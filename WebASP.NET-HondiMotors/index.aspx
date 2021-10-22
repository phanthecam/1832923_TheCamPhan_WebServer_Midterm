<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WebASP.NET_HondiMotors.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hondi Motors</title>

    <style type="text/css">
        .BigTable {
            width: 740px;
            margin-left: auto;
            margin-right: auto;
        }

        .leftTable {
            padding-left: 0px;
        }

        .lable {
            width: 120px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .rowWidth {
            width: 250px;
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .myPanelLeft {
            margin-top: 0px;
            border-color: darkred;
        }

            .myPanelLeft fieldset {
                border-color: darkblue;
            }

        .myPanelRightTop fieldset {
            border-color: darkblue;
            margin-top: 0px;
            height: 220px;
            width: 290px;
        }

        .myPanelRightBot fieldset {
            border-color: darkblue;
            margin-top: 8px;
            height: 330px;
            width: 290px;
        }

        .myPanelRightTop legend{
            color: darkblue;
            font-weight: bold;
        }

        .myPanelRightBot legend{
            color: darkblue;
            font-weight: bold;
        }

        .myPanelLeft legend{
            color: darkblue;
            font-weight: bold;
        }

        .input {
            width: 100px;
            height: 23px;
        }

        .button {
            background-color: darkblue; 
            color: white;
            padding: 6px 6px;
            text-align: center;
            font-size: 12px;
            float: right;
        }

        .literal {
            line-height: 1.5;
        }

    </style>
</head>
<body style="background-color: lightgray">

    <form id="form1" runat="server">
        <div>
            <h1 style="text-align: center; color: darkblue;">Hondi Build & Price</h1>
        </div>

        <br />

        <table class="BigTable">
            <tr style="vertical-align: top;">
                <td>
                    <asp:Panel ID="panCar" runat="server" GroupingText="Car Informations" Height="100%" Width="400px" CssClass="myPanelLeft" BackColor="whitesmoke">
                        <table class="leftTable">
                            <tr style="vertical-align: top;">
                                <td class="lable">
                                    <asp:Label ID="lblCity" runat="server" AccessKey="c" AssociatedControlID="txtCity" Text="Your City"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:TextBox ID="txtCity" runat="server" class="input"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="lable">
                                    <asp:Label ID="lblZipCode" runat="server" AccessKey="z" AssociatedControlID="txtZipCode" Text="Zip Code"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:TextBox ID="txtZipCode" runat="server" class="input"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="lable">
                                    <asp:Label ID="lblCar" runat="server" Text="Select Car model"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:DropDownList ID="cboCarModel" runat="server" AutoPostBack="True" Width="180px" OnSelectedIndexChanged="cboCarModel_SelectedIndexChanged">
                                        <asp:ListItem>  Select a car </asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td class="lable">
                                    <asp:Label ID="lblColor" runat="server" Text="Interior Color"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:ListBox ID="lstColor" runat="server" AutoPostBack="true" Width="150px" OnSelectedIndexChanged="lstColor_SelectedIndexChanged"></asp:ListBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="lable">
                                    <asp:Label ID="lblAccessories" runat="server" Text="Accessories"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:CheckBoxList ID="chklstAccessories" runat="server" AutoPostBack="true"></asp:CheckBoxList>
                                </td>
                            </tr>

                            <tr>
                                <td class="lable">
                                    <asp:Label ID="lblWarranty" runat="server" Text="Warranty"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:RadioButtonList ID="radlstWarranty" runat="server" AutoPostBack="true"></asp:RadioButtonList>
                                </td>
                            </tr>

                            <tr>
                                <td class="lable">
                                    <asp:Label ID="lblContact" runat="server" Text="DealerContact you by phone?"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:CheckBox ID="chkContact" runat="server" AutoPostBack="True" OnCheckedChanged="chkContact_CheckedChanged"></asp:CheckBox>
                                </td>
                            </tr>

                            <tr>
                                <td class="lable">
                                    <asp:Label ID="lblPhoneNumber" runat="server" Text="PhoneNumber"></asp:Label>
                                </td>

                                <td class="rowWidth">
                                    <asp:TextBox ID="txtPhoneNumber" TextMode="Phone" runat="server" class="input"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>

                <td>
                    <asp:Panel ID="panPrice" runat="server" GroupingText="Peice Resume" CssClass="myPanelRightTop" BackColor="whitesmoke">

                        <asp:Literal ID="litPricing" runat="server"></asp:Literal>
                        <br />
                        <asp:Button ID="btnConclude" runat="server" Text="Conclude" OnClick="btnConclude_Click" CssClass="button" />
                    </asp:Panel>

                    <br />
                    <asp:Panel ID="panInfor" runat="server" GroupingText="Final Information" CssClass="myPanelRightBot" BackColor="whitesmoke">
                        <asp:Literal ID="litInfor" runat="server"></asp:Literal>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>