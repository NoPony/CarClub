CREATE TABLE [dbo].[Post]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [BoardId]                   BIGINT                      NOT NULL,
    [CommentId]                 BIGINT                      NOT NULL,
    [SurveyId]                  BIGINT                      NULL,
    [PollId]                    BIGINT                      NULL,

    [Pinned]                    BIT                         NOT NULL        CONSTRAINT [DF_Post_Pinned] DEFAULT (0),
    [PinnedIp]                  VARBINARY(16)               NULL,
    [PinnedUtc]                 DATETIMEOFFSET              NULL,
    [PinnedUserId]              BIGINT                      NULL,
    [PinnedNote]                NVARCHAR(1024)              NULL,

    [UnpinnedIp]                VARBINARY(16)               NULL,
    [UnpinnedUtc]               DATETIMEOFFSET              NULL,
    [UnpinnedUserId]            BIGINT                      NULL,
    [UnpinnedNote]              NVARCHAR(1024)              NULL,

    [Locked]                    BIT                         NOT NULL        CONSTRAINT [DF_Post_Locked] DEFAULT (0),
    [LockedIp]                  VARBINARY(16)               NULL,
    [LockedUtc]                 DATETIMEOFFSET              NULL,
    [LockedUserId]              BIGINT                      NULL,
    [LockedNote]                NVARCHAR(1024)              NULL,

    [UnlockedIp]                VARBINARY(16)               NULL,
    [UnlockedUtc]               DATETIMEOFFSET              NULL,
    [UnlockedUserId]            BIGINT                      NULL,
    [UnlockedNote]              NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Post_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Post_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Post_Board_BoardId] FOREIGN KEY ([BoardId]) REFERENCES [dbo].[Board] ([Id]),
    
    CONSTRAINT [FK_Post_Survey_SurveyId] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id]),
    CONSTRAINT [FK_Post_Poll_PollId] FOREIGN KEY ([PollId]) REFERENCES [dbo].[Poll] ([Id]),
    CONSTRAINT [FK_Post_Comment_PostId] FOREIGN KEY ([CommentId]) REFERENCES [dbo].[Comment] ([Id]),
    CONSTRAINT [FK_Post_User_PinnedUserId] FOREIGN KEY ([PinnedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Post_User_UnpinnedId] FOREIGN KEY ([UnpinnedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Post_User_LockedId] FOREIGN KEY ([LockedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Post_User_UnlockedId] FOREIGN KEY ([UnlockedUserId]) REFERENCES [auth].[User] ([Id]),

    CONSTRAINT [FK_Post_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Post_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Post_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE NONCLUSTERED INDEX [IX_BoardId] ON [dbo].[Post] ([BoardId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_SurveyId] ON [dbo].[Post] ([SurveyId]);

GO

CREATE NONCLUSTERED INDEX [IX_PollId] ON [dbo].[Post] ([PollId]);

GO

CREATE NONCLUSTERED INDEX [IX_PostId] ON [dbo].[Post] ([CommentId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_PinnedUserId] ON [dbo].[Post] ([PinnedUserId]);

GO

CREATE NONCLUSTERED INDEX [IX_UnpinnedId] ON [dbo].[Post] ([UnpinnedUserId]);

GO

CREATE NONCLUSTERED INDEX [IX_LockedId] ON [dbo].[Post] ([LockedUserId]);

GO

CREATE NONCLUSTERED INDEX [IX_UnlockedId] ON [dbo].[Post] ([UnlockedUserId]);

GO

CREATE NONCLUSTERED INDEX [IX_CreatedUserId] ON [dbo].[Post] ([CreatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_UpdatedUserId] ON [dbo].[Post] ([UpdatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_DeletedUserId] ON [dbo].[Post] ([DeletedUserId] ASC);

GO
