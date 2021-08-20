CREATE TABLE [dbo].[MeetOfficial]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MeetId]                    BIGINT                      NOT NULL, 
	[OfficeId]					BIGINT						NOT NULL,
	[MemberId]					BIGINT						NOT NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetOfficial_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetOfficial_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_MeetOfficial] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_MeetOfficial_Meet_MeetId] FOREIGN KEY ([MeetId]) REFERENCES [dbo].[Meet] ([Id]),
	CONSTRAINT [FK_MeetOfficial_Office_OfficeId] FOREIGN KEY ([OfficeId]) REFERENCES [dbo].[Office] ([Id]),
	CONSTRAINT [FK_MeetOfficial_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),);

GO

CREATE INDEX [IX_MeetId] ON [dbo].[MeetOfficial] ([MeetId]);

GO
