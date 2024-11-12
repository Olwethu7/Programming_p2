<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="Part2_Prog.Welcome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome</title>
    <!-- Link to Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <style>
        body, html {
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            height: 100%;
            color: white;
        }

        /* Overlay for readability */
        .overlay {
            background-color: rgba(44, 62, 80, 0.8);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            padding: 120px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding-top: 20px; /* Add padding to move content down a bit */
        }

        /* Welcome text styling */
        .welcome-text {
            text-align: center;
            max-width: 800px;
            padding: 20px;
        }

        .welcome-text h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #1abc9c;
        }

        .welcome-text p {
            font-size: 20px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        /* Centered "Get Started!" button */
        .welcome-button {
            background-color: #1abc9c;
            color: white;
            font-size: 18px;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
            display: inline-block;
            text-align: center;
        }

        .welcome-button:hover {
            background-color: #16a085;
        }

        /* Header styling */
        .header {
            background-color: #2c3e50;
            color: white;
            padding: 15px 20px;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .header .logo {
            font-size: 24px;
            flex-shrink: 0;
        }

        .header .nav-links {
            display: flex;
            gap: 10px;
            margin-left: 20px;
        }

        .header .nav-links a, .header .close-button {
            color: white;
            text-decoration: none;
            font-size: 16px;
            cursor: pointer;
            flex-shrink: 0;
        }

        .header .close-button {
            font-size: 18px;
            margin-right: 50px;
        }
    </style>
    <script>
        function confirmClose() {
            var confirmation = confirm("Are you sure you want to close the window?");
            if (confirmation) {
                window.close();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <div class="logo">Welcome</div>
            <div class="nav-links">
                <a href="AboutUs.aspx">About Us</a>
                <a href="ContactUs.aspx">Contact Us</a>
                <span class="close-button" onclick="confirmClose();">
                    <i class="fas fa-times"></i> Close
                </span>
            </div>
        </div>

        <!-- Overlay for text on background image -->
        <div class="overlay">
            <div class="welcome-text">
                <h1>Welcome to the Claim Management System</h1>
                <p>Whether you're a Lecturer, Manager, or part of the HR team, this platform is designed to streamline the submission, review, and approval of your claims. 
                   Our goal is to make your workflow easier and more efficient.</p>
                <p>As a Lecturer, you can submit claims for review; as a Manager, you oversee and approve them; and as an HR team member, you can manage user information effectively.</p>
                <asp:Button ID="btnGetStarted" runat="server" Text="Get Started!" CssClass="welcome-button" OnClick="btnGetStarted_Click" />
            </div>
        </div>
    </form>
</body>
</html>
