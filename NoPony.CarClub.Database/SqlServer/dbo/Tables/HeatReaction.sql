CREATE TABLE [dbo].[HeatReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [HeatId]                    BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,

    [Emoji]                     NVARCHAR(8)                 NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_HeatReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_HeatReaction_Heat_HeatId] FOREIGN KEY ([HeatId]) REFERENCES [dbo].[Heat] ([Id]),
    CONSTRAINT [FK_HeatReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    CONSTRAINT [FK_HeatReaction_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_HeatReaction_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_HeatReaction_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE INDEX [IX_HeatId] ON [dbo].[HeatReaction] ([HeatId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[HeatReaction] ([MemberId]);

GO
