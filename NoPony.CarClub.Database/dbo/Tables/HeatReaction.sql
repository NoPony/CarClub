CREATE TABLE [dbo].[HeatReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [HeatId]                    BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [ReactionId]                BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_HeatReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_HeatReaction_Heat_HeatId] FOREIGN KEY ([HeatId]) REFERENCES [dbo].[Heat] ([Id]),
    CONSTRAINT [FK_HeatReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_HeatReaction_Reaction_ReactionId] FOREIGN KEY ([ReactionId]) REFERENCES [dbo].[Reaction] ([Id]),
)

GO

CREATE INDEX [IX_HeatId] ON [dbo].[HeatReaction] ([HeatId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[HeatReaction] ([MemberId]);

GO

CREATE INDEX [IX_Reaction] ON [dbo].[HeatReaction] ([ReactionId]);

GO
