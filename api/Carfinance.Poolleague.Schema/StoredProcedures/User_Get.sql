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
