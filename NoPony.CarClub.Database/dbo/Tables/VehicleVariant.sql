CREATE TABLE [dbo].[VehicleVariant]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [ModelId]                   BIGINT                      NOT NULL,

    [Code]                      NVARCHAR(32)                NOT NULL, 
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleVariant_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleVariant_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_VehicleVariant] PRIMARY KEY CLUSTERED ([Id] ASC),

    CONSTRAINT [FK_VehicleVariant_VehicleModel_ModelId] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[VehicleModel] ([Id]),
)

GO
