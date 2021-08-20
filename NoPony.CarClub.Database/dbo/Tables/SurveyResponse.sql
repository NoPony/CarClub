CREATE TABLE [dbo].[SurveyResponse]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SurveyQuestionId]          BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    
    [OptionId]                  BIGINT                      NULL, 
    [IntValue]                  SMALLINT                    NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyResponse_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyResponse_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_MemberSurveyResponse] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_SurveyResponse_SurveyQuestion_SurveyQuestionId] FOREIGN KEY ([SurveyQuestionId]) REFERENCES [dbo].[SurveyQuestion] ([Id]),
    CONSTRAINT [FK_SurveyResponse_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id])
);

GO

CREATE NONCLUSTERED INDEX [IX_SurveyQuestionId] ON [dbo].[SurveyResponse] ([SurveyQuestionId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_QuestionId] ON [dbo].[SurveyResponse] ([SurveyQuestionId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_MemberId] ON [dbo].[SurveyResponse] ([MemberId] ASC);

GO
