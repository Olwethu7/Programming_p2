<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LectureForm.aspx.cs" Inherits="Part2_Prog.LectureForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Submit New Claim</title>
    <style>
        body, html {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }

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

        .container {
            width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            background-color: white;
            border-radius: 10px;
            margin-top: 60px; /* Adjusted for header height */
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .input-group {
            margin-bottom: 15px;
        }

        .input-group label {
            display: block;
            font-weight: bold;
        }

        .input-group input, 
        .input-group select {
            width: 100%;
            padding: 5px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .input-group input[type="file"] {
            padding: 0;
        }

        .submit-button {
            text-align: center;
        }

        .submit-button input {
            width: 100%;
            padding: 10px;
            background-color: #2b3d70;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }

        .submit-button input:hover {
            background-color: #1d2a51;
        }

        .copyright {
            text-align: center;
            margin-top: 10px;
            font-size: 12px;
            color: #888;
        }
    </style>
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <div class="logo">Submit New Claim</div>
            <a href="Login.aspx" class="logout">Log Out</a>
        </div>

        <div class="container">
            <h2>Fill The Following</h2>

            <div class="input-group">
                <label for="txtLectureName">Lecture Name:</label>
                <asp:TextBox ID="txtLectureName" runat="server" />
            </div>

            <div class="input-group">
                <label for="txtLectureID">Lecture ID no.:</label>
                <asp:TextBox ID="txtLectureID" runat="server" />
            </div>

            <div class="input-group">
                <label for="txtEmail">E-mail:</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
            </div>

            <div class="input-group">
                <label for="txtCellNo">Cell no.:</label>
                <asp:TextBox ID="txtCellNo" runat="server" />
            </div>

            <div class="input-group">
                <label for="txtModuleName">Module Name:</label>
                <asp:TextBox ID="txtModuleName" runat="server" />
            </div>

            <div class="input-group">
                <label for="txtClaimDate">Claim Date:</label>
                <asp:TextBox ID="txtClaimDate" runat="server" />
                <asp:Calendar ID="calClaimDate" runat="server" />
            </div>

            <div class="input-group">
                <asp:Label ID="lblErrorMessage" runat="server" ForeColor="Red" Visible="false"></asp:Label>
            </div>

            <div class="input-group">
                <label for="txtHours">Hours:</label>
                <asp:TextBox ID="txtHours" runat="server" />
            </div>

            <div class="input-group">
                <label for="fileDocuments">Add Documents:</label>
                <asp:FileUpload ID="fileDocuments" runat="server" />
            </div>

            <div class="input-group">
                <label for="txtRate">Rate:</label>
                <asp:TextBox ID="txtRate" runat="server" />
            </div>

            <div class="input-group">
                <label for="txtTotalClaimed">Total Claimed:</label>
                <asp:TextBox ID="txtTotalClaimed" runat="server" />
            </div>

            <div class="submit-button">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Claim" OnClick="btnSubmit_Click" />
            </div>
        </div>

        <div class="copyright">
            Copyright © 2024. All Right Reserved By Prog6112
        </div>
    </form>
</body>
</html>
