using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_DefaultAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button_FrontPage_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        //cmd.CommandText = "INSERT INTO  [InfoText] (Overskrift, Text) VALUES (@Overskrift, @Text)";
        cmd.CommandText = "UPDATE InfoText SET Overskrift = @Overskrift, Text = @Text WHERE Lokation = 'FrontPage'";

        cmd.Parameters.Add("@Overskrift", SqlDbType.NVarChar).Value = FindControl("TextBox_FrontOverskrift");
        cmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = FindControl("TextBox_FrontText");

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("../Admin/DefaultAdmin.aspx");
    }

    protected void Button_About_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;

        //cmd.CommandText = "INSERT INTO  [InfoText] (Overskrift, Text) VALUES (@Overskrift, @Text)";
        cmd.CommandText = "UPDATE IndexText SET Overskrift = @Overskrift, Text = @Text";


        cmd.Parameters.Add("@Overskrift", SqlDbType.NVarChar).Value = TextBox_AboutOverskrift.Text;
        cmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = TextBox_AboutText.Text;

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        Response.Redirect("../Admin/DefaultAdmin.aspx");
    }

    protected void Button_Footer_Click(object sender, EventArgs e)
    {

    }
}