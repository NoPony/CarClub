CREATE TABLE [dbo].[BoardRolePermission]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [BoardId]                   BIGINT                      NOT NULL,
    [RoleId]                    BIGINT                      NOT NULL,
    [PermissionId]              BIGINT                      NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_BoardRolePermission_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_BoardRolePermission_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_BoardRolePermission] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_BoardRolePermission_Board_BoardId] FOREIGN KEY ([BoardId]) REFERENCES [dbo].[Board] ([Id]),
    CONSTRAINT [FK_BoardRolePermission_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [auth].[Role] ([Id]),
    CONSTRAINT [FK_BoardRolePermission_Permission_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [auth].[Permission] ([Id]),

    CONSTRAINT [FK_BoardRolePermission_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_BoardRolePermission_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_BoardRolePermission_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [dbo].[BoardRolePermission] ([Deleted], [BoardId] ASC, [RoleId] ASC, [PermissionId] ASC);

GO

CREATE INDEX [IX_BoardId] ON [dbo].[BoardRolePermission] ([BoardId] ASC);

GO

CREATE INDEX [IX_RoleId] ON [dbo].[BoardRolePermission] ([RoleId] ASC);

GO

CREATE INDEX [IX_PermissionId] ON [dbo].[BoardRolePermission] ([PermissionId] ASC);

GO

CREATE INDEX [IX_CreatedUserId] ON [dbo].[BoardRolePermission] ([CreatedUserId] ASC);

GO

CREATE INDEX [IX_UpdatedUserId] ON [dbo].[BoardRolePermission] ([UpdatedUserId] ASC);

GO

CREATE INDEX [IX_DeletedUserId] ON [dbo].[BoardRolePermission] ([DeletedUserId] ASC);

GO
