CREATE TABLE [dbo].[Role]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [Code]                      NVARCHAR(32)                NOT NULL, 
    [Name]                      NVARCHAR(1024)              NOT NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([Id]),
);

GO

