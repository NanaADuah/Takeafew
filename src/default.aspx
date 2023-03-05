 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="_33705119_Assignment2._default1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>takeafew</title>
    <style type="text/css">
        .auto-style1 {
            width: 800px;
            margin-top: 20px;
            padding: 10px 0px;
            border-radius: 10px;
            text-align: center;
            box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
            font-family: Arial;
        }
        
        .auto-style3 {
            width: 496px;
            height: 85px;
        }

        .auto-style2{
            padding: 10px;
            margin: 5px;
            border: none;
            width: 200px;
            border-radius: 5px;
            background:  linear-gradient( #CF4800,#b54103);
            color: white;
            font-weight: bold;
            font-size: large;
            cursor: pointer;
            transition: 0.15s ease-in-out;
        }

        .auto-style2:hover{
            box-shadow:  0 1px 2px 0 rgba(0, 0, 0, 0.05);
            padding: 15px;
            background: #9b3600;
        }
        
        .auto-style9{
            background-color: initial;
            background-color: #FFFFFF;
            border: 1px solid rgb(209,213,219);
            border-radius: 5px;
            box-sizing: border-box;
            color: #111827;
            font-size: 1rem;
            font-weight: normal;
            line-height: 1.25rem;
            padding: 5px 10px;
            text-align: center;
            text-decoration: none #D1D5DB solid;
            text-decoration-thickness: auto;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            cursor: pointer;
            user-select: none;
            margin: 5px;
            transition: 0.15s ease-in-out;
        }

        .auto-style9:hover{
             box-shadow:0 0 4px rgba(0,0,0,0.25);
        }

        .auto-style6 {
            width: auto;
        }
        .auto-style13 {
            width: 325px;
            height: 89px;
        }
        
        .auto-style14 {
            margin-left: 7px;
        }

        #btnViewIssues{
            font-weight:bold;
            border-radius:5px;
            padding: 2px 10px;
            border: 1px solid #CF4800;
            background: none;
            color:#CF4800;
            transition: .15s ease-in-out;
            cursor: pointer;
        }
        
        #btnViewIssues:hover{
            padding: 2px 15px;
        }
        </style>
</head>
<body>
     <form id="form1" class="auto-style1" runat="server">
        <div>
    <table class="auto-style6">
        <tr>
            <td class="auto-style14">
                <img alt="" class="auto-style3" src="AppLogo.png" /></td>
            <td class="auto-style13"></td>
            <td class="auto-style13">
                <asp:Button ID="lblLogout" Cssclass="auto-style9" runat="server" BorderStyle="Solid" OnClick="lblLogout_Click" Text="Logout" Width="118px" />
                <asp:Button ID="lblSettings" Cssclass="auto-style9" style="margin-bottom: 0px;" runat="server" BorderStyle="Solid" Text="Settings" Width="118px" OnClick="lblSettings_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <hr />
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align: left;padding-left:5px">
                <asp:Label ID="lblInfo" runat="server" ForeColor="Black"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <hr />
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Panel ID="Panel1" runat="server" GroupingText="Admin Console" style="text-align:left;padding:10px;">
                     <asp:Label ID="Label2" runat="server" ForeColor="Black" Font-Bold="True" Font-Size="Large">Employee Database</asp:Label>
                     <asp:Label ID="lblOther" runat="server" ForeColor="Black" style="margin-left:200px" Font-Bold="True" Font-Size="Large">Statistics</asp:Label>
                    <br />
                    <asp:Button ID="Button1" class="auto-style2" runat="server" Text="VIEW" OnClick="Button1_Click" />
                    <asp:Button ID="btnStatistics" class="auto-style2" style="margin-left:170px" runat="server" Text="VIEW"  OnClick="btnStatistics_Click"/>
                    <br />
                    <br />
                     <asp:Label ID="Label3" runat="server" ForeColor="Black" Font-Bold="True">Warehouse Details</asp:Label>
                    <br />
                    <asp:Button ID="btnWarehouse" class="auto-style2" runat="server" Text="VIEW" OnClick="btnWarehouse_Click" />
                    <br />
                    <br />
                     <asp:Label ID="Label4" runat="server" ForeColor="Black" Font-Bold="True">Stock Details</asp:Label>
                    <br />
                    <asp:Button ID="btnStock" class="auto-style2" runat="server" Text="VIEW" OnClick="btnStock_Click" />
                    <br />
                    <br />
                     <asp:Label ID="Label5" runat="server" ForeColor="Black" Font-Bold="True">Customer Details &amp; Orders</asp:Label>
                    <br />
                    <asp:Button ID="Button4" class="auto-style2" runat="server" Text="VIEW" OnClick="Button4_Click" />
                    <br />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="text-align:left;">
                <asp:Label ID="lblIssues" style="margin-left:5px;" runat="server" ForeColor="Black" Text="Issues: "> </asp:Label><asp:Button ID="btnViewIssues" runat="server" Text="View" CssClass="auto-style14" OnClick="btnViewIssues_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;</td>
        </tr>
    </table>
        </div>
    </form>
</body>
</html>
