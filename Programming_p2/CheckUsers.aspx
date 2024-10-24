<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CheckUsers.aspx.cs" Inherits="YourNamespace.CheckUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Check Users</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Container styles */
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* Heading styles */
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #007BFF; /* Bootstrap primary color */
        }

        /* GridView styles */
        .user-grid {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .user-grid th, .user-grid td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .user-grid th {
            background-color: #007BFF; /* Header background color */
            color: white;
        }

        /* Hover effects */
        .user-grid tr:hover {
            background-color: #f1f1f1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Users List</h2>
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvUsers_RowDataBound" CssClass="user-grid">
                <Columns>
                    <asp:BoundField DataField="UserName" HeaderText="User Name" />
                    <asp:BoundField DataField="UserRole" HeaderText="User Role" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Role" HeaderText="Role" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
