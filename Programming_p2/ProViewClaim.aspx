<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProViewClaim.aspx.cs" Inherits="Part2_Prog.ProViewClaim" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Program Coordinator - View Claims</title>
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

        .main-content {
            margin-top: 60px; /* Adjusted for header height */
            padding: 20px;
        }

        h2 {
            color: #34495e;
        }

        .grid-view {
            background-color: white;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
            overflow: hidden;
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

        .approve-button, .remove-button, .decline-button {
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            margin-right: 5px;
        }

        .approve-button {
            background-color: #28a745; /* Green for Approve */
        }

        .approve-button:hover {
            background-color: #218838; /* Darker green on hover */
        }

        .decline-button {
            background-color: #dc3545; /* Red for Decline */
        }

        .decline-button:hover {
            background-color: #c82333; /* Darker red on hover */
        }

        .remove-button {
            background-color: #ffc107; /* Yellow for Remove */
        }

        .remove-button:hover {
            background-color: #e0a800; /* Darker yellow on hover */
        }

        .button-container {
            display: flex;
            justify-content: center;
            margin-top: 10px;
        }

        .status-message {
            color: green;
            font-weight: bold;
            margin-top: 20px;
        }

        .no-claims {
            color: red;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
    <script type="text/javascript">
        function confirmAction(action) {
            return confirm("Are you sure you want to " + action + " this claim?");
        }
    </script>
</head>
<body>
    <div class="header">
        <div class="logo">Program Coordinator - View Claims</div>
    </div>

    <div class="main-content">
        <form id="form1" runat="server">
            <h2>Welcome, Program Coordinator! Manage Lecturer Claims</h2>
            <asp:Label ID="lblStatusMessage" runat="server" CssClass="status-message" Visible="false"></asp:Label>
            <asp:Label ID="lblNoClaims" runat="server" CssClass="no-claims" Visible="false"></asp:Label>
            <asp:GridView ID="gvClaims" runat="server" AutoGenerateColumns="False" CssClass="grid-view" OnRowCommand="gvClaims_RowCommand">
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
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnApprove" runat="server" Text="Approve" CommandName="Approve" CommandArgument='<%# Eval("ClaimID") %>' CssClass="approve-button" OnClientClick="return confirmAction('approve');" />
                            <asp:Button ID="btnDecline" runat="server" Text="Decline" CommandName="Decline" CommandArgument='<%# Eval("ClaimID") %>' CssClass="decline-button" OnClientClick="return confirmAction('decline');" />
                            <asp:Button ID="btnRemove" runat="server" Text="Remove" CommandName="Remove" CommandArgument='<%# Eval("ClaimID") %>' CssClass="remove-button" OnClientClick="return confirmAction('remove');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </form>
    </div>
</body>
</html>
