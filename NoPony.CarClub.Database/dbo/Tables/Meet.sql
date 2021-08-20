CREATE TABLE [dbo].[Meet]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MeetStatusId]				BIGINT                      NOT NULL,
	
    [StartUtc]                  DATETIMEOFFSET              NULL,
    [DurationMinutes]           INT                         NULL,
    
    [Title]                     NVARCHAR(128)               NOT NULL, 
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_Meet] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_Meet_MeetStatusId] FOREIGN KEY ([MeetStatusId]) REFERENCES [dbo].[MeetStatus] ([Id]),
)
