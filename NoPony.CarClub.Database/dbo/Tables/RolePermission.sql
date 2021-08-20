CREATE TABLE [dbo].[RolePermission]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [RoleId]                    BIGINT                      NOT NULL,
    [PermissionId]              BIGINT                      NOT NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_RolePermission_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_RolePermission_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_RolePermission] PRIMARY KEY CLUSTERED ([Id]),
)

GO

CREATE INDEX [IX_RoleId] ON [dbo].[RolePermission] ([RoleId] ASC);

GO

CREATE INDEX [IX_PermissionId] ON [dbo].[RolePermission] ([PermissionId] ASC);

GO

CREATE INDEX [IX_Composite] ON [dbo].[RolePermission] ([Deleted], [RoleId] ASC, [PermissionId] ASC) INCLUDE ([Updated]);

GO
