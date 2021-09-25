CREATE TABLE [dbo].[MemberEvent]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [EventId]                   BIGINT                      NOT NULL, 

    [Register]                  BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_Register] DEFAULT (0),
    [RegisterIp]                VARBINARY(16)               NULL,
    [RegisterUtc]               DATETIMEOFFSET              NULL,
    [RegisterBy]                NVARCHAR(128)               NOT NULL,

    [Checkin]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_Checkin] DEFAULT (0),
    [CheckinIp]                 VARBINARY(16)               NULL,
    [CheckinUtc]                DATETIMEOFFSET              NULL,
    [CheckinBy]                 NVARCHAR(128)               NOT NULL,

    [OnTrack]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_OnTrack] DEFAULT (0),
    [OnTrackIp]                 VARBINARY(16)               NULL,
    [OnTrackUtc]                DATETIMEOFFSET              NULL,
    [OnTrackBy]                 NVARCHAR(128)               NOT NULL,

    [OffTrack]                  BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_OffTrack] DEFAULT (0),
    [OffTrackIp]                VARBINARY(16)               NULL,
    [OffTrackUtc]               DATETIMEOFFSET              NULL,
    [OffTrackBy]                NVARCHAR(128)               NOT NULL,

    [Checkout]                  BIT                         NOT NULL        CONSTRAINT [DF_MemberEvent_Checkout] DEFAULT (0),
    [CheckoutIp]                VARBINARY(16)               NULL,
    [CheckoutUtc]               DATETIMEOFFSET              NULL,
    [CheckoutBy]                NVARCHAR(128)               NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_EventEntry_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_EventEntry_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_EventEntry] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_EventEntry_Event_EventId] FOREIGN KEY ([EventId]) REFERENCES [dbo].[Event] ([Id]),
    CONSTRAINT [FK_EventEntry_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE NONCLUSTERED INDEX [IX_MemberId] ON [dbo].[MemberEvent] ([MemberId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_EventId] ON [dbo].[MemberEvent] ([EventId] ASC);

GO

