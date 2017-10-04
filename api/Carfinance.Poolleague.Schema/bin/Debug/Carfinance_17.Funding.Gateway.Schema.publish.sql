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
/*
The column [dbo].[Application].[CreatedBy] on table [dbo].[Application] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Application].[CreatedOn] on table [dbo].[Application] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Application].[ModifiedBy] on table [dbo].[Application] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Application].[ModifiedOn] on table [dbo].[Application] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Application])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[Asset].[CreatedBy] on table [dbo].[Asset] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Asset].[CreatedOn] on table [dbo].[Asset] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Asset].[ModifiedBy] on table [dbo].[Asset] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Asset].[ModifiedOn] on table [dbo].[Asset] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Asset])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[Customer].[CreatedBy] on table [dbo].[Customer] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Customer].[CreatedOn] on table [dbo].[Customer] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Customer].[ModifiedBy] on table [dbo].[Customer] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Customer].[ModifiedOn] on table [dbo].[Customer] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Customer])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[Decision].[CreatedBy] on table [dbo].[Decision] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Decision].[CreatedOn] on table [dbo].[Decision] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Decision].[ModifiedBy] on table [dbo].[Decision] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Decision].[ModifiedOn] on table [dbo].[Decision] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Decision])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[EmploymentAddress].[CreatedBy] on table [dbo].[EmploymentAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[EmploymentAddress].[CreatedOn] on table [dbo].[EmploymentAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[EmploymentAddress].[ModifiedBy] on table [dbo].[EmploymentAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[EmploymentAddress].[ModifiedOn] on table [dbo].[EmploymentAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[EmploymentAddress])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[Proposal].[CreatedBy] on table [dbo].[Proposal] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Proposal].[CreatedOn] on table [dbo].[Proposal] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Proposal].[ModifiedBy] on table [dbo].[Proposal] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[Proposal].[ModifiedOn] on table [dbo].[Proposal] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[Proposal])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
/*
The column [dbo].[ResidentialAddress].[CreatedBy] on table [dbo].[ResidentialAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[ResidentialAddress].[CreatedOn] on table [dbo].[ResidentialAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[ResidentialAddress].[ModifiedBy] on table [dbo].[ResidentialAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.

The column [dbo].[ResidentialAddress].[ModifiedOn] on table [dbo].[ResidentialAddress] must be added, but the column has no default value and does not allow NULL values. If the table contains data, the ALTER script will not work. To avoid this issue you must either: add a default value to the column, mark it as allowing NULL values, or enable the generation of smart-defaults as a deployment option.
*/

IF EXISTS (select top 1 1 from [dbo].[ResidentialAddress])
    RAISERROR (N'Rows were detected. The schema update is terminating because data loss might occur.', 16, 127) WITH NOWAIT

GO
PRINT N'Altering [dbo].[Application]...';


GO
ALTER TABLE [dbo].[Application]
    ADD [CreatedBy]  VARCHAR (50) NOT NULL,
        [CreatedOn]  DATETIME     NOT NULL,
        [ModifiedBy] VARCHAR (50) NOT NULL,
        [ModifiedOn] DATETIME     NOT NULL;


GO
PRINT N'Altering [dbo].[Asset]...';


GO
ALTER TABLE [dbo].[Asset]
    ADD [CreatedBy]  VARCHAR (50) NOT NULL,
        [CreatedOn]  DATETIME     NOT NULL,
        [ModifiedBy] VARCHAR (50) NOT NULL,
        [ModifiedOn] DATETIME     NOT NULL;


GO
PRINT N'Altering [dbo].[Customer]...';


GO
ALTER TABLE [dbo].[Customer]
    ADD [CreatedBy]  VARCHAR (50) NOT NULL,
        [CreatedOn]  DATETIME     NOT NULL,
        [ModifiedBy] VARCHAR (50) NOT NULL,
        [ModifiedOn] DATETIME     NOT NULL;


GO
PRINT N'Altering [dbo].[Decision]...';


GO
ALTER TABLE [dbo].[Decision]
    ADD [CreatedBy]  VARCHAR (50) NOT NULL,
        [CreatedOn]  DATETIME     NOT NULL,
        [ModifiedBy] VARCHAR (50) NOT NULL,
        [ModifiedOn] DATETIME     NOT NULL;


GO
PRINT N'Altering [dbo].[EmploymentAddress]...';


GO
ALTER TABLE [dbo].[EmploymentAddress]
    ADD [CreatedBy]  VARCHAR (50) NOT NULL,
        [CreatedOn]  DATETIME     NOT NULL,
        [ModifiedBy] VARCHAR (50) NOT NULL,
        [ModifiedOn] DATETIME     NOT NULL;


GO
PRINT N'Altering [dbo].[Proposal]...';


GO
ALTER TABLE [dbo].[Proposal]
    ADD [CreatedBy]  VARCHAR (50) NOT NULL,
        [CreatedOn]  DATETIME     NOT NULL,
        [ModifiedBy] VARCHAR (50) NOT NULL,
        [ModifiedOn] DATETIME     NOT NULL;


GO
PRINT N'Altering [dbo].[ResidentialAddress]...';


