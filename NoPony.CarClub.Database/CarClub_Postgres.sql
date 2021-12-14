-- Database: CarClub

-- CREATE DATABASE "car_club" WITH 
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'English_Australia.1252'
--     LC_CTYPE = 'English_Australia.1252'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;

-- CREATE SCHEMA IF NOT EXISTS public
--     AUTHORIZATION postgres;

-- GRANT ALL ON SCHEMA public TO postgres;

CREATE ROLE car_club_api WITH
  LOGIN
  PASSWORD 'password'
  IN ROLE pg_read_all_data, pg_write_all_data
  INHERIT;
  
CREATE ROLE car_club_deploy WITH
    LOGIN
    PASSWORD 'password'
	IN ROLE pg_read_all_data, pg_write_all_data
  INHERIT;
  
GRANT ALL ON SCHEMA public TO car_club_api;
GRANT ALL ON SCHEMA public TO car_club_deploy;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- -----------------------------------------------------
-- Table "user"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "user" (
    "Id"                        BIGINT                                  NOT NULL    GENERATED ALWAYS AS IDENTITY,
    "Key"                       UUID                                    NOT NULL,
    "Email"                     VARCHAR(128)                            NOT NULL,
    "Password"                  VARCHAR(128)                            NOT NULL,
    "MfaEnabled"                BOOLEAN                                 NOT NULL    CONSTRAINT "DF_User_MfaEnabled" DEFAULT FALSE,
    "MfaEnabledIp"              INET                                    NULL,
    "MfaEnabledUtc"             TIMESTAMP(6) WITH TIME ZONE             NULL,
    "MfaKey"                    UUID                                    NULL,
    "EmailVerified"             BOOLEAN                                 NOT NULL    CONSTRAINT "DF_User_EmailVerified" DEFAULT FALSE,
    "EmailVerifiedIp"           INET                                    NULL,
    "EmailVerifiedUtc"          TIMESTAMP(6) WITH TIME ZONE             NULL,
    "EmailVerifyKey"            UUID                                    NULL,
    "ForgotPassword"            BOOLEAN                                 NOT NULL    CONSTRAINT "DF_User_ForgotPassword" DEFAULT FALSE,
    "ForgotPasswordIp"          INET                                    NULL,
    "ForgotPasswordUtc"         VARCHAR(64)                             NULL,
    "ForgotPasswordKey"         VARCHAR(64)                             NULL,
    "ForgotPasswordExpiryUtc"   TIMESTAMP(6) WITH TIME ZONE             NULL,
    "ForgotResetIp"             INET                                    NULL,
    "ForgotResetUtc"            TIMESTAMP(6) WITH TIME ZONE             NULL,
    "LastLoginIp"               INET                                    NULL,
    "LastLoginUtc"              TIMESTAMP(6) WITH TIME ZONE             NULL,
    "FailedLogin"               BOOLEAN                                 NOT NULL    CONSTRAINT "DF_User_FailedLogin" DEFAULT FALSE,
    "FailedLoginIp"             INET                                    NULL,
    "FailedLoginUtc"            TIMESTAMP(6) WITH TIME ZONE             NULL,
    "FailedLoginCount"          SMALLINT                                NOT NULL    CONSTRAINT "DF_User_FailedLoginCount" DEFAULT 0,
    "CreatedIp"                 INET                                    NOT NULL,
    "CreatedUtc"                TIMESTAMP(6) WITH TIME ZONE             NOT NULL,
    "Updated"                   BOOLEAN                                 NOT NULL    CONSTRAINT "DF_User_Updated" DEFAULT FALSE,
    "UpdatedIp"                 INET                                    NULL,
    "UpdatedUtc"                TIMESTAMP(6) WITH TIME ZONE             NULL,
    "UpdatedUserId"             BIGINT                                  NULL,
    "Deleted"                   BOOLEAN                                 NOT NULL    CONSTRAINT "DF_User_Deleted" DEFAULT FALSE,
    "DeletedIp"                 INET                                    NULL,
    "DeletedUtc"                TIMESTAMP(6) WITH TIME ZONE             NULL,
    "DeletedUserId"             BIGINT                                  NULL
);

CREATE INDEX "IX_User_Key" 
    ON "user" ("Key" ASC);

CREATE UNIQUE INDEX "IX_User_Email" 
    ON "user" ("Email" ASC)
    INCLUDE ("Password", "EmailVerified", "ForgotPassword", "FailedLoginCount")
	WHERE ("Deleted" = FALSE);
    
CREATE INDEX "IX_User_UpdatedUserId" 
    ON "user" ("UpdatedUserId" ASC);
    
CREATE INDEX "IX_User_DeletedUserId" 
    ON "user" ("DeletedUserId" ASC);
  
ALTER TABLE "user" 
	ADD CONSTRAINT "PK_User" 
	PRIMARY KEY ("Id");
	
-- ALTER TABLE "user" 
-- 	ADD CONSTRAINT "AK_User_Email" 
-- 	UNIQUE 
-- 	USING INDEX "IX_User_Email";

ALTER TABLE "user" 
	ADD CONSTRAINT "FK_User_User_UpdatedUserId" 
	FOREIGN KEY ("UpdatedUserId") 
	REFERENCES "user" ("Id");
	
ALTER TABLE "user" 
	ADD CONSTRAINT "FK_User_User_DeletedUserId" 
	FOREIGN KEY ("DeletedUserId") 
	REFERENCES "user" ("Id");

