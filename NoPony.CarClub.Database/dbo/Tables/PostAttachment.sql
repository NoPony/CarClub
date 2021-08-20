CREATE TABLE [dbo].[PostAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [PostId]                    BIGINT                      NOT NULL, 

    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

	[CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_PostAttachment] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_PostAttachment_Post_PostId] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id]),
);

GO

CREATE INDEX [IX_PostId] ON [dbo].[PostAttachment] ([PostId] ASC);

GO
