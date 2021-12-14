CREATE TABLE [dbo].[Meet]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MeetStatusId]				BIGINT                      NOT NULL,
	
    [StartUtc]                  DATETIMEOFFSET              NULL,
    [DurationMinutes]           INT                         NULL,
    
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Meet_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Meet_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Meet] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_Meet_MeetStatusId] FOREIGN KEY ([MeetStatusId]) REFERENCES [dbo].[MeetStatus] ([Id]),

    CONSTRAINT [FK_Meet_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Meet_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Meet_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)
