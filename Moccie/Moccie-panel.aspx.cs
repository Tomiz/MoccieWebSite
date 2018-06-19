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
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
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

            Response.Redirect("Admin/DefaultAdmin.aspx");
        }
        else
        {
            LabelMsg.Style.Add("color", "#FFF");
            LabelMsg.Style.Add("background-color", "#E06973");
            LabelMsg.Style.Add("width", "400px");
            LabelMsg.Style.Add("height", "100%");
            LabelMsg.Style.Add("border-radius", "15px");
            LabelMsg.Style.Add("padding", "25px");
            LabelMsg.Text = "Forkert brugernavn eller kodeord.";
        }
        conn.Close();
    }
}