CREATE TABLE [auth].[User]
(
    [Id]                        BIGINT IDENTITY(1, 1)       NOT NULL,
    [Key]                       UNIQUEIDENTIFIER            NOT NULL        CONSTRAINT [UQ_Login_Key] UNIQUE,

    [Email]                     NVARCHAR(128)               NOT NULL        CONSTRAINT [UQ_Login_Email] UNIQUE,
    [Password]                  NVARCHAR(128)               NOT NULL,
    
    [MfaEnabled]                BIT                         NOT NULL        CONSTRAINT [DF_Login_MfaEnabled] DEFAULT (0),
    [MfaEnabledIp]              VARBINARY(16)               NULL,
    [MfaEnabledUtc]             DATETIME                    NULL,
    [MfaKey]                    NVARCHAR(128)               NULL,

    [EmailVerified]             BIT                         NOT NULL        CONSTRAINT [DF_Login_EmailVerify] DEFAULT (0),
    [EmailVerifiedIp]           VARBINARY(16)               NULL,
    [EmailVerifiedUtc]          DATETIMEOFFSET              NULL,
    [EmailVerifyKey]            UNIQUEIDENTIFIER            NULL,

    [ForgotPassword]            BIT                         NOT NULL        CONSTRAINT [DF_Login_ResetPassword] DEFAULT (0),
    [ForgotPasswordIp]          VARBINARY(16)               NULL,
    [ForgotPasswordUtc]         UNIQUEIDENTIFIER            NULL,
    [ForgotPasswordKey]         UNIQUEIDENTIFIER            NULL,
    [ForgotPasswordExpiryUtc]   DATETIMEOFFSET              NULL,
    [ForgotResetIp]             VARBINARY(16)               NULL,
    [ForgotResetUtc]            DATETIMEOFFSET              NULL,

    [LastLoginIp]               VARBINARY(16)               NULL,
    [LastLoginUtc]              DATETIMEOFFSET              NULL,

    [FailedLogin]               BIT                         NOT NULL        CONSTRAINT [DF_Login_FailedLogin] DEFAULT (0),
    [FailedLoginIp]             VARBINARY(16)               NULL,
    [FailedLoginUtc]            DATETIMEOFFSET              NULL,
    [FailedLoginCount]          TINYINT                     NOT NULL        CONSTRAINT [DF_Login_FailedLoginCount] DEFAULT (0),

    [CreatedIp]                 VARBINARY(16)               NOT NULL,
    [CreatedUtc]                DATETIMEOFFSET              NOT NULL,

    [Updated]                   BIT                         NOT NULL        CONSTRAINT [DF_Login_Updated] DEFAULT (0),
    [UpdatedIp]                 VARBINARY(16)               NULL,
    [UpdatedUtc]                DATETIMEOFFSET              NULL,
    [UpdatedUserId]             BIGINT                      NULL,

    [Deleted]                   BIT                         NOT NULL        CONSTRAINT [DF_Login_Deleted] DEFAULT (0),
    [DeletedIp]                 VARBINARY(16)               NULL,
    [DeletedUtc]                DATETIMEOFFSET              NULL,
    [DeletedUserId]             BIGINT                      NULL,

    CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED ([Id]),

    CONSTRAINT [FK_Login_User_UpdatedUserId] FOREIGN KEY ([UpdatedUserId]) REFERENCES [auth].[User] ([Id]),
    CONSTRAINT [FK_Login_User_DeletedUserId] FOREIGN KEY ([DeletedUserId]) REFERENCES [auth].[User] ([Id]),
);

GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Composite_Key] 
    ON [auth].[User] ([Key]) 
    INCLUDE ([Password], [EmailVerified], [ForgotPassword], [Deleted], [FailedLoginCount]);

GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Composite_DeletedLogin] 
    ON [auth].[User] ([Email]) 
    INCLUDE ([Password], [EmailVerified], [ForgotPassword], [Deleted], [FailedLoginCount]);

GO

CREATE NONCLUSTERED INDEX [IX_UpdatedUserId] ON [auth].[User] ([UpdatedUserId] ASC);

GO

CREATE NONCLUSTERED INDEX [IX_DeletedUserId] ON [auth].[User] ([DeletedUserId] ASC);

GO
