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

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Member_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Member_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE INDEX [IX_Key] ON [dbo].[Member] ([UserKey] ASC);

GO
