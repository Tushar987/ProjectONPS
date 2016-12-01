using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class EditProfileCandidate : System.Web.UI.Page
{
    DataSet ds;
    CommonCode ob = new CommonCode();
    string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
            name = Request.QueryString["Email"].ToString();
        }
        else
        {
            Response.Redirect("Candidate.aspx");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlParameter[] parameter = new SqlParameter[] { new SqlParameter("@pass", TextBox10.Text) ,
        new SqlParameter("@cpass",chgnp.Text),
        new SqlParameter("@cont",chgcon0.Text)};
        string query="select Password from CandidateRegistration where Password=@pass";
        ds = ob.ExeAdapter(query , parameter,"CandidateRegistration");
        int count = ds.Tables["CandidateRegistration"].Rows.Count;
        SqlParameter[] parameters = new SqlParameter[] { new SqlParameter("@pass", TextBox10.Text) ,
        new SqlParameter("@cpass",chgnp.Text),
        new SqlParameter("@cont",chgcon0.Text)};
       
        if(count>0)
        {
         query = "update CandidateRegistration set Password=@cpass where Password=@pass";
         ob.ExeQuery(query, parameters);
         Response.Redirect("Candidate.aspx?Email="+name);
        }
        else
        {
            Response.Write("<script>alert('Your password is incorrect:')</script>");
        }
        


    }

}