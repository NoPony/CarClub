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

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Vehicle_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Vehicle_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Vehicle] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Vehicle_VehicleStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[VehicleStatus] ([Id]),
    CONSTRAINT [FK_Vehicle_VehicleMake_MakeId] FOREIGN KEY ([MakeId]) REFERENCES [dbo].[VehicleMake] ([Id]),
    CONSTRAINT [FK_Vehicle_VehicleModel_ModelId] FOREIGN KEY ([ModelId]) REFERENCES [dbo].[VehicleModel] ([Id]),
    CONSTRAINT [FK_Vehicle_VehicleVariant_VariantId] FOREIGN KEY ([VariantId]) REFERENCES [dbo].[VehicleVariant] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)
