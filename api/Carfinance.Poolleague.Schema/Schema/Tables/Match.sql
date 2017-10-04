CREATE TABLE [dbo].[Match]
(
	[Id] INT IDENTITY (1, 1) NOT NULL, 
    [WinnerId] INT NOT NULL, 
    [LoserId] INT NOT NULL, 
    [MatchDate] DATETIME NOT NULL,
)
