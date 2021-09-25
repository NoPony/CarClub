CREATE TABLE [dbo].[HeatAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [HeatId]                    BIGINT                      NOT NULL, 

    [UploadIp]                  NVARCHAR(16)                NULL,
    [UploadUtc]                 DATETIMEOFFSET              NULL,
    [Title]                     NVARCHAR(256)               NULL,
    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_HeatAttachment] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_HeatAttachment_Heat_HeatId] FOREIGN KEY ([HeatId]) REFERENCES [dbo].[Heat] ([Id]),

    CONSTRAINT [FK_HeatAttachment_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_HeatAttachment_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_HeatAttachment_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

);

GO

CREATE INDEX [IX_HeatId] ON [dbo].[HeatAttachment] ([HeatId]);

GO
