CREATE TABLE [auth].[Permission]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,

    [Code]                      NVARCHAR(32)                NULL,
    [Title]                     NVARCHAR(128)               NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Permission_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Permission_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Permission_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Permission_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Permission_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [auth].[Permission] ([Id] ASC) INCLUDE ([Code], [Title], [Deleted]);

GO

CREATE INDEX [IX_Composite_Code] ON [auth].[Permission] ([Code] ASC) INCLUDE ([Title], [Deleted]);

GO

CREATE INDEX [IX_CreatedUserId] ON [auth].[Permission] ([CreatedUserId] ASC);

GO

CREATE INDEX [IX_UpdatedUserId] ON [auth].[Permission] ([UpdatedUserId] ASC);

GO

CREATE INDEX [IX_DeletedUserId] ON [auth].[Permission] ([DeletedUserId] ASC);

GO
