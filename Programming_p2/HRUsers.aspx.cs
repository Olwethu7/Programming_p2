using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class HRUsers : System.Web.UI.Page
    {
        // Connection string to your SQL database
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";

        // Page load method
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        // Load users method to fetch users from the database and bind to GridView
        private void LoadUsers()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId, Username, UserType FROM Users"; // Fixed query without Password
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewUsers.DataSource = dt; // Binding data to GridView
                GridViewUsers.DataBind();
            }
        }

        // Method to add a new user
        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                // Insert query without 'Password' column
                string query = "INSERT INTO Users (Username, UserType) VALUES (@Username, @UserType)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text); // Get username from the textbox
                cmd.Parameters.AddWithValue("@UserType", txtUserType.Text); // Get user type from the textbox

                conn.Open();
                cmd.ExecuteNonQuery(); // Execute the query to insert the user
                conn.Close();
            }

            ClearFields(); // Clear input fields
            LoadUsers(); // Reload users in the GridView
        }

        // Method to clear input fields after adding a user
        private void ClearFields()
        {
            txtUsername.Text = "";
            txtUserType.Text = "";
        }

        // Method to edit user information
        protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUsers.EditIndex = e.NewEditIndex; // Set the row in edit mode
            LoadUsers();
        }

        // Method to update user information in the database
        protected void GridViewUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userId = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value); // Get UserId from the GridView
            TextBox txtUsername = (TextBox)GridViewUsers.Rows[e.RowIndex].Cells[1].Controls[0]; // Get username from GridView
            TextBox txtUserType = (TextBox)GridViewUsers.Rows[e.RowIndex].Cells[2].Controls[0]; // Get user type from GridView

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Users SET Username = @Username, UserType = @UserType WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@UserType", txtUserType.Text);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                cmd.ExecuteNonQuery(); // Execute the update query
                conn.Close();
            }

            GridViewUsers.EditIndex = -1; // Exit edit mode

            LoadUsers(); // Reload users after update
        }

        // Method to cancel editing in the GridView
        protected void GridViewUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUsers.EditIndex = -1;
            LoadUsers();
        }

        // Method to delete a user from the database
        protected void GridViewUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value); // Get UserId from the GridView

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Users WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                cmd.ExecuteNonQuery(); // Execute delete query
                conn.Close();
            }

            LoadUsers(); // Reload users after delete
        }
    }
}
