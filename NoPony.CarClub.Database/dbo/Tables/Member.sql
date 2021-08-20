CREATE TABLE [dbo].[Member]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [UserKey]                   UNIQUEIDENTIFIER            NULL,

    [FullName]                  NVARCHAR(256)               NOT NULL,
    [PreferredName]             NVARCHAR(128)               NOT NULL,

    [Phone]                     NVARCHAR(16)                NULL,
    [Mobile]                    NVARCHAR(16)                NULL,
    [Email]                     NVARCHAR(128)               NULL,

    [PrimaryAddress_Street1]    NVARCHAR(128)               NULL,
    [PrimaryAddress_Street2]    NVARCHAR(128)               NULL,
    [PrimaryAddress_Suburb]     NVARCHAR(128)               NULL,
    [PrimaryAddress_Postcode]   NVARCHAR(8)                 NULL,
    [PrimaryAddress_State]      NVARCHAR(32)                NULL,
    [PrimaryAddress_Latitude]   DECIMAL(18, 6)              NULL,
    [PrimaryAddress_Longitude]  DECIMAL(18, 6)              NULL,

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
