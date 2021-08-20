CREATE TABLE [dbo].[InvoiceDetail]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [StockId]                   BIGINT                      NOT NULL,

    [Quantity]                  DECIMAL(18, 6)              NOT NULL,
    [Note]                      NVARCHAR(1024)              NULL,

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_InvoiceDetail_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_InvoiceDetail_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_InvoiceDetail] PRIMARY KEY CLUSTERED ([Id]),
)

GO

CREATE INDEX [IX_Composite] ON [dbo].[InvoiceDetail] ([Deleted], [StockId]) INCLUDE ([Quantity], [Updated]);

GO
