CREATE TABLE [dbo].[SeasonEventReward]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SeasonEventId]             BIGINT                      NOT NULL,

    [Position]                  TINYINT                     NULL,
    [Percentile]                FLOAT                       NULL,

    [Value]                     SMALLINT                    NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonEventPoint_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonEventPoint_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 BIT                         NULL,

    CONSTRAINT [PK_SeasonEventPoint] PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [FK_SeasonEventPoint_SeasonEvent_SeasonEventId] FOREIGN KEY ([SeasonEventId]) REFERENCES [dbo].[SeasonEvent] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_StatusId] ON [dbo].[SeasonEventReward] ([SeasonEventId] ASC);

GO
