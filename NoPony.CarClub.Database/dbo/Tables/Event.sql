CREATE TABLE [dbo].[Event]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MeetId]                    BIGINT                      NOT NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [Title]                     NVARCHAR(256)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,
    [StartUtc]                  DATETIMEOFFSET              NULL,
    [DurationMinutes]           INT                         NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Event_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Event_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 BIT                         NULL,

    CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Event_Meet_MeetId] FOREIGN KEY ([MeetId]) REFERENCES [dbo].[Meet] ([Id]),
    CONSTRAINT [FK_Event_EventStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[EventStatus] ([Id]),
)

GO

CREATE INDEX [IX_MeetId] ON [dbo].[Event] ([MeetId] ASC);

GO

CREATE INDEX [IX_StatusId] ON [dbo].[Event] ([StatusId] ASC);

GO
