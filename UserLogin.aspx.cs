using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    string query;
    CommonCode common = new CommonCode();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_login_Click(object sender, EventArgs e)
    {
        string mail=txt_email.Text;
        string pwd=txt_pass.Text;

        query = "SELECT userID from user_LOGIN where email=@mail and Pasword=@pwd";
        SqlParameter[] parameter=new SqlParameter[]
            {
                new SqlParameter("@mail",mail),
                new SqlParameter("@pwd",pwd)
            };


        int x=Convert.ToInt32(common.ExeScalar(query, parameter));

        if(x==0)
        {
            lbl_text.Text = "UserName or Password Is Incrorect!";
        }
        else
        {
            Session["id"]=x;
            lbl_text.Text="Welcome!!";
            Response.AddHeader("REFRESH", "1;URL=dashboard.aspx");

        }

    }
}