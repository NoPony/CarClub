CREATE TABLE [dbo].[VehicleReaction]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [VehicleId]                 BIGINT                      NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [ReactionId]                BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,

	[CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_VehicleReaction] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_VehicleReaction_Vehicle_VehicleId] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id]),
    CONSTRAINT [FK_VehicleReaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[User] ([Id]),
    CONSTRAINT [FK_VehicleReaction_Reaction_ReactionId] FOREIGN KEY ([ReactionId]) REFERENCES [dbo].[Reaction] ([Id]),
)