GO
ALTER TABLE [dbo].[ResidentialAddress]
    ADD [CreatedBy]  VARCHAR (50) NOT NULL,
        [CreatedOn]  DATETIME     NOT NULL,
        [ModifiedBy] VARCHAR (50) NOT NULL,
        [ModifiedOn] DATETIME     NOT NULL;


GO
PRINT N'Altering [dbo].[Application_Insert]...';


GO

ALTER PROCEDURE [dbo].[Application_Insert]
           @BrokerId int,
           @BrokerReference varchar(50),
           @ProposalId int = NULL,
           @AgreementNo int = NULL,
           @ApplicationDate date,
		   @CreatedBy varchar(50) = 'Unknown'

AS

INSERT INTO [dbo].[Application]
           ([BrokerId]
           ,[BrokerReference]
           ,[ProposalId]
           ,[AgreementNo]
           ,[ApplicationDate]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]  
           ,[ModifiedOn])
     VALUES
           (@BrokerId
           ,@BrokerReference
           ,@ProposalId
           ,@AgreementNo
           ,@ApplicationDate
           ,@CreatedBy
           ,GETDATE()
           ,@CreatedBy  
           ,GETDATE())

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Altering [dbo].[Application_Update]...';


GO
ALTER PROCEDURE [dbo].[Application_Update]
		@Id int,
		@BrokerId int,
		@BrokerReference varchar(50),
		@ProposalId int = NULL,
		@AgreementNo int,
		@ApplicationDate date,
		@ModifiedBy varchar(50) = 'Unknown'

AS

UPDATE [dbo].[Application]
	SET		[BrokerId] = @BrokerId
           ,[BrokerReference] = @BrokerReference
           ,[ProposalId] = @ProposalId
           ,[AgreementNo] = @AgreementNo
           ,[ApplicationDate] = @ApplicationDate
		   ,[ModifiedBy]= @ModifiedBy 
		   ,[ModifiedOn] = GETDATE()
     WHERE
		Id = @Id
GO
PRINT N'Altering [dbo].[Asset_Insert]...';


GO
ALTER PROCEDURE dbo.Asset_Insert
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
           @IsVATQualifying bit = NULL,
		   @CreatedBy varchar(50) = 'Unknown'

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
           ,[IsVATQualifying]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]  
           ,[ModifiedOn])
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
           @IsVATQualifying,
           @CreatedBy,
           GETDATE(),
           @CreatedBy,  
           GETDATE()
		)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Altering [dbo].[Customer_Insert]...';


GO
ALTER PROCEDURE [dbo].[Customer_Insert]
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
           @MonthsAtBank int,
		   @CreatedBy varchar(50) = 'Unknown'
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
           ,[MonthsAtBank]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]  
           ,[ModifiedOn])
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
           @MonthsAtBank,
           @CreatedBy,
           GETDATE(),
           @CreatedBy,  
           GETDATE()
	)

	SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Altering [dbo].[Customer_Update]...';


GO
ALTER PROCEDURE dbo.Customer_Update
	@Id int,
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
	@MonthsAtBank int,
	@ModifiedBy varchar(50) = 'Unknown'

AS

UPDATE [dbo].[Customer]
   SET [TitleId] = @TitleId
      ,[FirstName] = @FirstName
      ,[MiddleNames] = @MiddleNames
      ,[Surname] = @Surname
      ,[DateOfBirth] = @DateOfBirth
      ,[MaritalStatusId] = @MaritalStatusId
      ,[DrivingLicenceTypeId] = @DrivingLicenceTypeId
      ,[DaytimePhone] = @DaytimePhone
      ,[EveningPhone] = @EveningPhone
      ,[MobilePhone] = @MobilePhone
      ,[EmailAddress] = @EmailAddress
      ,[Occupation] = @Occupation
      ,[BankName] = @BankName
      ,[AccountName] = @AccountName
      ,[SortCode] = @SortCode
      ,[AccountNumber] = @AccountNumber
      ,[YearsAtBank] = @YearsAtBank
      ,[MonthsAtBank] = @MonthsAtBank
      ,[ModifiedBy]= @ModifiedBy 
      ,[ModifiedOn] = GETDATE()
 WHERE @Id = Id
GO
PRINT N'Altering [dbo].[Decision_Insert]...';


GO
ALTER PROCEDURE dbo.[Decision_Insert]
           @Rate decimal(9,2),
           @ApprovedBy varchar(50),
		   @CreatedBy varchar(50) = 'Unknown'

AS

INSERT INTO [dbo].[Decision]
           ([Rate]
           ,[ApprovedBy]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]  
           ,[ModifiedOn])
     VALUES
	 (
		@Rate,
        @ApprovedBy,
        @CreatedBy,
        GETDATE(),
        @CreatedBy,  
        GETDATE()
	 )

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Altering [dbo].[EmploymentAddress_Insert]...';


GO
ALTER PROCEDURE [dbo].[EmploymentAddress_Insert]
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
           @MonthsOfEmployment int,
		   @CreatedBy varchar(50) = 'Unknown'

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
           ,[MonthsOfEmployment]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]  
           ,[ModifiedOn])
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
           ,@MonthsOfEmployment
           ,@CreatedBy
           ,GETDATE()
           ,@CreatedBy  
           ,GETDATE()
		   )

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Altering [dbo].[EmploymentAddress_Update]...';


