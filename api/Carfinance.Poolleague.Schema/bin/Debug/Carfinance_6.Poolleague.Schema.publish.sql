﻿/*
Deployment script for Carfinance.Poolleague

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Carfinance.Poolleague"
:setvar DefaultFilePrefix "Carfinance.Poolleague"
:setvar DefaultDataPath "S:\Data\"
:setvar DefaultLogPath "S:\Data\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET PAGE_VERIFY NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
PRINT N'Rename refactoring operation with key a07f1edc-8bca-4992-9e4b-4024b2522f5e is skipped, element [dbo].[User].[NickName] (SqlSimpleColumn) will not be renamed to Nickname';


GO
PRINT N'Rename refactoring operation with key 2d99838a-329a-45b5-b311-729a033fc1b6 is skipped, element [dbo].[User].[Name] (SqlSimpleColumn) will not be renamed to FirstName';


GO
PRINT N'Creating [dbo].[Match]...';


GO
CREATE TABLE [dbo].[Match] (
    [Id]        INT      IDENTITY (1, 1) NOT NULL,
    [WinnerId]  INT      NOT NULL,
    [LoserId]   INT      NOT NULL,
    [MatchDate] DATETIME NOT NULL
);


GO
PRINT N'Creating [dbo].[User]...';


GO
CREATE TABLE [dbo].[User] (
    [Id]        INT           IDENTITY (1, 1) NOT NULL,
    [FirstName] NVARCHAR (50) NOT NULL,
    [Surname]   NVARCHAR (50) NOT NULL,
    [Nickname]  NVARCHAR (50) NOT NULL,
    [Elo]       INT           NOT NULL
);


GO
PRINT N'Creating [dbo].[User_Get]...';


GO
CREATE PROCEDURE [dbo].[User_Get]
		   @Id int
AS

select 
	[Id],
	[FirstName],
	[Surname],
	[Nickname],
	[Elo]
from [dbo].[User]
where id = @Id
GO
PRINT N'Creating [dbo].[User_GetALL]...';


GO
CREATE PROCEDURE [dbo].[User_GetALL]
AS

select 
	[Id],
	[FirstName],
	[Surname],
	[Nickname],
	[Elo]
from [dbo].[User]
GO
PRINT N'Creating [dbo].[User_Insert]...';


GO
CREATE PROCEDURE dbo.User_Insert
           @FirstName nvarchar(50),
           @Surname nvarchar(50),
           @Nickname nvarchar(50),
           @Elo int
AS

INSERT INTO [dbo].[User]
           (
           [FirstName]
           ,[Surname]
           ,[Nickname]
           ,[Elo])
     VALUES
	 (
           @FirstName
           ,@Surname
           ,@Nickname
           ,@Elo
		   )

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Creating [dbo].[User_Update]...';


GO

CREATE PROCEDURE [dbo].[User_Update]
		   @Id int,
           @FirstName nvarchar(50),
           @Surname nvarchar(50),
           @Nickname nvarchar(50),
           @Elo int
AS

UPDATE [dbo].[User]
           set [FirstName] = @FirstName
           ,[Surname] = @Surname
           ,[Nickname] = @Nickname
           ,[Elo] = @Elo
where id = @Id
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'a07f1edc-8bca-4992-9e4b-4024b2522f5e')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('a07f1edc-8bca-4992-9e4b-4024b2522f5e')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '2d99838a-329a-45b5-b311-729a033fc1b6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('2d99838a-329a-45b5-b311-729a033fc1b6')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
--:r .\StaticData\Games.sql
GO

GO
PRINT N'Update complete.';


GO
