DELETE FROM [auth].[UserRole];
DELETE FROM [auth].[RolePermission];
DELETE FROM [auth].[Role];
DELETE FROM [auth].[Permission];
DELETE FROM [auth].[User];

-- Admin user
DECLARE @AdminKey AS UNIQUEIDENTIFIER = NEWID();

INSERT INTO [auth].[User] 
(
	[Key], 
	[Email], 
	[Password], 
	[EmailVerified], 
	[EmailVerifiedIp], 
	[EmailVerifiedUtc], 
	[CreatedIp], 
	[CreatedUtc]
)

VALUES
(
	@AdminKey,
	'admin@nopony.com.au',
	'$argon2id$v=19$m=32768,t=4,p=1$wQmZdSc02f0y7PikKIgZ0w$3jQFN05mZ9N/hr4gVYfWjGFc0hw2r8Ny+xypjJTnI4E',
	1,
	0x7F000001,
	GETUTCDATE(),
	0x7F000001,
	GETUTCDATE()
);

DECLARE @AdminUserId BIGINT = SCOPE_IDENTITY();

-- Basic starter Roles
INSERT INTO [auth].[Role] ([Code], [Title], [Note], [CreatedIp], [CreatedUtc], [CreatedUserId]) VALUES 
	('NEW',					'New user',				'New user',					0x7F000001,		GETUTCDATE(),	@AdminUserId),
	('ADMIN',				'Administrator',		'You can call me God',		0x7F000001,		GETUTCDATE(),	@AdminUserId);

-- Basic starter Permissions
INSERT INTO [auth].[Permission] ([Code], [Title], [Note], [CreatedIp], [CreatedUtc], [CreatedUserId]) VALUES 
	('ADMIN',				'Admin',				'Admin',					0x7F000001,		GETUTCDATE(),	@AdminUserId),

	('BOARD_CREATE',		'Board Create',			'Board Create',				0x7F000001,		GETUTCDATE(),	@AdminUserId),
	('BOARD_READ',			'Board Read',			'Board Read',				0x7F000001,		GETUTCDATE(),	@AdminUserId),
	('BOARD_UPDATE',		'Board Update',			'Board Update',				0x7F000001,		GETUTCDATE(),	@AdminUserId),
	('BOARD_DELETE',		'Board Delete',			'Board Delete',				0x7F000001,		GETUTCDATE(),	@AdminUserId);

-- NEW Role gets some READ permissions
INSERT INTO		[auth].[RolePermission]
(
	[RoleId],
	[PermissionId],
	[CreatedIp], 
	[CreatedUtc], 
	[CreatedUserId]
)

SELECT			[R].[Id]		AS [RoleId],
				[P].[Id]		AS [PermissionId],
				0x7F000001		AS [CreatedIp],
				GETUTCDATE()	AS [CreatedUtc],
				@AdminUserId	AS [CreatedUserId]

FROM (			SELECT			*
				FROM			[auth].[Role]
				WHERE			[Code] = 'NEW') AS [R]

CROSS APPLY (	SELECT			*
				FROM			[auth].[Permission]
				WHERE			[Code] = 'BOARD_READ') AS [P]

-- ADMIN Role gets ADMIN Permission
INSERT INTO		[auth].[RolePermission]
(
	[RoleId],
	[PermissionId],
	[CreatedIp], 
	[CreatedUtc], 
	[CreatedUserId]
)

SELECT			[R].[Id]		AS [RoleId],
				[P].[Id]		AS [PermissionId],
				0x7F000001		AS [CreatedIp],
				GETUTCDATE()	AS [CreatedUtc],
				@AdminUserId	AS [CreatedUserId]

FROM (			SELECT			*
				FROM			[auth].[Role]
				WHERE			[Code] = 'ADMIN') AS [R]

CROSS APPLY (	SELECT			*
				FROM			[auth].[Permission]
				WHERE			[Code] = 'ADMIN') AS [P]

-- Assign Admin user to ADMIN role
INSERT INTO		[auth].[UserRole]
(
	[UserId],
	[RoleId],
	[CreatedIp], 
	[CreatedUtc], 
	[CreatedUserId]
)

SELECT			@AdminUserId	AS [UserId],
				[R].[Id]		AS [RoleId],
				0x7F000001		AS [CreatedIp],
				GETUTCDATE()	AS [CreatedUtc],
				@AdminUserId	AS [CreatedUserId]

FROM (			SELECT			*
				FROM			[auth].[Role]
				WHERE			[Code] = 'ADMIN') AS [R]

-- Checky McCheck Face
SELECT			[U].[Email],
				[R].[Title],
				[P].[Title]

FROM (			SELECT			*
				FROM			[auth].[User]
				WHERE			[Id] = @AdminUserId) AS [U]

INNER JOIN  (	SELECT			*
				FROM			[auth].[UserRole]) AS [UR]
	ON			[UR].[UserId] = [U].[Id]
	
INNER JOIN  (	SELECT			*
				FROM			[auth].[Role]) AS [R]
	ON			[R].[Id] = [UR].[RoleId]

INNER JOIN (	SELECT			*
				FROM			[auth].[RolePermission]) AS [RP]
	ON			[RP].[RoleId] = [R].[Id]

INNER JOIN (	SELECT			*
				FROM			[auth].[Permission]) AS [P]
	ON			[P].[Id] = [RP].[PermissionId]