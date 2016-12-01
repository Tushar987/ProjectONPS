<%@ Page Title="Update Profile" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="UpdateProfile.aspx.cs" Inherits="Update_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            height: 21px;
        }
        .container{
            background-image:url('img/4a.jpg');
        }
        .header{
            background-color:azure;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
    
        <hr />
    <div class="header"><h1 align="Center" >
            Edit Profile
    </h1>
        </div>
        <hr />
        &nbsp;
        <table >
            <tr>
                <td class="font">Professional Skills:</td>
                <td>
                    <asp:TextBox ID="TextBox1" runat="server" placeholder="Add Skill"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Qualification:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Qualification"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">HomeTown:</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" placeholder="HomeTown"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Political Views:</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Political View"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Name Of Party:</td>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox8" runat="server" placeholder="Party Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Quotation of Party:</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Quotation"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Goal of party:</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" placeholder="Goal"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" class="green"/>
                </td>
            </tr>
        </table>
        <br />
   </div>
</asp:Content>