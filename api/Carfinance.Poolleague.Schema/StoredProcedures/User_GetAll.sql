CREATE PROCEDURE [dbo].[User_GetALL]
AS

select 
	[Id],
	[FirstName],
	[Surname],
	[Nickname],
	[Elo]
from [dbo].[User]
