CREATE TABLE [dbo].[Penalty]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [HeatId]                    BIGINT                      NULL, 
    [DriverId]                  BIGINT                      NULL,
    [VehicleId]                 BIGINT                      NULL,
    [StatusId]                  BIGINT                      NULL,

    [Code]                      NVARCHAR(32)                NULL,
    [Title]                     NVARCHAR(64)                NULL,
    [Notes]                     NVARCHAR(1024)              NULL,

    [ValueMs]                   SMALLINT                    NULL,
    [ValuePoints]               SMALLINT                    NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Penalty_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Penaltyt_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,


    CONSTRAINT [PK_Penalty] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_Penalty_Member_DriverId] FOREIGN KEY ([DriverId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_Penalty_Vehicle_VehicleId] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id]),
    CONSTRAINT [FK_Penalty_HeatStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[HeatStatus] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO
