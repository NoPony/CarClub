CREATE TABLE [dbo].[SeasonStatus]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [Code]                      NVARCHAR(32)                NOT NULL, 
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonStatus_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonStatus_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_SeasonStatus] PRIMARY KEY CLUSTERED ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [dbo].[SeasonStatus] ([Deleted] ASC, [Code] ASC) INCLUDE ([Title], [Updated]);

GO
