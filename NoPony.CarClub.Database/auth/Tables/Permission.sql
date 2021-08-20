CREATE TABLE [auth].[Permission]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [Code]                      NVARCHAR(32)                NULL,
    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Permission_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Permission_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [auth].[Permission] ([Deleted] ASC, [Code] ASC) INCLUDE ([Title], [Updated]);

GO
