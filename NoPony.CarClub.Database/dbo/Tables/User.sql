CREATE TABLE [dbo].[User]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [Key]                       UNIQUEIDENTIFIER            NOT NULL        CONSTRAINT [UQ_User_Key] UNIQUE,

    [Email]                     NVARCHAR(128)               NOT NULL        CONSTRAINT [UQ_User_Email] UNIQUE,
    [Password]                  NVARCHAR(128)               NOT NULL,
    
    [MfaEnabled]                BIT                         NOT NULL        CONSTRAINT [DF_User_MfaEnabled] DEFAULT (0),
    [MfaEnabledUtc]             DATETIME                    NULL,
    [MfaKey]                    NVARCHAR(128)               NULL,

    [EmailVerify]               BIT                         NOT NULL        CONSTRAINT [DF_User_EmailVerify] DEFAULT (0),
    [EmailVerifyIp]             NVARCHAR(32)                NULL,
    [EmailVerifyUtc]            DATETIMEOFFSET              NULL,
    [EmailVerifyKey]            UNIQUEIDENTIFIER            NULL,
    [EmailVerifyExpiryUtc]      DATETIMEOFFSET              NULL,
    [EmailVerifiedIp]           NVARCHAR(32)                NULL,
    [EmailVerifiedUtc]          DATETIMEOFFSET              NULL,

    [ForgotPassword]            BIT                         NOT NULL        CONSTRAINT [DF_User_ResetPassword] DEFAULT (0),
    [ForgotPasswordIp]          NVARCHAR(32)                NULL,
    [ForgotPasswordUtc]         UNIQUEIDENTIFIER            NULL,
    [ForgotPasswordKey]         UNIQUEIDENTIFIER            NULL,
    [ForgotPasswordExpiryUtc]   DATETIMEOFFSET              NULL,
    [ForgotResetIp]             NVARCHAR(32)                NULL,
    [ForgotResetUtc]            DATETIMEOFFSET              NULL,

    [LastLoginIp]               NVARCHAR(32)                NULL,
    [LastLoginUtc]              DATETIMEOFFSET              NULL,

    [FailedLogin]               BIT                         NOT NULL        CONSTRAINT [DF_User_FailedLogin] DEFAULT (0),
    [FailedLoginIp]             NVARCHAR(32)                NULL,
    [FailedLoginUtc]            DATETIMEOFFSET              NULL,
    [FailedLoginCount]          TINYINT                     NOT NULL        CONSTRAINT [DF_User_FailedLoginCount] DEFAULT (0),

    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,
    [CreatedIp]                 NVARCHAR(32)                NOT NULL,
    [CreatedBy]                 NVARCHAR(128)               NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_User_Updated] DEFAULT (0),
    [UpdatedIp]                 NVARCHAR(32)                NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedBy]                 NVARCHAR(128)               NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_User_Deleted] DEFAULT (0),
    [DeletedIp]                 NVARCHAR(32)                NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedBy]                 NVARCHAR(128)               NULL,

    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id]),
);

GO

CREATE INDEX [IX_User_Key] ON [dbo].[User] ([Key]);

GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Composite_DeletedKey] 
    ON [dbo].[User] ([Deleted], [Key]) 
    INCLUDE ([Password], [MfaKey], [EmailVerify], [ForgotPassword], [FailedLogin]);

GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Key]
    ON [dbo].[User] ([Deleted], [Email])
    INCLUDE ([Password], [MfaKey], [EmailVerify], [ForgotPassword], [FailedLogin]);

GO;
