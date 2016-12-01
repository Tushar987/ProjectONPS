<%@ Page Title="Update Profile||ONPS" Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserUpdate.aspx.cs" Inherits="update" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .auto-style1 {
            width: 99%;
            height:610px;
            border-collapse: collapse;
            border-style: solid;
            border-width: 1px;
            border-color: #000066;
            margin-left:10px;
            background-image: url('img/3a.jpg');

                }
        #img_user
        {
                        margin-left:10px;
        }
        .container{
            background-color:#bfb8b0;
        }
        
      </style>
     

    <script type="text/javascript">
        function validate3()
        {
            var mail = document.getElementbyId("txt_mail");
            var address = document.getElementById("txt_address");
            var mob = document.getElementById("txt_mobile");
           


            if (mail.value == "tushar@gmail.com") {
                alert('Please enter your new Email');
                mail.focus();
                return false;
            }
            
            if (address.value == "") {
                alert('Please enter your new address');
                address.focus();
                return false;
            }
            if (mob.value == "") {
                alert('Enter your new phone no');
                mob.focus();
                return false;
            }
            
            return true;
        }
        function validate2()
        {
            var password = document.getElementById("<%=txt_pass.ClientID%>");
            var password1 = document.getElementById("<%=txt_newpass.ClientID%>");
            var cpassword = document.getElementById("<%=txt_newpass2.ClientID%>");

            if (password.value == "") {
                alert('Enter your old password');
                password.focus();
                return false;
            }
            if (password1.value == "") {
                alert('Enter your new password');
                password1.focus();
                return false;
            }
            if (password1.value.length <= 7) {
                alert("minimum lenght 8 char");
                password1.focus();
                return false;
            }
            if (cpassword.value == "") {
                alert('Enter your confirm password');
                cpassword.focus();
                return false;
            }
            if (password1.value != cpassword.value) {
                alert("Password does not match");
                cpassword.focus();
                return false;
            }
            return true;
        }
    </script>

</asp:content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div  class=container>
        <hr size="5" />
        <asp:Image ID="img_user" runat="server" Height="127px"  Width="119px"  BorderColor="#660033" BorderStyle="Solid" BorderWidth="2px" />
    
        <asp:Label ID="lbl_name" runat="server" Font-Bold="True" Font-Names="Century Gothic" Font-Size="X-Large" ForeColor="#993300"></asp:Label>
        
        <asp:Button ID="btn_logout" runat="server" OnClick="btn_logout_Click" style="margin-left:800px;margin-bottom:10px" Height="50px" Width="200px" Text="Logout" CssClass="red"  />
        <hr size="5" />
        <table cellpadding="5" cellspacing="1" class="auto-style1">
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
                    
                            <asp:TextBox ID="txt_mail" runat="server" OnTextChanged="txt_mail_TextChanged" AutoPostBack="True"></asp:TextBox>
                            <asp:Label ID="lbl_email" runat="server" ForeColor="#DB4F43" ></asp:Label>
                        
                    
                </td>
                <td>
                    &nbsp;
                </td>
                
            </tr>
            
            <tr>
                <td class="font">Mobile No. :</td>
                <td>
                    <asp:TextBox ID="txt_mobile" runat="server" TextMode="Phone"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Address : </td>
                <td>
                    <asp:TextBox ID="txt_address" runat="server" Columns="30" Rows="6" TextMode="MultiLine"></asp:TextBox>
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
                <td class="font">Upload Profile Photo :</td>
                <td>
                    <asp:FileUpload ID="upload_profile" runat="server" />
                    (only jpeg,jpg,png are allowed)</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="font">Update Password :</td>
                <td>
                            
                                    <asp:TextBox ID="txt_pass" runat="server" placeholder="Old Password" TextMode="Password"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txt_newpass" runat="server" placeholder="New Password" TextMode="Password"></asp:TextBox>
                                    <br />
                                    <asp:TextBox ID="txt_newpass2" runat="server" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                                    <br />
                                    <asp:Button ID="btn_chngpwd" runat="server" OnClick="btn_chngpwd_Click" OnClientClick="return validate2()" Text="Change Password" CssClass="blue" />
                    <asp:Label ID="lbl_pass" runat="server" AssociatedControlID="btn_chngpwd" ForeColor="#F26F6F"></asp:Label>
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
            <tr>
                <td>&nbsp;</td>
                <td style="margin-left: 80px">
                    <asp:Button ID="btn_update" runat="server" Text="Update Profile" OnClientClick="return validate3()" OnClick="btn_update_Click" CssClass="blue"  />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
      </div>
</asp:Content>