-- -----------------------------------------------------
-- Table "permission"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "permission" (
    "Id" 						BIGINT 								 	NOT NULL	GENERATED ALWAYS AS IDENTITY,
    "Code" 						TEXT 									NULL,
    "Title" 					TEXT 									NULL,
    "Note" 						TEXT 									NULL,
    "CreatedIp" 				INET 									NOT NULL,
    "CreatedUtc" 				TIMESTAMP(6) WITH TIME ZONE 			NOT NULL,
    "CreatedUserId" 			BIGINT 									NOT NULL,
    "Updated" 					BOOLEAN 								NOT NULL	CONSTRAINT "DF_Permission_Updated" DEFAULT FALSE,
    "UpdatedIp" 				INET 									NULL,
    "UpdatedUtc" 				TIMESTAMP(6) WITH TIME ZONE 			NULL,
    "UpdatedUserId" 			BIGINT 									NULL,
	"Deleted"                   BOOLEAN                                 NOT NULL    CONSTRAINT "DF_Permission_Deleted" DEFAULT FALSE,
    "DeletedIp" 				INET 									NULL,
    "DeletedUtc" 				TIMESTAMP(6) WITH TIME ZONE 			NULL,
    "DeletedUserId" 			BIGINT 									NULL,
  
  CONSTRAINT "PK_Permission" PRIMARY KEY ("Id"),
  
  CONSTRAINT "FK_Permission_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId") REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  
  CONSTRAINT "FK_Permission_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId") REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
	
  CONSTRAINT "FK_Permission_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId") REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);

CREATE INDEX "IX_Permission_Composite" ON "permission" ("Id" ASC, "Code" ASC, "Title" ASC, "Deleted" ASC);

CREATE INDEX "IX_Permission_DeletedUserId" ON "permission" ("DeletedUserId" ASC);

CREATE INDEX "IX_Permission_CreatedUserId" ON "permission" ("CreatedUserId" ASC);

CREATE INDEX "IX_Permission_UpdatedUserId" ON "permission" ("UpdatedUserId" ASC);


-- -----------------------------------------------------
-- Table "role"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "role" (
    "Id" 						BIGINT 									NOT NULL 	GENERATED ALWAYS AS IDENTITY,
    "Code" 						TEXT 									NOT NULL,
    "Title" 					TEXT 									NULL,
    "Note" 						TEXT 									NULL,
    "CreatedIp" 				INET 									NOT NULL,
    "CreatedUtc" 				TIMESTAMP(6) WITH TIME ZONE 			NOT NULL,
    "CreatedUserId" 			BIGINT 									NOT NULL,
    "UpdatedIp" 				INET 									NULL,
    "UpdatedUtc" 				TIMESTAMP(6) WITH TIME ZONE 			NULL,
    "UpdatedUserId" 			BIGINT 									NULL,
    "Deleted" 					BOOLEAN 								NOT NULL 	DEFAULT FALSE,
    "DeletedIp" 				INET 									NULL,
    "DeletedUtc" 				TIMESTAMP(6) WITH TIME ZONE 			NULL,
    "DeletedUserId" 			BIGINT 									NULL,
	
	CONSTRAINT "PK_Role" PRIMARY KEY ("Id"),
	
	CONSTRAINT "FK_Role_User_CreatedUserId"
		FOREIGN KEY ("CreatedUserId") REFERENCES "user" ("Id")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
		
	CONSTRAINT "FK_Role_User_DeletedUserId"
		FOREIGN KEY ("DeletedUserId") REFERENCES "user" ("Id")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION,
		
	CONSTRAINT "FK_Role_User_UpdatedUserId"
		FOREIGN KEY ("UpdatedUserId") REFERENCES "user" ("Id")
		ON DELETE NO ACTION
		ON UPDATE NO ACTION);

CREATE INDEX "IX_Role_Composite" ON "role" ("Id" ASC, "Code" ASC, "Deleted" ASC);

CREATE INDEX "IX_Role_CreatedUserId" ON "role" ("CreatedUserId" ASC);

CREATE INDEX "IX_Role_DeletedUserId" ON "role" ("DeletedUserId" ASC);

CREATE INDEX "IX_Role_UpdatedUserId" ON "role" ("UpdatedUserId" ASC);


-- -----------------------------------------------------
-- Table "securable_category"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "securable_category" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NULL,
    "CreatedIp" INET NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_SecurableCategory_CreateUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_SecurableCategory_UpdateUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_SecurableCategory_DeleteUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_SecurableCategory_UpdateUserId" ON "securable_category" ("UpdatedUserId" ASC);

CREATE INDEX "IX_SecurableCategory_DeleteUserId" ON "securable_category" ("DeletedUserId" ASC);

CREATE INDEX "IX_SecurableCategory_CreateUserId" ON "securable_category" ("CreatedUserId" ASC);

CREATE UNIQUE INDEX "UQ_Code" ON "securable_category" ("Code" ASC);


-- -----------------------------------------------------
-- Table "securable"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "securable" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "SecurableCategoryId" BIGINT NOT NULL,
    "Code" TEXT NULL,
    "Title" TEXT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_Securable_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Securable_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Securable_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Securable_SecurableCategory_SecurableCategoryId"
    FOREIGN KEY ("SecurableCategoryId")
    REFERENCES "securable_category" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_Securable_Composite" ON "securable" ("Id" ASC, "Code" ASC, "Title" ASC, "Deleted" ASC);

CREATE INDEX "IX_Securable_DeletedUserId" ON "securable" ("DeletedUserId" ASC);

CREATE INDEX "IX_Securable_CreatedUserId" ON "securable" ("CreatedUserId" ASC);

CREATE INDEX "IX_Securable_UpdatedUserId" ON "securable" ("UpdatedUserId" ASC);

CREATE INDEX "IX_Securable_SecurableCategoryId" ON "securable" ("SecurableCategoryId" ASC);


-- -----------------------------------------------------
-- Table "role_permission_securable"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "role_permission_securable" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "RoleId" BIGINT NOT NULL,
    "PermissionId" BIGINT NOT NULL,
    "SecurableId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_RolePermissionSecurable_Permission_PermissionId"
    FOREIGN KEY ("PermissionId")
    REFERENCES "permission" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_RolePermissionSecurable_Role_RoleId"
    FOREIGN KEY ("RoleId")
    REFERENCES "role" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_RolePermissionSecurable_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_RolePermissionSecurable_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_RolePermissionSecurable_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_RolePermissionSecurable_Securable_SecurableId"
    FOREIGN KEY ("SecurableId")
    REFERENCES "securable" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_RolePermissionSecurable_RoleId" ON "role_permission_securable" ("RoleId" ASC);

