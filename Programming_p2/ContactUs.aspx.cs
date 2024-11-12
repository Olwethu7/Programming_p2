using System;
using System.Net.Mail;
using System.Web.UI;

namespace Part2_Prog
{
    public partial class ContactUs : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // This method is called when the page is loaded
            if (!IsPostBack)
            {
                // Code to execute only the first time the page is loaded
            }
        }

        protected void SubmitButton_Click(object sender, EventArgs e)
        {
            // Capture the data from the input fields
            string name = Request.Form["name"];
            string email = Request.Form["email"];
            string message = Request.Form["message"];

            // Validate the inputs (you can add more validation as needed)
            if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(email) || string.IsNullOrEmpty(message))
            {
                // Handle the error (e.g., show a message to the user)
                return;
            }

            try
            {
                // Send an email with the contact message
                MailMessage mail = new MailMessage();
                mail.From = new MailAddress(email);
                mail.To.Add("support@claimsmanagement.com"); // Change this to your actual support email
                mail.Subject = $"Contact Us Inquiry from {name}";
                mail.Body = message;
                mail.IsBodyHtml = false;

                SmtpClient smtp = new SmtpClient("smtp.your-email-provider.com"); // Replace with your SMTP server
                smtp.Port = 587; // Common SMTP port
                smtp.Credentials = new System.Net.NetworkCredential("your-email@example.com", "your-email-password"); // Replace with your email credentials
                smtp.EnableSsl = true;

                smtp.Send(mail);

                // Optionally, display a success message or redirect to a thank you page
            }
            catch (Exception ex)
            {
                // Handle any errors that may have occurred during email sending
            }
        }
    }
}
