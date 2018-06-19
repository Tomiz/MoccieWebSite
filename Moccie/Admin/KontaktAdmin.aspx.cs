using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_KontaktAdmin : System.Web.UI.Page
{
    protected void Button_PicPage_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in RepeaterAdminKontaktTextboxText.Items)
        {
            TextBox tOverskrift = (TextBox)item.FindControl("TextBox_KontOverskrift");
            TextBox tText = (TextBox)item.FindControl("TextBox_KontText");

            if (tOverskrift != null && tText != null)
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                //cmd.CommandText = "INSERT INTO  [InfoText] (Overskrift, Text) VALUES (@Overskrift, @Text)";
                cmd.CommandText = "UPDATE InfoText SET Overskrift = @Overskrift, Text = @Text WHERE Lokation = 'ContainPage'";

                cmd.Parameters.Add("@Overskrift", SqlDbType.NVarChar).Value = tOverskrift.Text;
                cmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = tText.Text;

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Redirect("../Admin/KontaktAdmin.aspx");
            }
        }
    }
    
}