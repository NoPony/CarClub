CREATE TABLE [dbo].[Season]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)               NULL,

    [StartUtc]                  DATETIMEOFFSET              NULL,
    [EndUtc]                    DATETIMEOFFSET              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Season_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Season_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 BIT                         NULL,

    CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [FK_Season_SeasonStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[SeasonStatus] ([Id]),
)

GO

CREATE INDEX [IX_StatusId] ON [dbo].[Season] ([StatusId] ASC);

GO
