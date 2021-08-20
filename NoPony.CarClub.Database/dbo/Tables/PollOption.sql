CREATE TABLE [dbo].[PollOption]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PollId]                    BIGINT                      NOT NULL, 

    [Title]                     NVARCHAR(128)               NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_PollOption_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_PollOption_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_PollOption] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_PollOption_Poll_PollOptionId] FOREIGN KEY ([PollId]) REFERENCES [dbo].[Poll] ([Id])
);

GO

CREATE NONCLUSTERED INDEX [IX_PollId] ON [dbo].[PollOption] ([PollId] ASC);

GO
