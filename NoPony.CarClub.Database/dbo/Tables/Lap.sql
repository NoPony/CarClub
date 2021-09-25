CREATE TABLE [dbo].[Lap]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [HeatId]                    BIGINT                      NOT NULL,

    [VehicleId]                 BIGINT                      NULL,
    [DriverId]                  BIGINT                      NULL,
    [StatusId]                  BIGINT                      NULL,

    [StartTime]                 BIT                         NOT NULL        CONSTRAINT [DF_Lap_StartTime] DEFAULT (0),
    [StartTimeMs]               DECIMAL(18, 6)              NULL,
    [StartTimeIp]               VARBINARY(16)               NOT NULL,
    [StartTimeUtc]              DATETIMEOFFSET              NOT NULL,
    [StartTimeBy]               NVARCHAR(128)               NOT NULL,

    [EndTime]                   BIT                         NOT NULL        CONSTRAINT [DF_Lap_EndTime] DEFAULT (0),
    [EndTimeMs]                 DECIMAL(18, 6)              NULL,
    [EndTimeIp]                 VARBINARY(16)               NOT NULL,
    [EndTimeUtc]                DATETIMEOFFSET              NOT NULL,
    [EndTimeBy]                 NVARCHAR(128)               NOT NULL,

    [Time]                      BIT                         NOT NULL        CONSTRAINT [DF_Lap_Time] DEFAULT (0),
    [TimeMs]                    DECIMAL(18, 6)              NULL,
    [TimeIp]                    VARBINARY(16)               NOT NULL,
    [TimeUtc]                   DATETIMEOFFSET              NOT NULL,
    [TimeBy]                    NVARCHAR(128)               NOT NULL,

    [Position]                  BIT                         NOT NULL        CONSTRAINT [DF_Lap_Position] DEFAULT (0),
    [PositionNumber]            TINYINT                     NULL,
    [PositionIp]                VARBINARY(16)               NOT NULL,
    [PositionUtc]               DATETIMEOFFSET              NOT NULL,
    [PositionBy]                NVARCHAR(128)               NOT NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Lap_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Lap_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_HeatResultLap] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_HeatResultLap_HeatResult_ResultId] FOREIGN KEY ([HeatId]) REFERENCES [dbo].[Heat] ([Id]),

    CONSTRAINT [FK_Lap_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Lap_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Lap_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE NONCLUSTERED INDEX [IX_HeatId] ON [dbo].[Lap] ([HeatId] ASC);

GO
