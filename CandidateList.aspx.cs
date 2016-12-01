using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class CandidateList : System.Web.UI.Page
{
    DataSet ds;
  CommonCode ob = new CommonCode();
    Image[] img;
    Label[] brk;
    Label[] brk1;
    Label[] brk2;
    Label[] brk3;
    Label[] txt;
    Image[] img1;
   
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
             string name = Request.QueryString["no"].ToString();
            // Response.Write(name);
             int count = Convert.ToInt32(name);
             img = new Image[count];
             img1 = new Image[count];
             brk = new Label[count];
             brk1 = new Label[count];
             brk2 = new Label[count];
             brk3 = new Label[count];
             txt = new Label[count];
             string query = "select * from CandidateRegistration";

             ds = ob.ExeAdapter(query, "CandidateRegistration");
             int a = ds.Tables["CandidateRegistration"].Rows.Count;

             for (int index = 0; index < count; index++)
             {
                 img[index] = new Image();
                 string st = ds.Tables["CandidateRegistration"].Rows[a - 1]["profile"].ToString();
                 img[index].ImageUrl = st;
                 img[index].Width = 200;
                 img[index].Height = 200;

                 string st1 = ds.Tables["CandidateRegistration"].Rows[(a - 1)]["CandidateName"].ToString();
                 brk[index] = new Label();
                 brk[index].Text = "<br/><br/>";
                 txt[index] = new Label();
                 txt[index].Text = "Candidate Name: "+ st1;
                 txt[index].CssClass = "font";
                 brk2[index] = new Label();

                /* img1[index] = new Image();
                 string st3 = ds.Tables["CandidateRegistration"].Rows[a - 1]["ElectionSign"].ToString();
                 img1[index].ImageUrl = st3;
                 img1[index].Width = 200;
                 img1[index].Height = 200;
                 */
                 brk1[index] = new Label();
                 brk1[index].Text = "<br/><br/><hr/>";
                 a--; 
                 PlaceHolder1.Controls.Add(img[index]);
                 PlaceHolder1.Controls.Add(brk[index]);
                
                 PlaceHolder1.Controls.Add(txt[index]);
                 
                 PlaceHolder1.Controls.Add(brk1[index]);
             }

             }
    }
}