GO
ALTER PROCEDURE [dbo].[EmploymentAddress_Update]
		@Id int,
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
		@MonthsOfEmployment int,
		@ModifiedBy varchar(50) = 'Unknown'

AS

UPDATE [dbo].[EmploymentAddress]
   SET [CustomerId] = @CustomerId
      ,[CompanyName] = @CompanyName
      ,[WorkTelephone] = @WorkTelephone
      ,[EmploymentStatusId] = @EmploymentStatusId
      ,[BuildingName] = @BuildingName
      ,[BuildingNumber] = @BuildingNumber
      ,[SubBuilding] = @SubBuilding
      ,[StreetName] = @StreetName
      ,[Town] = @Town
      ,[Postcode] = @Postcode
      ,[YearsOfEmployment] = @YearsOfEmployment
      ,[MonthsOfEmployment] = @MonthsOfEmployment
      ,[ModifiedBy]= @ModifiedBy 
      ,[ModifiedOn] = GETDATE()
 WHERE @Id = Id
GO
PRINT N'Altering [dbo].[Proposal_Insert]...';


GO
ALTER PROCEDURE [dbo].[Proposal_Insert]
           @ApplicationId int,
           @CustomerId int,
           @AssetId int,
           @DecisionId int,
           @ProposalStatusId int,
           @Amount decimal(19,2),
           @Deposit decimal(19,2),
           @TermMonths int,
		   @CreatedBy varchar(50) = 'Unknown'

AS

INSERT INTO [dbo].[Proposal]
           ([ApplicationId]
           ,[CustomerId]
           ,[AssetId]
           ,[DecisionId]
           ,[ProposalStatusId]
           ,[Amount]
           ,[Deposit]
           ,[TermMonths]
           ,[CreatedBy]
           ,[CreatedOn]
           ,[ModifiedBy]  
           ,[ModifiedOn])
     VALUES
	 (
           @ApplicationId,
           @CustomerId,
           @AssetId,
           @DecisionId,
           @ProposalStatusId,
           @Amount,
           @Deposit,
           @TermMonths,
           @CreatedBy,
           GETDATE(),
           @CreatedBy,  
           GETDATE()
	)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Altering [dbo].[ResidentialAddress_Insert]...';


GO
ALTER PROCEDURE [dbo].[ResidentialAddress_Insert]
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
           @MonthsAtAddress int,
		   @CreatedBy varchar(50) = 'Unknown'

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
	,[MonthsAtAddress]
    ,[CreatedBy]
    ,[CreatedOn]
    ,[ModifiedBy]  
    ,[ModifiedOn])
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
	@MonthsAtAddress,
    @CreatedBy,
    GETDATE(),
    @CreatedBy,  
    GETDATE()
)

SELECT CAST(SCOPE_IDENTITY() as int)
GO
PRINT N'Altering [dbo].[ResidentialAddress_Update]...';


GO
ALTER PROCEDURE [dbo].[ResidentialAddress_Update]
		@Id INT,
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
        @MonthsAtAddress int,
		@ModifiedBy varchar(50) = 'Unknown'
AS

UPDATE [dbo].[ResidentialAddress]
   SET [CustomerId] = @CustomerId
      ,[ResidentialStatusId] = @ResidentialStatusId
      ,[BuildingName] = @BuildingName
      ,[BuildingNumber] = @BuildingNumber
      ,[SubBuilding] = @SubBuilding
      ,[StreetName] = @StreetName
      ,[Locality] = @Locality
      ,[Town] = @Town
      ,[Postcode] = @Postcode
      ,[YearsAtAddress] = @YearsAtAddress
      ,[MonthsAtAddress] = @MonthsAtAddress
      ,[ModifiedBy]= @ModifiedBy 
      ,[ModifiedOn] = GETDATE()
WHERE Id = @Id
GO
PRINT N'Refreshing [dbo].[Application_Get]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Application_Get]';


GO
PRINT N'Refreshing [dbo].[Asset_Get]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Asset_Get]';


GO
PRINT N'Refreshing [dbo].[Customer_Get]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Customer_Get]';


GO
PRINT N'Refreshing [dbo].[Decision_Get]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Decision_Get]';


GO
PRINT N'Refreshing [dbo].[EmploymentAddress_Delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[EmploymentAddress_Delete]';


GO
PRINT N'Refreshing [dbo].[EmploymentAddress_GetByCustomerId]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[EmploymentAddress_GetByCustomerId]';


GO
PRINT N'Refreshing [dbo].[Proposal_Get]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[Proposal_Get]';


GO
PRINT N'Refreshing [dbo].[ResidentialAddress_Delete]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[ResidentialAddress_Delete]';


GO
PRINT N'Refreshing [dbo].[ResidentialAddress_GetByCustomerId]...';


GO
EXECUTE sp_refreshsqlmodule N'[dbo].[ResidentialAddress_GetByCustomerId]';


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
PRINT N'Update complete.';


GO
