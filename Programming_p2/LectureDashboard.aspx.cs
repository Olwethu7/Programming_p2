using System;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class Lecturedashboard : Page
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
            int totalClasses = GetTotalClasses();
            int totalStudents = GetTotalStudents();
            int pendingClaims = GetPendingClaims();

            // You can assign these values to labels or any UI element in your ASP.NET page as needed.
        }

        private int GetTotalClasses()
        {
            // Replace this with actual logic to fetch the total number of classes
            return 5; // Example value
        }

        private int GetTotalStudents()
        {
            // Replace this with actual logic to fetch the total number of students
            return 120; // Example value
        }

        private int GetPendingClaims()
        {
            // Replace this with actual logic to fetch the total number of pending claims
            return 10; // Example value
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
