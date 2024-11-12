using System;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class Welcome : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialization logic if needed
        }

        protected void btnGetStarted_Click(object sender, EventArgs e)
        {
            // Redirect to SelectUser.aspx
            Response.Redirect("SelectUser.aspx");
        }
    }
}
