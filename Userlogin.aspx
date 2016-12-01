<%@ Page Title="User LOGIN||ONPS" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserLogin.aspx.cs" Inherits="Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
         .auto-style2 {
            height: 25px;
             }
        .container{
            background-image:url("img/3a.jpg");
        }
        .header{
            background-color:azure;
        }
    </style>
    <link rel="stylesheet" href="css/Mine.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div class="container">
        <hr />
            <div class="header">
                     <h1 align="center">Log In user</h1>
            </div>
        <hr />
        <br />
        <table align="center" height="230px">
            <tr>
                <td class="font" align="right">User's Emailid:</td>
                <td >
                    <asp:TextBox ID="txt_email" runat="server" TextMode="Email" CssClass="glow" width="200px" placeholder="Enter Your Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font" align="right">Enter Your Password</td>
                <td class="font">

                    <asp:TextBox ID="txt_pass" runat="server" Width="200px" TextMode="Password" CssClass="glow" placeholder="Enter Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="font">
                    <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="blue" Width="80px" OnClick="btn_login_Click"/>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lbl_text" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>



            


        </div>
</asp:Content>