CREATE TABLE [dbo].[Survey]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [CreatorId]                 BIGINT                      NOT NULL,
    [OwnerId]                   BIGINT                      NOT NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [Title]                     NVARCHAR(256)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Survey_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Survey_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED ([Id]),
    
    CONSTRAINT [FK_Survey_Member_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_Survey_Member_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_Survey_SurveyStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[SurveyStatus] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_CreatorId] ON [dbo].[Survey] ([CreatorId]);

GO

CREATE INDEX [IX_OwnerId] ON [dbo].[Survey] ([OwnerId]);

GO

CREATE INDEX [IX_StatusId] ON [dbo].[Survey] ([StatusId]);

GO
