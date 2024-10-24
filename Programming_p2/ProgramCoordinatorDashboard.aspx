<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgramCoordinatorDashboard.aspx.cs" Inherits="Part2_Prog.ProgramCoordinatorDashboard" %>

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
            Program Coordinator Dashboard
        </div>
    </div>

    <!-- Sidebar -->
    <div class="sidebar">
        <a href="ProgramCoordinatorDashboard.aspx">Dashboard Overview</a>
        <a href="Login.aspx" class="logout">Log Out</a>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h2>Welcome, Program Coordinator</h2>
        <div class="card">
            <p class="description">
               As a Program Coordinator, you play a crucial role in overseeing the academic programs and
                ensuring their smooth operation. This dashboard empowers you to efficiently manage user accounts,
                respond to appeals, and facilitate communication between lecturers and students. With quick access
                to essential tools, you can monitor new claims, track user activities, and maintain a well-organized
                system that supports both faculty and student needs. Your leadership and coordination are vital in
                fostering an effective learning environment, enabling you to address challenges proactively and
                enhance the educational experience for all involved
            </p>
        </div>

        <!-- Action Button -->
        <div>
            <button class="button" onclick="location.href='ProViewClaim.aspx'">View New Claims</button>
        </div>
    </div>
</body>
</html>
