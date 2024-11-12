using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class LectureForm : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Database connection string
            string connString = "Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=ClaimApp;Integrated Security=True";

            // Get the file name
            string fileName = Path.GetFileName(fileDocuments.PostedFile.FileName);
            // Define the folder path for document storage
            string folderPath = Server.MapPath("~/Documents/");

            // Check if the directory exists; if not, create it
            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            // Combine the folder path and file name
            string filePath = Path.Combine(folderPath, fileName);

            // Save the file to the folder
            try
            {
                fileDocuments.SaveAs(filePath);
            }
            catch (Exception ex)
            {
                lblErrorMessage.Text = "Error saving file: " + ex.Message;
                lblErrorMessage.Visible = true;
                return;  // Exit if there's a file save error
            }

            // Declare a DateTime variable for the claim date
            DateTime claimDate;

            // Validate the claim date input
            bool isValidDate = DateTime.TryParse(txtClaimDate.Text, out claimDate);
            if (!isValidDate)
            {
                lblErrorMessage.Text = "Please enter a valid date in the format (MM/DD/YYYY)";
                lblErrorMessage.Visible = true;
                return; // Exit if the date is invalid
            }

            // SQL insert query for inserting claim details
            string query = "INSERT INTO Claims (LectureName, LectureID, Email, CellNo, ModuleName, ClaimDate, Hours, Rate, TotalClaimed, AttachFilePath) " +
                           "VALUES (@LectureName, @LectureID, @Email, @CellNo, @ModuleName, @ClaimDate, @Hours, @Rate, @TotalClaimed, @AttachFilePath)";

            // Use SqlConnection to connect to the database
            using (SqlConnection conn = new SqlConnection(connString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);

                // Add parameters to prevent SQL injection
                cmd.Parameters.AddWithValue("@LectureName", txtLectureName.Text);
                cmd.Parameters.AddWithValue("@LectureID", txtLectureID.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@CellNo", txtCellNo.Text);
                cmd.Parameters.AddWithValue("@ModuleName", txtModuleName.Text);
                cmd.Parameters.AddWithValue("@ClaimDate", claimDate); // Use the validated DateTime object
                cmd.Parameters.AddWithValue("@Hours", Convert.ToInt32(txtHours.Text));
                cmd.Parameters.AddWithValue("@Rate", Convert.ToDecimal(txtRate.Text));
                cmd.Parameters.AddWithValue("@TotalClaimed", Convert.ToDecimal(txtTotalClaimed.Text));
                cmd.Parameters.AddWithValue("@AttachFilePath", filePath);
                
                try
                {
                    // Open the connection and execute the insert command
                    conn.Open();
                    cmd.ExecuteNonQuery();

                    // Clear the input fields after successful submission
                    ClearInputFields();

                    // Call JavaScript function to show success message
                    ScriptManager.RegisterStartupScript(this, GetType(), "showalert", "showAlert('Claim submitted successfully!');", true);
                }
                catch (Exception ex)
                {
                    lblErrorMessage.Text = "Error: " + ex.Message;
                    lblErrorMessage.Visible = true;
                }
            }
        }

        // Method to clear input fields
        private void ClearInputFields()
        {
            txtLectureName.Text = string.Empty;
            txtLectureID.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtCellNo.Text = string.Empty;
            txtModuleName.Text = string.Empty;
            txtClaimDate.Text = string.Empty;
            txtHours.Text = string.Empty;
            txtRate.Text = string.Empty;
            txtTotalClaimed.Text = string.Empty;
            fileDocuments.Attributes.Clear(); // Reset file upload
        }
    }
}
