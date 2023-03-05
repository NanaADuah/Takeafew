<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="_33705119_Assignment2.Stock" %>

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
            font-family: Roboto;
        }

        .auto-style3 {
            width: 496px;
            height: 85px;
        }

        .auto-style2:hover {
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
            padding: 15px;
            background: #9b3600;
        }

        .auto-style9:hover {
            box-shadow: 0 0 4px rgba(0,0,0,0.25);
        }

        .auto-style6 {
            width: auto;
        }

        .auto-style13 {
            width: 325px;
            height: 33px;
        }

        .auto-style14 {
            margin-left: 7px;
            height: 33px;
        }

        #btnViewIssues {
            font-weight: bold;
            border-radius: 5px;
            padding: 2px 10px;
            border: 1px solid #CF4800;
            background: none;
            color: #CF4800;
            transition: .15s ease-in-out;
            cursor: pointer;
        }

            #btnViewIssues:hover {
                padding: 2px 15px;
            }

        .imgStock {
            width: 150px;
            height: 150px;
        }

        #scroll {
            overflow-x: scroll;
            scrollbar-base-color: #CF4800;
            scroll-behavior: smooth;
        }

        #pnlItems {
            width: 1500px;
        }

        #tblItems {
        }

        .labels {
            font-weight: bold;
            text-transform: uppercase;
            text-decoration: underline;
        }


        #btnReturn {
            font-weight: bold;
            font-size: large;
            padding: 5px;
            border: 2px solid #cf4800;
            background: none;
            border-radius: 5px;
            color: #cf4800;
            transition: 0.15s ease;
        }

        #scrollDiv {
            border: none;
        }

        #btnReturn:hover {
            padding: 5px 10px;
            background:#cf4800;
            color: white;
        }

        .borderTable {
            border: 2px solid #f1f1f1;
            padding: 5px;
            box-shadow: rgba(0, 0, 0, 0.12) 0px 1px 3px, rgba(0, 0, 0, 0.24) 0px 1px 2px;
            border-radius: 2px;
        }

        .btns {
            border-radius: 5px;
            border: 2px solid #1c8644;
            background: none;
            padding: 5px;
            font-size: medium;
            color: #1c8644;
            font-weight: bold;
            transition: 0.15s ease;
        }

        .btns:hover {
            background: #1c8644;
            color: white;
        }

        .btnsUn {
            border-radius: 5px;
            border: 2px solid #CF4800;
            background: none;
            padding: 5px;
            font-size: medium;
            color: #CF4800;
            font-weight: bold;
            transition: 0.15s ease;
        }

        .btnsUn:hover {
            background: #CF4800;
            color: white;
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
                    <td colspan="3" style="background: #CF4800; border:#CF4800">&nbsp;</td>
                    </tr>
                <tr>
                    <td colspan="3">
                        <asp:Label ID="Label2" runat="server" Text="ITEMS SAMPLE" Font-Bold="true" Font-Size="XX-Large"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <hr />
                    </td>
                </tr>
                <tr>
                    <td colspan="3" style="text-align: left; padding-left: 5px">
                        <asp:Label ID="lblInfo" runat="server" ForeColor="Black"></asp:Label>
                    </td>
                </tr>
            </table>
            <div id="scroll" style="width: 100%; display: block; text-align: center">
                <table id="scrollDiv">
                    <tr>
                        <td>
                            <table id="tblItems" style="width: 1000px; margin-bottom:5px">
                                <tr>
                                    <td class="borderTable">
                                        <asp:Image ID="Image2" runat="server" class="imgStock" ImageUrl="~/Images/Shoe.png" CssClass="imgStock" /><br />
                                        <asp:Label Text="Shoes" CssClass="labels" ID="Label1" runat="server"></asp:Label><br />
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Label11" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image5" class="imgStock" runat="server" ImageUrl="~/Images/Bottle.jpg" />
                                        <br />
                                        <asp:Label Text="Bottles" CssClass="labels" ID="Label3" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button2" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image4" class="imgStock" runat="server" ImageUrl="~/Images/Toys.jpg" />
                                        <br />
                                        <asp:Label Text="Toys" CssClass="labels" ID="Label4" runat="server"></asp:Label><br />
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button1" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image10" class="imgStock" runat="server" ImageUrl="~/Images/Phone.jpg" />
                                        <br />
                                        <asp:Label Text="Cellphones" CssClass="labels" ID="Label5" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button3" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image111" class="imgStock" runat="server" ImageUrl="~/Images/GPU.jpg" />
                                        <br />
                                        <asp:Label Text="Graphics Cards" CssClass="labels" ID="Label15" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: Not in Stock" CssClass="btnsUn" ID="Button4" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image1" class="imgStock" runat="server" ImageUrl="~/Images/food.jpg" />
                                        <br />
                                        <asp:Label Text="Student Essentials" CssClass="labels" ID="Label16" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button10" runat="server"></asp:Button>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="borderTable">
                                        <asp:Image ID="Image6" class="imgStock" runat="server" ImageUrl="~/Images/Bag.jpg" />
                                        <br />
                                        <asp:Label ID="Label6" runat="server" Text="Bags" CssClass="labels"></asp:Label><br />
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button5" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image3" class="imgStock" runat="server" ImageUrl="~/Images/Laptop.jpg" />
                                        <br />
                                        <asp:Label Text="Computers" CssClass="labels" ID="Label9" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button6" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image9" class="imgStock" runat="server" ImageUrl="~/Images/KUtensil.png" />
                                        <br />
                                        <asp:Label Text="Kitchen utensils" CssClass="labels" ID="Label8" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: Not in Stock" CssClass="btnsUn" ID="Button7" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image11" class="imgStock" runat="server" ImageUrl="~/Images/TV.jpg" />
                                        <br />
                                        <asp:Label Text="TVs" CssClass="labels" ID="Label7" runat="server"></asp:Label><br />
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button8" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image134" class="imgStock" runat="server" ImageUrl="~/Images/Furniture.jpg" />
                                        <br />
                                        <asp:Label Text="Furniture" CssClass="labels" ID="Label19" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button9" runat="server"></asp:Button>
                                    </td>
                                    <td class="borderTable">
                                        <asp:Image ID="Image7" class="imgStock" runat="server" ImageUrl="~/Images/Stationery.jpg" />
                                        <br />
                                        <asp:Label Text="Graphics Cards" CssClass="labels" ID="Label10" runat="server"></asp:Label>
                                        <asp:Button Text="Availability: In Stock" CssClass="btns" ID="Button11" runat="server"></asp:Button>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="text-align: right; padding: 10px 15px">
            <asp:Button runat="server" Text="GO BACK" ID="btnReturn" OnClick="btnReturn_Click" />
        </div>
    </form>
</body>
</html>
