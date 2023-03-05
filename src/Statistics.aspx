<%@ Page Language="C#" MaintainScrollPositionOnPostback="true" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="_33705119_Assignment2.Statistics"  %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

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

        .listbox{
            border-radius: 5px;
            border: 2px solid #CF4800;
            padding: 5px;
            width: 100%;
        }

        #btnUpdate{
            background: none;
            padding: 5px;
            border: 2px solid #cf4800;
            border-radius: 5px;
            color: #cf4800;
            cursor: pointer;
            transition: 0.15s ease-in-out;
            font-weight: bold;
        }

        #btnUpdate:hover{
            padding: 5px 10px;
        }
        .auto-style22 {
            width: 805px;
            padding: 5px;
        }
        .auto-style23 {
            height: 22px;
            width: 401px;
        }
        .auto-style25 {
            height: 22px;
            width: 1242px;
        }

        .scrollDiv{
            height: 350px;
            overflow: scroll;
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
    
        <table class="auto-style22">
        <tr>
            <td class="auto-style25" style="text-align:left;">
                <asp:Label ID="lblInfo" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style25" style="text-align:center;">
                <asp:Label ID="Label9" Text="STATISTICS" runat="server" Font-Bold="True" Font-Size="XX-Large"></asp:Label>
                <hr />
                </td>
        </tr>
        <tr>
            <td class="auto-style21">
                <asp:Label ID="lblCountEmp" runat="server" Text="Number of employees at all warehouses: "></asp:Label>
<asp:TextBox ID="tbTotal" runat="server" CssClass="textbox" ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" style="">
                <asp:Label ID="lblAvg" runat="server" Text="Average number of workers per warehouse:"></asp:Label>
                <asp:TextBox ID="tbAvg" runat="server" CssClass="textbox"  ReadOnly="True"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21" style="">
                <asp:Label ID="Label8" runat="server" Text="Current existing warehouses:"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="auto-style23" style="padding:0px;">
                <asp:ListBox ID="lbAvg" runat="server" CssClass="listbox" Height="129px" AutoPostBack="True" OnSelectedIndexChanged="lbAvg_SelectedIndexChanged"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style21">
                </td>
        </tr>
        <tr>
            <td class="auto-style21" style="padding-left:5px">
                <asp:Label ID="Label1" runat="server" Text="Number of employees per warehouse: "></asp:Label>
            </td>
        </tr>
            </table>
            <div class="scrollDiv">
        <tr>
            <td class="auto-style21" style="text-align:left;">

                <asp:Chart ID="Chart1" runat="server" style="margin:auto" Palette="None" PaletteCustomColors="207, 72, 0; White; 199, 223, 197; 246, 254, 170; 55, 55, 55; 252, 230, 148" Width="779px">
                    <series>
                        <asp:Series Name="Series1">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                    <Titles>
                        <asp:Title Name="Title" Text="takeafew Warehouses">
                        </asp:Title>
                    </Titles>
                </asp:Chart>
            </td>
        </tr>
            

            <table class="auto-style22">
        <tr> 
            <td class="auto-style21" >
                <asp:Panel ID="Panel1" runat="server" GroupingText="Select a job from the bottom, and warehouse from above to see the stats for it:">
                <asp:ListBox runat="server" CssClass="listbox" ID="lbJobs" Height="100px" AutoPostBack="True" OnSelectedIndexChanged="lbJobs_SelectedIndexChanged"></asp:ListBox>
                    <br />
                    <br />
                 <asp:Label runat="server" Text="" ID="lblStatJob"></asp:Label>
                <asp:ListBox runat="server" CssClass="listbox" ID="lbJobStats" Height="100px" OnSelectedIndexChanged="lbJobs_SelectedIndexChanged"></asp:ListBox>
                </asp:Panel>
            </td>
        </tr>
        <tr> 
            <td class="auto-style21" >
                <asp:Chart runat="server" style="margin:auto" Palette="None" ID="Chart2" visible="false" Width="779px">
                    <series>
                        <asp:Series Name="Series1">
                        </asp:Series>
                    </series>
                    <chartareas>
                        <asp:ChartArea Name="ChartArea1">
                        </asp:ChartArea>
                    </chartareas>
                    <Titles>
                        <asp:Title Name="Title" Text="takeafew Warehouses">
                        </asp:Title>
                    </Titles>
                </asp:Chart>
            </td>
        </tr>
        <tr> 
            <td class="auto-style21">

            </td>
        </tr>
        <tr> 
            <td class="auto-style21">
                <asp:Button ID="btnUpdate" runat="server" Text="UPDATE VALUES" OnClick="btnUpdate_Click"/>
            </td>
        </tr>

        </table>
            </div>

            
        </div>
            <div id="aa" style="box-shadow:none; padding:0px;text-align:right; ">
            <asp:Button ID="btnHome" runat="server" Text="GO HOME" OnClick="btnHome_Click1" style="margin-right:5px" />
        </div>
    </div>
        
    </form>
</body>
</html>
