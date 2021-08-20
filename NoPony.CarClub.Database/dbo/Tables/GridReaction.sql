CREATE TABLE [dbo].[GridReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [GridId]                BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [ReactionId]                BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_GridReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_GridReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_GridReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_GridReaction_Grid_GridId] FOREIGN KEY ([GridId]) REFERENCES [dbo].[Grid] ([Id]),
    CONSTRAINT [FK_GridReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_GridReaction_Reaction_ReactionId] FOREIGN KEY ([ReactionId]) REFERENCES [dbo].[Reaction] ([Id]),
)

GO

CREATE INDEX [IX_GridId] ON [dbo].[GridReaction] ([GridId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[GridReaction] ([MemberId]);

GO

CREATE INDEX [IX_Reaction] ON [dbo].[GridReaction] ([ReactionId]);

GO
