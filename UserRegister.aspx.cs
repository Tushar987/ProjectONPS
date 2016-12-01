using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Register : System.Web.UI.Page
{
    CommonCode common = new CommonCode();
    string error;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string query = "SELECT * FROM Country";
            common.DropList(drop_country, query, "Country_ID", "Country_Name", "--Select Country--");
            drop_state.Items.Insert(0,"--Select State--");
            drop_city.Enabled = false;
            drop_city.Items.Insert(0,"--Select City--");
            drop_state.Enabled = false;
        }
        /* DataSet ds = common.ExeAdapter(query, "Country");
         drop_country.DataSource = ds;
         drop_country.DataTextField = "Country_Name";
             drop_country.DataValueField="Country_ID";
             drop_country.DataBind();
             drop_country.Items.Insert(0,"--Select Country--");*/



    }
    
    //Country Dropox----------------------------------------------------------
    protected void drop_country_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        string str = drop_country.SelectedItem.Text;
        if (!str.Equals("--Select Country--"))
        {
            drop_state.Enabled = true;
            // label_country.Text = str + ",";
            int val = Convert.ToInt32(drop_country.SelectedItem.Value);

            string query = "SELECT State_Name,State_ID FROM State WHERE Country_ID=@Country_ID";
            SqlParameter[] parameter = new SqlParameter[]{
            new SqlParameter("@Country_ID", val)};
            common.DropList(drop_state, query, parameter, "State_ID", "State_Name", "--Select State--");
        }
        else
        {
            drop_state.Enabled = false;
            drop_city.Enabled = false;
        }

    }
    //State DropBox--------------------------------------------------------------------------------------
    protected void drop_state_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        string str = drop_state.SelectedItem.Text;

        if (!str.Equals("--Select State--"))
        {

            drop_city.Enabled = true;
            //  label_state.Text = str + ",";
            int val = Convert.ToInt32(drop_state.SelectedItem.Value);

            string query = "SELECT City_Name,City_ID FROM City WHERE State_ID=@State_ID";
            SqlParameter[] parameter = new SqlParameter[]{
            new SqlParameter("@State_ID",val)
             };
            common.DropList(drop_city, query, parameter, "City_ID", "City_Name", "--Select City--");
        }
        else
        {
               drop_city.Enabled = false;

        }


    }

    //City DropBox------------------------------------------------------------------------------------------------
    protected void drop_city_SelectedIndexChanged(object sender, EventArgs e)
    {
        string str = drop_city.SelectedItem.Text;
      //  label_city.Text = str;
    }


    // Age Validation---------------------------------------------------------------------------------------
    
    protected void txt_age_TextChanged(object sender, EventArgs e)
    {
        DateTime dob=Convert.ToDateTime(txt_age.Text);
        int check = dob.CompareTo(DateTime.Today);
      //  Response.Write(check);
        if (check<0)
        {
            TimeSpan span = DateTime.Today - dob;
            DateTime year = DateTime.MinValue + span;
            int res = year.Year - 1;//min value is 1/1/1
            if (res > 18)
            {
                img_green.Visible = true;
                img_red.Visible = false;
            }
            else
            {
                txt_age.Text = null;
                img_red.Visible = true;
                img_green.Visible = false;
                Response.Write("<script>alert('Yoy must be 18+ to Register')</script>");
            }
        }
        else
        {
            img_red.Visible = true;
            img_green.Visible=false;
            txt_age.Text = null;
            Response.Write("<script>alert('Yoy must be 18+ to Register')</script>");
        }
    
      }
     
    protected void chk_pass_CheckedChanged(object sender, EventArgs e)
    {
        if(chk_pass.Checked==true)
        {
            txt_pass.TextMode = TextBoxMode.SingleLine;
            txt_pass_confirm.TextMode = TextBoxMode.SingleLine;

        }
        else
        {
            txt_pass.TextMode = TextBoxMode.Password;
            txt_pass_confirm.TextMode = TextBoxMode.Password;

        }

    }

    
    protected void btn_register_Click(object sender, EventArgs e)
    {
        string alert = "";


        string str = FileUpload1.FileName;
        string ext = System.IO.Path.GetExtension(str);
        int id=0;

        if (ext.ToLower() == ".jpg" || ext.ToLower() == ".png" || ext.ToLower() == ".jpeg")
                {
                    try{

                    if (FileUpload1.HasFile)
                    {
                        string path = Server.MapPath("/Uploads/voterid");
                        path = path + "/" + str;


                        FileUpload1.PostedFile.SaveAs(path);

                        path = "/uploads/voterid/" +str;

                         string query = "INSERT INTO images (image,name) values(@path,@name)";
                        SqlParameter[] parameter = new SqlParameter[]
                        {
                            new SqlParameter("@path",path),
                            new SqlParameter("@name",txt_name.Text)
                        };
                        int x=common.ExeQuery(query, parameter);

                    }
                }

            //Uploading Image------------------------------------------------------------------------

            
            catch
            {
                alert += "Error uploading file";
                // Response.Write("<script>alert('" + error + "')</script>");
            }


            // Fetching Image ID-----------------------------------------------------------------------------------------------
            try
            {
                string query = "SELECT max(ImageID) from images where name=@name";
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@name",txt_name.Text)
                };
                object obj = common.ExeScalar(query, parameter);
                id = Convert.ToInt32(obj);
               // hide_upload.Value = Convert.ToString(id);

            }
            catch
            {
                alert += "Error fetching ID";
                // Response.Write("<script>alert('" + error + "')</script>");
            }


            string name = txt_name.Text;
            string mail = txt_mail.Text;
            string phone = txt_phone.Text;
            string dob = txt_age.Text;
            string pasword = txt_pass.Text;

            string state="";
            string city="";
            string country="";
            if(drop_country.Enabled)
            {
                country = drop_country.SelectedItem.Text;
            }
            if (drop_city.Enabled)
            {
                city = drop_city.SelectedItem.Text;
            }
            if (drop_state.Enabled)
            {
                state = drop_state.SelectedItem.Text;
            }
            string address = txt_address.Text + "+City=" + city + "+State=" + state+ "+Country=" + country;


            try
            {
                //uploading user_details-------------------------------------------------------------------------------
              string  query = "INSERT INTO user_details(UserID,Name,Email,dob,MobileNo,Address)" +
                      "VALUES (@id,@name,@mail,@dob,@mobile,@address)";
                SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@id",id),
                    new SqlParameter("@name",name),
                    new SqlParameter("@mail",mail),
                    new SqlParameter("@dob",dob),
                    new SqlParameter("@mobile",phone),
                    new SqlParameter("@Address",address)
                };

                int x = common.ExeQuery(query, parameter);


                //inserting login details--------------------------------------------------------------------

                query = "INSERT INTO user_login(UserID,Email,Pasword) VALUES" +
                "(@id,@email,@pasword)";
                SqlParameter[] parameter2 = new SqlParameter[]
                 {
                    new SqlParameter("@id",id),
                    new SqlParameter("@pasword",pasword),
                    new SqlParameter("@email",mail)
                    };

               x += common.ExeQuery(query, parameter2);

                if (x == 2)
                {

                    alert += "Values Inserted successfully!!\n";
                    alert += "<strong>Redirecting to Login Page</strong>";
                    Response.Write("<script>alert('" + alert + "')</script>");
                    Response.AddHeader("REFRESH", "1;URL=Login.aspx");
                    

                }
                else
                    alert += "Error Uploading Details";

            }
            catch
            {
                alert += "Error Uploading Details";
            }

    }

        else
        {
            alert += "Only Images are allowed to upload";
        }
        


       

      //  string id=hide_upload.Value;
       Response.Write("<script>alert('"+alert+"')</script>");
        





                                
    }



    protected void txt_mail_TextChanged(object sender, EventArgs e)
    {
        lbl_email.Visible = false;

        //Checking Email Validity------------------------------------------------------------------

        string query="SELECT count(Email) from user_login where Email=@mail";
        SqlParameter[] parameter = new SqlParameter[]
        {
            new SqlParameter("@mail",txt_mail.Text)
        };

        
        object obj = common.ExeScalar(query, parameter);
        int x = Convert.ToInt32(obj);

        if(x>=1)
        {
            txt_mail.Text = null;
            lbl_email.Text = "Email Already Exist";
            lbl_email.Visible = true;
        }

    }

    
}