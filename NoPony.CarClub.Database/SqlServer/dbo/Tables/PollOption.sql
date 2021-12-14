CREATE TABLE [dbo].[PollOption]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PollId]                    BIGINT                      NOT NULL, 

    [Title]                     NVARCHAR(128)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_PollOption_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_PollOption_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_PollOption] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PollOption_Poll_PollOptionId] FOREIGN KEY ([PollId]) REFERENCES [dbo].[Poll] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_PollId] ON [dbo].[PollOption] ([PollId] ASC);

GO
