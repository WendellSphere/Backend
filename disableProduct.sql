USE [DB]
GO
/****** Object:  StoredProcedure [dbo].[Product_Disable]    Script Date: 6/9/2017 12:15:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[Product_Disable]
			@Id int
AS
/*******Test Code******
	DECLARE @Id int = 131

	EXEC Product_Disable @Id

	SELECT * FROM Product
	WHERE Id = @Id
*/
BEGIN

	UPDATE [dbo].[Product]
	SET
    [IsDeleted] = 1
	WHERE Id = @Id
 
END

