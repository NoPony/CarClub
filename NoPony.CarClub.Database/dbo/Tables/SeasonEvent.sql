CREATE TABLE [dbo].[SeasonEvent]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SeasonId]                  BIGINT                      NOT NULL, 
    [EventId]                   BIGINT                      NOT NULL,



	[CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_SeasonEvent] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_SeasonEvent_Season_SeasonId] FOREIGN KEY ([SeasonId]) REFERENCES [dbo].[Season] ([Id]),
    CONSTRAINT [FK_SeasonEvent_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_SeasonId] ON [dbo].[SeasonEvent] ([SeasonId] ASC);

GO
