CREATE TABLE [dbo].[LapReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [LapId]                   BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [ReactionId]                BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_LapReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_LapReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_LapReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_LapReaction_Lap_LapId] FOREIGN KEY ([LapId]) REFERENCES [dbo].[Lap] ([Id]),
    CONSTRAINT [FK_LapReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_LapReaction_Reaction_ReactionId] FOREIGN KEY ([ReactionId]) REFERENCES [dbo].[Reaction] ([Id]),
)

GO

CREATE INDEX [IX_LapId] ON [dbo].[LapReaction] ([LapId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[LapReaction] ([MemberId]);

GO

CREATE INDEX [IX_Reaction] ON [dbo].[LapReaction] ([ReactionId]);

GO
