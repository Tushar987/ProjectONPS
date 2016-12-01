<%@ Page Title="Change Password||ONPS" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="EditProfileCandidate.aspx.cs" Inherits="EditProfileCandidate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-color: #FFCCCC;
           background-color:rgba(182, 255, 0, 0.71);
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style3 {
            height: 26px;
        }
        h1{
            background-color:#FFCCCC;
        }
        .container{
            background-image:url('img/6a.jpg');
        }
        .header{
            background-color:azure;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <hr />
        <div class="header">
              <h1 align="center"> Settings</h1>
        </div>
        <hr />
        <br />
        <table align="center">
            <tr>
                <td class="font">Old password:</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server"  class="glow" placeholder="Old Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">New Password:</td>
                <td class="auto-style3" style="margin-left: 280px">
                    <asp:TextBox ID="chgnp" runat="server"  class="glow" placeholder="New Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Confirm Password:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="Chgnpc" runat="server" CssClass="glow" placeholder="Confirm Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Change Contact:</td>
                <td>
                    <asp:TextBox ID="chgcon0" runat="server" CssClass="glow" placeholder="Contact Number"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="Change Password" CssClass="green" OnClick="Button2_Click" />
                </td>
            </tr>
        </table>
</div>
</asp:Content>