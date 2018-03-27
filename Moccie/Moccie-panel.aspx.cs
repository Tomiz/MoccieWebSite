using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Moccie_panel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonLogin_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandText = "SELECT * FROM [User] WHERE Navn = @brugernavn AND Kode = @password";

        cmd.Parameters.Add("@brugernavn", SqlDbType.NVarChar).Value = TextBoxUsername.Text;
        cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = TextBoxPassword.Text;

        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            Session["brugernavn"] = reader["Navn"];
            Session["bruger_id"] = reader["Id"];
            //Session["fk_rolleId"] = reader["fk_rolleId"];

            Response.Redirect("Admin/DefaultAdmin.aspx");
        }


        //else
        //{
        //    Labelfejl.Style.Add("color", "#CC0000");
        //    Labelfejl.Text = "Forkert brugernavn eller kodeord.";
        //}
        conn.Close();
    }
}