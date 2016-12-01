using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class CandidateRegistration : System.Web.UI.Page
{
    
    DataSet ds;
    
    CommonCode ob = new CommonCode();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            String query = "select * from Country";
            ob.ExeAdapter(query, "Contry");
            ob.DropList(DropDownList1, query, "Country_id", "Country_name", "---select Country---");
        }
    }

    protected void submit_Click(object sender, EventArgs e)
    {

        string path = "";
        string paths = "";
        if (FileUpload1.HasFile)
        {
            Label2.Text = "";
            string filename = FileUpload1.FileName;
            path = Server.MapPath("Uploads/Esign");
            path = path + "/" + filename;
            string[] extension = filename.Split('.');
            
            FileUpload1.PostedFile.SaveAs(path);
            Image2.Visible = true;
            Image2.ImageUrl = "~/Uploads/Esign/" + filename;
            path = "/Uploads/Esign/" + filename;
            //FileUpload1.SaveAs(path);
            /*
            else
            {
                Label2.Visible = true;
                Label2.Text = "<font color='red' size='5'>File must be a image file:</font>";
            }*/
        }

        else
        {
            Label2.Text = "<font color='red' size='5'>Please select a file:</font>";
        }
        if (FileUpload3.HasFile)
        {
            Label3.Text = "";
            string filenames = FileUpload3.FileName;
            paths = Server.MapPath("Uploads/VId");
            paths = paths + "/" + filenames;
            string[] extension = filenames.Split('.');

            FileUpload3.PostedFile.SaveAs(paths);
            ImgE.Visible = true;
            ImgE.ImageUrl = "~/Uploads/VId/" + filenames;
            paths = "/Uploads/VId/" + filenames;
            //FileUpload1.SaveAs(path);
           /* else
            {
                Label3.Visible = true;
                Label3.Text = "<font color='red' size='5'>File must be a image file:</font>";
            }*/
        }
        else
        {
            Label3.Text = "<font color='red' size='5'>Please select a file:</font>";
        }
        
        string query = "select * from CandidateRegistration where email='" + TextBox15 + "'";
       ds= ob.ExeAdapter(query,"CandidateRegistration");
        int count=ds.Tables["CandidateRegistration"].Rows.Count;
        string gender;
        if (RadioButton1.Checked)
        {
            gender = RadioButton1.Text;
        }
        else
            gender = RadioButton2.Text;
        SqlParameter[] parameter = new SqlParameter[]{
                    new SqlParameter("@email",TextBox15.Text),
                     new SqlParameter("@Cname",TextBox1.Text), 
                      new SqlParameter("@Address",TextBox2.Text),
                       new SqlParameter("@Mnum",TextBox3.Text),
                        new SqlParameter("@Fname",TextBox4.Text),
                         new SqlParameter("@Foc",TextBox5.Text),
                         new SqlParameter("@Tplace",TextBox6.Text),
                         new SqlParameter("@Esign",paths),
                         new SqlParameter("@Exp",TextBox7.Text),
                         new SqlParameter("@Vimg",path),
                         new SqlParameter("@Gen",gender),
                         new SqlParameter("@Pass",TextBox9.Text),
                         new SqlParameter("@National",DropDownList1.SelectedItem.Text) 
                         ,new SqlParameter("@dob",TextBox16.Text)

             
            };
        if (count == 0)
        {
            query = "insert into CandidateRegistration(CandidateName,Address,MobileNumber,FatherName,FatherOccupation,Ticketplace,Experiance,Nationality,Gender,Password,email,Dob,Electionsign,VoterId) values(@Cname,@Address,@Mnum,@Fname,@Foc,@Tplace,@Exp,@National,@Gen,@Pass,@email,@dob,@Esign,@Vimg)";

            ob.ExeQuery(query, parameter);
            Label1.Text = "Register Successfully";
            query = "insert into voting(CandidateName,numberofvote) values('"+TextBox1.Text+"',0) ";
            ob.ExeQuery(query);
            Response.Redirect("Candidatelogin.aspx");
        }
        else
        {
            Label1.Text = "this Email id is already Register";
        }

    }



    
}
