using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;
using System.Web;
using System.Web.UI.WebControls;

/// <summary>Common code Summary
/// </summary>
public class CommonCode
{
    SqlConnection cn;
    SqlCommand cmd;
    DataSet ds;
    SqlDataAdapter da;
    public CommonCode()
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ToString();
        cn = new SqlConnection(con);
    }

    public void OpenConnection()
    {
        if (cn.State == ConnectionState.Closed)
        {
            cn.Open();
        }

    }

    public void CloseConnection()
    {
        if (cn.State == ConnectionState.Open)
        {
            cn.Close();
        }
    }

    public int ExeQuery(string query)
    {
        OpenConnection();
        cmd = new SqlCommand(query, cn);
        int x = cmd.ExecuteNonQuery();
        CloseConnection();
        return x;
    }

    public int ExeQuery(string query, SqlParameter[] parameter)
    {
        OpenConnection();
        cmd = new SqlCommand(query, cn);
        cmd.Parameters.AddRange(parameter);


        int x = cmd.ExecuteNonQuery();

        CloseConnection();
        return x;

    }

    public object ExeScalar(string query,SqlParameter[] parameter)
    {
        OpenConnection();
        cmd = new SqlCommand(query, cn);
        cmd.Parameters.AddRange(parameter);

        object obj = cmd.ExecuteScalar();
        

        CloseConnection();
        return obj;
    }

    public DataSet ExeAdapter(string query, string table)
    {
        da = new SqlDataAdapter(query, cn);
        ds = new DataSet();
        da.Fill(ds, table);
        return ds;
    }


    public DataSet ExeAdapter(string query, SqlParameter[] parameter, string table)
    {
        da = new SqlDataAdapter(query, cn);
        da.SelectCommand.Parameters.AddRange(parameter);
        ds = new DataSet();
        da.Fill(ds, table);
        return ds;
    }

    public void DropList(DropDownList select, String query, string value, string text, string header)
    {
        ds = ExeAdapter(query, "select");
        select.DataSource = ds;
        select.DataTextField = text;
        select.DataValueField = value;
        select.DataBind();
        select.Items.Insert(0, header);


    }

    public void DropList(DropDownList select, String query, SqlParameter[] param, string value, string text, string header)
    {
        ds = ExeAdapter(query, param, "select");
        select.DataSource = ds;
        select.DataTextField = text;
        select.DataValueField = value;
        select.DataBind();
        select.Items.Insert(0, header);


    }


    /* public void DropList(DropDownList drop_city, string query, SqlParameter[] parameter, string p1, string p2)
     {
         throw new NotImplementedException();
     }*/
}