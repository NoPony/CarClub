CREATE TABLE [dbo].[InvoiceDetail]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [StockId]                   BIGINT                      NOT NULL,

    [Quantity]                  DECIMAL(18, 6)              NOT NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedUserId]             BIGINT                      NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_InvoiceDetail_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_InvoiceDetail_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_InvoiceDetail_User_CreatedUserId] FOREIGN KEY ([CreatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_InvoiceDetail_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_InvoiceDetail_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),

)

GO

CREATE INDEX [IX_Composite] ON [dbo].[InvoiceDetail] ([Deleted], [StockId]) INCLUDE ([Quantity], [Updated]);

GO
