using System;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class AboutUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This method is called when the page is loaded
            // You can add any code here that needs to run on page load
            if (!IsPostBack)
            {
                // Code to execute only the first time the page is loaded
            }
        }
    }
}
