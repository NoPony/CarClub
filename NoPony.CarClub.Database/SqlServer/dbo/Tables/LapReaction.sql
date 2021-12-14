CREATE TABLE [dbo].[LapReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [LapId]                     BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,

    [Emoji]                     NVARCHAR(8)                 NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_LapReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_LapReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_LapReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_LapReaction_Lap_LapId] FOREIGN KEY ([LapId]) REFERENCES [dbo].[Lap] ([Id]),
    CONSTRAINT [FK_LapReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    CONSTRAINT [FK_LapReaction_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_LapReaction_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_LapReaction_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE INDEX [IX_LapId] ON [dbo].[LapReaction] ([LapId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[LapReaction] ([MemberId]);

GO
