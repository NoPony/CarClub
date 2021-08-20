CREATE TABLE [dbo].[MemberEventAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberEventId]             BIGINT                      NOT NULL, 
    
    [UploadIp]                  NVARCHAR(16)                NULL,
    [UploadUtc]                 DATETIMEOFFSET              NULL,
    [UploadBy]                  NVARCHAR(128)               NOT NULL,
    [Filename]                  NVARCHAR(128)               NULL, 
    [Title]                     NVARCHAR(128)               NULL,
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEventAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEventAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_MemberEventAttachment] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_MemberEventAttachment_MemberEvent_MemberEntryId] FOREIGN KEY ([MemberEventId]) REFERENCES [dbo].[MemberEvent] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_MemberEventId] ON [dbo].[MemberEventAttachment] ([MemberEventId] ASC);

GO

