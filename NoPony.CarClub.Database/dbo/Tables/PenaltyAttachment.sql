CREATE TABLE [dbo].[PenaltyAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PenaltyId]                 BIGINT                      NOT NULL, 

    [UploadIp]                  NVARCHAR(32)                NOT NULL,
    [UploadUtc]                 DATETIMEOFFSET              NULL,
    [UploadBy]                  NVARCHAR(128)               NOT NULL,
    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_PenaltyAttachment] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PenaltyAttachment_Penalty_PenaltyId] FOREIGN KEY ([PenaltyId]) REFERENCES [dbo].[Penalty] ([Id])
);

GO

CREATE NONCLUSTERED INDEX [IX_PenaltyId] ON [dbo].[PenaltyAttachment] ([PenaltyId] ASC);

GO
