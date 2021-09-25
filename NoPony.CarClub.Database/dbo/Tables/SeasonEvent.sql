CREATE TABLE [dbo].[SeasonEvent]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SeasonId]                  BIGINT                      NOT NULL, 
    [EventId]                   BIGINT                      NOT NULL,



    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonEvent_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SeasonEvent_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_SeasonEvent] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_SeasonEvent_Season_SeasonId] FOREIGN KEY ([SeasonId]) REFERENCES [dbo].[Season] ([Id]),
    CONSTRAINT [FK_SeasonEvent_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_SeasonId] ON [dbo].[SeasonEvent] ([SeasonId] ASC);

GO
