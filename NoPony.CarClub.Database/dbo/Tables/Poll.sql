CREATE TABLE [dbo].[Poll]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [Open]                      BIT                         NOT NULL        CONSTRAINT [DF_Poll_Open] DEFAULT (0),
    [OpenIp]                    VARBINARY(16)               NULL,
    [OpenUtc]                   DATETIMEOFFSET              NULL,
    [OpenBy]                    NVARCHAR(128)               NULL,

    [Closed]                    BIT                         NOT NULL        CONSTRAINT [DF_Poll_Closed] DEFAULT (0),
    [ClosedIp]                  VARBINARY(16)               NULL,
    [ClosedUtc]                 DATETIMEOFFSET              NULL,
    [ClosedBy]                  NVARCHAR(128)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Poll_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Poll_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO
