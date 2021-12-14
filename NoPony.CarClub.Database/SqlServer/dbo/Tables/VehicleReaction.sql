CREATE TABLE [dbo].[VehicleReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [VehicleId]                 BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,

    [Emoji]                     NVARCHAR(8)                 NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleReaction_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleReaction_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_VehicleReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_VehicleReaction_Vehicle_VehicleId] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id]),
    CONSTRAINT [FK_VehicleReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)
