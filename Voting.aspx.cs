using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Voting : System.Web.UI.Page
{
    DataSet ds;
    CommonCode ob = new CommonCode();
    Image[] img;
    Label[] brk;
    Label[] txt;
    RadioButton[] rd;
    Label[] brk1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
             string name = Request.QueryString["no"].ToString();
             string uid = Request.QueryString["uid"].ToString();
             string qry = "select * from user_details where UserID='"+uid+"'";
             ds = ob.ExeAdapter(qry, "user_details");
             string vt = ds.Tables["user_details"].Rows[0]["vote"].ToString();
           //  Response.Write(vt);
             if (vt.Equals(""))
             {
             int count = Convert.ToInt32(name);
             img = new Image[count];
             rd = new RadioButton[count];
             brk = new Label[count];
             brk1 = new Label[count];
             txt = new Label[count];
             string query = "select * from CandidateRegistration";
             ds = ob.ExeAdapter(query, "CandidateRegistration");
             int a = ds.Tables["CandidateRegistration"].Rows.Count;

            
                for (int index = 0; index < count; index++)
                {
                    img[index] = new Image();
                    string st = ds.Tables["CandidateRegistration"].Rows[a - 1]["ElectionSign"].ToString();
                    img[index].ImageUrl = st;
                    img[index].Width = 200;
                    img[index].Height = 200;
                    rd[index] = new RadioButton();
                    rd[index].GroupName = "vote";
                    rd[index].Text = "Vote";
                    rd[index].Visible = true;
                    string st1 = ds.Tables["CandidateRegistration"].Rows[(a - 1)]["CandidateName"].ToString();
                    brk[index] = new Label();
                    brk[index].Text = "<br><br>";
                    txt[index] = new Label();
                    txt[index].Text = st1;
                    brk1[index] = new Label();
                    brk1[index].Text = "<br/><br/><hr/>";

                    a--;
                    PlaceHolder1.Controls.Add(img[index]);
                    PlaceHolder1.Controls.Add(brk[index]);
                    PlaceHolder1.Controls.Add(txt[index]);

                    PlaceHolder1.Controls.Add(rd[index]);
                    PlaceHolder1.Controls.Add(brk1[index]);
                  
                }
                
             
             }
            else
            {
                Response.Write("<script>alert('You Already Gave Your Presious Vote')</script>");
                Response.Redirect("Dashboard.aspx");
            }
        }
       
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString.Count > 0)
        {
            string uid = Request.QueryString["uid"].ToString();
            string name = Request.QueryString["no"].ToString();
            int count = Convert.ToInt32(name);
            for(int i=0;i<count;i++)
            {
               if(rd[i].Checked)
               {
                   string qry="select * from voting where CandidateName='" +txt[i].Text+"'";
                   ds = ob.ExeAdapter(qry,"voting");
                   string k=ds.Tables["voting"].Rows[0]["numberofvote"].ToString();
                   int j = Convert.ToInt32(k);
                   j = j + 1;
                   qry = "update voting set numberofvote="+j+"where CandidateName='" + txt[i].Text + "'";
                   ob.ExeQuery(qry);
                   qry = " update user_details set vote='yes' where UseriD='" + uid + "'";
                   ob.ExeAdapter(qry, "user_details");

                   Response.Redirect("Dashboard.aspx");
               }
            }
        }
    }
}