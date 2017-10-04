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