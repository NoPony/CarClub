CREATE TABLE [dbo].[SurveyOption]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [QuestionId]                BIGINT                      NOT NULL,

    [Position]                  TINYINT                     NULL,
    [Title]                     NVARCHAR(128)               NOT NULL,
    [Note]                      NVARCHAR(1024)              NULL,
    
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyOption_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyOption_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_ServeyOption] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_ServeyOption_SurveyQuestion_QuestionId] FOREIGN KEY ([QuestionId]) REFERENCES [dbo].[SurveyQuestion] ([Id])
)

GO

CREATE NONCLUSTERED INDEX [IX_QuestionId] ON [dbo].[SurveyOption] ([QuestionId] ASC);

GO
