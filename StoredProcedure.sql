USE [GreenSlate]
GO
/****** Object:  StoredProcedure [dbo].[User_usp_Project_GET]    Script Date: 3/6/2019 2:41:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[User_usp_Project_GET] 
	-- Add the parameters for the stored procedure here
	--@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		UP.ProjectID,
		P.StartDate,
		CASE WHEN DATEDIFF(d, UP.AssignedDate, P.StartDate) < 0 THEN 'Started' ELSE CONVERT(VARCHAR(50),DATEDIFF(d, UP.AssignedDate, P.StartDate)) END AS TimeToStart,
		P.EndDate,
		P.Credits,
		CASE WHEN UP.IsActive = 0 THEN 'Inactive' ELSE 'Active' END AS CurrentStatus
		FROM Users U
		INNER JOIN UserProject UP ON UP.UserId = U.Id
		INNER JOIN Project P ON P.Id = UP.ProjectId
		WHERE U.Id = 1
		
END

