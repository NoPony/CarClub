CREATE TABLE [dbo].[Office]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

	[Code]                      NVARCHAR(32)                NOT NULL,
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Office_Updated] DEFAULT (0),
    [UpdatedMemberId]           BIGINT                      NULL,
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Office_Deleted] DEFAULT (0),
    [DeletedMemberId]           BIGINT                      NULL,
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED ([Id]),
)
