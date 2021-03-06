USE [DB]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_HandleExists]    Script Date: 6/8/2017 2:42:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Accounts_HandleExists] 
				@Handle nvarchar(250)
AS
/*-------------Test Code---------------
	DECLARE @Handle nvarchar(250) = 'tree';
	EXEC dbo.Accounts_HandleExists 
			@Handle

	SELECT * FROM dbo.Accounts
	WHERE @Handle = Handle
*/
BEGIN

SELECT CASE WHEN EXISTS (
	SELECT Handle
	FROM [dbo].[Accounts]
	WHERE Handle = @Handle
  )
	THEN CAST(1 AS BIT)
	ELSE CAST(0 AS BIT) END AS HandleExists
	

	END