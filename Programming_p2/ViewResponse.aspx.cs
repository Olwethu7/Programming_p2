using System;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class ViewResponse : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if ClaimID is passed as a query parameter
                if (Request.QueryString["ClaimID"] != null)
                {
                    int claimId;
                    if (int.TryParse(Request.QueryString["ClaimID"], out claimId))
                    {
                        LoadClaimResponse(claimId);
                    }
                    else
                    {
                        // If ClaimID is invalid, show all claims
                        LoadAllClaims();
                    }
                }
                else
                {
                    // Load all claims if no ClaimID in query string
                    LoadAllClaims();
                }
            }
        }

        // Load specific claim based on ClaimID
        private void LoadClaimResponse(int claimId)
        {
            // Database connection string
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";


            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Query to select only the claim based on ClaimID
                string query = "SELECT ClaimID, LectureName, LectureID, Email, ModuleName, ClaimDate, Hours, Rate, TotalClaimed, Status FROM Claims WHERE ClaimID = @ClaimID";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ClaimID", claimId);
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    // Check if any record exists
                    if (dt.Rows.Count > 0)
                    {
                        gvResponses.DataSource = dt;
                        gvResponses.DataBind();
                    }
                    else
                    {
                        // Handle if no record found for the given ClaimID
                        gvResponses.EmptyDataText = "No record found for the specified Claim ID.";
                        gvResponses.DataBind();
                    }
                }
            }
        }

        // Load all claims if no specific ClaimID is provided
        private void LoadAllClaims()
        {
            // Database connection string
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";


            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Query to select all claims
                string query = "SELECT ClaimID, LectureName, LectureID, Email, ModuleName, ClaimDate, Hours, Rate, TotalClaimed, Status FROM Claims";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvResponses.DataSource = dt;
                gvResponses.DataBind();
            }
        }

        // Define status label class for visual indication
        protected string GetStatusClass(string status)
        {
            switch (status)
            {
                case "Approved":
                    return "status-approved";
                case "Declined":
                    return "status-declined";
                default:
                    return ""; // For Pending, no specific class is assigned
            }
        }
    }
}
