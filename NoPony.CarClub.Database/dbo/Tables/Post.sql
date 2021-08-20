CREATE TABLE [dbo].[Post]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [ParentId]                  BIGINT                      NULL,   

    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Post_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Post_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Post_Post_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [dbo].[Post] ([Id]),
)

GO

CREATE NONCLUSTERED INDEX [IX_Parent] ON [dbo].[Post] ([ParentId] ASC);

GO
