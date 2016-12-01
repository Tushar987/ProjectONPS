<%@ Page Title="User Profile||ONPS" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="dashboard" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
width: 34%;
            border-collapse: collapse;
            float:right;
            height:50px;
            background-image:initial;
            opacity:0.8;
            background-color:#3b95c9;
            
        }
        #tushar{
            background-image:url(img/6a.jpg);
            background-repeat:no-repeat;
            background-size:cover;
            
        }
        #ImageButton1
        {
            margin-left:10px;
        }
        .auto-style2 {
            width: 99%;
            height:610px;
            border-collapse: collapse;
            border-style: solid;
            border-width: 1px;
            border-color: #000066;
            margin-left:10px;
            background-image: url('img/3a.jpg');

                }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="background-color:#bfb8b0">
    
        <br />
        <br />
        
        <hr size="5" />
        <asp:ImageButton ID="ImageButton1" runat="server" Height="127px" OnClick="ImageButton1_Click" Width="119px" BorderColor="#660033" BorderStyle="Solid" BorderWidth="2px"  />
        <asp:Label ID="lbl_name" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="X-Large" ForeColor="#993300"></asp:Label>
        <table cellpadding="0" cellspacing="1" align="bottom" class="auto-style1">
            <tr>
                <td>
                    <asp:Button ID="btn_que" runat="server" Height="60px" Width="200px" Text="Ask Question" CssClass="grey" OnClick="btn_que_Click" />
                </td>
                <td>
                    <asp:Button ID="btn_ans" runat="server" Height="60px" Width="200px" Text="View Answers" CssClass="grey" OnClick="btn_ans_Click" />
                </td>
                <td>
        <asp:Button ID="btn_update" runat="server" OnClick="btn_update_Click" Height="60px" Width="200px" Text="Update" CssClass="green" />
                </td>
                <td>
    
        <asp:Button ID="btn_logout" runat="server" OnClick="btn_logout_Click"  Height="60px" Width="200px" Text="Logout" CssClass="red" />
                </td>
            </tr>
        </table>

        <br />
        <hr size="5"  />
        <table cellpadding="5" cellspacing="1" class="auto-style2">
        <tr>
                <td class="font">User Name :</td>
                <td style="margin-left: 40px">
                    <asp:Label ID="lbl_name2" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
            
                <td class="font">Email : </td>
                <td>
                    
                   <asp:Label ID="txt_mail" runat="server" OnTextChanged="txt_mail_TextChanged" AutoPostBack="True"></asp:Label>
                     
                </td>
                <td>
                    &nbsp;
                </td>
                
            </tr>
            
            <tr>
                <td class="font">Mobile No. :</td>
                <td>
                    <asp:Label ID="txt_mobile" runat="server" TextMode="Phone"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Address : </td>
                <td>
                    <asp:Label ID="txt_address" runat="server" Columns="30" Rows="6" TextMode="MultiLine"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Voter ID :</td>
                <td>
                    <asp:Image ID="img_voterid" runat="server" BorderStyle="Solid" BorderWidth="2px" Height="220px" Width="380px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            
            <tr>
                <td>&nbsp;</td>
                <td style="margin-left: 80px">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
  </asp:Content>
