CREATE TABLE [dbo].[VehicleAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [VehicleId]                 BIGINT                      NOT NULL, 

    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

	[CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_VehicleAttachment] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_VehicleAttachment_Vehicle_VehicleId] FOREIGN KEY ([VehicleId]) REFERENCES [dbo].[Vehicle] ([Id]),
);

GO

CREATE INDEX [IX_VehicleId] ON [dbo].[VehicleAttachment] ([VehicleId] ASC);

GO
