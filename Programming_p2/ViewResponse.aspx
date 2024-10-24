<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewResponse.aspx.cs" Inherits="Part2_Prog.ViewResponse" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Response</title>
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
        }

        h2 {
            color: #34495e;
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

        /* Status label styling */
        .status-approved {
            color: green;
            font-weight: bold;
        }

        .status-declined {
            color: red;
            font-weight: bold;
        }

        /* Center align status */
        .status-container {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <div class="logo">View Response</div>
    </div>

    <div class="main-content">
        <form id="form1" runat="server">
            <h2>Claims Responses</h2>
            <asp:GridView ID="gvResponses" runat="server" AutoGenerateColumns="False" CssClass="grid-view">
                <Columns>
                    <asp:BoundField DataField="ClaimID" HeaderText="ID" />
                    <asp:BoundField DataField="LectureName" HeaderText="Lecture Name" />
                    <asp:BoundField DataField="LectureID" HeaderText="Lecture ID" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="ModuleName" HeaderText="Module Name" />
                    <asp:BoundField DataField="ClaimDate" HeaderText="Claim Date" DataFormatString="{0:MM/dd/yyyy}" />
                    <asp:BoundField DataField="Hours" HeaderText="Hours" />
                    <asp:BoundField DataField="Rate" HeaderText="Rate" />
                    <asp:BoundField DataField="TotalClaimed" HeaderText="Total Claimed" />
                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <div class="status-container">
                                <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") == "Pending" ? "Pending" : Eval("Status") %>' CssClass='<%# GetStatusClass(Eval("Status").ToString()) %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>
