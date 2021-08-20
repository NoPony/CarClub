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

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyQuestion_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_SurveyQuestion_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_SurveyQuestion] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_SurveyQuestion_Servey_ServeyId] FOREIGN KEY ([SurveyId]) REFERENCES [dbo].[Survey] ([Id])
)

GO

CREATE NONCLUSTERED INDEX [IX_ServeyId] ON [dbo].[SurveyQuestion] ([SurveyId] ASC);

GO
