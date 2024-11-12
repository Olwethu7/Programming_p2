<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Part2_Prog.AboutUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us</title>
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

        .overlay {
            background-color: rgba(44, 62, 80, 0.8);
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding-top: -140px;
        }

        .about-text {
            text-align: center;
            max-width: 800px;
            padding: 20px;
        }

        .about-text h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #1abc9c;
        }

        .about-text p {
            font-size: 20px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

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
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="logo">About Us</div>
            <div class="nav-links">
                <a href="Welcome.aspx">Home</a>
                <a href="ContactUs.aspx">Contact Us</a>
                <span class="close-button" onclick="window.close();">
                    <i class="fas fa-times"></i> Close
                </span>
            </div>
        </div>

        <div class="overlay">
            <div class="about-text">
                <h1>About Us</h1>
                <p>Welcome to our Claim Management System! We are dedicated to providing an efficient platform for managing claims and enhancing communication between Lecturers, Managers, and the HR team.</p>
                <p>Our team comprises experienced professionals committed to streamlining the claim process, ensuring that all submissions are handled quickly and transparently.</p>
                <p>We believe in using technology to improve administrative efficiency and foster a collaborative environment for all stakeholders.</p>
            </div>
        </div>
    </form>
</body>
</html>
