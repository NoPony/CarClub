-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: auth, dbo
-- Source Schemata: auth, dbo
-- Created: Tue Oct 19 12:31:08 2021
-- Workbench Version: 8.0.26
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema auth
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `auth` ;
CREATE SCHEMA IF NOT EXISTS `auth` ;

-- ----------------------------------------------------------------------------
-- Table auth.Permission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `auth`.`Permission` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Id` ASC, `Code` ASC, `Title` ASC, `Deleted` ASC) VISIBLE,
  INDEX `IX_Composite_Code` (`Code` ASC, `Title` ASC, `Deleted` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_Permission_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Permission_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Permission_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table auth.Role
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `auth`.`Role` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Id` ASC, `Code` ASC, `Deleted` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_Role_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Role_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Role_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table auth.RolePermission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `auth`.`RolePermission` (
  `Id` BIGINT NOT NULL,
  `RoleId` BIGINT NOT NULL,
  `PermissionId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`RoleId` ASC, `PermissionId` ASC, `Deleted` ASC) VISIBLE,
  INDEX `IX_RoleId` (`RoleId` ASC) VISIBLE,
  INDEX `IX_PermissionId` (`PermissionId` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_RolePermission_Permission_PermissionId`
    FOREIGN KEY (`PermissionId`)
    REFERENCES `auth`.`Permission` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RolePermission_Role_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `auth`.`Role` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RolePermission_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RolePermission_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_RolePermission_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table auth.UserRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `auth`.`UserRole` (
  `Id` BIGINT NOT NULL,
  `UserId` BIGINT NOT NULL,
  `RoleId` BIGINT NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MemberId` (`UserId` ASC) VISIBLE,
  INDEX `IX_RoleId` (`RoleId` ASC) VISIBLE,
  INDEX `IX_Composite` (`UserId` ASC, `RoleId` ASC, `Deleted` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_UserRole_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserRole_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserRole_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserRole_User_UserId`
    FOREIGN KEY (`UserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_UserRole_Role_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `auth`.`Role` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table auth.User
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `auth`.`User` (
  `Id` BIGINT NOT NULL,
  `Key` VARCHAR(64) NOT NULL,
  `Email` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Password` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `MfaEnabled` TINYINT(1) NOT NULL DEFAULT 0,
  `MfaEnabledIp` VARBINARY(16) NULL,
  `MfaEnabledUtc` DATETIME(6) NULL,
  `MfaKey` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `EmailVerified` TINYINT(1) NOT NULL DEFAULT 0,
  `EmailVerifiedIp` VARBINARY(16) NULL,
  `EmailVerifiedUtc` DATETIME(6) NULL,
  `EmailVerifyKey` VARCHAR(64) NULL,
  `ForgotPassword` TINYINT(1) NOT NULL DEFAULT 0,
  `ForgotPasswordIp` VARBINARY(16) NULL,
  `ForgotPasswordUtc` VARCHAR(64) NULL,
  `ForgotPasswordKey` VARCHAR(64) NULL,
  `ForgotPasswordExpiryUtc` DATETIME(6) NULL,
  `ForgotResetIp` VARBINARY(16) NULL,
  `ForgotResetUtc` DATETIME(6) NULL,
  `LastLoginIp` VARBINARY(16) NULL,
  `LastLoginUtc` DATETIME(6) NULL,
  `FailedLogin` TINYINT(1) NOT NULL DEFAULT 0,
  `FailedLoginIp` VARBINARY(16) NULL,
  `FailedLoginUtc` DATETIME(6) NULL,
  `FailedLoginCount` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE INDEX `UQ_Login_Key` (`Key` ASC) VISIBLE,
  UNIQUE INDEX `UQ_Login_Email` (`Email` ASC) VISIBLE,
  UNIQUE INDEX `IX_Composite_DeletedLogin` (`Email` ASC, `Password` ASC, `EmailVerified` ASC, `ForgotPassword` ASC, `Deleted` ASC, `FailedLoginCount` ASC) VISIBLE,
  UNIQUE INDEX `IX_Composite_Key` (`Key` ASC, `Password` ASC, `EmailVerified` ASC, `ForgotPassword` ASC, `Deleted` ASC, `FailedLoginCount` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_Login_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Login_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Schema dbo
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `dbo` ;
CREATE SCHEMA IF NOT EXISTS `dbo` ;

-- ----------------------------------------------------------------------------
-- Table dbo.MemberVehicle
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberVehicle` (
  `Id` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `VehicleId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.Office
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Office` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.Penalty
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Penalty` (
  `Id` BIGINT NOT NULL,
  `HeatId` BIGINT NULL,
  `DriverId` BIGINT NULL,
  `VehicleId` BIGINT NULL,
  `StatusId` BIGINT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NULL,
  `Title` VARCHAR(64) CHARACTER SET 'utf8mb4' NULL,
  `Notes` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `ValueMs` SMALLINT NULL,
  `ValuePoints` SMALLINT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_Penalty_Member_DriverId`
    FOREIGN KEY (`DriverId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Penalty_Vehicle_VehicleId`
    FOREIGN KEY (`VehicleId`)
    REFERENCES `dbo`.`Vehicle` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Penalty_HeatStatus_StatusId`
    FOREIGN KEY (`StatusId`)
    REFERENCES `dbo`.`HeatStatus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.PenaltyAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`PenaltyAttachment` (
  `Id` BIGINT NOT NULL,
  `PenaltyId` BIGINT NOT NULL,
  `UploadIp` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `UploadUtc` DATETIME(6) NULL,
  `UploadBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_PenaltyId` (`PenaltyId` ASC) VISIBLE,
  CONSTRAINT `FK_PenaltyAttachment_Penalty_PenaltyId`
    FOREIGN KEY (`PenaltyId`)
    REFERENCES `dbo`.`Penalty` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.PenaltyReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`PenaltyReaction` (
  `Id` BIGINT NOT NULL,
  `PenaltyId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_PenaltyId` (`PenaltyId` ASC) VISIBLE,
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  CONSTRAINT `FK_PenaltyReaction_Penalty_PenaltyId`
    FOREIGN KEY (`PenaltyId`)
    REFERENCES `dbo`.`Penalty` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_PenaltyReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Poll
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Poll` (
  `Id` BIGINT NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `Open` TINYINT(1) NOT NULL DEFAULT 0,
  `OpenIp` VARBINARY(16) NULL,
  `OpenUtc` DATETIME(6) NULL,
  `OpenBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Closed` TINYINT(1) NOT NULL DEFAULT 0,
  `ClosedIp` VARBINARY(16) NULL,
  `ClosedUtc` DATETIME(6) NULL,
  `ClosedBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.PollOption
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`PollOption` (
  `Id` BIGINT NOT NULL,
  `PollId` BIGINT NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_PollId` (`PollId` ASC) VISIBLE,
  CONSTRAINT `FK_PollOption_Poll_PollOptionId`
    FOREIGN KEY (`PollId`)
    REFERENCES `dbo`.`Poll` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Post
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Post` (
  `Id` BIGINT NOT NULL,
  `BoardId` BIGINT NOT NULL,
  `SurveyId` BIGINT NULL,
  `PollId` BIGINT NULL,
  `CommentId` BIGINT NULL,
  `Pinned` TINYINT(1) NOT NULL DEFAULT 0,
  `PinnedIp` VARBINARY(16) NULL,
  `PinnedUtc` DATETIME(6) NULL,
  `PinnedUserId` BIGINT NULL,
  `PinnedNote` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `UnpinnedIp` VARBINARY(16) NULL,
  `UnpinnedUtc` DATETIME(6) NULL,
  `UnpinnedUserId` BIGINT NULL,
  `UnpinnedNote` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `Locked` TINYINT(1) NOT NULL DEFAULT 0,
  `LockedIp` VARBINARY(16) NULL,
  `LockedUtc` DATETIME(6) NULL,
  `LockedUserId` BIGINT NULL,
  `LockedNote` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `UnlockedIp` VARBINARY(16) NULL,
  `UnlockedUtc` DATETIME(6) NULL,
  `UnlockedUserId` BIGINT NULL,
  `UnlockedNote` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_BoardId` (`BoardId` ASC) VISIBLE,
  INDEX `IX_SurveyId` (`SurveyId` ASC) VISIBLE,
  INDEX `IX_PollId` (`PollId` ASC) VISIBLE,
  INDEX `IX_PostId` (`CommentId` ASC) VISIBLE,
  INDEX `IX_PinnedUserId` (`PinnedUserId` ASC) VISIBLE,
  INDEX `IX_UnpinnedId` (`UnpinnedUserId` ASC) VISIBLE,
  INDEX `IX_LockedId` (`LockedUserId` ASC) VISIBLE,
  INDEX `IX_UnlockedId` (`UnlockedUserId` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_Post_Board_BoardId`
    FOREIGN KEY (`BoardId`)
    REFERENCES `dbo`.`Board` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_Survey_SurveyId`
    FOREIGN KEY (`SurveyId`)
    REFERENCES `dbo`.`Survey` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_Poll_PollId`
    FOREIGN KEY (`PollId`)
    REFERENCES `dbo`.`Poll` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_Comment_PostId`
    FOREIGN KEY (`CommentId`)
    REFERENCES `dbo`.`Comment` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_User_PinnedUserId`
    FOREIGN KEY (`PinnedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_User_UnpinnedId`
    FOREIGN KEY (`UnpinnedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_User_LockedId`
    FOREIGN KEY (`LockedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_User_UnlockedId`
    FOREIGN KEY (`UnlockedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Post_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Qualification
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Qualification` (
  `Id` INT NOT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.Role
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Role` (
  `Id` BIGINT NOT NULL,
  `EventId` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_EventId` (`EventId` ASC) VISIBLE,
  CONSTRAINT `FK_Role_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Role_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Role_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.RoleCategory
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`RoleCategory` (
  `Id` INT NOT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.Season
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Season` (
  `Id` BIGINT NOT NULL,
  `StatusId` BIGINT NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `StartUtc` DATETIME(6) NULL,
  `EndUtc` DATETIME(6) NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_StatusId` (`StatusId` ASC) VISIBLE,
  CONSTRAINT `FK_Season_SeasonStatus_StatusId`
    FOREIGN KEY (`StatusId`)
    REFERENCES `dbo`.`SeasonStatus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SeasonAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SeasonAttachment` (
  `Id` BIGINT NOT NULL,
  `SeasonId` BIGINT NOT NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_SeasonId` (`SeasonId` ASC) VISIBLE,
  CONSTRAINT `FK_SeasonAttachment_Season_SeasonId`
    FOREIGN KEY (`SeasonId`)
    REFERENCES `dbo`.`Season` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SeasonEvent
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SeasonEvent` (
  `Id` BIGINT NOT NULL,
  `SeasonId` BIGINT NOT NULL,
  `EventId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_SeasonId` (`SeasonId` ASC) VISIBLE,
  CONSTRAINT `FK_SeasonEvent_Season_SeasonId`
    FOREIGN KEY (`SeasonId`)
    REFERENCES `dbo`.`Season` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SeasonEvent_Event_EventId`
    FOREIGN KEY (`EventId`)
    REFERENCES `dbo`.`Event` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SeasonEventReward
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SeasonEventReward` (
  `Id` BIGINT NOT NULL,
  `SeasonEventId` BIGINT NOT NULL,
  `Position` TINYINT UNSIGNED NULL,
  `Percentile` DOUBLE NULL,
  `Value` SMALLINT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedBy` TINYINT(1) NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_StatusId` (`SeasonEventId` ASC) VISIBLE,
  CONSTRAINT `FK_SeasonEventPoint_SeasonEvent_SeasonEventId`
    FOREIGN KEY (`SeasonEventId`)
    REFERENCES `dbo`.`SeasonEvent` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SeasonEventStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SeasonEventStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.SeasonStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SeasonStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table dbo.Survey
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Survey` (
  `Id` BIGINT NOT NULL,
  `CreatorId` BIGINT NOT NULL,
  `OwnerId` BIGINT NOT NULL,
  `StatusId` BIGINT NOT NULL,
  `Title` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_CreatorId` (`CreatorId` ASC) VISIBLE,
  INDEX `IX_OwnerId` (`OwnerId` ASC) VISIBLE,
  INDEX `IX_StatusId` (`StatusId` ASC) VISIBLE,
  CONSTRAINT `FK_Survey_Member_CreatorId`
    FOREIGN KEY (`CreatorId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_Member_OwnerId`
    FOREIGN KEY (`OwnerId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Survey_SurveyStatus_StatusId`
    FOREIGN KEY (`StatusId`)
    REFERENCES `dbo`.`SurveyStatus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SurveyOption
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SurveyOption` (
  `Id` BIGINT NOT NULL,
  `QuestionId` BIGINT NOT NULL,
  `Position` TINYINT UNSIGNED NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_QuestionId` (`QuestionId` ASC) VISIBLE,
  CONSTRAINT `FK_ServeyOption_SurveyQuestion_QuestionId`
    FOREIGN KEY (`QuestionId`)
    REFERENCES `dbo`.`SurveyQuestion` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SurveyQuestion
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SurveyQuestion` (
  `Id` BIGINT NOT NULL,
  `SurveyId` BIGINT NOT NULL,
  `Position` TINYINT UNSIGNED NULL,
  `Title` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `Text` TINYINT(1) NULL,
  `Int` TINYINT(1) NULL,
  `IntMin` SMALLINT NULL,
  `IntMax` SMALLINT NULL,
  `IntSteps` TINYINT UNSIGNED NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_ServeyId` (`SurveyId` ASC) VISIBLE,
  CONSTRAINT `FK_SurveyQuestion_Servey_ServeyId`
    FOREIGN KEY (`SurveyId`)
    REFERENCES `dbo`.`Survey` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SurveyResponse
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SurveyResponse` (
  `Id` BIGINT NOT NULL,
  `SurveyQuestionId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `OptionId` BIGINT NULL,
  `IntValue` SMALLINT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_SurveyQuestionId` (`SurveyQuestionId` ASC) VISIBLE,
  INDEX `IX_QuestionId` (`SurveyQuestionId` ASC) VISIBLE,
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  CONSTRAINT `FK_SurveyResponse_SurveyQuestion_SurveyQuestionId`
    FOREIGN KEY (`SurveyQuestionId`)
    REFERENCES `dbo`.`SurveyQuestion` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_SurveyResponse_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.SurveyStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`SurveyStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.Tag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Tag` (
  `Id` BIGINT NOT NULL,
  `CreatorId` BIGINT NOT NULL,
  `OwnerId` BIGINT NOT NULL,
  `StatusId` BIGINT NOT NULL,
  `Title` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_CreatorId` (`CreatorId` ASC) VISIBLE,
  INDEX `IX_OwnerId` (`OwnerId` ASC) VISIBLE,
  INDEX `IX_StatusId` (`StatusId` ASC) VISIBLE,
  CONSTRAINT `FK_Tag_Member_CreatorId`
    FOREIGN KEY (`CreatorId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Tag_Member_OwnerId`
    FOREIGN KEY (`OwnerId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Tag_TagStatus_StatusId`
    FOREIGN KEY (`StatusId`)
    REFERENCES `dbo`.`TagStatus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.TagStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`TagStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table dbo.Vehicle
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Vehicle` (
  `Id` BIGINT NOT NULL,
  `StatusId` BIGINT NOT NULL,
  `MakeId` BIGINT NULL,
  `ModelId` BIGINT NULL,
  `VariantId` BIGINT NULL,
  `Year` SMALLINT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_Vehicle_VehicleStatus_StatusId`
    FOREIGN KEY (`StatusId`)
    REFERENCES `dbo`.`VehicleStatus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vehicle_VehicleMake_MakeId`
    FOREIGN KEY (`MakeId`)
    REFERENCES `dbo`.`VehicleMake` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vehicle_VehicleModel_ModelId`
    FOREIGN KEY (`ModelId`)
    REFERENCES `dbo`.`VehicleModel` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Vehicle_VehicleVariant_VariantId`
    FOREIGN KEY (`VariantId`)
    REFERENCES `dbo`.`VehicleVariant` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Board
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Board` (
  `Id` BIGINT NOT NULL,
  `Key` VARCHAR(64) NOT NULL,
  `Ordinal` INT NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Key` ASC, `Deleted` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_Board_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Board_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Board_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.VehicleAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`VehicleAttachment` (
  `Id` BIGINT NOT NULL,
  `VehicleId` BIGINT NOT NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_VehicleId` (`VehicleId` ASC) VISIBLE,
  CONSTRAINT `FK_VehicleAttachment_Vehicle_VehicleId`
    FOREIGN KEY (`VehicleId`)
    REFERENCES `dbo`.`Vehicle` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.BoardRolePermission
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`BoardRolePermission` (
  `Id` BIGINT NOT NULL,
  `BoardId` BIGINT NOT NULL,
  `RoleId` BIGINT NOT NULL,
  `PermissionId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `BoardId` ASC, `RoleId` ASC, `PermissionId` ASC) VISIBLE,
  INDEX `IX_BoardId` (`BoardId` ASC) VISIBLE,
  INDEX `IX_RoleId` (`RoleId` ASC) VISIBLE,
  INDEX `IX_PermissionId` (`PermissionId` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_BoardRolePermission_Board_BoardId`
    FOREIGN KEY (`BoardId`)
    REFERENCES `dbo`.`Board` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BoardRolePermission_Role_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `auth`.`Role` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BoardRolePermission_Permission_PermissionId`
    FOREIGN KEY (`PermissionId`)
    REFERENCES `auth`.`Permission` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BoardRolePermission_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BoardRolePermission_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_BoardRolePermission_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.VehicleMake
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`VehicleMake` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.BoardTag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`BoardTag` (
  `Id` INT NOT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.VehicleModel
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`VehicleModel` (
  `Id` BIGINT NOT NULL,
  `MakeId` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_VehicleModel_VehicleMake_MakeId`
    FOREIGN KEY (`MakeId`)
    REFERENCES `dbo`.`VehicleMake` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Comment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Comment` (
  `Id` BIGINT NOT NULL,
  `Key` VARCHAR(64) NOT NULL,
  `ParentId` BIGINT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Content` VARCHAR(0) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `ParentId` ASC) VISIBLE,
  INDEX `IX_Key` (`Key` ASC) VISIBLE,
  INDEX `IX_ParentId` (`ParentId` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_Comment_Comment_ParentId`
    FOREIGN KEY (`ParentId`)
    REFERENCES `dbo`.`Comment` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comment_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comment_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Comment_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.VehicleOwner
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`VehicleOwner` (
  `Id` BIGINT NOT NULL,
  `MemberId` BIGINT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.CommentAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`CommentAttachment` (
  `Id` BIGINT NOT NULL,
  `CommentId` BIGINT NOT NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `CommentId` ASC, `Filename` ASC, `Url`(255) ASC) VISIBLE,
  INDEX `IX_CommentId` (`CommentId` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_CommentAttachment_Comment_CommentId`
    FOREIGN KEY (`CommentId`)
    REFERENCES `dbo`.`Comment` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CommentAttachment_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CommentAttachment_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CommentAttachment_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.VehicleReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`VehicleReaction` (
  `Id` BIGINT NOT NULL,
  `VehicleId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_VehicleReaction_Vehicle_VehicleId`
    FOREIGN KEY (`VehicleId`)
    REFERENCES `dbo`.`Vehicle` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_VehicleReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.CommentReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`CommentReaction` (
  `Id` BIGINT NOT NULL,
  `CommentId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `CommentId` ASC, `MemberId` ASC, `Emoji` ASC) VISIBLE,
  INDEX `IX_CommentId` (`CommentId` ASC) VISIBLE,
  INDEX `IX_CreatedUserId` (`CreatedUserId` ASC) VISIBLE,
  INDEX `IX_UpdatedUserId` (`UpdatedUserId` ASC) VISIBLE,
  INDEX `IX_DeletedUserId` (`DeletedUserId` ASC) VISIBLE,
  CONSTRAINT `FK_CommentReaction_Comment_CommentId`
    FOREIGN KEY (`CommentId`)
    REFERENCES `dbo`.`Comment` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CommentReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CommentReaction_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CommentReaction_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_CommentReaction_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.VehicleStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`VehicleStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.Event
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Event` (
  `Id` BIGINT NOT NULL,
  `MeetId` BIGINT NOT NULL,
  `StatusId` BIGINT NOT NULL,
  `Title` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `StartUtc` DATETIME(6) NULL,
  `DurationMinutes` INT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MeetId` (`MeetId` ASC) VISIBLE,
  INDEX `IX_StatusId` (`StatusId` ASC) VISIBLE,
  CONSTRAINT `FK_Event_Meet_MeetId`
    FOREIGN KEY (`MeetId`)
    REFERENCES `dbo`.`Meet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Event_EventStatus_StatusId`
    FOREIGN KEY (`StatusId`)
    REFERENCES `dbo`.`EventStatus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Event_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Event_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Event_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.VehicleVariant
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`VehicleVariant` (
  `Id` BIGINT NOT NULL,
  `ModelId` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_VehicleVariant_VehicleModel_ModelId`
    FOREIGN KEY (`ModelId`)
    REFERENCES `dbo`.`VehicleModel` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.EventAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`EventAttachment` (
  `Id` BIGINT NOT NULL,
  `EventId` BIGINT NOT NULL,
  `Title` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_EventId` (`EventId` ASC) VISIBLE,
  CONSTRAINT `FK_EventAttachment_Event_EventId`
    FOREIGN KEY (`EventId`)
    REFERENCES `dbo`.`Event` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventAttachment_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventAttachment_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventAttachment_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.EventMemberRole
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`EventMemberRole` (
  `Id` BIGINT NOT NULL,
  `EventId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `RoleId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_EventMemberRole_Event_EventId`
    FOREIGN KEY (`EventId`)
    REFERENCES `dbo`.`Event` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventMemberRole_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventMemberRole_Role_RoleId`
    FOREIGN KEY (`RoleId`)
    REFERENCES `dbo`.`Role` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventMemberRole_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventMemberRole_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventMemberRole_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.EventReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`EventReaction` (
  `Id` BIGINT NOT NULL,
  `EventId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `ReactionId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_EventId` (`EventId` ASC) VISIBLE,
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  INDEX `IX_Reaction` (`ReactionId` ASC) VISIBLE,
  CONSTRAINT `FK_EventReaction_Event_EventId`
    FOREIGN KEY (`EventId`)
    REFERENCES `dbo`.`Event` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventReaction_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventReaction_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventReaction_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.EventStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`EventStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_EventStatus_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventStatus_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventStatus_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.EventTag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`EventTag` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_EventTag_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventTag_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventTag_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Grid
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Grid` (
  `Id` BIGINT NOT NULL,
  `HeatId` BIGINT NOT NULL,
  `MemberId` BIGINT NULL,
  `VehicleId` BIGINT NULL,
  `Position` INT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_HeatId` (`HeatId` ASC) VISIBLE,
  INDEX `IX_DriverId` (`MemberId` ASC) VISIBLE,
  INDEX `IX_Vehicle` (`VehicleId` ASC) VISIBLE,
  CONSTRAINT `FK_Grid_Heat_HeatId`
    FOREIGN KEY (`HeatId`)
    REFERENCES `dbo`.`Heat` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Grid_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Grid_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Grid_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.GridReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`GridReaction` (
  `Id` BIGINT NOT NULL,
  `GridId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_GridId` (`GridId` ASC) VISIBLE,
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  CONSTRAINT `FK_GridReaction_Grid_GridId`
    FOREIGN KEY (`GridId`)
    REFERENCES `dbo`.`Grid` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_GridReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_GridReaction_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_GridReaction_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_GridReaction_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Heat
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Heat` (
  `Id` BIGINT NOT NULL,
  `EventId` BIGINT NOT NULL,
  `StatusId` BIGINT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_EventId` (`EventId` ASC) VISIBLE,
  CONSTRAINT `FK_Heat_Event_EventId`
    FOREIGN KEY (`EventId`)
    REFERENCES `dbo`.`Event` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Heat_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Heat_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Heat_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.HeatAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`HeatAttachment` (
  `Id` BIGINT NOT NULL,
  `HeatId` BIGINT NOT NULL,
  `UploadIp` VARCHAR(16) CHARACTER SET 'utf8mb4' NULL,
  `UploadUtc` DATETIME(6) NULL,
  `Title` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_HeatId` (`HeatId` ASC) VISIBLE,
  CONSTRAINT `FK_HeatAttachment_Heat_HeatId`
    FOREIGN KEY (`HeatId`)
    REFERENCES `dbo`.`Heat` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatAttachment_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatAttachment_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatAttachment_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.HeatPenaltyStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`HeatPenaltyStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.HeatReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`HeatReaction` (
  `Id` BIGINT NOT NULL,
  `HeatId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_HeatId` (`HeatId` ASC) VISIBLE,
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  CONSTRAINT `FK_HeatReaction_Heat_HeatId`
    FOREIGN KEY (`HeatId`)
    REFERENCES `dbo`.`Heat` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatReaction_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatReaction_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatReaction_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.HeatStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`HeatStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE,
  CONSTRAINT `FK_HeatStatus_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatStatus_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatStatus_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.HeatTag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`HeatTag` (
  `Id` BIGINT NOT NULL,
  `HeatId` BIGINT NOT NULL,
  `TagId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_HeatTag_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatTag_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_HeatTag_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Invoice
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Invoice` (
  `Id` BIGINT NOT NULL,
  `CustomerId` BIGINT NOT NULL,
  `StatusId` BIGINT NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_Invoice_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Invoice_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Invoice_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.InvoiceDetail
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`InvoiceDetail` (
  `Id` BIGINT NOT NULL,
  `StockId` BIGINT NOT NULL,
  `Quantity` DECIMAL(18,6) NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `StockId` ASC, `Quantity` ASC, `Updated` ASC) VISIBLE,
  CONSTRAINT `FK_InvoiceDetail_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InvoiceDetail_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InvoiceDetail_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.InvoiceStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`InvoiceStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE,
  CONSTRAINT `FK_InvoiceStatus_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InvoiceStatus_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_InvoiceStatus_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Lap
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Lap` (
  `Id` BIGINT NOT NULL,
  `HeatId` BIGINT NOT NULL,
  `VehicleId` BIGINT NULL,
  `DriverId` BIGINT NULL,
  `StatusId` BIGINT NULL,
  `StartTime` TINYINT(1) NOT NULL DEFAULT 0,
  `StartTimeMs` DECIMAL(18,6) NULL,
  `StartTimeIp` VARBINARY(16) NOT NULL,
  `StartTimeUtc` DATETIME(6) NOT NULL,
  `StartTimeBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `EndTime` TINYINT(1) NOT NULL DEFAULT 0,
  `EndTimeMs` DECIMAL(18,6) NULL,
  `EndTimeIp` VARBINARY(16) NOT NULL,
  `EndTimeUtc` DATETIME(6) NOT NULL,
  `EndTimeBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Time` TINYINT(1) NOT NULL DEFAULT 0,
  `TimeMs` DECIMAL(18,6) NULL,
  `TimeIp` VARBINARY(16) NOT NULL,
  `TimeUtc` DATETIME(6) NOT NULL,
  `TimeBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Position` TINYINT(1) NOT NULL DEFAULT 0,
  `PositionNumber` TINYINT UNSIGNED NULL,
  `PositionIp` VARBINARY(16) NOT NULL,
  `PositionUtc` DATETIME(6) NOT NULL,
  `PositionBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_HeatId` (`HeatId` ASC) VISIBLE,
  CONSTRAINT `FK_HeatResultLap_HeatResult_ResultId`
    FOREIGN KEY (`HeatId`)
    REFERENCES `dbo`.`Heat` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Lap_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Lap_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Lap_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.LapReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`LapReaction` (
  `Id` BIGINT NOT NULL,
  `LapId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_LapId` (`LapId` ASC) VISIBLE,
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  CONSTRAINT `FK_LapReaction_Lap_LapId`
    FOREIGN KEY (`LapId`)
    REFERENCES `dbo`.`Lap` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapReaction_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapReaction_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapReaction_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.LapStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`LapStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE,
  CONSTRAINT `FK_LapStatus_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapStatus_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapStatus_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.LapTag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`LapTag` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_LapTag_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapTag_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_LapTag_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Meet
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Meet` (
  `Id` BIGINT NOT NULL,
  `MeetStatusId` BIGINT NOT NULL,
  `StartUtc` DATETIME(6) NULL,
  `DurationMinutes` INT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_Meet_MeetStatusId`
    FOREIGN KEY (`MeetStatusId`)
    REFERENCES `dbo`.`MeetStatus` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Meet_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Meet_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_Meet_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MeetAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MeetAttachment` (
  `Id` BIGINT NOT NULL,
  `MeetId` BIGINT NOT NULL,
  `Title` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MeetId` (`MeetId` ASC) VISIBLE,
  CONSTRAINT `FK_MeetAttachment_Meet_MeetId`
    FOREIGN KEY (`MeetId`)
    REFERENCES `dbo`.`Meet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetAttachment_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetAttachment_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetAttachment_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MeetOfficial
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MeetOfficial` (
  `Id` BIGINT NOT NULL,
  `MeetId` BIGINT NOT NULL,
  `OfficeId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MeetId` (`MeetId` ASC) VISIBLE,
  CONSTRAINT `FK_MeetOfficial_Meet_MeetId`
    FOREIGN KEY (`MeetId`)
    REFERENCES `dbo`.`Meet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetOfficial_Office_OfficeId`
    FOREIGN KEY (`OfficeId`)
    REFERENCES `dbo`.`Office` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetOfficial_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetOfficial_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetOfficial_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetOfficial_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MeetReaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MeetReaction` (
  `Id` BIGINT NOT NULL,
  `MeetId` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `Emoji` CHAR(1) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MeetId` (`MeetId` ASC) VISIBLE,
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  CONSTRAINT `FK_MeetReaction_Meet_MeetId`
    FOREIGN KEY (`MeetId`)
    REFERENCES `dbo`.`Meet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetReaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetReaction_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetReaction_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetReaction_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MeetStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MeetStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Composite` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE,
  CONSTRAINT `FK_MeetStatus_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetStatus_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetStatus_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MeetTag
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MeetTag` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_MeetTag_User_CreatedUserId`
    FOREIGN KEY (`CreatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetTag_User_UpdatedUserId`
    FOREIGN KEY (`UpdatedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MeetTag_User_DeletedUserId`
    FOREIGN KEY (`DeletedUserId`)
    REFERENCES `auth`.`User` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.Member
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`Member` (
  `Id` BIGINT NOT NULL,
  `UserKey` VARCHAR(64) NULL,
  `FullName` VARCHAR(256) CHARACTER SET 'utf8mb4' NOT NULL,
  `PreferredName` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Phone` VARCHAR(16) CHARACTER SET 'utf8mb4' NULL,
  `Mobile` VARCHAR(16) CHARACTER SET 'utf8mb4' NULL,
  `Email` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `PrimaryAddress_Street1` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `PrimaryAddress_Street2` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `PrimaryAddress_Suburb` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `PrimaryAddress_Postcode` VARCHAR(8) CHARACTER SET 'utf8mb4' NULL,
  `PrimaryAddress_State` VARCHAR(32) CHARACTER SET 'utf8mb4' NULL,
  `PrimaryAddress_Latitude` DECIMAL(18,6) NULL,
  `PrimaryAddress_Longitude` DECIMAL(18,6) NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Key` (`UserKey` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table dbo.MemberEvent
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberEvent` (
  `Id` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `EventId` BIGINT NOT NULL,
  `Register` TINYINT(1) NOT NULL DEFAULT 0,
  `RegisterIp` VARBINARY(16) NULL,
  `RegisterUtc` DATETIME(6) NULL,
  `RegisterBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Checkin` TINYINT(1) NOT NULL DEFAULT 0,
  `CheckinIp` VARBINARY(16) NULL,
  `CheckinUtc` DATETIME(6) NULL,
  `CheckinBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `OnTrack` TINYINT(1) NOT NULL DEFAULT 0,
  `OnTrackIp` VARBINARY(16) NULL,
  `OnTrackUtc` DATETIME(6) NULL,
  `OnTrackBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `OffTrack` TINYINT(1) NOT NULL DEFAULT 0,
  `OffTrackIp` VARBINARY(16) NULL,
  `OffTrackUtc` DATETIME(6) NULL,
  `OffTrackBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Checkout` TINYINT(1) NOT NULL DEFAULT 0,
  `CheckoutIp` VARBINARY(16) NULL,
  `CheckoutUtc` DATETIME(6) NULL,
  `CheckoutBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  INDEX `IX_EventId` (`EventId` ASC) VISIBLE,
  CONSTRAINT `FK_EventEntry_Event_EventId`
    FOREIGN KEY (`EventId`)
    REFERENCES `dbo`.`Event` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_EventEntry_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MemberEventAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberEventAttachment` (
  `Id` BIGINT NOT NULL,
  `MemberEventId` BIGINT NOT NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MemberEventId` (`MemberEventId` ASC) VISIBLE,
  CONSTRAINT `FK_MemberEventAttachment_MemberEvent_MemberEntryId`
    FOREIGN KEY (`MemberEventId`)
    REFERENCES `dbo`.`MemberEvent` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MemberEventStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberEventStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_Code` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE,
  INDEX `IX_Composite` (`Deleted` ASC, `Code` ASC, `Title` ASC, `Updated` ASC) VISIBLE);

-- ----------------------------------------------------------------------------
-- Table dbo.MemberMeet
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberMeet` (
  `Id` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `MeetId` BIGINT NOT NULL,
  `Enter` TINYINT(1) NOT NULL,
  `EnterIp` VARBINARY(16) NULL,
  `EnterUtc` DATETIME(6) NULL,
  `EnterBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Checkin` TINYINT(1) NOT NULL,
  `CheckinIp` VARBINARY(16) NOT NULL,
  `CheckinUtc` DATETIME(6) NOT NULL,
  `CheckinBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Checkout` TINYINT(1) NOT NULL,
  `CheckoutIp` VARBINARY(16) NOT NULL,
  `CheckoutUtc` DATETIME(6) NOT NULL,
  `CheckoutBy` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedBy` TINYINT(1) NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  INDEX `IX_MeetId` (`MeetId` ASC) VISIBLE,
  CONSTRAINT `FK_MemberMeet_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `FK_MemberMeet_Meet_MeetId`
    FOREIGN KEY (`MeetId`)
    REFERENCES `dbo`.`Meet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MemberMeetAttachment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberMeetAttachment` (
  `Id` BIGINT NOT NULL,
  `MemberMeetId` BIGINT NOT NULL,
  `Filename` VARCHAR(128) CHARACTER SET 'utf8mb4' NULL,
  `Url` VARCHAR(256) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  CONSTRAINT `FK_MemberMeetAttachment_MemberMeet_MemberMeetId`
    FOREIGN KEY (`MemberMeetId`)
    REFERENCES `dbo`.`MemberMeet` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- ----------------------------------------------------------------------------
-- Table dbo.MemberMeetStatus
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberMeetStatus` (
  `Id` BIGINT NOT NULL,
  `Code` VARCHAR(32) CHARACTER SET 'utf8mb4' NOT NULL,
  `Title` VARCHAR(128) CHARACTER SET 'utf8mb4' NOT NULL,
  `Note` VARCHAR(1024) CHARACTER SET 'utf8mb4' NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.MemberOffice
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberOffice` (
  `Id` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `OfficeId` BIGINT NOT NULL,
  `StartUtc` DATETIME(6) NULL,
  `EndUtc` DATETIME(6) NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.MemberQualification
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberQualification` (
  `Id` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `QualificationId` BIGINT NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`));

-- ----------------------------------------------------------------------------
-- Table dbo.MemberTransaction
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `dbo`.`MemberTransaction` (
  `Id` BIGINT NOT NULL,
  `MemberId` BIGINT NOT NULL,
  `WhenUtc` DATETIME(6) NOT NULL,
  `Description` VARCHAR(256) CHARACTER SET 'utf8mb4' NOT NULL,
  `Debit` DECIMAL(19,4) NOT NULL,
  `Credit` DECIMAL(19,4) NOT NULL,
  `Balance` DECIMAL(19,4) NOT NULL,
  `CreatedIp` VARBINARY(16) NOT NULL,
  `CreatedUtc` DATETIME(6) NOT NULL,
  `CreatedUserId` BIGINT NOT NULL,
  `Updated` TINYINT(1) NOT NULL DEFAULT 0,
  `UpdatedIp` VARBINARY(16) NULL,
  `UpdatedUtc` DATETIME(6) NULL,
  `UpdatedUserId` BIGINT NULL,
  `Deleted` TINYINT(1) NOT NULL DEFAULT 0,
  `DeletedIp` VARBINARY(16) NULL,
  `DeletedUtc` DATETIME(6) NULL,
  `DeletedUserId` BIGINT NULL,
  PRIMARY KEY (`Id`),
  INDEX `IX_MemberId` (`MemberId` ASC) VISIBLE,
  CONSTRAINT `FK_MemberTransaction_Member_MemberId`
    FOREIGN KEY (`MemberId`)
    REFERENCES `dbo`.`Member` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
SET FOREIGN_KEY_CHECKS = 1;
