<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
        }
        .container {
            background-image: url("img/3a.jpg");
        }
        #new
        {
            margin-left:200px;
        }
    </style>
        <link rel="stylesheet" href="css/Mine.css" type="text/css" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" >
    <table align="center" cellpadding="5" cellspacing="1" height="420px" id="new">
        <tr>
            <td>
                <asp:Button ID="btn_user" runat="server" Text="User Login" class="green"  width="100%" height="100%" OnClick="btn_user_Click" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_candidate" runat="server" Text="Candidate Login" CssClass="green" width="100%" height="100%" OnClick="btn_candidate_Click" />



            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="lnk_user" runat="server" class="font" OnClick="lnk_user_Click">Register as a USER</asp:LinkButton>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                <asp:LinkButton ID="lnk_candidate" runat="server" class="font" OnClick="lnk_candidate_Click">Register as a CANDIDATE</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</div>
 <br/>


</asp:Content>

