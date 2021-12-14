CREATE TABLE [auth].[Role]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [Code]                      NVARCHAR(32)                NOT NULL, 
    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Role_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Role_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Role_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Role_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Role_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE NONCLUSTERED INDEX [IX_Composite] ON [auth].[Role] ([Id]) INCLUDE ([Code], [Deleted]);

GO

CREATE INDEX [IX_CreatedUserId] ON [auth].[Role] ([CreatedUserId] ASC);

GO

CREATE INDEX [IX_UpdatedUserId] ON [auth].[Role] ([UpdatedUserId] ASC);

GO

CREATE INDEX [IX_DeletedUserId] ON [auth].[Role] ([DeletedUserId] ASC);

GO
