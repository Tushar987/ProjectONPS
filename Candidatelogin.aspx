<%@ Page Title="Candidate LOGIN||ONPS" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Candidatelogin.aspx.cs" Inherits="Candidatelogin" %>

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
                     <h1 align="center">Log In Candidate</h1>
            </div>
        <hr />
        <br />
        <table align="center" height="230px">
            <tr>
                <td class="font" align="right">Candidate Emailid:</td>
                <td >
                    <asp:TextBox ID="Cname" runat="server" TextMode="Email" CssClass="glow" width="200px" placeholder="Enter Your Email"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font" align="right">Candidate Password</td>
                <td class="font">
                    <asp:TextBox ID="TextBox2" runat="server" Width="200px" TextMode="Password" CssClass="glow" placeholder="Enter Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="font">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Login" CssClass="blue" Width="80px" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        </div>
</asp:Content>
