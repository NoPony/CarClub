CREATE TABLE [dbo].[SurveyQuestion]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SurveyId]                  BIGINT                      NOT NULL,

    [Position]                  TINYINT                     NULL,
    [Title]                     NVARCHAR(256)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [Text]                      BIT                         NULL,
    
    [Int]                       BIT                         NULL,
    [IntMin]                    SMALLINT                    NULL,
    [IntMax]                    SMALLINT                    NULL,
    [IntSteps]                  TINYINT                     NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyQuestion_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyQuestion_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_SurveyQuestion] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_SurveyQuestion_Servey_ServeyId] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE NONCLUSTERED INDEX [IX_ServeyId] ON [dbo].[SurveyQuestion] ([SurveyId] ASC);

GO
