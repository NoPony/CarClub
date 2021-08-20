CREATE TABLE [dbo].[MemberEvent]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [EventId]                   BIGINT                      NOT NULL, 

    [Register]                  BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_Register] DEFAULT (0),
    [RegisterIp]                NVARCHAR(32)                NULL,
    [RegisterUtc]               DATETIMEOFFSET              NULL,
    [RegisterBy]                NVARCHAR(128)               NOT NULL,

    [Checkin]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_Checkin] DEFAULT (0),
    [CheckinIp]                 NVARCHAR(32)                NULL,
    [CheckinUtc]                DATETIMEOFFSET              NULL,
    [CheckinBy]                 NVARCHAR(128)               NOT NULL,

    [OnTrack]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_OnTrack] DEFAULT (0),
    [OnTrackIp]                 NVARCHAR(32)                NULL,
    [OnTrackUtc]                DATETIMEOFFSET              NULL,
    [OnTrackBy]                 NVARCHAR(128)               NOT NULL,

    [OffTrack]                  BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_OffTrack] DEFAULT (0),
    [OffTrackIp]                NVARCHAR(32)                NULL,
    [OffTrackUtc]               DATETIMEOFFSET              NULL,
    [OffTrackBy]                NVARCHAR(128)               NOT NULL,

    [Checkout]                  BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_Checkout] DEFAULT (0),
    [CheckoutIp]                NVARCHAR(32)                NULL,
    [CheckoutUtc]               DATETIMEOFFSET              NULL,
    [CheckoutBy]                NVARCHAR(128)               NOT NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_EventEntry_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_EventEntry_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_EventEntry] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_EventEntry_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),
    CONSTRAINT [FK_EventEntry_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id])
)

GO

CREATE NONCLUSTERED INDEX [IX_MemberId] ON [dbo].[MemberEvent] ([MemberId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_EventId] ON [dbo].[MemberEvent] ([EventId] ASC);

GO

