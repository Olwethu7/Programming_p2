<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRDashboard.aspx.cs" Inherits="Part2_Prog.ProgramCoordinatorDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Program Coordinator Dashboard</title>
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
        }

        .header .logo {
            float: left;
            font-size: 24px;
            margin: 0;
        }

        .header .logout {
            float: right;
            color: white;
            text-decoration: none;
            font-size: 16px;
            margin-top: 5px;
        }

        /* Sidebar styling */
        .sidebar {
            width: 250px;
            background-color: #34495e;
            position: fixed;
            height: 100%;
            top: 60px;
            padding-top: 30px;
            color: white;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 15px 20px;
            text-decoration: none;
            font-size: 16px;
        }

        .sidebar a:hover {
            background-color: #1abc9c;
        }

        /* Main content */
        .main-content {
            margin-left: 250px;
            padding: 20px;
            padding-top: 100px; /* Adjusted for header height */
        }

        /* Cards for dashboard stats */
        .card {
            background-color: white;
            padding: 20px;
            margin-bottom: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin: 0;
        }

        .description {
            margin-top: 10px;
            font-size: 16px;
            line-height: 1.5;
            color: #34495e; /* Darker color for better readability */
        }

        .button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #2c3e50;
            color: white;
            cursor: pointer;
            margin-top: 20px;
        }

        .button:hover {
            background-color: #1abc9c;
        }
    </style>
</head>
<body>
    <!-- Header -->
    <div class="header">
        <div class="logo">
            HR Dashboard
        </div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="HRDashboard.aspx">Dashboard Overview</a>
        <a href="Welcome.aspx" class="logout">Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Welcome, HR</h2>
        <div class="card">
            <p class="description">
               As an HR Manager, you play a vital role in fostering a positive workplace culture and 
                supporting the well-being of every team member. This dashboard empowers you to efficiently 
                manage employee records, oversee recruitment processes, and facilitate smooth communication
                across departments. With quick access to essential tools, you can monitor new applications,
                track employee performance, and ensure compliance with company policies. Your leadership and dedication are key to creating a thriving work environment, 
                enabling you to proactively address challenges and enhance the overall employee experience.
            </p>
        </div>

        <!-- Action Button -->
        <div>
            <button class="button" onclick="location.href='HRUsers.aspx'">Manage Users</button>
        </div>
    </div>
</body>
</html>
