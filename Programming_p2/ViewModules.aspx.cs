using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Part2_Prog
{
    public partial class ManageModules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        private void BindGrid()
        {
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT [ModuleID], [ModuleName] FROM [Modules] WHERE LecturerID = @LecturerID"; // Use current lecturer's ID
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                da.SelectCommand.Parameters.AddWithValue("@LecturerID", 1); // Replace with actual lecturer ID
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvModules.DataSource = dt;
                gvModules.DataBind();
            }
        }

        protected void btnAddModule_Click(object sender, EventArgs e)
        {
            string moduleName = txtModuleName.Text.Trim();
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "INSERT INTO Modules (ModuleName, LecturerID) VALUES (@ModuleName, @LecturerID)";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ModuleName", moduleName);
                cmd.Parameters.AddWithValue("@LecturerID", 1); // Replace with actual lecturer ID
                conn.Open();
                cmd.ExecuteNonQuery();
            }
            ClientScript.RegisterStartupScript(this.GetType(), "showModal", "showModal('Module added successfully!');", true);
            BindGrid();
        }

        protected void gvModules_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";
            int moduleId = Convert.ToInt32(e.CommandArgument);

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                if (e.CommandName == "Remove")
                {
                    cmd.CommandText = "DELETE FROM Modules WHERE ModuleID = @ModuleID";
                    cmd.Parameters.AddWithValue("@ModuleID", moduleId);
                    cmd.Connection = conn;
                    cmd.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "showModal", "showModal('Module removed successfully!');", true);
                }
            }
            BindGrid();
        }
    }
}
