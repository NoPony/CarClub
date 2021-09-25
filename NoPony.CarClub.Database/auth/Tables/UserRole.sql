CREATE TABLE [auth].[UserRole]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [UserId]                    BIGINT                      NOT NULL,
    [RoleId]                    BIGINT                      NOT NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberRole_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberRole_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED ([Id]),
    
    CONSTRAINT [FK_UserRole_User_UserId] FOREIGN KEY ([UserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_UserRole_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [auth].[Role] ([Id]),

    CONSTRAINT [FK_UserRole_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_UserRole_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_UserRole_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [auth].[UserRole] ([UserId] ASC, [RoleId] ASC) INCLUDE ([Deleted]);

GO

CREATE INDEX [IX_MemberId] ON [auth].[UserRole] ([UserId] ASC);

GO

CREATE INDEX [IX_RoleId] ON [auth].[UserRole] ([RoleId] ASC);

GO

CREATE INDEX [IX_CreatedUserId] ON [auth].[UserRole] ([CreatedUserId] ASC);

GO

CREATE INDEX [IX_UpdatedUserId] ON [auth].[UserRole] ([UpdatedUserId] ASC);

GO

CREATE INDEX [IX_DeletedUserId] ON [auth].[UserRole] ([DeletedUserId] ASC);

GO
