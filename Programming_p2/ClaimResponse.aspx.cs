using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Part2_Prog
{
    public partial class ClaimResponse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClaimStatus();
            }
        }

        private void LoadClaimStatus()
        {
            string connString = ConfigurationManager.ConnectionStrings["Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True;Encrypt=True"].ConnectionString;
            string lectureID = Session["LectureID"].ToString(); // Assume LectureID is stored in Session

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string query = "SELECT TOP 1 Status FROM Claims WHERE LectureID = @LectureID ORDER BY ClaimID DESC";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@LectureID", lectureID);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    lblStatus.Text = "Your claim was " + reader["Status"].ToString();
                }
            }
        }
    }
}
