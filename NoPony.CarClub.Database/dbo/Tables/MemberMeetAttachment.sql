CREATE TABLE [dbo].[MemberMeetAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberMeetId]              BIGINT                      NOT NULL, 

    [UploadIp]                  NVARCHAR(32)                NULL,
    [UploadUtc]                 DATETIMEOFFSET              NULL,
    [UploadBy]                  NVARCHAR(128)               NOT NULL,

    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetEntryAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetEntryAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_MemberMeetAttachment] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_MemberMeetAttachment_MemberMeet_MemberMeetId] FOREIGN KEY ([MemberMeetId]) REFERENCES [dbo].[MemberMeet] ([Id])
);

GO
