using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_user_Click(object sender, EventArgs e)
    {
        Server.Transfer("Userlogin.aspx");
    }
    protected void btn_candidate_Click(object sender, EventArgs e)
    {
        Server.Transfer("Candidatelogin.aspx");
    }
    protected void lnk_user_Click(object sender, EventArgs e)
    {
        Response.Redirect("userregister.aspx");
    }
    protected void lnk_candidate_Click(object sender, EventArgs e)
    {
        Response.Redirect("CandidateRegistration.aspx");
    }
}