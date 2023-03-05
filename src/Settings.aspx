<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="_33705119_Assignment2.Settings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>takeafew | Settings</title>
    <style type="text/css">
        .auto-style1 {
            width: 147px;
            font-weight: bold;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style3 {
            font-family: Arial;
            width: 70%;
            margin: auto;
            border-radius: 5px;
            padding: 10px;
            margin-top: 3%;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 30px 60px -12px inset, rgba(0, 0, 0, 0.3) 0px 18px 36px -18px inset;

        }

        .auto-style4{
            background-color: initial;
            background-image: linear-gradient(-180deg, #00D775, #00BD68);
            border-radius: 5px;
            box-shadow: rgba(0, 0, 0, 0.1) 0 2px 4px;
            color: #FFFFFF;
            cursor: pointer;
            display: inline-block;
            height: 44px;
            line-height: 44px;
            outline: 0;
            overflow: hidden;
            position: relative;
            text-align: center;
            user-select: none;
            -webkit-user-select: none;
            vertical-align: top;
            white-space: nowrap;
            border: 0;
            font-size: large;
            padding: 0px 10px;
            margin: 5px;
        }

        .auto-style4:hover{
            background: #00bd68;
        }
        
        .auto-style6 {
            height: 50px;
        }
        
        .auto-style7 {
            width: 250px;
            border: 1px solid rgb(152 152 152);
            padding: 5px 10px;
            border-radius: 5px;
            margin-right: 10px;

        }
        .auto-style8 {
            width: 147px;
            font-weight: bold;
            height: 23px;
        }
        .auto-style9 {
            height: 23px;
        }
        .auto-style11 {
            height: 185px;
        }
        .auto-style12 {
            height: 22px;
        }
        .auto-style13 {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style3">
            <table class="auto-style2">
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblDetails" runat="server" Text="Hello" Font-Bold="True" Font-Overline="False" Font-Size="Large" Font-Underline="True"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="auto-style12"></td>
                </tr>
                <tr>
                    <td class="auto-style1">Name:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tbName" class="auto-style7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A name is required" ControlToValidate="tbName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Surname:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tbSurname" class="auto-style7" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="A surname is required" ControlToValidate="tbSurname" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Email:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tbEmail" class="auto-style7" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid email!" ControlToValidate="tbEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Position:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tbPosition" runat="server" CssClass="auto-style7" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Date of Birth:</td>
                    <td class="auto-style11">
                        <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Date of Employement:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="tbEmployement" runat="server" CssClass="auto-style7" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8">&nbsp;</td>
                    <td class="auto-style9">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style13" colspan="2">

                        <asp:Button Class="auto-style4" ID="btnCancel" runat="server" style="background: dimgray" Text="Cancel" OnClick="btnCancel_Click" />
                        <asp:Button Class="auto-style4" ID="btnSave" runat="server" Text="Save Details" OnClick="btnSave_Click1" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
