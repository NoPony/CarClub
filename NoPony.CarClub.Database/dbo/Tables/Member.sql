CREATE TABLE [dbo].[Member]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [UserKey]                   UNIQUEIDENTIFIER            NULL,

    [FullName]                  NVARCHAR(256)               NOT NULL,
    [PreferredName]             NVARCHAR(128)               NOT NULL,

    [Phone]                     NVARCHAR(16)                NULL,
    [Mobile]                    NVARCHAR(16)                NULL,
    [Email]                     NVARCHAR(128)               NULL,

    [Street]                    NVARCHAR(128)               NULL,
    [Suburb]                    NVARCHAR(128)               NULL,
    [Postcode]                  NVARCHAR(8)                 NULL,
    [State]                     NVARCHAR(32)                NULL,
    [Latitude]                  DECIMAL(18, 6)              NULL,
    [Longitude]                 DECIMAL(18, 6)              NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Member_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Member_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED ([Id]),
)
