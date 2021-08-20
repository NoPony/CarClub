CREATE TABLE [dbo].[Survey]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [CreatorId]                 BIGINT                      NOT NULL,
    [OwnerId]                   BIGINT                      NOT NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [Title]                     NVARCHAR(256)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Survey_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Survey_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Survey] PRIMARY KEY CLUSTERED ([Id]),
    
    CONSTRAINT [FK_Survey_Member_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_Survey_Member_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_Survey_SurveyStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[SurveyStatus] ([Id])
)

GO

CREATE INDEX [IX_CreatorId] ON [dbo].[Survey] ([CreatorId]);

GO

CREATE INDEX [IX_OwnerId] ON [dbo].[Survey] ([OwnerId]);

GO

CREATE INDEX [IX_StatusId] ON [dbo].[Survey] ([StatusId]);

GO
