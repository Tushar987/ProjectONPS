using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class Govote : System.Web.UI.Page
{
    CommonCode ob = new CommonCode();
    DataSet ds;
    string uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void Button1_Click(object sender, EventArgs e)  
    {

        if (Session["id"] != null)
        {
            uid = Session["id"].ToString();
        string query="select * from CandidateRegistration";
        ds = ob.ExeAdapter(query, "CandidateRegistration");
       int c = ds.Tables["CandidateRegistration"].Rows.Count;
        Response.Redirect("Voting.aspx?no=" +c +"&uid="+uid);
        }
        else
        {
            Response.Write("<script>You have already Casted your vote</script>");
            Response.Redirect("Dashboard.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string query = "select * from CandidateRegistration";
        ds = ob.ExeAdapter(query, "CandidateRegistration");
        int c = ds.Tables["CandidateRegistration"].Rows.Count;
        Response.Redirect("CandidateList.aspx?no=" + c);
    }
    
}