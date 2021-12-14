CREATE TABLE [dbo].[EventAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [EventId]                   BIGINT                      NOT NULL, 

    [Title]                     NVARCHAR(256)               NULL,
    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_EventAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_EventAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_EventAttachment] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_EventAttachment_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),

    CONSTRAINT [FK_EventAttachment_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_EventAttachment_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_EventAttachment_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

);

GO

CREATE INDEX [IX_EventId] ON [dbo].[EventAttachment] ([EventId]);

GO
