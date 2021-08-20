CREATE TABLE [dbo].[Grid]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [HeatId]                    BIGINT                      NOT NULL, 
    [MemberId]                  BIGINT                      NULL,
    [VehicleId]                 BIGINT                      NULL,

    [Position]                  SMALLINT                    NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Grid_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Grid_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Grid] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Grid_Heat_HeatId] FOREIGN KEY ([HeatId]) REFERENCES [dbo].[Heat] ([Id])
);

GO

CREATE INDEX [IX_HeatId] ON [dbo].[Grid] ([HeatId]);

GO

CREATE INDEX [IX_DriverId] ON [dbo].[Grid] ([MemberId]);

GO

CREATE INDEX [IX_Vehicle] ON [dbo].[Grid] ([VehicleId]);

GO
