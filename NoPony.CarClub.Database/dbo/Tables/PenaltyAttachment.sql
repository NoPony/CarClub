CREATE TABLE [dbo].[PenaltyAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PenaltyId]                 BIGINT                      NOT NULL, 

    [UploadIp]                  NVARCHAR(32)                NOT NULL,
    [UploadUtc]                 DATETIMEOFFSET              NULL,
    [UploadBy]                  NVARCHAR(128)               NOT NULL,
    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_PenaltyAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_PenaltyAttachment] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PenaltyAttachment_Penalty_PenaltyId] FOREIGN KEY ([PenaltyId]) REFERENCES [dbo].[Penalty] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_PenaltyId] ON [dbo].[PenaltyAttachment] ([PenaltyId] ASC);

GO
