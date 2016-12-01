<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Govote.aspx.cs" Inherits="Govote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="margin-left:200px">
        <tr>
            <td>
    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="View Candidate" Height="180px" width="400px" CssClass="green" />
            </td>
            <td>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Start Voting" Height="180px" width="400px" CssClass="green" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>

