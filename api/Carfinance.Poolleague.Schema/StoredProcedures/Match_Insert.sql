CREATE PROCEDURE dbo.Match_Insert
           @WinnerId AS INT,
           @LoserId AS INT,
           @MatchDate AS DATETIME

AS

INSERT INTO [dbo].[Match]
(
           WinnerId,
           LoserId,
           MatchDate
		   )
     VALUES
	 (
           @WinnerId,
           @LoserId,
		   @MatchDate)

 SELECT CAST(SCOPE_IDENTITY() as int)


