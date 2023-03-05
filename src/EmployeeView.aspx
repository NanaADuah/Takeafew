<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="EmployeeView.aspx.cs" Inherits="_33705119_Assignment2.EmployeeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>takeafew | Employee Details</title>
    <style type="text/css">
        #aa{
            width: 805px;
            padding: 10px 0px;
            border-radius: 10px;
            text-align: center;
            margin: auto;
            box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
            margin-top: 20px;
        }
        .auto-style1 {
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
            font-family: Arial;
            height: 600px;
            overflow: auto;
        }

        .auto-style3 {
            width: 496px;
            height: 85px;
            padding: 0px;
        }
        
        .auto-style10:hover{
            box-shadow:0 0 4px rgba(0,0,0,0.25);
        }

        .auto-style6 {
            width: auto;
            padding: 5px;
        }
        .auto-style13 {
            width: 325px;
            height: 89px;
        }
        .auto-style14 {
            width: 259px;
            height: 89px;
        }

        .auto-style15:hover{
            border: 1px solid dimgray;
        }

        .lblRegister:hover{
            text-decoration: underline;
            cursor: pointer;
        }
        
        #lblInfo{
            margin-left: 10px;
        }

        #btnHome{
            cursor: pointer;
            padding: 10px;
            font-weight: bold;
            font-size: large;
            background: none;
            color: #CF4800;
            border-radius: 5px;
            transition: 0.15s ease-in-out;
            border: 2px solid #CF4800;
        }

        #btnHome:hover{
            box-shadow:  0 1px 2px 0 rgba(0, 0, 0, 0.05);
            padding: 10px 15px;
            border: 2px solid;
        }

        .auto-style20 {
        }

        #header{
            width: 805px;
            margin: auto;
        }

         .scrolling {  
                position: absolute;  
            }  
        .auto-style21 {
            height: 22px;
        }

        .btn{
            padding:5px;
            border-radius: 5px;
            transition: 0.15s ease-in-out;
            border: 2px solid #cf4800;
            background: #cf4800;
            color: white;
        }

        #tbSearch{
            border-radius: 5px;
            padding: 5px;
            transition: 0.15s ease-in-out;
            border: 2px solid #cf4800;
        }
        .btn:hover{
            padding: 5px 10px;
            box-shadow:  0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }
        .auto-style22 {
            margin-right: 8px;
        }

        #dlItems{
            border: 2px solid #CF4800; 
            border-radius: 5px;
            color: #CF4800;
            padding: 5px;
        }

        .dropList{
            padding: 5px 10px; 
        }

        #form1{
            font-family: Arial;
        }

        .auto-style23 {
            margin-left: 6px;
        }

        .auto-style24 {
            padding: 5px;
            border-radius: 5px;
            transition: 0.15s ease-in-out;
            border: 2px solid #cf4800;
            background: #cf4800;
            color: white;
            margin-left: 17px;
        }

        #empNum{
            padding: 5px;
            border-radius: 5px;
            border: 2px solid #cf4800;
        }

        .auto-style25 {
            height: 20px;
        }

        .auto-style26 {
            padding: 5px;
            border-radius: 5px;
            transition: 0.15s ease-in-out;
            border: 2px solid #cf4800;
            background: #cf4800;
            color: white;
            margin-left: 10px;
        }

        </style>
