<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="selectuser.aspx.cs" Inherits="Part2_Prog.SelectUser" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select User</title>
    <!-- Link to Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet" />
    <style>
        body, html {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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

        /* Main content styling with border */
        .main-content {
            margin: 210px auto 0 auto; /* Centers the content horizontally */
            padding: 40px 50px 40px 40px; /* Adds extra padding to the right */
            width: 80%;
            max-width: 600px;
            text-align: left; /* Aligns text to the left */
            border: 2px solid #2c3e50; /* Dashed border style */
            border-radius: 10px;
            background-color: #f4f4f4;
            position: relative; /* For absolute positioning of h2 */
        }

        .main-content h2 {
            color: #2c3e50;
            margin: 0;
            padding: 0 10px; /* Padding inside the border */
            position: absolute; /* Positions h2 in the corner */
            top: -15px; /* Adjusts placement to be inside the dashed line */
            left: 20px;
            background-color: #f4f4f4; /* Background to match the main content */
        }

        /* User selection buttons */
        .user-option {
            display: inline-block;
            width: 100%;
            padding: 15px;
            margin: 15px 0;
            background-color: #34495e;
            color: white;
            font-size: 18px;
            text-decoration: none;
            border-radius: 5px;
            border: 2px solid #2c3e50;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .user-option i {
            margin-right: 10px;
        }

        .user-option:hover {
            background-color: #1abc9c;
            border-color: #1abc9c;
        }
    </style>

    <script>
        function confirmRedirect(message, redirectUrl) {
            if (confirm(message)) {
                window.location.href = redirectUrl;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header -->
        <div class="header">
            <div class="logo">User Selection</div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <h2>Select Your User Type</h2>

            <asp:LinkButton ID="btnLecture" runat="server" CssClass="user-option" OnClientClick="confirmRedirect('You are logging in as a Lecturer!', 'LectureDashboard.aspx'); return false;">
                <i class="fas fa-chalkboard-teacher"></i> Lecture Dashboard
            </asp:LinkButton>

            <asp:LinkButton ID="btnManager" runat="server" CssClass="user-option" OnClientClick="confirmRedirect('You are logging in as a Manager!', 'ManagerDashboard.aspx'); return false;">
                <i class="fas fa-user-tie"></i> Manager Dashboard
            </asp:LinkButton>

            <asp:LinkButton ID="btnHR" runat="server" CssClass="user-option" OnClientClick="confirmRedirect('You are logging in as HR!', 'HRDashboard.aspx'); return false;">
                <i class="fas fa-users"></i> HR Dashboard
            </asp:LinkButton>
        </div>
    </form>
</body>
</html>
