CREATE TABLE [dbo].[PostReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PostId]                    BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [ReactionId]                BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,

	[CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_PostReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PostReaction_Post_PostId] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id]),
    CONSTRAINT [FK_PostReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_PostReaction_Reaction_ReactionId] FOREIGN KEY ([ReactionId]) REFERENCES [dbo].[Reaction] ([Id]),
)
