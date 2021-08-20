CREATE TABLE [dbo].[Vehicle]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [MakeId]                    BIGINT                      NULL,
    [ModelId]                   BIGINT                      NULL,
    [VariantId]                 BIGINT                      NULL,
    [Year]                      SMALLINT                    NULL,

    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Vehicle_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Vehicle_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Vehicle_VehicleStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[VehicleStatus] ([Id]),
    CONSTRAINT [FK_Vehicle_VehicleMake_MakeId] FOREIGN KEY ([MakeId]) REFERENCES [dbo].[VehicleMake] ([Id]),
    CONSTRAINT [FK_Vehicle_VehicleModel_ModelId] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[VehicleModel] ([Id]),
    CONSTRAINT [FK_Vehicle_VehicleVariant_VariantId] FOREIGN KEY ([VariantId]) REFERENCES [dbo].[VehicleVariant] ([Id]),
)
