<%@ Page Title="View Answers||ONPS" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAnswer.aspx.cs" Inherits="ViewAnswer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-collapse: collapse;
            height: 481px;
            background-color: #C0C0C0;
        }
        .auto-style2 {
            width: 30px;
        }
        .auto-style3 {
            width: 836px;
        }
        .auto-style4 {
            width: 30px;
            height: 59px;
        }
        .auto-style5 {
            width: 836px;
            height: 59px;
        }
        .auto-style6 {
            height: 59px;
        }
        .auto-style7 {
            width: 30px;
            height: 329px;
        }
        .auto-style8 {
            width: 836px;
            height: 329px;
        }
        .auto-style9 {
            height: 329px;
        }
        .auto-style10 {
            width: 836px;
            height: 55px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <table cellpadding="2">
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style5"></td>
                <td class="auto-style6"></td>
            </tr>
            <tr>
                <td class="auto-style7" rowspan="2"></td>
                <td class="auto-style10">
                    <asp:PlaceHolder ID="PH" runat="server"></asp:PlaceHolder>
                </td>
                <td class="auto-style9" rowspan="2"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

    </asp:Content>

