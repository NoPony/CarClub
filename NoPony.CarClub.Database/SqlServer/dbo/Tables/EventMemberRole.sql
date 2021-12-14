CREATE TABLE [dbo].[EventMemberRole]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [EventId]                   BIGINT                      NOT NULL, 
	[MemberId]					BIGINT						NOT NULL,
	[RoleId]					BIGINT						NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_EventMemberRole_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_EventMemberRole_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_EventMemberRole] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_EventMemberRole_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),
	CONSTRAINT [FK_EventMemberRole_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
	CONSTRAINT [FK_EventMemberRole_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [dbo].[Role] ([Id]),

    CONSTRAINT [FK_EventMemberRole_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_EventMemberRole_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_EventMemberRole_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

);

GO

