CREATE TABLE [dbo].[EventOfficial]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [EventId]                   BIGINT                      NOT NULL, 
	[OfficeId]					BIGINT						NOT NULL,
	[MemberId]					BIGINT						NOT NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_EventOfficial_Updated] DEFAULT (0),
    [UpdatedMemberId]           BIGINT                      NULL,
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_EventOfficial_Deleted] DEFAULT (0),
    [DeletedMemberId]           BIGINT                      NULL,
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_EventOfficial] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_EventOfficial_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),
	CONSTRAINT [FK_EventOfficial_Office_OfficeId] FOREIGN KEY ([OfficeId]) REFERENCES [dbo].[Office] ([Id]),
	CONSTRAINT [FK_EventOfficial_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
);

GO

