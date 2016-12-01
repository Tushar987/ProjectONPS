using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
  
public partial class Candidatelogin : System.Web.UI.Page
{
    CommonCode common = new CommonCode();
    DataSet ds;

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string Email = Cname.Text;
        string password = TextBox2.Text;
        string query = "select * from CandidateRegistration  where email=@email and Password=@pass";
        SqlParameter[] parameter = new SqlParameter[] { 
                new SqlParameter("@email",Email),
                new SqlParameter("@pass",password)
        };
        ds=common.ExeAdapter(query,parameter, "CandidateRegistration");
        int count = ds.Tables["CandidateRegistration"].Rows.Count;
        if (count ==1)
        {
           // Response.Redirect("Candidate.aspx");
            Response.Redirect("Candidate.aspx?Email=" + Cname.Text);
        }
        else
            Response.Write("<script>alert('Your Name id or password is incorrect:')</script>");

    }
  
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
}