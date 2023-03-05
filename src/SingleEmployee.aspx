<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SingleEmployee.aspx.cs" Inherits="_33705119_Assignment2.SingleEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>takeafew | Statistics</title>
    <style type="text/css">
        #aa{
            width: 805px;
            padding: 10px 0px;
            border-radius: 10px;
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

        #btnSearch{
            padding:7.5px 20px;
            border-radius: 5px;
        }

        .textbox{
            padding: 5px;
            border-radius: 5px;
            border:2px solid #cf4800;
            background: none;
        }
                
        #tbAvg0{
            padding: 5px;
            border-radius: 5px;
            border:2px solid #cf4800;
            background: none;
        }

        #lbAvg{
            border-radius: 5px;
            border: 2px solid #CF4800;
            padding: 5px;
        }

        #dlIDs{
            padding: 10px;
            color: black;

        }
        .auto-style22 {
        }
        .auto-style23 {
            width: 870px;
        }

        .btn{
            font-weight:bold;
            border-radius: 5px;
            border: 2px solid #cf4800;
            font-size: large;
            padding: 5px;
            background:none;
            transition: .15s ease-in-out;
            cursor: pointer;
            color: #cf4800;
        }

        .btn:hover{
            padding: 5px 15px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
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
            <td class="auto-style19" style="text-align:center;">
                <asp:Label ID="Label9" Text="INFORMATION" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                <hr />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style23" style="text-align:left; padding-left: 20px;">
                <asp:Label ID="Label1" Text="Enter worker ID to view: " runat="server" ></asp:Label><asp:DropDownList ID="dlIDs" runat="server" Height="16px" Width="105px" class="textbox" OnSelectedIndexChanged="dlIDs_SelectedIndexChanged" AutoPostBack="True">
                </asp:DropDownList>
                </td>
        </tr>
        <tr>
            <td class="auto-style19" style="text-align:center;">
                        <asp:Label ID="lblEdit" Text="You cannot edit employee details" runat="server" Visible="False" Font-Overline="False" Font-Size="Large" Font-Underline="True" ForeColor="Red"></asp:Label>
                    </td>
        </tr>
        </table>
        <table id="customInfo" visible="false" runat="server" style="width:100%; padding-left:20px ">
        <tr>
            <td class="auto-style21">
                    <asp:Image ID="imgProfile" runat="server" Height="100px" ImageUrl="~/Female.jpg" Width="100px" CssClass="auto-style22" />
            </td>
        </tr>
        <tr>
            <td class="auto-style21" >
                <asp:Label runat="server" ID="lblName" Font-Bold="True" Font-Italic="False" Font-Size="XX-Large" Font-Overline="False" Font-Underline="True"></asp:Label>
                </td>
        </tr>
                <tr>
                <td class="auto-style21">
                    <asp:Label ID="lblPosition" Text="Current position" runat="server" Font-Size="Large"></asp:Label>
                    &nbsp;
                    <br />
                    <br />
                </td>
                </tr>
                <tr>
                    <td class="auto-style21" style="">
                        <asp:Label ID="lblEmail" runat="server" Text="Email address: " Font-Size="Large"></asp:Label>
                    <br />
                    <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21">
                        <asp:Label ID="lblWarehouse" runat="server" Text="Currently assigned to: " Font-Size="Large"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblRating" Text="Current work rating: " runat="server" Font-Size="Large"></asp:Label>
                        <br />
                        <br />
                        <asp:Label ID="lblWorkTime" Text="Current work rating: " runat="server" Font-Size="Large"></asp:Label>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style21" style="padding-left:5px">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style21" style="text-align:left;">
                        <asp:Button runat="server" ID="btnEdit" class="btn" style="margin-right: 10px" Text="EDIT INFO" OnClick="btnEdit_Click"/>
                        <asp:Button runat="server" ID="btnDismiss" class="btn" Text="DISMISS EMPLOYEE" OnClick="btnDismiss_Click"/>
                        <br />
                        <br />
                        <asp:Label runat="server" Text="Confirmation" ID="lblConfirm" ></asp:Label>
                        <br />
                        <asp:Button runat="server" class="btn" ID="btnConfirm" Text="CONFIRM" style="margin-top:10px" OnClick="btnConfirm_Click"/>
                        <asp:Button runat="server" class="btn" ID="btnCancel" Text="CANCEL" style="color: white;background:#cf4800;margin-top:10px;margin-left:10px"/>
                    </td>
                </tr>
                <tr> 
                    <td class="auto-style21">
                        &nbsp;</td>
                </tr>
                <tr> 
                    <td class="auto-style21">
                        &nbsp;</td>
                </tr>
           </table>
            
        </div>
            <div id="aa" style="box-shadow:none; padding:0px;text-align:right; ">
            <asp:Button ID="btnHome" runat="server" Text="GO HOME" OnClick="btnHome_Click1" style="margin-right:5px" />

        </div>
    </div>
        
    </form>
</body>
</html>
