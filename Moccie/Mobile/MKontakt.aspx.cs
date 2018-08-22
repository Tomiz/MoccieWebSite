using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Kontakt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ButtonSendMail_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBoxName.Text == "")
            {
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                cmd.CommandText = "INSERT INTO Beskeder (Fornavn, Efternavn, Email, AArsag, Begrundelse, Dato) VALUES (@Fornavn, @Efternavn, @Email, @AArsag, @Begrundelse, @Dato)";

                cmd.Parameters.Add("@Fornavn", SqlDbType.NVarChar).Value = TextBoxFornavn.Text;
                cmd.Parameters.Add("@Efternavn", SqlDbType.NVarChar).Value = TextBoxEfternavn.Text;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = TextBoxEmail.Text;
                cmd.Parameters.Add("@AArsag", SqlDbType.NVarChar).Value = DropDownListGrund.SelectedValue;
                cmd.Parameters.Add("@Begrundelse", SqlDbType.NVarChar).Value = TextBoxSubject.Text;
                cmd.Parameters.Add("@Dato", SqlDbType.DateTime2).Value = DateTime.Now;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                MailMessage mailMessage = new MailMessage();
                mailMessage.To.Add("info@moccie.dk"); // To Email
                mailMessage.From = new MailAddress(TextBoxEmail.Text); // From Eamil
                mailMessage.Subject = DropDownListGrund.SelectedValue; // Email subject
                mailMessage.Body = "Send fra: " + TextBoxFornavn.Text + " " + TextBoxEfternavn.Text + "\n" + TextBoxSubject.Text; // Email body 
                SmtpClient smtpClient = new SmtpClient("smtp.unoeuro.com");
                //    //SmtpClient smtpClient = new SmtpClient();
                //    //smtpClient.Host = "localhost"; // Host
                smtpClient.Send(mailMessage);
                LabelMsg.Text = "E-mail sent!";


                //tømmer textboxes
                TextBoxFornavn.Text = "";
                TextBoxEfternavn.Text = "";
                TextBoxEmail.Text = "";
                TextBoxSubject.Text = "";
                //TextBoxEmail2.Text = "";
                //Followers.Text = "";
                Page.DataBind();
            }
            else
            {
                LabelMsg.Text = "Error";
            }
        }
        catch (Exception ex)
        {
            LabelMsg.Text = "Could not send the e-mail - error: " + ex.Message;
        }
    }
}