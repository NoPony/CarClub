CREATE TABLE [dbo].[Board]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

	[CreatorId]                 BIGINT                      NOT NULL,
    [OwnerId]                   BIGINT                      NOT NULL,
    [StatusId]                  BIGINT                      NOT NULL,

    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,
    
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Board_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Board_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Board] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Board_Member_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Member] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Board_Member_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[Member] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_Board_BoardStatus_StatusId] FOREIGN KEY ([StatusId]) REFERENCES [dbo].[BoardStatus] ([Id]) ON DELETE NO ACTION,
)

GO

CREATE INDEX [IX_Composite] ON [dbo].[Board] ([Deleted] ASC, [CreatorId] ASC, [OwnerId] ASC, [StatusId] ASC);

GO

CREATE INDEX [IX_CreatorId] ON [dbo].[Board] ([CreatorId] ASC);

GO

CREATE INDEX [IX_OwnerId] ON [dbo].[Board] ([OwnerId] ASC);

GO

CREATE INDEX [IX_StatusId] ON [dbo].[Board] ([StatusId] ASC);

GO

