CREATE TABLE [dbo].[VehicleModel]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MakeId]                    BIGINT                      NOT NULL,

    [Code]                      NVARCHAR(32)                NOT NULL, 
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleModel_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleModel_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_VehicleModel] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_VehicleModel_VehicleMake_MakeId] FOREIGN KEY ([MakeId]) REFERENCES [dbo].[VehicleMake] ([Id]),
)

GO
