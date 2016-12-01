using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class update : System.Web.UI.Page
{
    CommonCode common = new CommonCode();
    string query;
    string uid, username, email,path,voterid;
    SqlParameter[] parameter;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["id"] != null)
        {
            uid = Session["id"].ToString();

            if (!IsPostBack)
            {
                query = "Select * from user_details where userid=@id";
                parameter = new SqlParameter[]
                {
                    new SqlParameter("@id",uid)
                };



                DataSet ds = common.ExeAdapter(query, parameter, "users");

                username = ds.Tables["users"].Rows[0]["name"].ToString();
                email = ds.Tables["users"].Rows[0]["email"].ToString();
                path = ds.Tables["users"].Rows[0]["image"].ToString();
                img_user.ImageUrl = path;
                img_user.AlternateText = username;

                lbl_name.Text = lbl_name2.Text = username;
                txt_mail.Text = ds.Tables["users"].Rows[0]["email"].ToString();

                txt_mobile.Text = ds.Tables["users"].Rows[0]["mobileno"].ToString();

                //Formatting address string-----------------------------------------------------
                string address = ds.Tables["users"].Rows[0]["address"].ToString();
                string[] adr = address.Split('+');
                address = "";
                for (int i = 0; i < adr.Length; i++)
                {
                    address += adr[i] + ",";
                }
                address = address.Replace('=', '-');
                txt_address.Text = address;
            }

            ///fetching voterID from UserID------------------------------------------
            ///
            query = "select image from images where imageid=@id";
            parameter = new SqlParameter[]
            {
                new SqlParameter("@id",uid)
            };
            object vid = common.ExeScalar(query, parameter);

            voterid = vid.ToString();
            img_voterid.ImageUrl = voterid;
            img_voterid.AlternateText = username+"VoterID";









        }

        else
        {
            Response.Redirect("login.aspx");
        }

    }

    protected void btn_logout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("login.aspx");
    }
    protected void btn_chngpwd_Click(object sender, EventArgs e)
    {
        //Password Module---------------------------------------------------------

        query = "select pasword from user_login where userid=@id";
        string nw = txt_newpass.Text;
        string nw2 = txt_newpass2.Text;
        parameter = new SqlParameter[] { 
                    new SqlParameter("@pwd",nw),
                    new SqlParameter("@id",uid)
                };

        string old = common.ExeScalar(query, parameter).ToString();

        Response.Write(old);
        if (old.Equals(txt_pass.Text))
        {
            query = "update user_login set pasword=@pwd where userid=@id";
            parameter = new SqlParameter[] { 
                    new SqlParameter("@pwd",nw),
                    new SqlParameter("@id",uid)
                };
            common.ExeQuery(query, parameter);

            lbl_pass.Text = "Password changed Successfully";
            lbl_pass.Visible = true;
            txt_pass.Visible = false;
            txt_newpass.Visible = false;
            txt_newpass2.Visible = false;
            btn_chngpwd.Visible = false;
        }
        else
        {
            lbl_pass.Text = "Password Not changed";

        }

    }
    protected void btn_update_Click(object sender, EventArgs e)
    {
        string alert = "";
        string ext = System.IO.Path.GetExtension(upload_profile.FileName);
        string path;
        string mail = txt_mail.Text;
        string phone = txt_mobile.Text;
        string pasword = txt_pass.Text;
        string address = txt_address.Text;

        //uploading file--------------------------------------------------------------
        if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png" || ext.ToLower() == ".jpeg")
        {

            if (upload_profile.HasFile)
            {
                path = Server.MapPath("/Uploads/profile");
                path = path + "/" + upload_profile.FileName;


                upload_profile.PostedFile.SaveAs(path);

                path = "/uploads/profile/" + upload_profile.FileName;

                query = "update user_details set image=@path where userid=@id";
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@path",path),
                    new SqlParameter("@id",uid)
                };
                int x=common.ExeQuery(query, parameter);

                

            }
            else
            {
                path = "/Uploads/profile/user.png";
            }
        }
        else
        {
            path = "/Uploads/profile/user.png";
        }

       try
       {

            //uploading user_details-------------------------------------------------------------------------------
            query = "UPDATE user_details set email=@mail,MobileNo=@mobile,address=@address where userid=@id";
            SqlParameter[] parameter3 = new SqlParameter[]
                {
                    new SqlParameter("@id",uid),
                    new SqlParameter("@mail",mail),
                    new SqlParameter("@mobile",phone),
                    new SqlParameter("@address",address)
                };

            int z = common.ExeQuery(query, parameter3);





            //inserting login details--------------------------------------------------------------------

            query = "UPDATE user_login set Email=@mail where userID=@id";
            SqlParameter[] parameter2 = new SqlParameter[]
                 {
                    new SqlParameter("@id",uid),
                    new SqlParameter("@mail",mail)
                    };

            z += common.ExeQuery(query, parameter2);

            if (z == 2)
            {
               // Response.Write(mail + uid + phone);
                Response.AddHeader("REFRESH", "1;URL=dashboard.aspx");


            }
            else
            {
                alert += "some error occured,Both table not Updated";
                Response.Write("<script>alert('" + alert + "')</script>");
            }
         }
        catch
        {
            alert += "Error Uploading Details";
            Response.Write("<script>alert('" + alert + "')</script>");
        }
        



    }

    protected void txt_mail_TextChanged(object sender, EventArgs e)
    {
        lbl_email.Visible = false ;

        //Checking Email Validity------------------------------------------------------------------

        string query = "SELECT count(Email) from user_login where Email=@mail";
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@mail",txt_mail.Text)
        };

        Response.Write(txt_mail.Text);
        object obj = common.ExeScalar(query, parameter);
        int x = Convert.ToInt32(obj);

        if (x >= 1)
        {
            txt_mail.Text = null;
            Response.Write("exist");
            lbl_email.Text = "Email Already Exist";
            lbl_email.Visible = true;
        }
        Response.Write("ok");

    }
}