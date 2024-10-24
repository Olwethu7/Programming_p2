using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Part2_Prog
{
    public partial class ProViewClaim : System.Web.UI.Page
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
                string query = "SELECT [ClaimID], [LectureName], [LectureID], [Email], [ModuleName], [ClaimDate], [Hours], [Rate], [TotalClaimed], [Status] FROM [dbo].[Claims]";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvClaims.DataSource = dt;
                gvClaims.DataBind();

                // Check if there are no claims
                if (dt.Rows.Count == 0)
                {
                    lblNoClaims.Text = "There are no available claims.";
                    lblNoClaims.Visible = true;
                }
                else
                {
                    lblNoClaims.Visible = false; // Hide the no claims message if there are claims
                }
            }
        }

        protected void gvClaims_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";
            int claimId = Convert.ToInt32(e.CommandArgument);
            string actionMessage = string.Empty;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                if (e.CommandName == "Approve")
                {
                    cmd.CommandText = "UPDATE Claims SET Status = 'Approved' WHERE ClaimID = @ClaimID"; // Update status to Approved
                    cmd.Parameters.AddWithValue("@ClaimID", claimId);
                    cmd.ExecuteNonQuery();
                    actionMessage = "Claim approved successfully.";
                }
                else if (e.CommandName == "Decline")
                {
                    cmd.CommandText = "UPDATE Claims SET Status = 'Declined' WHERE ClaimID = @ClaimID"; // Update status to Declined
                    cmd.Parameters.AddWithValue("@ClaimID", claimId);
                    cmd.ExecuteNonQuery();
                    actionMessage = "Claim declined successfully.";
                }
                else if (e.CommandName == "Remove")
                {
                    // Check the status of the claim before removing
                    cmd.CommandText = "SELECT Status FROM Claims WHERE ClaimID = @ClaimID";
                    cmd.Parameters.AddWithValue("@ClaimID", claimId);
                    string status = cmd.ExecuteScalar() as string;

                    // Deny deletion if no action has been taken
                    if (status == "Pending") // Assuming "Pending" is the initial state
                    {
                        actionMessage = "You cannot delete this claim until it has been approved or declined.";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + actionMessage + "');", true);
                        return; // Exit the method early
                    }

                    // Allow removal only if the status is Approved or Declined
                    if (status == "Approved" || status == "Declined")
                    {
                        // Proceed to remove the record
                        cmd.CommandText = "DELETE FROM Claims WHERE ClaimID = @ClaimID";
                        cmd.ExecuteNonQuery();
                        actionMessage = "Successfully removed the record; deleted permanently from the database.";
                    }
                    else
                    {
                        // Use JavaScript to alert the message
                        actionMessage = "Respond to the claim first!";
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + actionMessage + "');", true);
                        return; // Exit the method early
                    }
                }
            }

            // Display action message as a web alert
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + actionMessage + "');", true);
            BindGrid(); // Refresh the grid after any action
        }
    }
}
