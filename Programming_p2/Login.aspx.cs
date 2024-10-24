using System;
using System.Data;
using System.Data.SqlClient;

namespace Programming_p2
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Database connection string
            string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";

            // Define the SQL query using parameterized queries
            string query = "SELECT * FROM LoginTable WHERE Username = @Username AND Password = @Password AND UserType = @UserType";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                // Create SQL command with parameters
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    // Add parameters to avoid SQL injection
                    cmd.Parameters.AddWithValue("@Username", txtUser.Text);
                    cmd.Parameters.AddWithValue("@Password", txtPass.Text);
                    cmd.Parameters.AddWithValue("@UserType", drpUser.SelectedItem.ToString());

                    // Execute the query and fill the DataTable
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    // Check if the user exists
                    if (dt.Rows.Count > 0)
                    {
                        // Show success message
                        Response.Write("<script>alert('You are successfully logged in as " + dt.Rows[0]["UserType"] + "');</script>");

                        // Redirect based on user type
                        if (drpUser.SelectedIndex == 0) // Program Coordinator
                        {
                            Server.Transfer("ProgramCoordinatorDashboard.aspx");
                        }
                        else if (drpUser.SelectedIndex == 1) // Lecture
                        {
                            Server.Transfer("LectureDashboard.aspx");
                        }
                        else if (drpUser.SelectedIndex == 2) // Manager
                        {
                            Server.Transfer("ManagerDashboard.aspx");
                        }
                    }
                    else
                    {
                        // Display message for invalid credentials
                        Response.Write("<script>alert('Error in your input. Please check your username, password, or user type.');</script>");
                    }
                }
            }
        }
    }
}
