using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace YourNamespace
{
    public partial class HRUsers : System.Web.UI.Page
    {
        string connectionString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "SELECT UserId, Username, UserType FROM Users";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                GridViewUsers.DataSource = dt; // Correct GridView control reference
                GridViewUsers.DataBind();
            }
        }

        protected void btnAddUser_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Users (Username, Password, UserType) VALUES (@Username, @Password, @UserType)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text); // Correct TextBox control reference
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // Correct TextBox control reference
                cmd.Parameters.AddWithValue("@UserType", txtUserType.Text); // Correct TextBox control reference

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            ClearFields();
            LoadUsers();
        }

        private void ClearFields()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtUserType.Text = "";
        }

        protected void GridViewUsers_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewUsers.EditIndex = e.NewEditIndex; // Correct GridView control reference
            LoadUsers();
        }

        protected void GridViewUsers_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int userId = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value); // Correct GridView control reference
            TextBox txtUsername = (TextBox)GridViewUsers.Rows[e.RowIndex].Cells[1].Controls[0]; // Correct GridView control reference
            TextBox txtUserType = (TextBox)GridViewUsers.Rows[e.RowIndex].Cells[2].Controls[0]; // Correct GridView control reference

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "UPDATE Users SET Username = @Username, UserType = @UserType WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                cmd.Parameters.AddWithValue("@UserType", txtUserType.Text);
                cmd.Parameters.AddWithValue("@UserId", userId);
                
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            GridViewUsers.EditIndex = -1;

            LoadUsers();
        }

        protected void GridViewUsers_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridViewUsers.EditIndex = -1;
            LoadUsers();
        }

        protected void GridViewUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = Convert.ToInt32(GridViewUsers.DataKeys[e.RowIndex].Value); // Correct GridView control reference

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Users WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@UserId", userId);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            LoadUsers();
        }
    }
}
