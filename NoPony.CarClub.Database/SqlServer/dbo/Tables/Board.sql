CREATE TABLE [dbo].[Board]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [Key]                       UNIQUEIDENTIFIER            NOT NULL,

    [Ordinal]                   INT                         NOT NULL,
    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,
    
    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Board_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Board_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Board] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Board_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Board_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Board_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [dbo].[Board] ([Key] ASC) INCLUDE ([Deleted]);

GO

CREATE INDEX [IX_CreatedUserId] ON [dbo].[Board] ([CreatedUserId] ASC);

GO

CREATE INDEX [IX_UpdatedUserId] ON [dbo].[Board] ([UpdatedUserId] ASC);

GO

CREATE INDEX [IX_DeletedUserId] ON [dbo].[Board] ([DeletedUserId] ASC);

GO
