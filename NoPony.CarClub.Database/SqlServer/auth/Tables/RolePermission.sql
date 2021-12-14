CREATE TABLE [auth].[RolePermission]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [RoleId]                    BIGINT                      NOT NULL,
    [PermissionId]              BIGINT                      NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_RolePermission_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_RolePermission_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_RolePermission] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_RolePermission_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [auth].[Role] ([Id]),
    CONSTRAINT [FK_RolePermission_Permission_PermissionId] FOREIGN KEY ([PermissionId]) REFERENCES [auth].[Permission] ([Id]),

    CONSTRAINT [FK_RolePermission_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_RolePermission_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_RolePermission_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [auth].[RolePermission] ([RoleId] ASC, [PermissionId] ASC) INCLUDE ([Deleted]);

GO

CREATE INDEX [IX_RoleId] ON [auth].[RolePermission] ([RoleId] ASC);

GO

CREATE INDEX [IX_PermissionId] ON [auth].[RolePermission] ([PermissionId] ASC);

GO

CREATE INDEX [IX_CreatedUserId] ON [auth].[RolePermission] ([CreatedUserId] ASC);

GO

CREATE INDEX [IX_UpdatedUserId] ON [auth].[RolePermission] ([UpdatedUserId] ASC);

GO

CREATE INDEX [IX_DeletedUserId] ON [auth].[RolePermission] ([DeletedUserId] ASC);

GO
