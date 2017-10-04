CREATE TABLE [dbo].[User]
(
	[Id] INT IDENTITY (1, 1) NOT NULL,
    [FirstName] NVARCHAR(50) NOT NULL, 
    [Surname] NVARCHAR(50) NOT NULL, 
    [Nickname] NVARCHAR(50) NOT NULL, 
    [Elo] INT NOT NULL
)
