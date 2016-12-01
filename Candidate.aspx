<%@Page  Title="Candidate Profile||ONPS" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Candidate.aspx.cs" Inherits="Candidate" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        
        .auto-style2 {
            width: 388px;
        }
        .auto-style3 {
            width: 388px;
            height: 13px;
        }
        .auto-style4 {
            height: 13px;
        }
        .auto-style5 {
            width: 388px;
            height: 23px;
        }
        .auto-style6 {
            height: 23px;
        }
        #my{
            background-image:url(img/2.jpg);
            background-repeat:no-repeat;
            background-size:cover;
        }
        #img{
            margin-left:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div id="my">
    <div id="img">

        <asp:Label ID="lbl_name" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="X-Large" ForeColor="#0049B7"></asp:Label>
        <br />
        <asp:Image ID="Image1" runat="server" BackColor="#FFFFCC" Height="200px" ImageUrl="~/img/user.png" Width="150 px" BorderColor="#660033" BorderStyle="Solid" BorderWidth="2px"/>
        <div style="margin-left:15px">

        </div>
        </div>
                    <asp:FileUpload ID="FileUpload1" runat="server" Height="16px" class="red"/>
        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        <table >
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Upload" class="green"/>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="font">Professional skill:<br class="Apple-interchange-newline" />
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Label" CssClass="font1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                </td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Study Details:</td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="Label" CssClass="font1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Home Town:</td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="Label" class="font1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Poitical View:</td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="Label" class="font1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Qutation Of Party:</td>
                <td>
                    <asp:Label ID="Label6" runat="server" Text="Label" CssClass="font1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Name Of Party:</td>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="Label" CssClass="font1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Aim of Party:</td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="Label" CssClass="font1"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Answer Question" CssClass="blue" />
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" style="margin-left: 30px" Text="Settings" class="blue"/>
                </td>
                <td>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" style="margin-left: 51px" Text="Edit Profile" CssClass="green"/>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
</asp:Content>
