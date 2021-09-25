CREATE TABLE [dbo].[CommentReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [CommentId]                 BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,

    [Emoji]                     NCHAR                       NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_CommentReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_CommentReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_CommentReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_CommentReaction_Comment_CommentId] FOREIGN KEY ([CommentId]) REFERENCES [dbo].[Comment] ([Id]),
    CONSTRAINT [FK_CommentReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    CONSTRAINT [FK_CommentReaction_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_CommentReaction_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_CommentReaction_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE NONCLUSTERED INDEX [IX_Composite] ON [dbo].[CommentReaction] ([Deleted] ASC, [CommentId] ASC) INCLUDE ([MemberId], [Emoji]);

GO

CREATE NONCLUSTERED INDEX [IX_CommentId] ON [dbo].[CommentReaction] ([CommentId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_CreatedUserId] ON [dbo].[CommentReaction] ([CreatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_UpdatedUserId] ON [dbo].[CommentReaction] ([UpdatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_DeletedUserId] ON [dbo].[CommentReaction] ([DeletedUserId] ASC);

GO
