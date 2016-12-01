using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class ViewAnswer : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter da;
    Label[] brk;
    Label[] brk1;
    Label[] brk2;
    Label[] brk3;
    Label[] brk0;
    Label[] brk4;
    Label[] brk5;
    Label[] brk6;
    int x;
    protected void Page_Load(object sender, EventArgs e)
    {
        string connectionstring = @"server=TUSHARGUPTA\SQLEXPRESS;Database=Project;Integrated Security=true";
        cn = new SqlConnection(connectionstring);
        cn.Open();
        string query = "select Answers,Question,Candidate_name from Answer";
        da = new SqlDataAdapter(query,cn);
        ds = new DataSet();
        da.Fill(ds, "Answer");
        x = ds.Tables["Answer"].Rows.Count;
        if (x > 0)
        {
            brk0 = new Label[x];
            brk = new Label[x];
            brk1 = new Label[x];
            brk2 = new Label[x];
            brk3 = new Label[x];
            brk4 = new Label[x];
            brk5 = new Label[x];
            brk6 = new Label[x];
            for (int index = 0; index < x; index++)
            {
                brk0[index] = new Label();
                brk0[index].Text = "Question:-";
                brk0[index].CssClass = "font";
                brk[index] = new Label();
                brk[index].Text = ds.Tables["Answer"].Rows[index]["Question"].ToString();
                brk[index].CssClass = "font1";
                brk[index].Font.Italic = false;
                brk2[index] = new Label();
                brk2[index].Text = "<br>";
                brk4[index] = new Label();
                brk4[index].Text = "Answer:-";
                brk4[index].CssClass = "font";
                brk1[index] = new Label();
                string str = ds.Tables["Answer"].Rows[index]["Answers"].ToString();
                if (str.Equals(""))
                {
                    brk1[index].Text = "[NOT ANSWERED]";
                }
                else
                {
                    brk1[index].Text = str;
                }
                brk1[index].CssClass = "font1";
                brk1[index].Font.Italic = false;
                brk5[index] = new Label();
                brk5[index].Text = "Answered by:-";
                brk5[index].CssClass = "font";
                

                brk6[index] = new Label();
                string ans = ds.Tables["Answer"].Rows[index]["Candidate_name"].ToString();
                if(ans.Equals(""))
                {
                    brk6[index].Text = "<<Not Yet Answered>>";
                }
                else
                {
                    brk6[index].Text = ans;
                }

                brk6[index].CssClass = "font1";
                

                brk3[index] = new Label();
                brk3[index].Text = "<br><br>";
                PH.Controls.Add(brk0[index]);
                PH.Controls.Add(brk[index]);
                PH.Controls.Add(brk2[index]);
                PH.Controls.Add(brk4[index]);
                PH.Controls.Add(brk1[index]);
                
                PH.Controls.Add(brk5[index]);
                PH.Controls.Add(brk6[index]);
                PH.Controls.Add(brk3[index]);
            }
        }
        cn.Close();
    }
}