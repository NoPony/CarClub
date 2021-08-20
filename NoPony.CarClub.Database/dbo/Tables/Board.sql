CREATE TABLE [dbo].[Board]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [ParentId]				    BIGINT                      NULL,

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

    CONSTRAINT [FK_Board_Board_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Board] ([Id]),
    CONSTRAINT [FK_Board_Member_CreatorId] FOREIGN KEY ([CreatorId]) REFERENCES [dbo].[Member] ([Id]),
    CONSTRAINT [FK_Board_Member_OwnerId] FOREIGN KEY ([OwnerId]) REFERENCES [dbo].[Member] ([Id]),
)
