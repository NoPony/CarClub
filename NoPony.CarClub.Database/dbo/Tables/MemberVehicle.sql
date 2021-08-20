CREATE TABLE [dbo].[MemberVehicle]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,
    [VehicleId]                  BIGINT                      NOT NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberVehicle_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberVehicle_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_MemberVehicle] PRIMARY KEY CLUSTERED ([Id]),
)

GO
