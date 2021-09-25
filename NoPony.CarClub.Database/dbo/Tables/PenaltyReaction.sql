CREATE TABLE [dbo].[PenaltyReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [PenaltyId]                 BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,

    [Emoji]                     NCHAR                       NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_PenaltyReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PenaltyReaction_Penalty_PenaltyId] FOREIGN KEY ([PenaltyId]) REFERENCES [dbo].[Penalty] ([Id]),
    CONSTRAINT [FK_PenaltyReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_PenaltyId] ON [dbo].[PenaltyReaction] ([PenaltyId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[PenaltyReaction] ([MemberId]);

GO
