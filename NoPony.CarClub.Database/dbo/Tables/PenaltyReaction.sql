CREATE TABLE [dbo].[PenaltyReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PenaltyId]                 BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [ReactionId]                BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_PenaltyReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PenaltyReaction_Penalty_PenaltyId] FOREIGN KEY ([PenaltyId]) REFERENCES [dbo].[Penalty] ([Id]),
    CONSTRAINT [FK_PenaltyReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_PenaltyReaction_Reaction_ReactionId] FOREIGN KEY ([ReactionId]) REFERENCES [dbo].[Reaction] ([Id]),
)

GO

CREATE INDEX [IX_PenaltyId] ON [dbo].[PenaltyReaction] ([PenaltyId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[PenaltyReaction] ([MemberId]);

GO

CREATE INDEX [IX_Reaction] ON [dbo].[PenaltyReaction] ([ReactionId]);

GO
