<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WarehouseView.aspx.cs" Inherits="_33705119_Assignment2.WarehouseView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>takeafew | Warehouse Details</title>
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
            transition: .15s ease-in;
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
            border: none;
            padding: 10px;
            font-weight: bold;
            font-size: large;
            background: #CF4800;
            color: white;
            border-radius: 5px;
            transition: .15s ease-in;
        }

        #btnHome:hover{
            box-shadow:  0 1px 2px 0 rgba(0, 0, 0, 0.05);
            padding: 15px;
            background: #9b3600;
        }

        .auto-style19 {
            height: 22px;
            width: 870px;
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

        #tbSearch{
            padding: 5px;
            border-radius: 5px;
            border:none;
            border: 2px solid #cf4800;
            background: none;
            margin: 0px 5px;
        }

        #dlWarehouse{
            border: 2px solid #cf4800;
            background: white;
            padding: 5px;
            border-radius: 5px;
        }
        .auto-style22 {
            margin-left: 29px;
        }

        #btnView{
            border: 2px solid #cf4800;
            border-radius: 5px;
            background: none;
            font-weight: bold;
            color: #cf4800;
            font-size:large;
            cursor: pointer;
        }
        
        .btn{
            border-radius: 5px;
            background: none;
            font-weight: bold;
            color: #cf4800;
            font-size:large;
            cursor: pointer;
            padding: 5px;
            transition: .15s ease-in-out;
            border: 2px solid #cf4800;
            margin: 2px 5px;
        }

        .btn:hover{
            padding: 5px 10px;
        }



        #lbPeople{
            border: 2px solid #cf4800;
            border-radius: 5px;

        }

        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="aa">

        <div id="header"class="auto-style6">
            <table class="auto-style6">
            <tr >
                <div style="position:absolute; background:white;">
                    <td class="auto-style14">
                        <img alt="" class="auto-style3" src="AppLogo.png" /></td>
                    <td class="auto-style13">
                    </td>
                    <td class="auto-style13"></td>
                </div>
            </tr>
        </table>
        </div>
        <div  class="auto-style1">
    
        <table class="auto-style6">
        <tr>
            <td class="auto-style19" style="text-align:left;">
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" style="">
                <asp:Label ID="Label4" runat="server" Text="Search Location:"></asp:Label><asp:TextBox ID="tbSearch" runat="server" Width="348px" AutoPostBack="True"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" class="btn" Text="SEARCH" Font-Bold="True" OnClick="btnSearch_Click" />
                <asp:Button ID="btnClear" runat="server"  class="btn" Text="CLEAR" Font-Bold="True" OnClick="btnClear_Click"/>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" style="">
                &nbsp;</td>
        </tr>
        <tr> 
            <td class="auto-style20">
                <asp:GridView ID="warehouseGrid" runat="server" style="margin:auto;" BorderColor="#CF4800" BorderStyle="Solid" CellPadding="5" CellSpacing="2" OnSelectedIndexChanged="warehouseGrid_SelectedIndexChanged" BorderWidth="2px" EmptyDataText="No records found" ShowHeaderWhenEmpty="True">
                    <HeaderStyle BackColor="#CF4800" ForeColor="White" />
                </asp:GridView>
            </td>
        </tr>
        <tr> 
            <td class="auto-style21">
            </td>
        </tr>
        <tr> 
            <td class="auto-style20" style="text-align:left; padding: 0px 5px;">
                <asp:DropDownList ID="dlWarehouse" runat="server" Width="289px">
                </asp:DropDownList>
                <asp:Button runat="server" ID="btnView" Text="VIEW" CssClass="auto-style22" OnClick="btnView_Click"/>
            </td>
        </tr>
        <tr> 
            <td class="auto-style20" style="text-align:left; padding: 0px 5px;">
                <asp:ListBox ID="lbPeople" style="width:100%; margin-top:5px" runat="server" Font-Names="Courier New" Height="180px"></asp:ListBox>
            </td>
        </tr>
        </table>
            
        </div>
            <div id="aa" style="box-shadow:none; padding:0px">
            <asp:Button ID="btnHome" runat="server" Text="GO HOME" OnClick="btnHome_Click" />
        </div>
    </div>
        
    </form>
</body>
</html>
