CREATE TABLE [dbo].[Comment]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [Key]                       UNIQUEIDENTIFIER            NOT NULL,

    [ParentId]                  BIGINT                      NULL,   

    [Title]                     NVARCHAR(128)               NULL,
    [Content]                   NVARCHAR(MAX)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Comment_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Comment_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Comment_Comment_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Comment] ([Id]),

    CONSTRAINT [FK_Comment_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Comment_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Comment_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE NONCLUSTERED INDEX [IX_Composite] ON [dbo].[Comment] ([Deleted], [ParentId]);

GO

CREATE NONCLUSTERED INDEX [IX_Key] ON [dbo].[Comment] ([Key]);

GO

CREATE NONCLUSTERED INDEX [IX_ParentId] ON [dbo].[Comment] ([ParentId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_CreatedUserId] ON [dbo].[Comment] ([CreatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_UpdatedUserId] ON [dbo].[Comment] ([UpdatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_DeletedUserId] ON [dbo].[Comment] ([DeletedUserId] ASC);

GO
