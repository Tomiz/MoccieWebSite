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

public partial class Admin_TegningerAdmin : System.Web.UI.Page
{

    //protected void ButtonGemProdukt_Click(object sender, EventArgs e)
    //{
    //    FileUploadProduktBilled.SaveAs(Server.MapPath("~/Pictures/Produkter/") + FileUploadProduktBilled.FileName);

    //    if (File.Exists(Server.MapPath("~/Pictures/Produkter/") + FileUploadProduktBilled.FileName))
    //    {

    //        SqlConnection conn = new SqlConnection();
    //        conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
    //        SqlCommand cmd = new SqlCommand();
    //        cmd.Connection = conn;


    //        cmd.CommandText += "INSERT INTO  Produkter (Fk_ProduktKategori, Navn, ProduktHeader, ProduktInfo, Fk_Kunde, Fk_billeder) VALUES (@Fk_ProduktKategori, @Navn, @ProduktHeader, @ProduktInfo, @Fk_Kunde, @Fk_billeder);";

    //        //finder automatisk ID'et på produktet som den skal bruge
    //        //cmd.CommandText += " Declare @produktId Int ; SET @produktId = @@Identity ;";
    //        //bool first = true;

    //        // indsætter billederne i Databasen
    //        foreach (var billed in FileUploadProduktBilled.PostedFiles)
    //        {
    //            cmd.CommandText += "INSERT INTO Billeder (Billed) VALUES ('" + billed.FileName + ")'";
    //            //if (first)
    //            //{
    //            //    //finder automatisk ID'et på billedet som den skal bruge
    //            //    cmd.CommandText += "Declare @ImgId Int ; SET @ImgId = @@Identity ;";
    //            //    first = false;
    //            //}
    //            //gemmer billederne i en mappe
    //            billed.SaveAs(Server.MapPath("~/Pictures/Produkter/") + billed.FileName);
    //        }
    //        //cmd.CommandText += "UPDATE brandeovne SET fk_prevImg = @ImgId WHERE Id = @produktId";

    //        cmd.Parameters.Add("@Fk_ProduktKategori", SqlDbType.Int).Value = DropDownListGrupper.SelectedIndex;
    //        cmd.Parameters.Add("@Navn", SqlDbType.NVarChar).Value = TextBoxHeaderText.Text;
    //        cmd.Parameters.Add("@ProduktHeader", SqlDbType.NVarChar).Value = TextBoxHeaderInfoText.Text;
    //        cmd.Parameters.Add("@ProduktInfo", SqlDbType.NVarChar).Value = TextBoxInfoText.Text;
    //        cmd.Parameters.Add("@Fk_Kunde", SqlDbType.Int).Value = DropDownListKunde.SelectedIndex;
    //        //cmd.Parameters.Add("@Fk_billeder", SqlDbType.Int).Value = ;

    //        conn.Open();

    //        cmd.ExecuteNonQuery();

    //        conn.Close();
    //        //tømmer textboxes for text
    //        //TextBoxNavn2.Text = "";
    //        //TextBoxVarenr2.Text = "";
    //        //TextBoxBeskrivelse2.Text = "";
    //        Page.DataBind();

    //        //udskriver besked i label og ændre dens farve grøn hvis tilføjet og rød hvis ikke
    //        //LabelBesked.Style.Add("color", "#6fbf59");
    //        //LabelBesked.Text = "Produktet er blevet tilføjet";
    //        //}
    //        //else
    //        //{
    //        //    LabelBesked.Style.Add("color", "#CC0000");
    //        //    LabelBesked.Text = "Der skete en fejl, produktet er ikke blevet tilføjet";
    //        //}
    //    }
    //}

    protected void ButtonGemKunde_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;


        cmd.CommandText = "INSERT INTO Kunde (KundeNavn, KundeLink, Fk_Platform, AntalFollowers) VALUES (@KundeNavn, @KundeLink, @Fk_Platform, @AntalFollowers)";

        cmd.Parameters.Add("@KundeNavn", SqlDbType.NVarChar).Value = Kundenavn.Text;
        cmd.Parameters.Add("@KundeLink", SqlDbType.NVarChar).Value = KundeLink.Text;
        cmd.Parameters.Add("@Fk_Platform", SqlDbType.Int).Value = DropDownListplatform.SelectedValue;
        cmd.Parameters.Add("@AntalFollowers", SqlDbType.Int).Value = Followers.Text;

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        //tømmer textboxes
        Kundenavn.Text = "";
        KundeLink.Text = "";
        Followers.Text = "";
        Page.DataBind();

    }
}