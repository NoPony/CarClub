CREATE TABLE [dbo].[SeasonAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [SeasonId]                    BIGINT                      NOT NULL, 

    [Filename]                  NVARCHAR(128)               NULL, 
    [Url]                       NVARCHAR(256)               NULL,

	[CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_SeasonAttachment] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_SeasonAttachment_Season_SeasonId] FOREIGN KEY ([SeasonId]) REFERENCES [dbo].[Season] ([Id]),
);

GO

CREATE INDEX [IX_SeasonId] ON [dbo].[SeasonAttachment] ([SeasonId] ASC);

GO
