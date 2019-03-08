CREATE PROCEDURE [dbo].[User_usp_Project_GET] 
	-- Add the parameters for the stored procedure here
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	-- exec User_usp_Project_GET @userid = 1
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT
		UP.ProjectID,
		P.StartDate,
		DATEDIFF(d, UP.AssignedDate, P.StartDate) AS TimeToStart,
		P.EndDate,
		P.Credits,
		CASE WHEN UP.IsActive = 0 THEN 'Inactive' ELSE 'Active' END AS CurrentStatus
		FROM Users U
		INNER JOIN UserProject UP ON UP.UserId = U.Id
		INNER JOIN Project P ON P.Id = UP.ProjectId
		WHERE U.Id = @UserId
		
END

