CREATE TABLE [dbo].[MemberEventAttachment]
(
	[Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberEventId]             BIGINT                      NOT NULL, 
    
    [Filename]                  NVARCHAR(128)               NULL, 
    [Title]                     NVARCHAR(128)               NULL,
    [Url]                       NVARCHAR(256)               NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEventAttachment_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberEventAttachment_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_MemberEventAttachment] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_MemberEventAttachment_MemberEvent_MemberEntryId] FOREIGN KEY ([MemberEventId]) REFERENCES [dbo].[MemberEvent] ([Id]),

    --CONSTRAINT [FK_XXX_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    --CONSTRAINT [FK_XXX_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

);

GO

CREATE NONCLUSTERED INDEX [IX_MemberEventId] ON [dbo].[MemberEventAttachment] ([MemberEventId] ASC);

GO

