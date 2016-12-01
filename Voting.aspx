<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Voting.aspx.cs" Inherits="Voting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <table >
        <tr>
            <td>
    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Cast Vote" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>

</asp:Content>

