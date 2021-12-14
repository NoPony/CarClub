CREATE TABLE [dbo].[SurveyResponse]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SurveyQuestionId]          BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    
    [OptionId]                  BIGINT                      NULL, 
    [IntValue]                  SMALLINT                    NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyResponse_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyResponse_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_MemberSurveyResponse] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_SurveyResponse_SurveyQuestion_SurveyQuestionId] FOREIGN KEY ([SurveyQuestionId]) REFERENCES [dbo].[SurveyQuestion] ([Id]),
    CONSTRAINT [FK_SurveyResponse_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_SurveyQuestionId] ON [dbo].[SurveyResponse] ([SurveyQuestionId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_QuestionId] ON [dbo].[SurveyResponse] ([SurveyQuestionId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_MemberId] ON [dbo].[SurveyResponse] ([MemberId] ASC);

GO
