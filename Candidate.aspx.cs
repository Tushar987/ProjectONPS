using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Candidate : System.Web.UI.Page
{
    DataSet ds;
   CommonCode ob =new CommonCode();
   string name;
   string candidatename;
    protected void Page_Load(object sender, EventArgs e)
    {

        
        
        if (Request.QueryString.Count > 0)
        {
            name = Request.QueryString["Email"].ToString();
            string qury = "select CandidateName from CandidateRegistration where email='" + name + "'";
            ds = ob.ExeAdapter(qury, "CandidateRegistration");
            candidatename = "";
            if (ds.Tables["CandidateRegistration"].Rows.Count > 0)
            candidatename= ds.Tables["CandidateRegistration"].Rows[0]["CandidateName"].ToString();
        }
        else
        {
            Response.Redirect("Candidatelogin.aspx");
        }
        string qry = "select profile from CandidateRegistration where email='" + name + "'";
        ds = ob.ExeAdapter(qry, "CandidateRegistration");
       if(ds.Tables["CandidateRegistration"].Rows.Count>0)
       {
           Image1.ImageUrl = ds.Tables["CandidateRegistration"].Rows[0]["profile"].ToString();
       }
       else
       {
           Image1.ImageUrl = ds.Tables["CandidateRegistration"].Rows[0]["profile"].ToString();

       }
        string query = "select * from Edit where email='"+name+"'";
         ds=ob.ExeAdapter(query, "Edit");
         if (ds.Tables["Edit"].Rows.Count != 0)
         {
             lbl_name.Text = candidatename;
             Label2.Text = ds.Tables["Edit"].Rows[0]["Skill"].ToString();
             Label3.Text = ds.Tables["Edit"].Rows[0]["Study"].ToString();
             Label4.Text = ds.Tables["Edit"].Rows[0]["Home"].ToString();
             Label5.Text = ds.Tables["Edit"].Rows[0]["Pview"].ToString();
             Label6.Text = ds.Tables["Edit"].Rows[0]["Qparty"].ToString();
             Label7.Text = ds.Tables["Edit"].Rows[0]["Nparty"].ToString();
             Label8.Text = ds.Tables["Edit"].Rows[0]["Aparty"].ToString();
         }
         else
         {
             Label2.Text = "";
             Label3.Text = "";
             Label4.Text = "";
             Label5.Text = "";
             Label6.Text = "";
             Label7.Text = "";
             Label8.Text = "";
         }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (FileUpload1.HasFile)
        {
             string name = "";
        if (Request.QueryString.Count > 0)
        {
            name = Request.QueryString["Email"].ToString();
        }
            Label1.Text = "";
            string filename = FileUpload1.FileName;
            string path = Server.MapPath("uploads/Dp");
            path = path + "/" + filename;
            string[] extension = filename.Split('.');
            if (extension[1] == "jpeg" || extension[1] == "jpg")
            {
                FileUpload1.PostedFile.SaveAs(path);
                Image1.Visible = true;
                Image1.ImageUrl = "~/uploads/Dp/" + filename;
                //FileUpload1.SaveAs(path);
              path = "/uploads/Dp/" + filename;
                string qry="update CandidateRegistration set profile='"+path+"' where email='"+name+"'";
                ob.ExeAdapter(qry, "CandidateRegistration");
            }
            else
            {
                Label1.Text = "<font color='red' size='5'>File must be a image file:</font>";
            }
        }
        else
        {
            Label1.Text = "<font color='red' size='5'>Please select a file:</font>";
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string name = "";
        if (Request.QueryString.Count > 0)
        {
            name = Request.QueryString["Email"].ToString();
        }
        //Response.Redirect("Update Profile.aspx");
        Response.Redirect("UpdateProfile.aspx?Email=" + name);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditProfileCandidate.aspx?Email="+name);
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        string name = "";
        if (Request.QueryString.Count > 0)
        {
            name = Request.QueryString["Email"].ToString();
        }
       // Response.Redirect("ans.aspx");
        Response.Redirect("Answer.aspx?email=" +name);
    }
}