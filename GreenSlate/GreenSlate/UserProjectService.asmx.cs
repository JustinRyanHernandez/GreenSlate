using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;

namespace GreenSlate
{
    /// <summary>
    /// Summary description for UserProjectService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class UserProjectService1 : System.Web.Services.WebService
    {

        [WebMethod]
        public void GetProjects()
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            List<UserProject> userProjects = new List<UserProject>();
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("User_usp_Project_GET", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    UserProject userProject = new UserProject();
                    userProject.ProjectID = Convert.ToInt32(rdr["ProjectId"]);
                    userProject.StartDate = rdr["StartDate"].ToString();
                    userProject.TimeToStart = rdr["TimeToStart"].ToString();
                    userProject.EndDate = rdr["EndDate"].ToString();
                    userProject.Credits = Convert.ToInt32(rdr["Credits"]);
                    userProject.CurrentStatus = rdr["CurrentStatus"].ToString();
                    userProjects.Add(userProject);
                }
            }
            JavaScriptSerializer js = new JavaScriptSerializer();
            Context.Response.Write(js.Serialize(userProjects));
        }



        //    string cs = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        //    List<UserProject> userProjects = new List<UserProject>();
        //    using (SqlConnection con = new SqlConnection(cs))
        //    {
        //        SqlCommand cmd = new SqlCommand();
        //        cmd.Connection = con;
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        cmd.CommandText = "User_usp_Project_GET";
        //        if(userId != 1 || userId != 2 || userId != 3)
        //        {
        //            userId = 1;
        //        }
        //        cmd.Parameters.AddWithValue("@userid", userId);
        //        con.Open();
        //        SqlDataReader rdr = cmd.ExecuteReader();
        //        while (rdr.Read())
        //        {
        //            UserProject userProject = new UserProject();
        //            userProject.ProjectID = Convert.ToInt32(rdr["ProjectId"]);
        //            userProject.StartDate = rdr["StartDate"].ToString();
        //            userProject.TimeToStart = rdr["TimeToStart"].ToString();
        //            userProject.EndDate = rdr["EndDate"].ToString();
        //            userProject.Credits = Convert.ToInt32(rdr["Credits"]);
        //            userProject.CurrentStatus = rdr["CurrentStatus"].ToString();
        //            userProjects.Add(userProject);
        //        }
        //    }
        //    JavaScriptSerializer js = new JavaScriptSerializer();
        //    Context.Response.Write(js.Serialize(userProjects));
        //}
    }
}
