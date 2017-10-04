
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

