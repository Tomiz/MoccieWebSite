using System;
using System.Collections.Generic;
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
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add("thomas-tanja@live.dk"); // To Email
            mailMessage.From = new MailAddress(TextBoxEmail.Text); // From Eamil
            mailMessage.Subject = DropDownListGrund.SelectedValue; // Email subject
            mailMessage.Body = "Send fra: " + TextBoxFornavn.Text + " " + TextBoxEfternavn.Text + "\n" + TextBoxSubject.Text; // Email body 
            //SmtpClient smtpClient = new SmtpClient("smtp.unoeuro.com");
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "localhost"; // Host
            smtpClient.Send(mailMessage);
            LabelMsg.Text = "E-mail sent!";
        }
        catch (Exception ex)
        {
            LabelMsg.Text = "Could not send the e-mail - error: " + ex.Message;
        }
    }
}