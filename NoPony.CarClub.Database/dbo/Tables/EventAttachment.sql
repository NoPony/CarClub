CREATE TABLE [dbo].[EventAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [EventId]                   BIGINT                      NOT NULL, 

    [UploadIp]                  NVARCHAR(16)                NULL,
    [UploadUtc]                 DATETIMEOFFSET              NULL,
    [Title]                     NVARCHAR(256)               NULL,
    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_EventAttachment_Updated] DEFAULT (0),
    [UpdatedMemberId]           BIGINT                      NULL,
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_EventAttachment_Deleted] DEFAULT (0),
    [DeletedMemberId]           BIGINT                      NULL,
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_EventAttachment] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_EventAttachment_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id])
);

GO

CREATE INDEX [IX_EventId] ON [dbo].[EventAttachment] ([EventId]);

GO
