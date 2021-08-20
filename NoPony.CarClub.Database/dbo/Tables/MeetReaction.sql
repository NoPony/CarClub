CREATE TABLE [dbo].[MeetReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MeetId]                    BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [ReactionId]                BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_MeetReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_MeetReaction_Meet_MeetId] FOREIGN KEY ([MeetId]) REFERENCES [dbo].[Meet] ([Id]),
    CONSTRAINT [FK_MeetReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_MeetReaction_Reaction_ReactionId] FOREIGN KEY ([ReactionId]) REFERENCES [dbo].[Reaction] ([Id]),
)

GO

CREATE INDEX [IX_MeetId] ON [dbo].[MeetReaction] ([MeetId]);

GO

CREATE INDEX [IX_MemberId] ON [dbo].[MeetReaction] ([MemberId]);

GO

CREATE INDEX [IX_Reaction] ON [dbo].[MeetReaction] ([ReactionId]);

GO
