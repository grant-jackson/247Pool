﻿/*
Deployment script for Carfinance.Funding.Gateway

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Carfinance.Funding.Gateway"
:setvar DefaultFilePrefix "Carfinance.Funding.Gateway"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\"

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
PRINT N'Rename refactoring operation with key 941d9bb8-6964-409a-ace2-dece8d205f58 is skipped, element [dbo].[Asset].[V] (SqlSimpleColumn) will not be renamed to Registration';


GO
PRINT N'Rename refactoring operation with key b0290932-097e-4fc3-9d7d-274a7a2abfa6 is skipped, element [dbo].[Proposal].[ProposalStatus] (SqlSimpleColumn) will not be renamed to ProposalStatusId';


GO
PRINT N'Rename refactoring operation with key bf032a8c-797b-4a14-8024-7bff99f5354d is skipped, element [dbo].[EmploymentAddress].[EmploymentStatus] (SqlSimpleColumn) will not be renamed to EmploymentStatusId';


GO
PRINT N'Creating [dbo].[Application]...';


GO
CREATE TABLE [dbo].[Application] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [BrokerId]        INT          NOT NULL,
    [BrokerReference] VARCHAR (50) NOT NULL,
    [ProposalId]      INT          NULL,
    [AgreementNo]     INT          NULL,
    [ApplicationDate] DATE         NOT NULL,
    CONSTRAINT [PK_Application] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Asset]...';


GO
CREATE TABLE [dbo].[Asset] (
    [Id]                INT          IDENTITY (1, 1) NOT NULL,
    [AssetTypeId]       INT          NOT NULL,
    [Registration]      VARCHAR (50) NOT NULL,
    [Mileage]           INT          NOT NULL,
    [Vin]               VARCHAR (50) NULL,
    [CapId]             INT          NULL,
    [CapCode]           VARCHAR (50) NULL,
    [Range]             VARCHAR (50) NULL,
    [Make]              VARCHAR (50) NULL,
    [Fuel]              VARCHAR (50) NULL,
    [Transmission]      VARCHAR (50) NULL,
    [Colour]            VARCHAR (50) NULL,
    [YearOfManufacture] INT          NULL,
    [EngineCapacity]    INT          NULL,
    [DoorPlan]          VARCHAR (50) NULL,
    [GlassId]           INT          NULL,
    [IsVATQualifying]   BIT          NULL,
    CONSTRAINT [PK_Asset] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[AssetType]...';


GO
CREATE TABLE [dbo].[AssetType] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Broker]...';


GO
CREATE TABLE [dbo].[Broker] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Customer]...';


GO
CREATE TABLE [dbo].[Customer] (
    [Id]                   INT           IDENTITY (1, 1) NOT NULL,
    [TitleId]              INT           NOT NULL,
    [FirstName]            VARCHAR (50)  NOT NULL,
    [MiddleNames]          VARCHAR (50)  NOT NULL,
    [Surname]              VARCHAR (50)  NOT NULL,
    [DateOfBirth]          DATE          NOT NULL,
    [MaritalStatusId]      INT           NOT NULL,
    [DrivingLicenceTypeId] INT           NOT NULL,
    [DaytimePhone]         VARCHAR (50)  NULL,
    [EveningPhone]         VARCHAR (50)  NULL,
    [MobilePhone]          VARCHAR (50)  NULL,
    [EmailAddress]         VARCHAR (100) NOT NULL,
    [Occupation]           VARCHAR (50)  NULL,
    [BankName]             VARCHAR (50)  NOT NULL,
    [AccountName]          VARCHAR (50)  NOT NULL,
    [SortCode]             VARCHAR (50)  NOT NULL,
    [AccountNumber]        VARCHAR (50)  NOT NULL,
    [YearsAtBank]          INT           NOT NULL,
    [MonthsAtBank]         INT           NOT NULL,
    CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Decision]...';


GO
CREATE TABLE [dbo].[Decision] (
    [Id]         INT            IDENTITY (1, 1) NOT NULL,
    [Rate]       DECIMAL (9, 2) NOT NULL,
    [ApprovedBy] VARCHAR (50)   NOT NULL,
    CONSTRAINT [PK_Decision] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[DrivingLicenceType]...';


GO
CREATE TABLE [dbo].[DrivingLicenceType] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EmploymentAddress]...';


GO
CREATE TABLE [dbo].[EmploymentAddress] (
    [Id]                 INT          IDENTITY (1, 1) NOT NULL,
    [CustomerId]         INT          NOT NULL,
    [CompanyName]        VARCHAR (50) NOT NULL,
    [WorkTelephone]      VARCHAR (50) NULL,
    [EmploymentStatusId] INT          NOT NULL,
    [BuildingName]       VARCHAR (50) NULL,
    [BuildingNumber]     VARCHAR (50) NULL,
    [SubBuilding]        VARCHAR (50) NULL,
    [StreetName]         VARCHAR (50) NOT NULL,
    [Town]               VARCHAR (50) NOT NULL,
    [Postcode]           VARCHAR (50) NOT NULL,
    [YearsOfEmployment]  INT          NOT NULL,
    [MonthsOfEmployment] INT          NOT NULL,
    CONSTRAINT [PK_EmploymentAddress] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[EmploymentStatus]...';


GO
CREATE TABLE [dbo].[EmploymentStatus] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Gender]...';


GO
CREATE TABLE [dbo].[Gender] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[MaritalStatus]...';


GO
CREATE TABLE [dbo].[MaritalStatus] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Proposal]...';


GO
CREATE TABLE [dbo].[Proposal] (
    [Id]               INT             IDENTITY (1, 1) NOT NULL,
    [ApplicationId]    INT             NOT NULL,
    [CustomerId]       INT             NOT NULL,
    [AssetId]          INT             NOT NULL,
    [DecisionId]       INT             NOT NULL,
    [ProposalStatusId] INT             NOT NULL,
    [Amount]           DECIMAL (19, 2) NOT NULL,
    [Deposit]          DECIMAL (19, 2) NOT NULL,
    [TermMonths]       INT             NOT NULL,
    CONSTRAINT [PK_Proposal] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ProposalStatus]...';


GO
CREATE TABLE [dbo].[ProposalStatus] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ResidentialAddress]...';


GO
CREATE TABLE [dbo].[ResidentialAddress] (
    [Id]                  INT          IDENTITY (1, 1) NOT NULL,
    [CustomerId]          INT          NOT NULL,
    [ResidentialStatusId] INT          NOT NULL,
    [BuildingName]        VARCHAR (50) NULL,
    [BuildingNumber]      VARCHAR (50) NULL,
    [SubBuilding]         VARCHAR (50) NULL,
    [StreetName]          VARCHAR (50) NOT NULL,
    [Locality]            VARCHAR (50) NULL,
    [Town]                VARCHAR (50) NOT NULL,
    [Postcode]            VARCHAR (50) NOT NULL,
    [YearsAtAddress]      INT          NOT NULL,
    [MonthsAtAddress]     INT          NOT NULL,
    CONSTRAINT [PK_ResidentialAddress] PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[ResidentialStatus]...';


GO
CREATE TABLE [dbo].[ResidentialStatus] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Title]...';


GO
CREATE TABLE [dbo].[Title] (
    [Id]   INT          NOT NULL,
    [Name] VARCHAR (50) NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[FK_Application_BrokerId]...';


GO
ALTER TABLE [dbo].[Application] WITH NOCHECK
    ADD CONSTRAINT [FK_Application_BrokerId] FOREIGN KEY ([BrokerId]) REFERENCES [dbo].[Broker] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Application_ProposalId]...';


GO
ALTER TABLE [dbo].[Application] WITH NOCHECK
    ADD CONSTRAINT [FK_Application_ProposalId] FOREIGN KEY ([ProposalId]) REFERENCES [dbo].[Proposal] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Customer_TitleId]...';


GO
ALTER TABLE [dbo].[Customer] WITH NOCHECK
    ADD CONSTRAINT [FK_Customer_TitleId] FOREIGN KEY ([TitleId]) REFERENCES [dbo].[Title] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EmploymentAddress_CustomerId]...';


GO
ALTER TABLE [dbo].[EmploymentAddress] WITH NOCHECK
    ADD CONSTRAINT [FK_EmploymentAddress_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creating [dbo].[FK_EmploymentAddress_EmploymentStatusId]...';


GO
ALTER TABLE [dbo].[EmploymentAddress] WITH NOCHECK
    ADD CONSTRAINT [FK_EmploymentAddress_EmploymentStatusId] FOREIGN KEY ([EmploymentStatusId]) REFERENCES [dbo].[EmploymentStatus] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Proposal_ApplicationId]...';


GO
ALTER TABLE [dbo].[Proposal] WITH NOCHECK
    ADD CONSTRAINT [FK_Proposal_ApplicationId] FOREIGN KEY ([ApplicationId]) REFERENCES [dbo].[Application] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Proposal_CustomerId]...';


GO
ALTER TABLE [dbo].[Proposal] WITH NOCHECK
    ADD CONSTRAINT [FK_Proposal_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Proposal_AssetId]...';


GO
ALTER TABLE [dbo].[Proposal] WITH NOCHECK
    ADD CONSTRAINT [FK_Proposal_AssetId] FOREIGN KEY ([AssetId]) REFERENCES [dbo].[Asset] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Proposal_DecisionId]...';


GO
ALTER TABLE [dbo].[Proposal] WITH NOCHECK
    ADD CONSTRAINT [FK_Proposal_DecisionId] FOREIGN KEY ([DecisionId]) REFERENCES [dbo].[Decision] ([Id]);


GO
PRINT N'Creating [dbo].[FK_Proposal_ProposalStatusId]...';


GO
ALTER TABLE [dbo].[Proposal] WITH NOCHECK
    ADD CONSTRAINT [FK_Proposal_ProposalStatusId] FOREIGN KEY ([ProposalStatusId]) REFERENCES [dbo].[ProposalStatus] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResidentialAddress_CustomerId]...';


GO
ALTER TABLE [dbo].[ResidentialAddress] WITH NOCHECK
    ADD CONSTRAINT [FK_ResidentialAddress_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customer] ([Id]);


GO
PRINT N'Creating [dbo].[FK_ResidentialAddress_ResidentialStatusId]...';


GO
ALTER TABLE [dbo].[ResidentialAddress] WITH NOCHECK
    ADD CONSTRAINT [FK_ResidentialAddress_ResidentialStatusId] FOREIGN KEY ([ResidentialStatusId]) REFERENCES [dbo].[EmploymentStatus] ([Id]);


GO
PRINT N'Creating [dbo].[Application_Get]...';


GO
CREATE PROCEDURE [dbo].[Application_Get]
	@Id INT

AS

SELECT [Id]
      ,[BrokerId]
      ,[BrokerReference]
      ,[ProposalId]
      ,[AgreementNo]
      ,[ApplicationDate]
  FROM [dbo].[Application]
WHERE Id = @Id
GO
PRINT N'Creating [dbo].[Application_Insert]...';


GO

CREATE PROCEDURE [dbo].[Application_Insert]
           @BrokerId int,
           @BrokerReference varchar(50),
           @ProposalId int = NULL,
           @AgreementNo int = NULL,
           @ApplicationDate date

AS

INSERT INTO [dbo].[Application]
           ([BrokerId]
           ,[BrokerReference]
           ,[ProposalId]
           ,[AgreementNo]
           ,[ApplicationDate])
     VALUES
           (@BrokerId
           ,@BrokerReference
           ,@ProposalId
           ,@AgreementNo
           ,@ApplicationDate)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Creating [dbo].[Application_Update]...';


GO
CREATE PROCEDURE [dbo].[Application_Update]
		@Id int,
		@BrokerId int,
		@BrokerReference varchar(50),
		@ProposalId int = NULL,
		@AgreementNo int,
		@ApplicationDate date

AS

UPDATE [dbo].[Application]
	SET		[BrokerId] = @BrokerId
           ,[BrokerReference] = @BrokerReference
           ,[ProposalId] = @ProposalId
           ,[AgreementNo] = @AgreementNo
           ,[ApplicationDate] = @ApplicationDate
     WHERE
		Id = @Id
GO
PRINT N'Creating [dbo].[Asset_Get]...';


GO
CREATE PROCEDURE [dbo].[Asset_Get]
		@Id AS INT
AS

SELECT [Id]
      ,[AssetTypeId]
      ,[Registration]
      ,[Mileage]
      ,[Vin]
      ,[CapId]
      ,[CapCode]
      ,[Range]
      ,[Make]
      ,[Fuel]
      ,[Transmission]
      ,[Colour]
      ,[YearOfManufacture]
      ,[EngineCapacity]
      ,[DoorPlan]
      ,[GlassId]
      ,[IsVATQualifying]
  FROM [dbo].[Asset]
WHERE Id = @Id
GO
PRINT N'Creating [dbo].[Asset_Insert]...';


GO
CREATE PROCEDURE dbo.Asset_Insert
           @AssetTypeId int,
           @Registration varchar(50),
           @Mileage int ,
           @Vin varchar(50) = NULL,
           @CapId int = NULL,
           @CapCode varchar(50) = NULL,
           @Range varchar(50) = NULL,
           @Make varchar(50) = NULL,
           @Fuel varchar(50) = NULL,
           @Transmission varchar(50) = NULL,
           @Colour varchar(50) = NULL,
           @YearOfManufacture int = NULL,
           @EngineCapacity int = NULL,
           @DoorPlan varchar(50) = NULL,
           @GlassId int = NULL,
           @IsVATQualifying bit = NULL

AS

INSERT INTO [dbo].[Asset]
           ([AssetTypeId]
           ,[Registration]
           ,[Mileage]
           ,[Vin]
           ,[CapId]
           ,[CapCode]
           ,[Range]
           ,[Make]
           ,[Fuel]
           ,[Transmission]
           ,[Colour]
           ,[YearOfManufacture]
           ,[EngineCapacity]
           ,[DoorPlan]
           ,[GlassId]
           ,[IsVATQualifying])
     VALUES
	 (
           @AssetTypeId,
           @Registration,
           @Mileage,
           @Vin,
           @CapId,
           @CapCode,
           @Range,
           @Make,
           @Fuel,
           @Transmission,
           @Colour,
           @YearOfManufacture,
           @EngineCapacity,
           @DoorPlan,
           @GlassId,
           @IsVATQualifying
		)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Creating [dbo].[Customer_Get]...';


GO
CREATE PROCEDURE [dbo].[Customer_Get]
		@Id INT
AS

SELECT [Id]
      ,[TitleId]
      ,[FirstName]
      ,[MiddleNames]
      ,[Surname]
      ,[DateOfBirth]
      ,[MaritalStatusId]
      ,[DrivingLicenceTypeId]
      ,[DaytimePhone]
      ,[EveningPhone]
      ,[MobilePhone]
      ,[EmailAddress]
      ,[Occupation]
      ,[BankName]
      ,[AccountName]
      ,[SortCode]
      ,[AccountNumber]
      ,[YearsAtBank]
      ,[MonthsAtBank]
  FROM [dbo].[Customer]
WHERE @Id = Id
GO
PRINT N'Creating [dbo].[Customer_Insert]...';


GO
CREATE PROCEDURE [dbo].[Customer_Insert]
           @TitleId int,
           @FirstName varchar(50),
           @MiddleNames varchar(50),
           @Surname varchar(50),
           @DateOfBirth date,
           @MaritalStatusId int,
           @DrivingLicenceTypeId int,
           @DaytimePhone varchar(50),
           @EveningPhone varchar(50),
           @MobilePhone varchar(50),
           @EmailAddress varchar(100),
           @Occupation varchar(50),
           @BankName varchar(50),
           @AccountName varchar(50),
           @SortCode varchar(50),
           @AccountNumber varchar(50),
           @YearsAtBank int,
           @MonthsAtBank int
AS

INSERT INTO [dbo].[Customer]
           ([TitleId]
           ,[FirstName]
           ,[MiddleNames]
           ,[Surname]
           ,[DateOfBirth]
           ,[MaritalStatusId]
           ,[DrivingLicenceTypeId]
           ,[DaytimePhone]
           ,[EveningPhone]
           ,[MobilePhone]
           ,[EmailAddress]
           ,[Occupation]
           ,[BankName]
           ,[AccountName]
           ,[SortCode]
           ,[AccountNumber]
           ,[YearsAtBank]
           ,[MonthsAtBank])
     VALUES
	 (
           @TitleId,
           @FirstName,
           @MiddleNames,
           @Surname,
           @DateOfBirth,
           @MaritalStatusId,
           @DrivingLicenceTypeId,
           @DaytimePhone,
           @EveningPhone,
           @MobilePhone,
           @EmailAddress,
           @Occupation,
           @BankName,
           @AccountName,
           @SortCode,
           @AccountNumber,
           @YearsAtBank,
           @MonthsAtBank
	)

	SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Creating [dbo].[Decision_Get]...';


GO
CREATE PROCEDURE [dbo].[Decision_Get]
		@Id INT
AS

SELECT [Id]
      ,[Rate]
      ,[ApprovedBy]
  FROM [dbo].[Decision]
WHERE @Id = Id
GO
PRINT N'Creating [dbo].[Decision_Insert]...';


GO
CREATE PROCEDURE dbo.[Decision_Insert]
           @Rate decimal(9,2),
           @ApprovedBy varchar(50)

AS

INSERT INTO [dbo].[Decision]
           ([Rate]
           ,[ApprovedBy])
     VALUES
	 (
		@Rate,
        @ApprovedBy
	 )

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Creating [dbo].[EmploymentAddress_GetByCustomerId]...';


GO
CREATE PROCEDURE [dbo].[EmploymentAddress_GetByCustomerId]
		@CustomerId INT
AS

SELECT [Id]
      ,[CustomerId]
      ,[CompanyName]
      ,[WorkTelephone]
      ,[EmploymentStatusId]
      ,[BuildingName]
      ,[BuildingNumber]
      ,[SubBuilding]
      ,[StreetName]
      ,[Town]
      ,[Postcode]
      ,[YearsOfEmployment]
      ,[MonthsOfEmployment]
  FROM [dbo].[EmploymentAddress]
WHERE CustomerId = @CustomerId
GO
PRINT N'Creating [dbo].[EmploymentAddress_Insert]...';


GO
CREATE PROCEDURE [dbo].[EmploymentAddress_Insert]
           @CustomerId int,
           @CompanyName varchar(50),
           @WorkTelephone varchar(50),
           @EmploymentStatusId int,
           @BuildingName varchar(50),
           @BuildingNumber varchar(50),
           @SubBuilding varchar(50),
           @StreetName varchar(50),
           @Town varchar(50),
           @Postcode varchar(50),
           @YearsOfEmployment int,
           @MonthsOfEmployment int

AS

INSERT INTO [dbo].[EmploymentAddress]
           ([CustomerId]
           ,[CompanyName]
           ,[WorkTelephone]
           ,[EmploymentStatusId]
           ,[BuildingName]
           ,[BuildingNumber]
           ,[SubBuilding]
           ,[StreetName]
           ,[Town]
           ,[Postcode]
           ,[YearsOfEmployment]
           ,[MonthsOfEmployment])
     VALUES
           (@CustomerId
           ,@CompanyName
           ,@WorkTelephone
           ,@EmploymentStatusId
           ,@BuildingName
           ,@BuildingNumber
           ,@SubBuilding
           ,@StreetName
           ,@Town
           ,@Postcode
           ,@YearsOfEmployment
           ,@MonthsOfEmployment)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Creating [dbo].[Proposal_Get]...';


GO
CREATE PROCEDURE [dbo].[Proposal_Get]
		@Id INT

AS

SELECT [Id]
      ,[ApplicationId]
      ,[CustomerId]
      ,[AssetId]
      ,[DecisionId]
      ,[ProposalStatusId]
      ,[Amount]
      ,[Deposit]
      ,[TermMonths]
  FROM [dbo].[Proposal]
WHERE Id = @Id
GO
PRINT N'Creating [dbo].[Proposal_Insert]...';


GO
CREATE PROCEDURE [dbo].[Proposal_Insert]
           @ApplicationId int,
           @CustomerId int,
           @AssetId int,
           @DecisionId int,
           @ProposalStatusId int,
           @Amount decimal(19,2),
           @Deposit decimal(19,2),
           @TermMonths int

AS

INSERT INTO [dbo].[Proposal]
           ([ApplicationId]
           ,[CustomerId]
           ,[AssetId]
           ,[DecisionId]
           ,[ProposalStatusId]
           ,[Amount]
           ,[Deposit]
           ,[TermMonths])
     VALUES
	 (
           @ApplicationId,
           @CustomerId,
           @AssetId,
           @DecisionId,
           @ProposalStatusId,
           @Amount,
           @Deposit,
           @TermMonths)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Creating [dbo].[ResidentialAddress_GetByGustomerId]...';


GO
CREATE PROCEDURE [dbo].[ResidentialAddress_GetByGustomerId]
		@CustomerId INT

AS

SELECT [Id]
      ,[CustomerId]
      ,[ResidentialStatusId]
      ,[BuildingName]
      ,[BuildingNumber]
      ,[SubBuilding]
      ,[StreetName]
      ,[Locality]
      ,[Town]
      ,[Postcode]
      ,[YearsAtAddress]
      ,[MonthsAtAddress]
  FROM [dbo].[ResidentialAddress]
WHERE Id = @CustomerId
GO
PRINT N'Creating [dbo].[ResidentialAddress_Insert]...';


GO
CREATE PROCEDURE [dbo].[ResidentialAddress_Insert]
           @CustomerId int,
           @ResidentialStatusId int,
           @BuildingName varchar(50),
           @BuildingNumber varchar(50),
           @SubBuilding varchar(50),
           @StreetName varchar(50),
           @Locality varchar(50),
           @Town varchar(50),
           @Postcode varchar(50),
           @YearsAtAddress int,
           @MonthsAtAddress int

AS

INSERT INTO [dbo].[ResidentialAddress]
	([CustomerId]
	,[ResidentialStatusId]
	,[BuildingName]
	,[BuildingNumber]
	,[SubBuilding]
	,[StreetName]
	,[Locality]
	,[Town]
	,[Postcode]
	,[YearsAtAddress]
	,[MonthsAtAddress])
VALUES
(
	@CustomerId,
	@ResidentialStatusId,
	@BuildingName,
	@BuildingNumber,
	@SubBuilding,
	@StreetName,
	@Locality,
	@Town,
	@Postcode,
	@YearsAtAddress,
	@MonthsAtAddress
)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '941d9bb8-6964-409a-ace2-dece8d205f58')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('941d9bb8-6964-409a-ace2-dece8d205f58')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'b0290932-097e-4fc3-9d7d-274a7a2abfa6')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('b0290932-097e-4fc3-9d7d-274a7a2abfa6')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = 'bf032a8c-797b-4a14-8024-7bff99f5354d')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('bf032a8c-797b-4a14-8024-7bff99f5354d')

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
MERGE INTO [dbo].[AssetType] AS Target
USING (VALUES
        (0, 'Unknown'),
        (1, 'Car'),
        (2, 'BlackCab'),
        (3, 'Caravan') ,
        (4, 'LCV'),
        (5, 'Motorbike'),
        (6, 'Motorhome'),
        (7, 'Commercial'),
        (8, 'CoachBus'),
        (9, 'Van')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[AssetType]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].[AssetType] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[DrivingLicenceType] AS Target
USING (VALUES
        (1, 'FullUKPhotocard'),
        (2, 'FullUK'),
        (3, 'International'),
        (4, 'None'),
        (5, 'ProvisionalUK'),
        (6, 'EU')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[DrivingLicenceType]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].[DrivingLicenceType] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[EmploymentStatus] AS Target
USING (VALUES
        (0, 'Unknown'),
        (1, 'EmployedFullTime'),
        (2, 'EmployedPartTime'),
        (3, 'SelfEmployed'),
        (4, 'ArmedForces'),
        (5, 'NotEmployed'),
        (6, 'Retired'),
        (7, 'AgencyWorker'),
        (8, 'ContractWorker'),
        (9, 'SubContractor'),
        (10, 'Disability'),
        (11, 'Housewife'),
        (12, 'Student'),
        (13, 'Carer'),
        (14, 'NonProfessionalCarer')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[EmploymentStatus]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].[EmploymentStatus] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[Gender] AS Target
USING (VALUES
    (0, 'Unknown'),
    (1, 'Male'),
    (2, 'Female')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[Gender]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].[Gender] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[MaritalStatus] AS Target
USING (VALUES
  (1,'Married')
 ,(2,'Cohabiting')
 ,(3,'Single')
 ,(4,'Divorced')
 ,(5,'Seperated')
 ,(6,'Widowed')
 ,(7,'Civil partnership')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[MaritalStatus]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].[MaritalStatus] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[ProposalStatus] AS Target
USING (VALUES
    (1, 'Processing'),
    (2, 'Declined'),
    (3, 'Accepted')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[ProposalStatus]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].ProposalStatus] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[ResidentialStatus] AS Target
USING (VALUES
    (0, 'Unknown'),
    (1, 'HomeOwner'),
    (2, 'PrivateTenant'),
    (3, 'CouncilTenant'),
    (4, 'LivingWithParents')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[ResidentialStatus]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].ResidentialStatus] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[Title] AS Target
USING (VALUES
	(1, 'Mr'),
	(2, 'Mrs'),
	(3, 'Miss'),
	(4, 'Ms'),
	(5, 'Dr')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[Title]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].Title] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO
MERGE INTO [dbo].[Broker] AS Target
USING (VALUES
	(1, 'Carfinance247')
) AS Source ([Id],[Name])
ON (Target.[Id] = Source.[Id])
WHEN MATCHED AND (
	NULLIF(Source.[Name], Target.[Name]) IS NOT NULL OR NULLIF(Target.[Name], Source.[Name]) IS NOT NULL) THEN 
 UPDATE SET
  [Name] = Source.[Name]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Id],[Name])
 VALUES(Source.[Id],Source.[Name])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE
;
GO
DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [dbo].[Broker]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[dbo].Broker] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO

GO
PRINT N'Checking existing data against newly created constraints';


GO
USE [$(DatabaseName)];


GO
ALTER TABLE [dbo].[Application] WITH CHECK CHECK CONSTRAINT [FK_Application_BrokerId];

ALTER TABLE [dbo].[Application] WITH CHECK CHECK CONSTRAINT [FK_Application_ProposalId];

ALTER TABLE [dbo].[Customer] WITH CHECK CHECK CONSTRAINT [FK_Customer_TitleId];

ALTER TABLE [dbo].[EmploymentAddress] WITH CHECK CHECK CONSTRAINT [FK_EmploymentAddress_CustomerId];

ALTER TABLE [dbo].[EmploymentAddress] WITH CHECK CHECK CONSTRAINT [FK_EmploymentAddress_EmploymentStatusId];

ALTER TABLE [dbo].[Proposal] WITH CHECK CHECK CONSTRAINT [FK_Proposal_ApplicationId];

ALTER TABLE [dbo].[Proposal] WITH CHECK CHECK CONSTRAINT [FK_Proposal_CustomerId];

ALTER TABLE [dbo].[Proposal] WITH CHECK CHECK CONSTRAINT [FK_Proposal_AssetId];

ALTER TABLE [dbo].[Proposal] WITH CHECK CHECK CONSTRAINT [FK_Proposal_DecisionId];

ALTER TABLE [dbo].[Proposal] WITH CHECK CHECK CONSTRAINT [FK_Proposal_ProposalStatusId];

ALTER TABLE [dbo].[ResidentialAddress] WITH CHECK CHECK CONSTRAINT [FK_ResidentialAddress_CustomerId];

ALTER TABLE [dbo].[ResidentialAddress] WITH CHECK CHECK CONSTRAINT [FK_ResidentialAddress_ResidentialStatusId];


GO
PRINT N'Update complete.';


GO
