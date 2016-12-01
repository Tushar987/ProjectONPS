<%@ Page Title="Candidate Register" Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="CandidateRegistration.aspx.cs" Inherits="CandidateRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

   
    <script type="text/javascript" >
        function validate()
        {
            
            var name = document.getElementById("TextBox1");
            var addrss = document.getElementById("TextBox2");
            var fathername = document.getElementById("TextBox3");
            var mobilenumber = document.getElementById("TextBox4");
            var fatheroc = document.getElementById("TextBox5");
            var ticketplace = document.getElementById("TextBox6");
            var exp = document.getElementById("TextBox7");
            var  dob= document.getElementById("TextBox8");
            var pass = document.getElementById("TextBox9");
            var conpass = document.getElementById("TextBox10")
            if (conpass.Value != pass.Value)
            {
                alert('password does not match')
                conpass.focus();
                return false;
            }
            if(name.Value=="")
            {
                alert('Please enter your name:');
                name.focus();
                return false;
            }
            if(addrss.value=="")
            {
                alert('Please enter your address:');
                addrss.focus();
                return false;
            }
            if(fathername.value=="")
            {
                alert('Please enter your fathername:');
                fathername.focus();
                return false;
            }
            if(mobilenumber.value=="")
            {
                alert('Please enter your mobilenumber:');
                mobilenumber.focus();
                return false;
            }
            if(fatheroc.value=="")
            {
                alert('Please enter your Fatheroccupation:');
                fatheroc.focus();
                return false;
            }
            if(ticketplace.value=="")
            {
                alert('Please enter from where fighting in election:');
                ticketplace.focus();
                return false;
            }
            if(exp.value=="")
            {
                alert('Please enter your previous experiance:');
               exp.focus();
                return false;
            }
            if(dob.value=="")
            {
                alert('Please enter your Date of Birth:');
                dob.focus();
                return false;
            }
            if (dob.value == "") {
                alert('Please enter your Date of Birth:');
                dob.focus();
                return false;
            }
            if(pass.value=="")
            {
                alert('Please enter your password:');
                pass.focus();
                return false;
            }
            if(pass.value.length <= 7)
            {
                alert('password have atleast length 7:');
                pass.focus();
                return false;
            }
                    
            return true;
        }
    </script>
    <style type="text/css">
        .auto-style2 {
            width: 70%;
            border: 1px solid #000000;
            background-color: rgba(215, 174, 43, 0.75);
            
        }
        .auto-style4 {
            height: 21px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            height: 30px;
        }
        .auto-style8 {
            height: 133px;
        }
        .auto-style9 {
            height: 2px;
        }
        .auto-style10 {
            height: 23px;
        }
        .container{
            background-image:url('img/1a.jpg');
        }
    </style>
    <link rel="stylesheet" href="css/Mine.css" type="text/css" />
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
         <asp:scriptmanager runat="server"></asp:scriptmanager>
        <hr />
    <div class="header">
    <h1 align="center">Registration for Candidate</h1>
        </div>
        <hr />
        <br />
        <table align="center">
            <tr>
                <td>Candidate Name:</td>
                <td class="font">
                    <asp:TextBox ID="TextBox1" runat="server" Width="176px" placeholder="Name"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Candidate Address:</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" placeholder="Address" TextMode="MultiLine" Width="199px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">Mobile Number:</td>
                <td class="auto-style7">
                    <asp:TextBox ID="TextBox3" runat="server" placeholder="Mobile Number" Width="174px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">Father's Name:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox4" runat="server" placeholder="Father's Name" Width="183px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Father's Occupation:</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" placeholder="Father's Occupation" Width="162px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4"></td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">Ticket Place:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox6" runat="server" placeholder="Place" Width="139px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    </asp:UpdatePanel>
                </td>
                <td class="auto-style9">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8">Election Sign:</td>
                <td class="auto-style8">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <asp:FileUpload ID="FileUpload3" runat="server" />
                            <asp:Image ID="ImgE" runat="server" Height="200px" style="margin-top: 4px" Visible="False" Width="200px" />
                            <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>Experience:</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" placeholder="Experiance" style="margin-bottom: 11px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>VoterId:</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Image ID="Image2" runat="server" Height="200px" Visible="False" Width="200px" style="margin-top: 4px" />
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Date Of Birth:</td>
                <td>
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Nationality:</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" >
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="gender" Text="Male" />
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="gender" Text="female" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">Email:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">Password:</td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox9" runat="server"  TextMode="Password" Width="161px" placeholder="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    Confirm Password:</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" placeholder="Confirm Password" TextMode="Password" Width="155px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="submit" runat="server"  class="green" Text="Submit" OnClientClick="return validate()" OnClick="submit_Click"  />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
</div>
    </asp:Content>

