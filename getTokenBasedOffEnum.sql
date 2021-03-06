USE [DB]
GO
/****** Object:  StoredProcedure [dbo].[AccountSettings_GetSettingValueByHandle]    Script Date: 6/8/2017 2:34:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*Test

Declare @UserId nvarchar(128) = 'f51de1df-52c9-4a7c-b4be-1efb9970c91c',
		@SettingId int = 1

		Declare @Handle nvarchar(128) = 'tree2'
Exec AccountSettings_GetSettingValueByHandle
@Handle

*/

ALTER PROCEDURE [dbo].[AccountSettings_GetSettingValueByHandle] 
	@Handle nvarchar(40)
	, @SettingID  int = 6
	AS
Begin
SELECT 
	  
      S.[Value]
     
  FROM [dbo].[AccountSettings] As S
  Inner Join Accounts As A On A.UserId = S.UserId
  Where A.Handle Like @Handle AND S.SettingId Like @SettingID
End


