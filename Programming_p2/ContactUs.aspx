<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Part2_Prog.ContactUs" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact Us</title>
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
            padding-top: 20px;
        }

        .contact-text {
            text-align: center;
            max-width: 800px;
            padding: 20px;
        }

        .contact-text h1 {
            font-size: 48px;
            margin-bottom: 20px;
            color: #1abc9c;
        }

        .contact-text p {
            font-size: 20px;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .contact-form {
            display: flex;
            flex-direction: column;
            max-width: 600px;
            margin: 0 auto;
            gap: 15px;
        }

        .contact-form input, .contact-form textarea {
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .contact-form input {
            height: 40px;
        }

        .contact-form textarea {
            height: 100px;
        }

        .submit-button {
            background-color: #1abc9c;
            color: white;
            font-size: 18px;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .submit-button:hover {
            background-color: #16a085;
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
            <div class="logo">Contact Us</div>
            <div class="nav-links">
                <a href="Welcome.aspx">Home</a>
                <a href="AboutUs.aspx">About Us</a>
                <span class="close-button" onclick="window.close();">
                    <i class="fas fa-times"></i> Close
                </span>
            </div>
        </div>

        <div class="overlay">
            <div class="contact-text">
                <h1>Contact Us</h1>
                <p>If you have any questions, feedback, or need assistance, please don't hesitate to reach out to us!</p>
                <p>You can contact us through the following methods:</p>
                <ul>
                    <li>Email: cweleolwethu6@gmail.com</li>
                    <li>Phone: +27 69 592 2556</li>
                </ul>
                <p>Or fill out the form below:</p>
                <div class="contact-form">
                    <input type="text" placeholder="Your Name" required />
                    <input type="email" placeholder="Your Email" required />
                    <textarea placeholder="Your Message" required></textarea>
                    <button type="submit" class="submit-button">Send Message</button>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
