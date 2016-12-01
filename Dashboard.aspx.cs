using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class dashboard : System.Web.UI.Page
{
    string alert;
    string query;
    string uid;
    string voterid;
    CommonCode common = new CommonCode();
    protected void Page_Load(object sender, EventArgs e)
    {
        /*Session["count"]=Convert.ToInt32(Session["count"])+1;
        Response.Write("Session Count :" + Session["count"]+"<br/>");*/

        if (Session["id"] != null)
        {
            uid = Session["id"].ToString();

            query = "Select * from user_details where userid=@id";
            SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@id",uid)
                };



            DataSet ds = common.ExeAdapter(query, parameter, "users");

            string username = ds.Tables["users"].Rows[0]["name"].ToString();
            string email = ds.Tables["users"].Rows[0]["email"].ToString();
            string path = ds.Tables["users"].Rows[0]["image"].ToString();
            ImageButton1.ImageUrl = path;

           /* alert+="Welcome " + username + "!";
            alert+="EmailID : " + email;
            Response.Write("<script>alert('"+alert+"')</script>");*/

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
            Response.Redirect("Userlogin.aspx");
        }

    }
protected void btn_logout_Click(object sender, EventArgs e)
{
    Session.Clear();
    Response.Redirect("UserLogin.aspx");
}
protected void btn_update_Click(object sender, EventArgs e)
{
    Response.Redirect("UserUpdate.aspx");
}
protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
{

}
protected void btn_que_Click(object sender, EventArgs e)
{
    Response.Redirect("Question.aspx");

}
protected void btn_ans_Click(object sender, EventArgs e)
{
    Response.Redirect("ViewAnswer.aspx");
}
}