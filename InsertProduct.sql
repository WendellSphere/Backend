USE [DB]
GO
/****** Object:  StoredProcedure [dbo].[Product_Insert_V3] ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Product_Insert_V3] 
			@Title nvarchar(50)
		   , @Description nvarchar(500) = null
           , @BasePrice decimal(18, 4)
           , @CreatedBy nvarchar(128)
           , @CreatedDate datetime = null  
		  
           , @ModifiedDate datetime = null
		   , @ProductType int = 1
		   , @MainImage nvarchar(255) = null
		   , @SecondaryImage nvarchar(255) = null
		   , @Video nvarchar(255) = null
		   , @Id int OUTPUT 


As
/*------Test Code--------------

	DECLARE @Id int = 0;

			DECLARE @Title nvarchar(50) = 'Japanese pants'
		   , @Description nvarchar(100) = 'Organicnically made and bless by Shinto temples'
		   , @BasePrice decimal(18, 4) = 50
           , @CreatedBy nvarchar(128) = 'Marciluis'
           , @CreatedDate datetime = GETUTCDATE()
           , @ModifiedDate datetime = GETUTCDATE()
		   , @ProductType int = 1
		   , @MainImage nvarchar(255) = 'https://scbeautyhigh.files.wordpress.com/2015/04/lashextensions.jpg?w=662&h=529'
		   , @SecondaryImage nvarchar(255) = 'https://s-media-cache-ak0.pinimg.com/originals/dc/b5/6d/dcb56d48ed48c0d6f5032d478a20cda1.jpg'
		   , @Video nvarchar(255) = 'https://www.youtube.com/watch?v=4GuqJadv4r0';

	Execute Product_Insert_V3 @Title
           , @Description
           , @BasePrice
           , @CreatedBy
           , @CreatedDate
         
           , @ModifiedDate
		   , @ProductType
		   , @MainImage
		   , @SecondaryImage
		   , @Video
		   , @Id Output

		 
		SELECT *
		FROM dbo.Product
		WHERE Id = @Id
*/
Begin

	--Declare @ModifiedBy nvarchar(128) = @CreatedBy
	Declare @ModifiedBy nvarchar(128) = @CreatedBy

	IF @CreatedDate IS null
	BEGIN
		SET @CreatedDate = GETUTCDATE()
	END

	SET @ModifiedDate = COALESCE(@ModifiedDate, GETUTCDATE())

	INSERT INTO [dbo].[Product]
			   ([Title]
			   , [Description]
			   , [BasePrice]
			   , [CreatedBy]
			   , [CreatedDate]
			   , [ModifiedBy]
			   , [ModifiedDate]
			   , ProductType
			   , MainImage
			   , SecondaryImage
			   , Video)
     VALUES
			   (@Title
			   , @Description
			   , @BasePrice
			   , @CreatedBy
			   , @CreatedDate
			   , @ModifiedBy
			   , @ModifiedDate
			   , @ProductType
			   , @MainImage
			   , @SecondaryImage
			   , @Video)

	SET @Id = SCOPE_IDENTITY()
End

