USE [DB]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_InsertRegisteredUser_V2]    Script Date: 6/8/2017 2:39:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [dbo].[Accounts_InsertRegisteredUser_V2]
			 @UserId nvarchar(128) OUTPUT
			,@Handle nvarchar(250)
			,@AvatarUrl nvarchar(200) = null
AS
/*------------Test Code-----------
		DECLARE @UserId nvarchar(128) = 'TESTid2'
		, @Handle nvarchar(250) = 'TESThandle2';
		
		EXEC dbo.Accounts_InsertRegisteredUser_V2
				@UserId
			  , @Handle

		SELECT * FROM dbo.Accounts
		WHERE UserId = @UserId
*/
BEGIN
	IF(@AvatarUrl is null)
	
	BEGIN
			SET @AvatarUrl = 'https://www.crossref.org/images/staff/blank-profile-picture.png'
	END

	INSERT INTO [dbo].[Accounts]
           ([UserId] 
           ,[Handle]
		   ,CreatedBy
		   ,ModifiedBy
		   ,AvatarUrl)
     VALUES
           (@UserId
           ,@Handle
		   ,@UserId
		   ,@UserId
		   ,@AvatarUrl)
END  
