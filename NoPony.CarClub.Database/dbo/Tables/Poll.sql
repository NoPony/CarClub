CREATE TABLE [dbo].[Poll]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [Open]                      BIT                         NOT NULL        CONSTRAINT [DF_Poll_Open] DEFAULT (0),
    [OpenIp]                    NVARCHAR(32)                NULL,
    [OpenUtc]                   DATETIMEOFFSET              NULL,
    [OpenBy]                    NVARCHAR(128)               NULL,
    [Duration]                  SMALLINT                    NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Poll_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Poll_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Poll_PollStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[PollStatus] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_StatusId] ON [dbo].[Poll] ([StatusId] ASC);

GO
