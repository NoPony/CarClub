CREATE TABLE [dbo].[MeetStatus]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [Code]                      NVARCHAR(32)                NOT NULL,
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetStatus_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetStatus_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_MeetStatus] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_MeetStatus_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_MeetStatus_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_MeetStatus_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE INDEX [IX_Composite] ON [dbo].[MeetStatus] ([Deleted], [Code]) INCLUDE ([Title], [Updated]);

GO
