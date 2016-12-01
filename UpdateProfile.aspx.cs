using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Update_Profile : System.Web.UI.Page
{
    CommonCode ob = new CommonCode();
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string name="";

        if (Request.QueryString.Count > 0)
        {
            name = Request.QueryString["Email"].ToString();

            string query = "insert into Edit(Skill,Study,Home,Pview,Qparty,Nparty,Aparty,email)values(@skill,@study,@Home,@pview,@qparty,@nparty,@aparty,@name)";
            SqlParameter[] parameter = new SqlParameter[] {
            new SqlParameter("@skill",TextBox1.Text), 
         new SqlParameter("@study",TextBox2.Text),
         new SqlParameter("@Home",TextBox3.Text),
         new SqlParameter("@pview",TextBox4.Text),
         new SqlParameter("@qparty",TextBox5.Text),
         new SqlParameter("@nparty",TextBox8.Text),
         new SqlParameter("@aparty",TextBox7.Text),
         new SqlParameter("@name",name)};
            int x=ob.ExeQuery(query, parameter);
            if(x==1)
            {
                Response.Redirect("Candidate.aspx");
            }
        }
        else
        {
            Response.Redirect("Candidatelogin.aspx");
        }
    }
}