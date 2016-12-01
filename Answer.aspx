<%@ Page Title="Answer Voter's question" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Answer.aspx.cs" Inherits="Answer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
       .header{
            background-color:#0094ff;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="css/mystyle.css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <hr/>
          <div class="header">
              <h1 align="Center">Select the Question to Answer</h1>
          </div>
            <hr/>
        
                
                    <table cellpadding="2">
                        <tr>
                            <td>
                                <asp:PlaceHolder ID="PH" runat="server"></asp:PlaceHolder>
                            </td>
                        </tr>
                    </table>
                
   </asp:Content>