CREATE INDEX "IX_RolePermissionSecurable_PermissionId" ON "role_permission_securable" ("PermissionId" ASC);

CREATE INDEX "IX_RolePermissionSecurable_SecurableId" ON "role_permission_securable" ("SecurableId" ASC);

CREATE INDEX "IX_RolePermissionSecurable_CreatedUserId" ON "role_permission_securable" ("CreatedUserId" ASC);

CREATE INDEX "IX_RolePermissionSecurable_DeletedUserId" ON "role_permission_securable" ("DeletedUserId" ASC);

CREATE INDEX "IX_RolePermissionSecurable_UpdatedUserId" ON "role_permission_securable" ("UpdatedUserId" ASC);


-- -----------------------------------------------------
-- Table "user_role"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "user_role" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "UserId" BIGINT NOT NULL,
    "RoleId" BIGINT NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_UserRole_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_UserRole_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_UserRole_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_UserRole_User_UserId"
    FOREIGN KEY ("UserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_UserRole_Role_RoleId"
    FOREIGN KEY ("RoleId")
    REFERENCES "role" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_UserRole_Composite" ON "user_role" ("UserId" ASC, "RoleId" ASC, "Deleted" ASC);

CREATE INDEX "IX_UserRole_UserId" ON "user_role" ("UserId" ASC);

CREATE INDEX "IX_UserRole_RoleId" ON "user_role" ("RoleId" ASC);

CREATE INDEX "IX_UserRole_CreatedUsedId" ON "user_role" ("CreatedUserId" ASC);

CREATE INDEX "IX_UserRole_UpdatedUserId" ON "user_role" ("UpdatedUserId" ASC);

CREATE INDEX "IX_UserRole_DeletedUserId" ON "user_role" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "board"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "board" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Key" UUID NOT NULL,
    "Ordinal" INT NOT NULL,
    "Title" TEXT NULL,
    "Note" TEXT NULL,
    "Pinned" BOOLEAN NOT NULL DEFAULT FALSE,
    "PinnedIp" INET NULL,
    "PinnedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "PinnedUserId" BIGINT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_Board_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Board_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Board_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Board_User_PinnedUserId"
    FOREIGN KEY ("PinnedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_Board_Composite" ON "board" ("Key" ASC, "Deleted" ASC);

CREATE INDEX "IX_Board_CreatedUserId" ON "board" ("CreatedUserId" ASC);

CREATE INDEX "IX_Board_UpdatedUserId" ON "board" ("UpdatedUserId" ASC);

CREATE INDEX "IX_Board_DeletedUserId" ON "board" ("DeletedUserId" ASC);

CREATE INDEX "IX_Board_Pinned" ON "board" ("PinnedUserId" ASC);


-- -----------------------------------------------------
-- Table "board_role_permission"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "board_role_permission" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "BoardId" BIGINT NOT NULL,
    "RoleId" BIGINT NOT NULL,
    "PermissionId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_BoardRolePermission_Role_RoleId"
    FOREIGN KEY ("RoleId")
    REFERENCES "role" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_BoardRolePermission_Permission_PermissionId"
    FOREIGN KEY ("PermissionId")
    REFERENCES "permission" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_BoardRolePermission_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_BoardRolePermission_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_BoardRolePermission_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_BoardRolePermission_Board_BoardId"
    FOREIGN KEY ("BoardId")
    REFERENCES "board" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_BoardRolePermission_Composite" ON "board_role_permission" ("Deleted" ASC, "BoardId" ASC, "RoleId" ASC, "PermissionId" ASC);

CREATE INDEX "IX_BoardRolePermission_RoleId" ON "board_role_permission" ("RoleId" ASC);

CREATE INDEX "IX_BoardRolePermission_PermissionId" ON "board_role_permission" ("PermissionId" ASC);

CREATE INDEX "IX_BoardRolePermission_CreatedUserId" ON "board_role_permission" ("CreatedUserId" ASC);

CREATE INDEX "IX_BoardRolePermission_UpdatedUserId" ON "board_role_permission" ("UpdatedUserId" ASC);

CREATE INDEX "IX_BoardRolePermission_DeletedUserId" ON "board_role_permission" ("DeletedUserId" ASC);

CREATE INDEX "IX_BoardRolePermission_BoardId" ON "board_role_permission" ("BoardId" ASC);


-- -----------------------------------------------------
-- Table "board_tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "board_tag" (
    "Id" INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "BoardId" BIGINT NULL,
    "TagId" BIGINT NULL,
    "CreatedIp" INET NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_BoardTag_Board_BoardId"
    FOREIGN KEY ("BoardId")
    REFERENCES "board" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_BoardTag_BoardId" ON "board_tag" ("BoardId" ASC);


-- -----------------------------------------------------
-- Table "thread"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "thread" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id") INCLUDE("Deleted"),
  CONSTRAINT "FK_Thread_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Thread_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_Thread_CreatedUserId" ON "thread" ("CreatedUserId" ASC);

CREATE INDEX "IX_Thread_DeletedUserId" ON "thread" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "comment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "comment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Key" UUID NOT NULL,
    "ThreadId" BIGINT NOT NULL,
    "Content" TEXT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_Comment_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Comment_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Comment_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Comment_Thread_ThreadId"
    FOREIGN KEY ("ThreadId")
    REFERENCES "thread" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_Comment_Composite" ON "comment" ("Deleted" ASC);

CREATE INDEX "IX_Comment_Key" ON "comment" ("Key" ASC);

CREATE INDEX "IX_Comment_User_CreatedUserId_idx" ON "comment" ("CreatedUserId" ASC);

CREATE INDEX "IX_Comment_User_UpdatedUserId_idx" ON "comment" ("UpdatedUserId" ASC);

CREATE INDEX "IX_Comment_User_DeletedUserId_idx" ON "comment" ("DeletedUserId" ASC);

CREATE INDEX "IX_Comment_Thread_ThreadId" ON "comment" ("ThreadId" ASC);


-- -----------------------------------------------------
-- Table "comment_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "comment_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "CommentId" BIGINT NOT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_CommentAttachment_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_CommentAttachment_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_CommentAttachment_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_CommentAttachment_Comment_CommentId"
    FOREIGN KEY ("CommentId")
    REFERENCES "comment" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_CommentAttachment_Composite" ON "comment_attachment" ("Deleted" ASC, "CommentId" ASC, "Filename" ASC, "Url" ASC);

CREATE INDEX "FK_CommentAttachment_User_CreatedUserId_idx" ON "comment_attachment" ("CreatedUserId" ASC);

CREATE INDEX "FK_CommentAttachment_User_UpdatedUserId_idx" ON "comment_attachment" ("UpdatedUserId" ASC);

CREATE INDEX "FK_CommentAttachment_User_DeletedUserId_idx" ON "comment_attachment" ("DeletedUserId" ASC);

CREATE INDEX "FK_CommentAttachment_Comment_CommentId_idx" ON "comment_attachment" ("CommentId" ASC);


-- -----------------------------------------------------
-- Table "member"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "UserKey" TEXT NULL,
    "FullName" TEXT NOT NULL,
    "PreferredName" TEXT NOT NULL,
    "Phone" TEXT NULL,
    "Mobile" TEXT NULL,
    "Email" TEXT NULL,
    "PrimaryAddress_Street1" TEXT NULL,
    "PrimaryAddress_Street2" TEXT NULL,
    "PrimaryAddress_Suburb" TEXT NULL,
    "PrimaryAddress_Postcode" TEXT NULL,
    "PrimaryAddress_State" TEXT NULL,
    "PrimaryAddress_Latitude" DECIMAL(18,6) NULL,
    "PrimaryAddress_Longitude" DECIMAL(18,6) NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_Member_Key" ON "member" ("UserKey" ASC);


-- -----------------------------------------------------
-- Table "comment_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "comment_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "CommentId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_CommentReaction_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_CommentReaction_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_CommentReaction_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_CommentReaction_Comment_CommentId"
    FOREIGN KEY ("CommentId")
    REFERENCES "comment" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_CommentReaction_Member"
    FOREIGN KEY ("MemberId")
    REFERENCES "member" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_CommentReaction_Composite" ON "comment_reaction" ("Deleted" ASC, "CommentId" ASC, "MemberId" ASC, "Emoji" ASC);

CREATE INDEX "FK_CommentReaction_User_CreatedUserId_idx" ON "comment_reaction" ("CreatedUserId" ASC);

CREATE INDEX "FK_CommentReaction_User_DeletedUserId_idx" ON "comment_reaction" ("DeletedUserId" ASC);

CREATE INDEX "FK_CommentReaction_Comment_CommentId_idx" ON "comment_reaction" ("CommentId" ASC);

CREATE INDEX "FK_CommentReaction_Member_idx" ON "comment_reaction" ("MemberId" ASC);


-- -----------------------------------------------------
-- Table "event"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "event" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MeetId" BIGINT NOT NULL,
    "StatusId" BIGINT NOT NULL,
    "Title" TEXT NULL,
    "Note" TEXT NULL,
    "StartUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DurationMinutes" INT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_Event_User_CreatedUserId" ON "event" ("CreatedUserId" ASC);

CREATE INDEX "FK_Event_User_UpdatedUserId" ON "event" ("UpdatedUserId" ASC);

CREATE INDEX "FK_Event_User_DeletedUserId" ON "event" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "event_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "event_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "EventId" BIGINT NOT NULL,
    "Title" TEXT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_EventAttachment_User_CreatedUserId" ON "event_attachment" ("CreatedUserId" ASC);

CREATE INDEX "FK_EventAttachment_User_UpdatedUserId" ON "event_attachment" ("UpdatedUserId" ASC);

CREATE INDEX "FK_EventAttachment_User_DeletedUserId" ON "event_attachment" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "event_member_role"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "event_member_role" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "EventId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "RoleId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_EventMemberRole_User_CreatedUserId" ON "event_member_role" ("CreatedUserId" ASC);

CREATE INDEX "FK_EventMemberRole_User_UpdatedUserId" ON "event_member_role" ("UpdatedUserId" ASC);

CREATE INDEX "FK_EventMemberRole_User_DeletedUserId" ON "event_member_role" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "event_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "event_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "EventId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "ReactionId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_EventReaction_ReactionId" ON "event_reaction" ("ReactionId" ASC);

CREATE INDEX "FK_EventReaction_User_CreatedUserId" ON "event_reaction" ("CreatedUserId" ASC);

CREATE INDEX "FK_EventReaction_User_UpdatedUserId" ON "event_reaction" ("UpdatedUserId" ASC);

CREATE INDEX "FK_EventReaction_User_DeletedUserId" ON "event_reaction" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "event_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "event_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_EventStatus_User_CreatedUserId" ON "event_status" ("CreatedUserId" ASC);

CREATE INDEX "FK_EventStatus_User_UpdatedUserId" ON "event_status" ("UpdatedUserId" ASC);

CREATE INDEX "FK_EventStatus_User_DeletedUserId" ON "event_status" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "event_tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "event_tag" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_EventTag_User_CreatedUserId" ON "event_tag" ("CreatedUserId" ASC);

CREATE INDEX "FK_EventTag_User_UpdatedUserId" ON "event_tag" ("UpdatedUserId" ASC);

CREATE INDEX "FK_EventTag_User_DeletedUserId" ON "event_tag" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "grid"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "grid" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "HeatId" BIGINT NOT NULL,
    "MemberId" BIGINT NULL,
    "VehicleId" BIGINT NULL,
    "Position" INT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_Grid_DriverId" ON "grid" ("MemberId" ASC);

CREATE INDEX "IX_Grid_Vehicle" ON "grid" ("VehicleId" ASC);

CREATE INDEX "FK_Grid_User_CreatedUserId" ON "grid" ("CreatedUserId" ASC);

CREATE INDEX "FK_Grid_User_UpdatedUserId" ON "grid" ("UpdatedUserId" ASC);

CREATE INDEX "FK_Grid_User_DeletedUserId" ON "grid" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "grid_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "grid_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "GridId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_GridReaction_User_CreatedUserId" ON "grid_reaction" ("CreatedUserId" ASC);

CREATE INDEX "FK_GridReaction_User_UpdatedUserId" ON "grid_reaction" ("UpdatedUserId" ASC);

CREATE INDEX "FK_GridReaction_User_DeletedUserId" ON "grid_reaction" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "heat"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "heat" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "EventId" BIGINT NOT NULL,
    "StatusId" BIGINT NULL,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_Heat_User_CreatedUserId" ON "heat" ("CreatedUserId" ASC);

CREATE INDEX "FK_Heat_User_UpdatedUserId" ON "heat" ("UpdatedUserId" ASC);

CREATE INDEX "FK_Heat_User_DeletedUserId" ON "heat" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "heat_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "heat_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "HeatId" BIGINT NOT NULL,
    "UploadIp" TEXT NULL,
    "UploadUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "Title" TEXT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_HeatAttachment_User_CreatedUserId" ON "heat_attachment" ("CreatedUserId" ASC);

CREATE INDEX "FK_HeatAttachment_User_UpdatedUserId" ON "heat_attachment" ("UpdatedUserId" ASC);

CREATE INDEX "FK_HeatAttachment_User_DeletedUserId" ON "heat_attachment" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "heat_penalty_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "heat_penalty_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "heat_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "heat_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "HeatId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_HeatReaction_User_CreatedUserId" ON "heat_reaction" ("CreatedUserId" ASC);

CREATE INDEX "FK_HeatReaction_User_UpdatedUserId" ON "heat_reaction" ("UpdatedUserId" ASC);

CREATE INDEX "FK_HeatReaction_User_DeletedUserId" ON "heat_reaction" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "heat_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "heat_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_HeatStatus_Composite" ON "heat_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);

CREATE INDEX "FK_HeatStatus_User_CreatedUserId" ON "heat_status" ("CreatedUserId" ASC);

CREATE INDEX "FK_HeatStatus_User_UpdatedUserId" ON "heat_status" ("UpdatedUserId" ASC);

CREATE INDEX "FK_HeatStatus_User_DeletedUserId" ON "heat_status" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "heat_tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "heat_tag" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "HeatId" BIGINT NOT NULL,
    "TagId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_HeatTag_User_CreatedUserId" ON "heat_tag" ("CreatedUserId" ASC);

CREATE INDEX "FK_HeatTag_User_UpdatedUserId" ON "heat_tag" ("UpdatedUserId" ASC);

CREATE INDEX "FK_HeatTag_User_DeletedUserId" ON "heat_tag" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "invoice"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "invoice" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "CustomerId" BIGINT NOT NULL,
    "StatusId" BIGINT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_Invoice_User_CreatedUserId" ON "invoice" ("CreatedUserId" ASC);

CREATE INDEX "FK_Invoice_User_UpdatedUserId" ON "invoice" ("UpdatedUserId" ASC);

CREATE INDEX "FK_Invoice_User_DeletedUserId" ON "invoice" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "invoice_detail"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "invoice_detail" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "StockId" BIGINT NOT NULL,
    "Quantity" DECIMAL(18,6) NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

--CREATE INDEX "IX_Composite" ON "invoice_detail" ("Deleted" ASC, "StockId" ASC, "Quantity" ASC, "Updated" ASC);

CREATE INDEX "FK_InvoiceDetail_User_CreatedUserId" ON "invoice_detail" ("CreatedUserId" ASC);

CREATE INDEX "FK_InvoiceDetail_User_UpdatedUserId" ON "invoice_detail" ("UpdatedUserId" ASC);

CREATE INDEX "FK_InvoiceDetail_User_DeletedUserId" ON "invoice_detail" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "invoice_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "invoice_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

--CREATE INDEX "IX_Composite" ON "invoice_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);

CREATE INDEX "FK_InvoiceStatus_User_CreatedUserId" ON "invoice_status" ("CreatedUserId" ASC);

CREATE INDEX "FK_InvoiceStatus_User_UpdatedUserId" ON "invoice_status" ("UpdatedUserId" ASC);

CREATE INDEX "FK_InvoiceStatus_User_DeletedUserId" ON "invoice_status" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "lap"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "lap" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "HeatId" BIGINT NOT NULL,
    "VehicleId" BIGINT NULL,
    "DriverId" BIGINT NULL,
    "StatusId" BIGINT NULL,
    "StartTime" BOOLEAN NOT NULL DEFAULT FALSE,
    "StartTimeMs" DECIMAL(18,6) NULL,
    "StartTimeIp" INET NOT NULL,
    "StartTimeUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "StartTimeBy" TEXT NOT NULL,
    "EndTime" BOOLEAN NOT NULL DEFAULT FALSE,
    "EndTimeMs" DECIMAL(18,6) NULL,
    "EndTimeIp" INET NOT NULL,
    "EndTimeUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "EndTimeBy" TEXT NOT NULL,
    "Time" BOOLEAN NOT NULL DEFAULT FALSE,
    "TimeMs" DECIMAL(18,6) NULL,
    "TimeIp" INET NOT NULL,
    "TimeUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "TimeBy" TEXT NOT NULL,
    "Position" BOOLEAN NOT NULL DEFAULT FALSE,
    "PositionNumber" SMALLINT NULL,
    "PositionIp" INET NOT NULL,
    "PositionUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "PositionBy" TEXT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_Lap_User_CreatedUserId" ON "lap" ("CreatedUserId" ASC);

CREATE INDEX "FK_Lap_User_UpdatedUserId" ON "lap" ("UpdatedUserId" ASC);

CREATE INDEX "FK_Lap_User_DeletedUserId" ON "lap" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "lap_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "lap_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "LapId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_LapReaction_User_CreatedUserId" ON "lap_reaction" ("CreatedUserId" ASC);

CREATE INDEX "FK_LapReaction_User_UpdatedUserId" ON "lap_reaction" ("UpdatedUserId" ASC);

CREATE INDEX "FK_LapReaction_User_DeletedUserId" ON "lap_reaction" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "lap_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "lap_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

--CREATE INDEX "IX_Composite" ON "lap_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);

CREATE INDEX "FK_LapStatus_User_CreatedUserId" ON "lap_status" ("CreatedUserId" ASC);

CREATE INDEX "FK_LapStatus_User_UpdatedUserId" ON "lap_status" ("UpdatedUserId" ASC);

CREATE INDEX "FK_LapStatus_User_DeletedUserId" ON "lap_status" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "lap_tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "lap_tag" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_LapTag_User_CreatedUserId" ON "lap_tag" ("CreatedUserId" ASC);

CREATE INDEX "FK_LapTag_User_UpdatedUserId" ON "lap_tag" ("UpdatedUserId" ASC);

CREATE INDEX "FK_LapTag_User_DeletedUserId" ON "lap_tag" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "meet"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "meet" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MeetStatusId" BIGINT NOT NULL,
    "StartUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DurationMinutes" INT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_Meet_User_CreatedUserId" ON "meet" ("CreatedUserId" ASC);

CREATE INDEX "FK_Meet_User_UpdatedUserId" ON "meet" ("UpdatedUserId" ASC);

CREATE INDEX "FK_Meet_User_DeletedUserId" ON "meet" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "meet_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "meet_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MeetId" BIGINT NOT NULL,
    "Title" TEXT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_MeetAttachment_User_CreatedUserId" ON "meet_attachment" ("CreatedUserId" ASC);

CREATE INDEX "FK_MeetAttachment_User_UpdatedUserId" ON "meet_attachment" ("UpdatedUserId" ASC);

CREATE INDEX "FK_MeetAttachment_User_DeletedUserId" ON "meet_attachment" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "meet_official"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "meet_official" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MeetId" BIGINT NOT NULL,
    "OfficeId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_MeetOfficial_User_CreatedUserId" ON "meet_official" ("CreatedUserId" ASC);

CREATE INDEX "FK_MeetOfficial_User_UpdatedUserId" ON "meet_official" ("UpdatedUserId" ASC);

CREATE INDEX "FK_MeetOfficial_User_DeletedUserId" ON "meet_official" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "meet_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "meet_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MeetId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_MeetReaction_User_CreatedUserId" ON "meet_reaction" ("CreatedUserId" ASC);

CREATE INDEX "FK_MeetReaction_User_UpdatedUserId" ON "meet_reaction" ("UpdatedUserId" ASC);

CREATE INDEX "FK_MeetReaction_User_DeletedUserId" ON "meet_reaction" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "meet_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "meet_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

--CREATE INDEX "IX_Composite" ON "meet_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);

CREATE INDEX "FK_MeetStatus_User_CreatedUserId" ON "meet_status" ("CreatedUserId" ASC);

CREATE INDEX "FK_MeetStatus_User_UpdatedUserId" ON "meet_status" ("UpdatedUserId" ASC);

CREATE INDEX "FK_MeetStatus_User_DeletedUserId" ON "meet_status" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "meet_tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "meet_tag" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "FK_MeetTag_User_CreatedUserId" ON "meet_tag" ("CreatedUserId" ASC);

CREATE INDEX "FK_MeetTag_User_UpdatedUserId" ON "meet_tag" ("UpdatedUserId" ASC);

CREATE INDEX "FK_MeetTag_User_DeletedUserId" ON "meet_tag" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "member_event"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_event" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberId" BIGINT NOT NULL,
    "EventId" BIGINT NOT NULL,
    "Register" BOOLEAN NOT NULL DEFAULT FALSE,
    "RegisterIp" INET NULL,
    "RegisterUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "RegisterBy" TEXT NOT NULL,
    "Checkin" BOOLEAN NOT NULL DEFAULT FALSE,
    "CheckinIp" INET NULL,
    "CheckinUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "CheckinBy" TEXT NOT NULL,
    "OnTrack" BOOLEAN NOT NULL DEFAULT FALSE,
    "OnTrackIp" INET NULL,
    "OnTrackUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "OnTrackBy" TEXT NOT NULL,
    "OffTrack" BOOLEAN NOT NULL DEFAULT FALSE,
    "OffTrackIp" INET NULL,
    "OffTrackUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "OffTrackBy" TEXT NOT NULL,
    "Checkout" BOOLEAN NOT NULL DEFAULT FALSE,
    "CheckoutIp" INET NULL,
    "CheckoutUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "CheckoutBy" TEXT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "member_event_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_event_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberEventId" BIGINT NOT NULL,
    "Filename" TEXT NULL,
    "Title" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "member_event_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_event_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_MemberEventStatus_Code" ON "member_event_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);

CREATE INDEX "IX_MemberEventStatus_Composite" ON "member_event_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);


-- -----------------------------------------------------
-- Table "member_meet"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_meet" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberId" BIGINT NOT NULL,
    "MeetId" BIGINT NOT NULL,
    "Enter" BOOLEAN NOT NULL,
    "EnterIp" INET NULL,
    "EnterUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "EnterBy" TEXT NULL,
    "Checkin" BOOLEAN NOT NULL,
    "CheckinIp" INET NOT NULL,
    "CheckinUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CheckinBy" TEXT NOT NULL,
    "Checkout" BOOLEAN NOT NULL,
    "CheckoutIp" INET NOT NULL,
    "CheckoutUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CheckoutBy" TEXT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedBy" BOOLEAN NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "member_meet_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_meet_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberMeetId" BIGINT NOT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "member_meet_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_meet_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "member_office"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_office" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberId" BIGINT NOT NULL,
    "OfficeId" BIGINT NOT NULL,
    "StartUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "EndUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "member_qualification"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_qualification" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberId" BIGINT NOT NULL,
    "QualificationId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_QualificationId" ON "member_qualification" ("QualificationId" ASC);


-- -----------------------------------------------------
-- Table "member_transaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_transaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberId" BIGINT NOT NULL,
    "WhenUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "Description" TEXT NOT NULL,
    "Debit" DECIMAL(19,4) NOT NULL,
    "Credit" DECIMAL(19,4) NOT NULL,
    "Balance" DECIMAL(19,4) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "member_vehicle"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "member_vehicle" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberId" BIGINT NOT NULL,
    "VehicleId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "office"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "office" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "penalty_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "penalty_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "PenaltyId" BIGINT NOT NULL,
    "UploadIp" TEXT NOT NULL,
    "UploadUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UploadBy" TEXT NOT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "penalty"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "penalty" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "HeatId" BIGINT NULL,
    "DriverId" BIGINT NULL,
    "VehicleId" BIGINT NULL,
    "StatusId" BIGINT NULL,
    "Code" TEXT NULL,
    "Title" TEXT NULL,
    "Notes" TEXT NULL,
    "ValueMs" SMALLINT NULL,
    "ValuePoints" SMALLINT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "penalty_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "penalty_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "PenaltyId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "poll"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "poll" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "BoardId" BIGINT NOT NULL,
    "ThreadId" BIGINT NOT NULL,
    "Title" TEXT NOT NULL,
    "Content" TEXT NULL,
    "Open" BOOLEAN NOT NULL DEFAULT FALSE,
    "OpenIp" INET NULL,
    "OpenUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "OpenBy" TEXT NULL,
    "Closed" BOOLEAN NOT NULL DEFAULT FALSE,
    "ClosedIp" INET NULL,
    "ClosedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "ClosedBy" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_Poll_Thread_ThreadId"
    FOREIGN KEY ("ThreadId")
    REFERENCES "thread" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Poll_Board_BoardId"
    FOREIGN KEY ("BoardId")
    REFERENCES "board" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Poll_CreateUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Poll_UpdateUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Poll_DeleteUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_Poll_ThreadId" ON "poll" ("ThreadId" ASC);

CREATE INDEX "IX_Poll_BoardId" ON "poll" ("BoardId" ASC);

CREATE INDEX "IX_Poll_CreateUserId" ON "poll" ("CreatedUserId" ASC);

CREATE INDEX "IX_Poll_UpdateUserId" ON "poll" ("UpdatedUserId" ASC);

CREATE INDEX "IX_Poll_DeleteUserId" ON "poll" ("DeletedUserId" ASC);


-- -----------------------------------------------------
-- Table "poll_option"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "poll_option" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "PollId" BIGINT NOT NULL,
    "Title" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_PollOption_Poll_PollId"
    FOREIGN KEY ("PollId")
    REFERENCES "poll" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_PollOption_PollId" ON "poll_option" ("PollId" ASC);


-- -----------------------------------------------------
-- Table "post"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "post" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Key" UUID NOT NULL,
    "BoardId" BIGINT NOT NULL,
    "ThreadId" BIGINT NOT NULL,
    "Title" TEXT NOT NULL,
    "Content" TEXT NOT NULL,
    "Pinned" BOOLEAN NOT NULL DEFAULT FALSE,
    "PinnedIp" INET NULL,
    "PinnedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "PinnedUserId" BIGINT NULL,
    "PinnedNote" TEXT NULL,
    "UnpinnedIp" INET NULL,
    "UnpinnedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UnpinnedUserId" BIGINT NULL,
    "UnpinnedNote" TEXT NULL,
    "Locked" BOOLEAN NOT NULL DEFAULT FALSE,
    "LockedIp" INET NULL,
    "LockedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "LockedUserId" BIGINT NULL,
    "LockedNote" TEXT NULL,
    "UnlockedIp" INET NULL,
    "UnlockedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UnlockedUserId" BIGINT NULL,
    "UnlockedNote" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_Post_User_PinnedUserId"
    FOREIGN KEY ("PinnedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_User_UnpinnedUserId"
    FOREIGN KEY ("UnpinnedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_User_LockedUserId"
    FOREIGN KEY ("LockedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_User_UnlockedUserId"
    FOREIGN KEY ("UnlockedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_Board_BoardId"
    FOREIGN KEY ("BoardId")
    REFERENCES "board" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Post_Thread_ThreadId"
    FOREIGN KEY ("ThreadId")
    REFERENCES "thread" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "FK_Post_User_PinnedUserId_idx" ON "post" ("PinnedUserId" ASC);

CREATE INDEX "FK_Post_User_UnpinnedUserId_idx" ON "post" ("UnpinnedUserId" ASC);

CREATE INDEX "FK_Post_User_LockedUserId_idx" ON "post" ("LockedUserId" ASC);

CREATE INDEX "FK_Post_User_UnlockedUserId_idx" ON "post" ("UnlockedUserId" ASC);

CREATE INDEX "FK_Post_User_CreatedUserId_idx" ON "post" ("CreatedUserId" ASC);

CREATE INDEX "FK_Post_User_UpdatedUserId_idx" ON "post" ("UpdatedUserId" ASC);

CREATE INDEX "FK_Post_User_DeletedUserId_idx" ON "post" ("DeletedUserId" ASC);

CREATE INDEX "FK_Post_Board_BoardId_idx" ON "post" ("BoardId" ASC);

CREATE INDEX "fk_post_thread1_idx" ON "post" ("ThreadId" ASC);


-- -----------------------------------------------------
-- Table "qualification"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "qualification" (
    "Id" INT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "CreatedIp" INET NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "UpdatedUserId" BIGINT NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "season"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "season" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "StatusId" BIGINT NOT NULL,
    "Title" TEXT NULL,
    "Note" TEXT NULL,
    "StartUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "EndUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "season_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "season_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "SeasonId" BIGINT NOT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "season_event"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "season_event" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "SeasonId" BIGINT NOT NULL,
    "EventId" BIGINT NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "season_event_reward"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "season_event_reward" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "SeasonEventId" BIGINT NOT NULL,
    "Position" SMALLINT NULL,
    "Percentile" SMALLINT NULL,
    "Value" SMALLINT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedBy" BOOLEAN NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "season_event_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "season_event_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "season_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "season_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_SeasonStatus_Composite" ON "season_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);


-- -----------------------------------------------------
-- Table "survey"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "survey" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "BoardId" BIGINT NOT NULL,
    "ThreadId" BIGINT NOT NULL,
    "StatusId" BIGINT NOT NULL,
    "Title" TEXT NULL,
    "Content" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"),
  CONSTRAINT "FK_Survey_User_CreatedUserId"
    FOREIGN KEY ("CreatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Survey_User_UpdatedUserId"
    FOREIGN KEY ("UpdatedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Survey_User_DeletedUserId"
    FOREIGN KEY ("DeletedUserId")
    REFERENCES "user" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Survey_Thread_ThreadId"
    FOREIGN KEY ("ThreadId")
    REFERENCES "thread" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "FK_Survey_Board_BoardId"
    FOREIGN KEY ("BoardId")
    REFERENCES "board" ("Id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE INDEX "IX_Survey_CreatedUserId" ON "survey" ("CreatedUserId" ASC);

CREATE INDEX "IX_Survey_UpdatedUserId" ON "survey" ("UpdatedUserId" ASC);

CREATE INDEX "IX_Survey_DeletedUserId" ON "survey" ("DeletedUserId" ASC);

CREATE INDEX "IX_Survey_ThreadId" ON "survey" ("ThreadId" ASC);

CREATE INDEX "IX_Survey_Board" ON "survey" ("BoardId" ASC);


-- -----------------------------------------------------
-- Table "survey_option"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "survey_option" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "QuestionId" BIGINT NOT NULL,
    "Position" SMALLINT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "survey_question"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "survey_question" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "SurveyId" BIGINT NOT NULL,
    "Position" SMALLINT NULL,
    "Title" TEXT NULL,
    "Note" TEXT NULL,
    "Text" BOOLEAN NULL,
    "Int" BOOLEAN NULL,
    "IntMin" SMALLINT NULL,
    "IntMax" SMALLINT NULL,
    "IntSteps" SMALLINT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "survey_response"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "survey_response" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "SurveyQuestionId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "OptionId" BIGINT NULL,
    "IntValue" SMALLINT NULL,
    "Note" TEXT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_SurveyResponse_QuestionId" ON "survey_response" ("SurveyQuestionId" ASC);


-- -----------------------------------------------------
-- Table "survey_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "survey_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "tag"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "tag" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "CreatorId" BIGINT NOT NULL,
    "OwnerId" BIGINT NOT NULL,
    "StatusId" BIGINT NOT NULL,
    "Title" TEXT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "tag_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "tag_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

CREATE INDEX "IX_TagStatus_Composite" ON "tag_status" ("Deleted" ASC, "Code" ASC, "Title" ASC, "Updated" ASC);


-- -----------------------------------------------------
-- Table "vehicle"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "StatusId" BIGINT NOT NULL,
    "MakeId" BIGINT NULL,
    "ModelId" BIGINT NULL,
    "VariantId" BIGINT NULL,
    "Year" SMALLINT NULL,
    "Title" TEXT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "vehicle_attachment"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle_attachment" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "VehicleId" BIGINT NOT NULL,
    "Filename" TEXT NULL,
    "Url" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "vehicle_make"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle_make" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "vehicle_model"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle_model" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MakeId" BIGINT NOT NULL,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "vehicle_owner"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle_owner" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "MemberId" BIGINT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "vehicle_reaction"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle_reaction" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "VehicleId" BIGINT NOT NULL,
    "MemberId" BIGINT NOT NULL,
    "Emoji" CHAR(1) NOT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "vehicle_status"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle_status" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "Updated" BOOLEAN NOT NULL DEFAULT FALSE,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));


-- -----------------------------------------------------
-- Table "vehicle_variant"
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS "vehicle_variant" (
    "Id" BIGINT NOT NULL GENERATED ALWAYS AS IDENTITY,
    "ModelId" BIGINT NOT NULL,
    "Code" TEXT NOT NULL,
    "Title" TEXT NOT NULL,
    "Note" TEXT NULL,
    "CreatedIp" INET NOT NULL,
    "CreatedUtc" TIMESTAMP(6) WITH TIME ZONE NOT NULL,
    "CreatedUserId" BIGINT NOT NULL,
    "UpdatedIp" INET NULL,
    "UpdatedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "UpdatedUserId" BIGINT NULL,
    "Deleted" BOOLEAN NOT NULL DEFAULT FALSE,
    "DeletedIp" INET NULL,
    "DeletedUtc" TIMESTAMP(6) WITH TIME ZONE NULL,
    "DeletedUserId" BIGINT NULL,
  PRIMARY KEY ("Id"));

--
-- Seed
--
INSERT INTO "user" (
    "Key", 
    "Email", 
    "Password", 
    "EmailVerified", 
    "CreatedIp", 
    "CreatedUtc"
)
VALUES (
    uuid_generate_v4(), 
    'admin', 
    '$argon2id$v=19$m=32768,t=4,p=1$izX4HMxxqvK2GyhZUpNKjw$cG7sl4P0IWLVYTiU7D+UJAhNko7Ri9phTiqx0N03A1k', 
    FALSE, 
    '127.0.0.1', 
    NOW() AT TIME ZONE 'utc'
);

INSERT INTO "role" (
    "Code", 
    "Title", 
    "CreatedUserId", 
    "CreatedIp", 
    "CreatedUtc"
)
VALUES ('ANON', 'Anonymous public user', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc'),
    ('USER', 'Registered user', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc'),
    ('MEMBER', 'Financial member', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc'),
    ('COMMITTE', 'Committee member', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc'),
    ('ADMIN', 'System administrator', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc');

INSERT INTO "permission" (
    "Code", 
    "Title", 
    "CreatedUserId", 
    "CreatedIp", 
    "CreatedUtc"
)
VALUES ('CREATE', 'Create', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc'),
    ('READ', 'Read', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc'),
    ('UPDATE', 'Update', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc'),
    ('DELETE', 'Delete', 1, '127.0.0.1', NOW() AT TIME ZONE 'utc');

