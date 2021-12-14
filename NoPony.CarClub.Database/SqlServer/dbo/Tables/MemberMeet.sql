CREATE TABLE [dbo].[MemberMeet]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [MeetId]                    BIGINT                      NOT NULL, 

    [Enter]                     BIT                         NOT NULL,
    [EnterIp]                   VARBINARY(16)               NULL,
    [EnterUtc]                  DATETIMEOFFSET              NULL,
    [EnterBy]                   NVARCHAR(128)               NULL,

    [Checkin]                   BIT                         NOT NULL,
    [CheckinIp]                 VARBINARY(16)               NOT NULL,
    [CheckinUtc]                DATETIMEOFFSET              NOT NULL,
    [CheckinBy]                 NVARCHAR(128)               NOT NULL,

    [Checkout]                  BIT                         NOT NULL,
    [CheckoutIp]                VARBINARY(16)               NOT NULL,
    [CheckoutUtc]               DATETIMEOFFSET              NOT NULL,
    [CheckoutBy]                NVARCHAR(128)               NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberMeet_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberMeet_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 BIT                         NULL,

    CONSTRAINT [PK_MemberMeet] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_MemberMeet_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_MemberMeet_Meet_MeetId] FOREIGN KEY ([MeetId]) REFERENCES [dbo].[Meet] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

);

GO

CREATE NONCLUSTERED INDEX [IX_MemberId] ON [dbo].[MemberMeet] ([MemberId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_MeetId] ON [dbo].[MemberMeet] ([MeetId] ASC);

GO
