using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace GreenSlate
{
    public class UserProject
    {
       public int ProjectID { get; set; }
       public int Credits { get; set; }
       public string CurrentStatus { get; set; }
       public string TimeToStart { get; set; }
       public string EndDate { get; set; }
       public string StartDate { get; set; }

    }
}