</head>
<body>
    <form id="form1"  runat="server">
        <div id="aa">

        <div id="header"class="auto-style6">
            <table class="auto-style6">
            <tr >
                        <td class="auto-style14">
                            <img alt="" class="auto-style3" src="AppLogo.png" /></td>
                        <td class="auto-style13">
                        </td>
                        <td class="auto-style13"></td>
             </tr>
            <tr>
            <td class="auto-style19" style="text-align:left;">
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
            </td>
            </tr>
          </table>
        <tr>
            <td class="auto-style21" style="">
                <asp:DropDownList ID="dlItems" runat="server" CssClass="auto-style22" Width="146px">
                    <asp:ListItem class="dropList">EmployeeID</asp:ListItem>
                    <asp:ListItem class="dropList">Name</asp:ListItem>
                    <asp:ListItem class="dropList">Surname</asp:ListItem>
                    <asp:ListItem class="dropList">Position</asp:ListItem>
                    <asp:ListItem class="dropList">Warehouse</asp:ListItem>
                    <asp:ListItem class="dropList">Email</asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="Label4" runat="server" Text="Filter:"></asp:Label><asp:TextBox ID="tbSearch" runat="server" Width="348px" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged" CssClass="auto-style23"></asp:TextBox>
                <asp:Button ID="btnSearch" CssClass="btn" runat="server" OnClick="Button1_Click1" Text="SEARCH" Font-Bold="True" />
                <asp:Button ID="btnClear" CssClass="btn" runat="server" Text="CLEAR" Font-Bold="True" style="padding-left:5px;" OnClick="btnClear_Click" />
            </td>
        </tr>
        </div>
        <div  class="auto-style1">
        <table class="auto-style6" style="width:100%">
        
        <tr>
            <td class="auto-style21" style="">
                &nbsp;</td>
        </tr>
        <tr> 
            <td class="auto-style20">
                <asp:GridView ID="employeeGrid" runat="server" style="margin:auto;" BackColor="White" BorderColor="#CF4800" BorderWidth="2px" ForeColor="Black" EmptyDataText="No Records found" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="employeeGrid_SelectedIndexChanged" OnRowDataBound="employeeGrid_RowDataBound">
                    <HeaderStyle BackColor="#CF4800" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr> 
            <td class="auto-style21">
            </td>
        </tr>
        <tr> 
            <td class="auto-style21" style="text-align:left;padding-left:10px">
                <asp:Label ID="Label5" runat="server" Text="Sort by:"></asp:Label>
            </td>
        </tr>
        <tr> 
            <td class="auto-style21" style="text-align:left; padding-left:10px">
                <asp:Button ID="Button1" class="btn" style="margin: 0px 2px;" runat="server" Text="Name" OnClick="Button1_Click2" />
                <asp:Button ID="Button2" class="btn" style="margin: 0px 2px;" runat="server" Text="Surname" OnClick="Button2_Click" />
                <asp:Button ID="Button3" class="btn" style="margin: 0px 2px;" runat="server" Text="WorkerID" OnClick="Button3_Click" />
                <asp:Button ID="Button4" class="btn" style="margin-left:200px;" runat="server" Text="View Worker Details" OnClick="Button4_Click" />
            </td>
        </tr>
        <tr>
            <td class="auto-style20" style="text-align:left; padding: 0px 5px;">
            <hr />
                <asp:Label ID="lblHint" CssClass="hint" runat="server" Text="This is automated task that reviews & screens candidates for hiring, just specify the number of employees:"></asp:Label>
                
            </td>
        </tr>
        <tr> 
            <td class="auto-style20" style="text-align:left; padding: 0px 5px;">
                <asp:Button ID="btnHire" style="margin-top:5px" CssClass="btn" runat="server" Text="Hire Additional Staff" OnClick="btnHire_Click" />
                

            </td>
        </tr>
        <tr> 
            <td class="auto-style20" style="text-align:left; padding: 0px 5px;">
                <asp:TextBox ID="empNum" runat="server" TextMode="Number" min="1" max="20" step="1" Width="50px"/>
                <asp:Button ID="btnAccept" CssClass="auto-style26" runat="server" Text="CONFIRM" OnClick="btnAccept_Click"/>
            </td>
        </tr>
        <tr> 
            <td class="auto-style25" style="text-align:left; padding: 0px 5px;text-align: right">
                <asp:Button ID="btnCancel" CssClass="auto-style24" style="margin:0px;margin-top:5px" runat="server" Text="CANCEL" OnClick="btnCancel_Click"  />
                </td>
        </tr>
            </table>
            
        </div>
            <div style="box-shadow:none; padding-top:10px; text-align:right;padding-right:10px;">
            <asp:Button ID="btnHome" runat="server" Text="GO HOME" OnClick="Button1_Click" />
        </div>
    </div>
        
    </form>
</body>
</html>
