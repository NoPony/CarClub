CREATE TABLE [dbo].[VehicleModel]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MakeId]                    BIGINT                      NOT NULL,

    [Code]                      NVARCHAR(32)                NOT NULL, 
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleModel_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_VehicleModel_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_VehicleModel] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_VehicleModel_VehicleMake_MakeId] FOREIGN KEY ([MakeId]) REFERENCES [dbo].[VehicleMake] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO
