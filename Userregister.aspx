<%@ Page Title="User Register||ONPS" Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserRegister.aspx.cs" Inherits="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
 
    </style>
    <script type="text/javascript">
        function validate()
        {
            var name=document.getElementById("txt_name");
            var mail = document.getElementById("txt_mail");
            var age = document.getElementById("txt_age");
            var pass = document.getElementById("txt_pass");
            var cpass = document.getElementById("txt_pass_confirm");


            if(name.value=="")
            {
                alert('Please enter your name');
                name.focus();
                return false;
            }
            if (mail.value == "") {
                alert('Please enter your EmailID');
                mail.focus();
                return false;
            }
            if (age.value == "") {
                alert('Please Select Your age');
                age.focus();
                return false;
            }
            if (pass.value == "") {
                alert('Please enter a Password');
                pass.focus();
                return false;
            }
            if (pass.value.length < 8)
            {
                alert('Password must be of 8 Character');
                pass.focus();
                return false;
            }
            if(cpass.value=="")
            {
                alert('Please Confirm Password');
                cpass.focus();
                return false;
            }
            return true;


        }
    </script>

 <!-- <link rel="stylesheet" href="css/mystyle.css" />-->
    <link rel="stylesheet" href="css/Mine.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
        <table >
            <tr>
                <td align="left">
                    <asp:ScriptManager ID="ScriptManager2" runat="server">
                    </asp:ScriptManager>
                </td>
                <td >
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">Name :</td>
                <td >
                    <asp:TextBox ID="txt_name" runat="server" ToolTip="Enter Full Name"  placeholder="Full Name" class="glow" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name" ErrorMessage="You Must Enter a Name" ForeColor="#DB4F43" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="left">Email :</td>
                <td >
                    <asp:TextBox ID="txt_mail" runat="server" TextMode="Email" ToolTip="Enter EmailID" placeholder="Email" class="glow" AutoPostBack="True" OnTextChanged="txt_mail_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_mail" ErrorMessage="Enter Email" ForeColor="#DB4F43" SetFocusOnError="True" Visible="False"></asp:RequiredFieldValidator>
                    <asp:Label ID="lbl_email" runat="server" ForeColor="#DB4F43" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="left">Phone No. :</td>
                <td >
                    <asp:TextBox ID="txt_phone" runat="server" MaxLength="11" TextMode="Number" ToolTip="Enter 10 Digit Number" class="glow" placeholder="Mobile no."></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="left">Address : </td>
                <td >
                    <asp:TextBox ID="txt_address" runat="server" Rows="4" TextMode="MultiLine"  class="glow" ToolTip="Enter Complete Address" Width="300px" placeholder="Address"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="glow" rowspan="3">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:DropDownList ID="drop_country" runat="server" AppendDataBoundItems="True" AutoPostBack="True" class="glow" OnSelectedIndexChanged="drop_country_SelectedIndexChanged">
                            </asp:DropDownList>
                            <br />
                            <asp:DropDownList ID="drop_state" runat="server" AppendDataBoundItems="True" AutoPostBack="True" class="glow" OnSelectedIndexChanged="drop_state_SelectedIndexChanged">
                            </asp:DropDownList><br />
                            

                            <asp:DropDownList ID="drop_city" runat="server" AppendDataBoundItems="True" AutoPostBack="True" class="glow" OnSelectedIndexChanged="drop_city_SelectedIndexChanged">
                            </asp:DropDownList><br />

                            <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1" DisplayAfter="10">
                            

                                    <ProgressTemplate>
                                        <img src="img/al.gif" width="20px"height="20px" alt="Loading.."/>
                                        Loading..
                                    </ProgressTemplate>

                             </asp:UpdateProgress>


                            
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="left">Date of Birth : </td>
                <td style="color:red" >
                    <asp:TextBox ID="txt_age" runat="server"></asp:TextBox>
                    <cc1:CalendarExtender ID="CalendarExtender1" TargetControlID="txt_age" runat="server"></cc1:CalendarExtender>
                    <asp:Image ID="img_green" runat="server" Height="15px" ImageUrl="~/img/arrow-green.gif" Visible="False" Width="15px" float="Left" AlternateText="Cross"/>
                    <asp:Image ID="img_red" runat="server" Height="15px" ImageUrl="~/img/cross-red.gif" Visible="False" Width="15px" float="left" AlternateText="Cross" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_age" ErrorMessage="Please Enter Your Age" float="left" ForeColor="#DB4F43" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr height="25px">
                <td ></td>
                <td ></td>
            </tr>
            <tr>
                <td align="left"  >Password : </td>
                <td  >
                    <asp:TextBox ID="txt_pass" runat="server" TextMode="Password" class="glow" placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txt_pass" ErrorMessage="Password field can't be empty" ForeColor="#DB4F43" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td >&nbsp;</td>
            </tr>
            <tr>
                <td align="left" >Confirm Password :</td>
                <td >
                    <asp:TextBox ID="txt_pass_confirm" runat="server" TextMode="Password" class="glow" placeholder="Repeat Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_pass" ControlToValidate="txt_pass_confirm" float="left" ErrorMessage="Passwords Do Not Match" ForeColor="#DB4F43" SetFocusOnError="True"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td >
                    <asp:CheckBox ID="chk_pass" runat="server" AutoPostBack="True" Text="Show Password" OnCheckedChanged="chk_pass_CheckedChanged" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="left">Upload Voter ID :</td>
                <td >
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="181px"/>
                    <asp:Label ID="lbl_upload" runat="server" float="left" Text="[*.jpg,*.jpeg,*.gif,*.png]"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td >&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td >
                    <asp:Button ID="btn_register" runat="server" BackColor="#FE9EC2" ForeColor="#0C2D9E" Text="Submit Request" OnClientClick="return validate()" OnClick="btn_register_Click" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td >
                    <br />
                </td>
            </tr>
            </table>
</asp:Content>
