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
        foreach (RepeaterItem item in RepeaterAdminDefaultTextboxText.Items)
        {
            TextBox tOverskrift = (TextBox)item.FindControl("TextBox_FrontOverskrift");
            TextBox tText = (TextBox)item.FindControl("TextBox_FrontText");

            if (tOverskrift != null && tText != null)
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                //cmd.CommandText = "INSERT INTO  [InfoText] (Overskrift, Text) VALUES (@Overskrift, @Text)";
                cmd.CommandText = "UPDATE InfoText SET Overskrift = @Overskrift, Text = @Text WHERE Lokation = 'FrontPage'";

                cmd.Parameters.Add("@Overskrift", SqlDbType.NVarChar).Value = tOverskrift.Text;
                cmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = tText.Text;

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Redirect("../Admin/DefaultAdmin.aspx");
            }
        }
    }

    protected void Button_About_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in RepeaterAdminAboutText.Items)
        {
            TextBox tAboutOverskrift = (TextBox)item.FindControl("TextBox_AboutOverskrift");
            TextBox tAboutText = (TextBox)item.FindControl("TextBox_AboutText");

            if (tAboutOverskrift != null && tAboutText != null) //&& fAbout != null)
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                cmd.CommandText = "UPDATE IndexText SET Overskrift = @Overskrift, Text = @Text";

                cmd.Parameters.Add("@Overskrift", SqlDbType.NVarChar).Value = tAboutOverskrift.Text;
                cmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = tAboutText.Text;

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Redirect("../Admin/DefaultAdmin.aspx");
            }
        }
    }

    protected void ButtonProfilePic_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in RepeaterAdminAboutPicture.Items)
        {
            FileUpload fAbout = (FileUpload)item.FindControl("FileUploadProilePic");
            //FileUpload fAbout = (FileUpload)item.FindControl("FileUploadProilePic");

            if (fAbout != null)
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                //cmd.CommandText = "INSERT INTO  [InfoText] (Overskrift, Text) VALUES (@Overskrift, @Text)";
                //cmd.CommandText = "UPDATE IndexText SET Overskrift = @Overskrift, Text = @Text";

                //indsætter billederne i Databasen
                foreach (var billed in fAbout.PostedFiles)
                {
                    cmd.CommandText += "UPDATE IndexText SET Image = @Image"; //(url, fk_brandeovnId) VALUES ('" + billed.FileName + "', @produktId);";
                    //gemmer billederne i en mappe
                    billed.SaveAs(Server.MapPath("~/Pictures/Profil/") + billed.FileName);
                    cmd.Parameters.Add("@Image", SqlDbType.NVarChar).Value = fAbout.FileName;
                }

                //cmd.Parameters.Add("@Overskrift", SqlDbType.NVarChar).Value = tAboutOverskrift.Text;
                //cmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = tAboutText.Text;

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Redirect("../Admin/DefaultAdmin.aspx");
            }
        }
    }

    protected void Button_Footer_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in RepeaterFooter.Items)
        {
            TextBox tFooter = (TextBox)item.FindControl("TextBoxFootertext");
            //FileUpload fAbout = (FileUpload)item.FindControl("FileUploadProilePic");

            if (tFooter != null)
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                cmd.CommandText = "UPDATE InfoText SET Text = @Text WHERE Lokation = 'Footer'";
                
                cmd.Parameters.Add("@Text", SqlDbType.NVarChar).Value = tFooter.Text;

                conn.Open();

                cmd.ExecuteNonQuery();

                conn.Close();

                Response.Redirect("../Admin/DefaultAdmin.aspx");
            }
        }
    }

    
}