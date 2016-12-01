<%@ Page Title="Post Question||ONPS" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Question.aspx.cs" Inherits="Question" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 690px;
            
            border-collapse:collapse;
        }
        .auto-style4 {
            width: 244px;
            height: 85px;
        }
        .auto-style5 {
            width: 624px;
            height: 85px;
        }
        .auto-style6 {
            height: 85px;
            width: 219px;
        }
        .auto-style10 {
            width: 244px;
            height: 107px;
        }
        .auto-style11 {
            width: 624px;
            height: 107px;
        }
        .auto-style12 {
            height: 107px;
            width: 219px;
        }
        .auto-style13 {
            width: 244px;
            height: 350px;
        }
        .auto-style14 {
            width: 624px;
            height: 350px;
        }
        .auto-style15 {
            height: 350px;
            width: 219px;
        }
        .auto-style16 {
            width: 95%;
            border-collapse: collapse;
            height: 268px;
            background-color: #808080;
            opacity:0.7;
        }
        .auto-style17 {
            height: 43px;
        }
        .auto-style18 {
            width: 46px;
        }
        .auto-style20 {
        }
        .auto-style23 {
            width: 382px;
        }
        .auto-style28 {
            width: 62px;
        }
        .auto-style29 {
            width: 46px;
            height: 5px;
        }
        .auto-style30 {
            width: 62px;
            height: 5px;
        }
        .auto-style33 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: medium;
            font-weight: bold;
            font-style: normal;
            font-variant: normal;
            color: #0c439a;
            text-decoration: underline;
            height: 19px;
        }
        .auto-style34 {
            width: 46px;
            height: 19px;
        }
        .auto-style35 {
            height: 19px;
            width: 51px;
        }
        .auto-style36 {
            width: 51px;
            height: 5px;
        }
        .auto-style37 {
            width: 51px;
        }
        .container{
            height: 588px;
            background-image: url('img/2a.jpg');
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="container">

 
                    <table cellpadding="2">
                        <tr>
                            <td class="auto-style17" colspan="4"></td>
                        </tr>
                        <tr>
                            <td class="auto-style29"></td>
                            <td class="auto-style30"></td>
                            <td class="auto-style23" rowspan="3">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="textarea" Height="120px" TextMode="MultiLine" Width="359px" placeholder="Write Your Question"></asp:TextBox>
                                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" CssClass="font1" Display="Dynamic" ErrorMessage="* Question Field Must Be Filled" Font-Bold="True" Font-Italic="True" Font-Size="XX-Small"></asp:RequiredFieldValidator>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <br />
                                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="b_post" runat="server" CssClass="blue" Text="Post Question" Width="100px" OnClick="b_post_Click" />
                            </td>
                            <td class="auto-style36"></td>
                        </tr>
                        <tr>
                            <td class="auto-style34"></td>
                            <td class="auto-style33"><strong><em>Question:-</em></strong></td>
                            <td class="auto-style35"></td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp;</td>
                            <td class="auto-style28">&nbsp;</td>
                            <td class="auto-style37">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp;</td>
                            <td class="auto-style20" colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Label ID="Label1" runat="server" CssClass="font1" Font-Bold="True" Font-Italic="True" Font-Size="X-Small"></asp:Label>
                                &nbsp;</td>
                            <td class="auto-style37">&nbsp;</td>
                        </tr>
                    </table>
    </div>

    </asp:Content>
