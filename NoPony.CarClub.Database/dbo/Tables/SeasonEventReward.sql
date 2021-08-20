CREATE TABLE [dbo].[SeasonEventReward]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SeasonEventId]             BIGINT                      NOT NULL,

    [Position]                  TINYINT                     NULL,
    [Percentile]                FLOAT                       NULL,

    [Value]                     SMALLINT                    NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonEventPoint_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonEventPoint_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 BIT                         NULL,

    CONSTRAINT [PK_SeasonEventPoint] PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [FK_SeasonEventPoint_SeasonEvent_SeasonEventId] FOREIGN KEY ([SeasonEventId]) REFERENCES [dbo].[SeasonEvent] ([Id]),
)

GO

CREATE INDEX [IX_StatusId] ON [dbo].[SeasonEventReward] ([SeasonEventId] ASC);

GO
