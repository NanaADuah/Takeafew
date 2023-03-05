<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="_33705119_Assignment2._default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>takeafew | Login</title>
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
        .auto-style2 {
            background-color: rgb(207 72 0);
            border-color: rgb(207 72 0);
            border-block-color: #0000FF;
            height: 23px;
        }
        .auto-style3 {
            width: 496px;
            height: 85px;
        }
        
        .auto-style10 {
            padding: 5px 20px;
            background-color: initial;
            background-color: #FFFFFF;
            border: 1px solid rgb(209,213,219);
            border-radius: .5rem;
            box-sizing: border-box;
            color: #111827;
            font-size: 1rem;
            font-weight: 600;
            line-height: 1.25rem;
            padding: .75rem 1rem;
            text-align: center;
            text-decoration: none #D1D5DB solid;
            text-decoration-thickness: auto;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            cursor: pointer;
            user-select: none;           
        }

        .auto-style10:hover{
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
            width: 259px;
            height: 89px;
        }

        .auto-style15 {
            border-radius: 6px;
            line-height: 25px;
            padding: 5px 15px;
            border: 1px solid darkgrey;
            transition: .3s border-color;
        }

        .auto-style15:hover{
            border: 1px solid dimgray;
        }

        .lblRegister:hover{
            text-decoration: underline;
            cursor: pointer;
        }
        
        .auto-style16 {
            height: 20px;
        }
        .auto-style17 {
            height: 25px;
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
            <td class="auto-style13"></td>
        </tr>
        <tr>
            <td class="auto-style2" colspan="3"></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="Label1" runat="server" Text="LOGIN" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="lblErrors" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:TextBox ID="tbEmail" runat="server" Width="368px" CssClass="auto-style15"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Label ID="Label3" runat="server" Text="Password:"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:TextBox ID="tbPassword" runat="server" Width="368px" CssClass="auto-style15"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:Button ID="btnLogin" runat="server" class="auto-style10" Text="LOGIN" Width="160px" OnClick="btnLogin_Click">

                </asp:Button>

            </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style17">
                <asp:CheckBox ID="cbLog" runat="server" Text="Stay logged in?" />

            </td>
        </tr>
        <tr>
            <td colspan="3" class="auto-style16">
                <asp:HyperLink ID="hlRegister" runat="server" NavigateUrl="~/404.aspx">Register an supervisor?</asp:HyperLink>

            </td>
        </tr>
    </table>
        </div>
    </form>
</body>
</html>
