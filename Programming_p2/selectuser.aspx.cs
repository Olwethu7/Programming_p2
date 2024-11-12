using System;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class SelectUser : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Any initialization logic can go here
        }

        protected void btnLecture_Click(object sender, EventArgs e)
        {
            // Redirect to Lecture Dashboard
            Response.Redirect("LectureDashboard.aspx");
        }

        protected void btnManager_Click(object sender, EventArgs e)
        {
            // Redirect to Manager Dashboard
            Response.Redirect("ManagerDashboard.aspx");
        }

        protected void btnHR_Click(object sender, EventArgs e)
        {
            // Redirect to HR Dashboard
            Response.Redirect("HRDashboard.aspx");
        }
    }
}
