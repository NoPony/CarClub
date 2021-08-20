CREATE TABLE [dbo].[HeatAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [HeatId]                    BIGINT                      NOT NULL, 

    [UploadIp]                  NVARCHAR(16)                NULL,
    [UploadUtc]                 DATETIMEOFFSET              NULL,
    [Title]                     NVARCHAR(256)               NULL,
    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatAttachment_Updated] DEFAULT (0),
    [UpdatedMemberId]           BIGINT                      NULL,
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_HeatAttachment_Deleted] DEFAULT (0),
    [DeletedMemberId]           BIGINT                      NULL,
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_HeatAttachment] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_HeatAttachment_Heat_HeatId] FOREIGN KEY ([HeatId]) REFERENCES [dbo].[Heat] ([Id])
);

GO

CREATE INDEX [IX_HeatId] ON [dbo].[HeatAttachment] ([HeatId]);

GO
