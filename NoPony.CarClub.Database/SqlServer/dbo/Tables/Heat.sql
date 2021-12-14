﻿CREATE TABLE [dbo].[Heat]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [EventId]                   BIGINT                      NOT NULL,
    [StatusId]                  BIGINT                      NULL,

    [Code]                      NVARCHAR(32)                NOT NULL,
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Heat_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Heat_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Heat] PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [FK_Heat_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),

    CONSTRAINT [FK_Heat_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Heat_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Heat_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE INDEX [IX_EventId] ON [dbo].[Heat] ([EventId] ASC);

GO