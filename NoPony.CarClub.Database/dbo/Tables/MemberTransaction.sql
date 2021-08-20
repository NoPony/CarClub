CREATE TABLE [dbo].[MemberTransaction]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [MemberId]                  BIGINT                      NOT NULL,

    [WhenUtc]                   DATETIMEOFFSET              NOT NULL,
    [Description]               NVARCHAR(256)               NOT NULL, 
    [Debit]                     MONEY                       NOT NULL, 
    [Credit]                    MONEY                       NOT NULL, 

    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberTransaction_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_MemberTransaction_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,

    CONSTRAINT [PK_MemberTransaction] PRIMARY KEY CLUSTERED ([Id]),
    CONSTRAINT [FK_MemberTransaction_Member_MemberId] FOREIGN KEY ([MemberId]) REFERENCES [dbo].[Member] ([Id])
)

GO

CREATE INDEX [IX_MemberId] ON [dbo].[MemberTransaction] ([MemberId]);

GO
