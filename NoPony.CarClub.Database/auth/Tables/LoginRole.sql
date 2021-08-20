CREATE TABLE [auth].[LoginRole]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [LoginId]                   BIGINT                      NOT NULL,
    [RoleId]                    BIGINT                      NOT NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberRole_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberRole_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_MemberRole] PRIMARY KEY CLUSTERED ([Id]),
    
    CONSTRAINT [FK_MemberRole_Member_UserId] FOREIGN KEY ([LoginId]) REFERENCES [auth].[Login] ([Id]),
    CONSTRAINT [FK_MemberRole_Role_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [auth].[Role] ([Id])
)

GO

CREATE INDEX [IX_MemberId] ON [auth].[LoginRole] ([LoginId] ASC);

GO

CREATE INDEX [IX_RoleId] ON [auth].[LoginRole] ([RoleId] ASC);

GO

CREATE INDEX [IX_Composite] ON [auth].[LoginRole] ([Deleted] ASC, [LoginId] ASC, [RoleId] ASC);

GO
