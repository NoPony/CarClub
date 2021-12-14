CREATE TABLE [dbo].[MeetOfficial]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MeetId]                    BIGINT                      NOT NULL, 
	[OfficeId]					BIGINT						NOT NULL,
	[MemberId]					BIGINT						NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetOfficial_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MeetOfficial_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_MeetOfficial] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_MeetOfficial_Meet_MeetId] FOREIGN KEY ([MeetId]) REFERENCES [dbo].[Meet] ([Id]),
	CONSTRAINT [FK_MeetOfficial_Office_OfficeId] FOREIGN KEY ([OfficeId]) REFERENCES [dbo].[Office] ([Id]),
	CONSTRAINT [FK_MeetOfficial_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    CONSTRAINT [FK_MeetOfficial_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_MeetOfficial_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_MeetOfficial_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE INDEX [IX_MeetId] ON [dbo].[MeetOfficial] ([MeetId]);

GO
