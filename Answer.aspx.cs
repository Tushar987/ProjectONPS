using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Answer : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter da;
    TextBox[] t1;
    Label[] brk;
    RadioButton[] ck;
    Button[] btn;
    Label[] brk1;
    Label[] brk2;
    int x;
    RequiredFieldValidator val;
    string name;
    string email;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Request.QueryString.Count == 1)
        {
            email = Request.QueryString["email"].ToString();
            string connectionstring = @"server=TUSHARGUPTA\SQLEXPRESS;Database=Project;Integrated Security=true";
            cn = new SqlConnection(connectionstring);
            cn.Open();
            string query = "select CandidateName from CandidateRegistration where email='" + email + "'";
            da = new SqlDataAdapter(query, cn);
            ds = new DataSet();
            da.Fill(ds, "name");
            x = ds.Tables["name"].Rows.Count;
            if (x > 0)
            {
                name = ds.Tables["name"].Rows[0]["CandidateName"].ToString();
            }
            query = "select User_que from Question";
            da = new SqlDataAdapter(query, cn);
            ds = new DataSet();
            da.Fill(ds, "Question");
            x = ds.Tables["Question"].Rows.Count;
            if (x > 0)
            {
                t1 = new TextBox[x];
                brk = new Label[x];
                ck = new RadioButton[x];
                btn = new Button[x];
                brk1 = new Label[x];
                brk2 = new Label[x];
                for (int index = 0; index < x; index++)
                {
                    ck[index] = new RadioButton();
                    ck[index].ID = "ck" + index;
                    ck[index].GroupName = "radio";
                    ck[index].AutoPostBack = true;
                    ck[index].Checked = false;
                    ck[index].CheckedChanged += ck_CheckedChanged;
                    ck[index].CssClass = "font";
                    ck[index].Font.Italic = false;
                    ck[index].Font.Underline = false;
                    ck[index].Text = ds.Tables["Question"].Rows[index]["User_que"].ToString();
                    brk[index] = new Label();
                    brk[index].Text = "<br><br>";
                    t1[index] = new TextBox();
                    t1[index].ID = "txt" + index;
                    t1[index].Visible = false;
                    t1[index].CssClass = "textarea";
                    t1[index].TextMode = TextBoxMode.MultiLine;
                    btn[index] = new Button();
                    btn[index].ID = "btn" + index;
                    btn[index].Visible = false;
                    btn[index].CssClass = "blue";
                    btn[index].Text = "Post Your Answer";
                    btn[index].Click += btn_Click;
                    brk2[index] = new Label();
                    brk2[index].CssClass = "font1";
                    brk1[index] = new Label();
                    brk1[index].Text = "<br><br>";
                    PH.Controls.Add(ck[index]);
                    PH.Controls.Add(brk[index]);
                    PH.Controls.Add(t1[index]);
                    PH.Controls.Add(btn[index]);
                    PH.Controls.Add(brk2[index]);
                    PH.Controls.Add(brk1[index]);
                }
            }
            cn.Close();
        }
        else
        {
            Response.Redirect("Candidatelogin.aspx");
        }
        
    }
    protected void ck_CheckedChanged(object sender, EventArgs e)
    {
        for(int index=0;index<x;index++)
        {
            if(ck[index].Checked==true)
            {
                t1[index].Visible = true;
                btn[index].Visible = true;
                val = new RequiredFieldValidator();
                val.ErrorMessage = "Answer Must Be Written On TextBox";
                val.CssClass = "font1";
                val.Display = ValidatorDisplay.Dynamic;
                val.ControlToValidate = t1[index].ID;
                PH.Controls.Add(val);
            }
            else
            {
                t1[index].Visible = false;
                btn[index].Visible = false;
            }
        }
    }
    protected void btn_Click(object sender, EventArgs e)
    {
        cn.Open();
        string que=null, ans=null;
        for (int index = 0; index < x; index++)
        {
            if (ck[index].Checked == true)
            {
                que = ck[index].Text;
                ans = t1[index].Text;
            }
        }
        string query="insert into Answer(Candidate_name,Question,Answers)values('"+name+"','"+que+"','"+ans+"')";
        cmd = new SqlCommand(query, cn);
        int y = cmd.ExecuteNonQuery();
        if (y > 0)
        {
            for (int index = 0; index < x; index++)
            {
                if (ck[index].Checked == true)
                {
                    brk2[index].Text = "Answer Posted:";
                }
            }
        }
        else
        {
            for (int index = 0; index < x; index++)
            {
                if (ck[index].Checked == true)
                {
                    brk2[index].Text = "Answer not Posted:";
                }
            }
        }
        cn.Close();
    }
}