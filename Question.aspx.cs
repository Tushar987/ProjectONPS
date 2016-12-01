using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Question : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    string uid, email;
    string query;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlDataAdapter da;
        
        
        string connectionstring = @"server=TUSHARGUPTA\SQLEXPRESS;Database=Project;Integrated Security=true";
        cn = new SqlConnection(connectionstring);
        if (Session["id"] != null)
        {
            uid = Session["id"].ToString();

            query = "Select email from user_details where userid=@id";
            SqlParameter[] parameter = new SqlParameter[]
                {
                    new SqlParameter("@id",uid)
                };


            da = new SqlDataAdapter(query, cn);
            da.SelectCommand.Parameters.AddRange(parameter);
            DataSet ds = new DataSet();
            da.Fill(ds, "que");
            

            email = ds.Tables["que"].Rows[0]["email"].ToString();
        }
        else
        {
            Response.Write("<script>You must Login to Ask Question</script>");
            Response.Redirect("UserLogin.aspx");
        }
    }
    protected void b_post_Click(object sender, EventArgs e)
    {
        cn.Open();
        string que=TextBox2.Text;
        string query = "insert into Question(User_que,User_mail,User_ID) values(@que,@mail,@id)";
        SqlParameter[] parameter = new SqlParameter[]{
            new SqlParameter("@que",que),
            new SqlParameter("@id",uid),
            new SqlParameter("@mail",email)
        };
        cmd = new SqlCommand(query, cn);
        cmd.Parameters.AddRange(parameter);
        int x = cmd.ExecuteNonQuery();
        if (x > 0)
        {
            Label1.Text = "Question Posted:";
            Response.Redirect("Dashboard.aspx");
        }
        else
            Label1.Text = "Question not Posted:";
        cn.Close();
    }
}