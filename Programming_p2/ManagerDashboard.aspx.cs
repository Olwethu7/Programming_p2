using System;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class ManagerDashboard : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Load data when the page loads
            if (!IsPostBack)
            {
                LoadDashboardData();
            }
        }

        private void LoadDashboardData()
        {
            // In a real application, you would fetch data from your database
            // For demonstration purposes, we'll use hardcoded values

            // Example of setting dashboard stats
            int totalUsers = GetTotalUsers();
            int totalClaims = GetTotalClaims();
            int totalAppeals = GetTotalAppeals();

            // You can assign these values to labels or any UI element in your ASP.NET page as needed.
        }

        private int GetTotalUsers()
        {
            // Replace this with actual logic to fetch the total number of users
            return 25; // Example value
        }

        private int GetTotalClaims()
        {
            // Replace this with actual logic to fetch the total number of claims
            return 30; // Example value
        }

        private int GetTotalAppeals()
        {
            // Replace this with actual logic to fetch the total number of appeals
            return 5; // Example value
        }

        // Logout method
        protected void Logout_Click(object sender, EventArgs e)
        {
            // Clear session and redirect to login page
            Session.Clear(); // Clear all session variables
            Session.Abandon(); // End the session
            Response.Redirect("Login.aspx"); // Redirect to login page
        }
    }
}
