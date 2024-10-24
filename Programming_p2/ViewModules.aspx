<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageModules.aspx.cs" Inherits="Part2_Prog.ManageModules" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Modules</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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

        /* Main content */
        .main-content {
            margin-top: 60px; /* Adjusted for header height */
            padding: 20px;
            max-width: 800px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            color: #34495e;
            text-align: center;
        }

        /* GridView styling */
        .grid-view {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            overflow: hidden; /* To contain child elements */
        }

        .grid-view th, .grid-view td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .grid-view th {
            background-color: #2c3e50;
            color: white;
        }

        .grid-view tr:hover {
            background-color: #f1f1f1;
        }

        .add-module-container {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }

        .add-module-container input {
            margin-right: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 70%;
        }

        .add-module-container button {
            padding: 8px 16px;
            background-color: #28a745; /* Green for Add Module */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .add-module-container button:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .grid-view .remove-button {
            background-color: #dc3545; /* Red for Remove button */
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .grid-view .remove-button:hover {
            background-color: #c82333; /* Darker red on hover */
        }

        /* Modal styles */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; 
            z-index: 1; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
            max-width: 500px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">Manage Modules</div>
    </div>

    <div class="main-content">
        <form id="form1" runat="server">
            <h2>Manage Your Modules</h2>
            <div class="add-module-container">
                <asp:TextBox ID="txtModuleName" runat="server" Placeholder="Enter Module Name"></asp:TextBox>
                <asp:Button ID="btnAddModule" runat="server" Text="Add Module" OnClick="btnAddModule_Click" />
            </div>
            <asp:GridView ID="gvModules" runat="server" AutoGenerateColumns="False" CssClass="grid-view" OnRowCommand="gvModules_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ModuleID" HeaderText="Module ID" />
                    <asp:BoundField DataField="ModuleName" HeaderText="Module Name" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ModuleID") %>' CssClass="remove-button" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
    </div>

    <!-- Modal -->
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="document.getElementById('myModal').style.display='none'">&times;</span>
            <p id="modalMessage"></p>
        </div>
    </div>

    <script>
        function showModal(message) {
            document.getElementById('modalMessage').innerText = message;
            document.getElementById('myModal').style.display = 'block';
        }

        window.onclick = function (event) {
            if (event.target === document.getElementById('myModal')) {
                document.getElementById('myModal').style.display = "none";
            }
        }
    </script>
</body>
</html>
