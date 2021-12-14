CREATE TABLE [dbo].[CommentAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [CommentId]                 BIGINT                      NOT NULL, 

    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_CommentAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_CommentAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_CommentAttachment] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_CommentAttachment_Comment_CommentId] FOREIGN KEY ([CommentId]) REFERENCES [dbo].[Comment] ([Id]),

    CONSTRAINT [FK_CommentAttachment_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_CommentAttachment_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_CommentAttachment_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_Composite] ON [dbo].[CommentAttachment] ([Deleted] ASC, [CommentId] ASC) INCLUDE ([Filename], [Url]);

GO

CREATE NONCLUSTERED INDEX [IX_CommentId] ON [dbo].[CommentAttachment] ([CommentId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_CreatedUserId] ON [dbo].[CommentAttachment] ([CreatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_UpdatedUserId] ON [dbo].[CommentAttachment] ([UpdatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_DeletedUserId] ON [dbo].[CommentAttachment] ([DeletedUserId] ASC);

GO
