CREATE TABLE [dbo].[Thread]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PostId]                    BIGINT                      NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [Pinned]                    BIT                         NOT NULL        CONSTRAINT [DF_Thread_Pinned] DEFAULT (0),
    [PinnedIp]                  NVARCHAR(32)                NULL,
    [PinnedUtc]                 DATETIMEOFFSET              NULL,
    [PinnedBy]                  NVARCHAR(128)               NULL,
    [PinnedNote]                NVARCHAR(1024)              NULL,

    [UnpinnedIp]                NVARCHAR(32)                NULL,
    [UnpinnedUtc]               DATETIMEOFFSET              NULL,
    [UnpinnedBy]                NVARCHAR(128)               NULL,
    [UnpinnedNote]              NVARCHAR(1024)              NULL,

    [Locked]                    BIT                         NOT NULL        CONSTRAINT [DF_Thread_Locked] DEFAULT (0),
    [LockedIp]                  NVARCHAR(32)                NULL,
    [LockedUtc]                 DATETIMEOFFSET              NULL,
    [LockedBy]                  NVARCHAR(128)               NULL,
    [LockedNote]                NVARCHAR(1024)              NULL,

    [UnlockedIp]                NVARCHAR(32)                NULL,
    [UnlockedUtc]               DATETIMEOFFSET              NULL,
    [UnlockedBy]                NVARCHAR(128)               NULL,
    [UnlockedNote]              NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Thread_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Thread_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Thread] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Thread_ThreadStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[ThreadStatus] ([Id]),
)

GO

CREATE NONCLUSTERED INDEX [IX_StatusId] ON [dbo].[Thread] ([StatusId] ASC);

GO
