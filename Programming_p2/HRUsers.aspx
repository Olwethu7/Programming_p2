<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HRUsers.aspx.cs" Inherits="YourNamespace.HRUsers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>HR User Management</title>
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

        .header h2 {
            margin: 0;
        }

        /* Main container */
        .container {
            margin-left: 0; /* Remove margin to align left */
            padding: 20px;
            padding-top: 100px; /* Adjusted for header height */
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-size: 16px;
            color: #34495e;
        }

        .form-group input {
            width: 98%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-bottom: 10px;
        }

        /* Button styles */
        .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #2c3e50;
            color: white;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #1abc9c;
        }

        .btn-add {
            background-color: #16a085;
        }

        /* GridView styling */
        .gridview-style {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
        }

        .gridview-style th, .gridview-style td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
        }

        .gridview-style th {
            background-color: #34495e;
            color: white;
        }

        .gridview-style tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview-style tr:hover {
            background-color: #f1f1f1;
        }

        /* Action button styles */
        .approve-button, .edit-button, .delete-button, .update-button {
            padding: 15px 7px;
            border: none;
            border-radius: 15px;
            color: white;
            cursor: pointer;
            margin-right: 5px;
            width:30%;
           
        }

        .approve-button {
            background-color: #28a745; /* Green for Approve */
        }

        .approve-button:hover {
            background-color: #218838;
        }

        .delete-button {
            background-color: #dc3545; /* Red for Delete */
        }

        .delete-button:hover {
            background-color: #c82333;
        }

        .edit-button {
            background-color: #ffc107; /* Yellow for Edit */
        }

        .edit-button:hover {
            background-color: #e0a800;
        }

        .update-button {
            background-color: #2ecc71; /* Light Green for Update */
        }

        .update-button:hover {
            background-color: #27ae60;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- Header section -->
        <div class="header">
            <h2>HR User Management</h2>
        </div>

        <!-- Main Content -->
        <div class="container">
            <!-- Add User Form -->
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-group"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-group"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtUserType">User Type:</label>
                <asp:TextBox ID="txtUserType" runat="server" CssClass="form-group"></asp:TextBox>
            </div>
            <asp:Button ID="btnAddUser" runat="server" Text="Add User" CssClass="btn btn-add" OnClick="btnAddUser_Click" OnClientClick="return confirmAction('Add');" />

            <!-- User GridView for Displaying, Editing, and Deleting Users -->
            <asp:GridView ID="GridViewUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserId" OnRowEditing="GridViewUsers_RowEditing" OnRowUpdating="GridViewUsers_RowUpdating" OnRowCancelingEdit="GridViewUsers_RowCancelingEdit" OnRowDeleting="GridViewUsers_RowDeleting" CssClass="gridview-style">
                <Columns>
                    <asp:BoundField DataField="UserId" HeaderText="User ID" ReadOnly="True" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="UserType" HeaderText="User Type" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <div style="display: flex; justify-content: space-between;">
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandName="Edit" CssClass="edit-button" OnClientClick="return confirmAction('Edit');" />
                                <asp:Button ID="btnUpdate" runat="server" Text="Update" CommandName="Update" CssClass="update-button" OnClientClick="return confirmAction('Update');" />
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandName="Delete" CssClass="delete-button" OnClientClick="return confirmAction('Delete');" />
                                
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>

    <script type="text/javascript">
        function confirmAction(action) {
            return confirm("Are you sure you want to " + action + " this user?");
        }
    </script>
</body>
</html>
