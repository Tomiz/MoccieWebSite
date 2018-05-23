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

    protected void ButtonGemProdukt_Click(object sender, EventArgs e)
    {
        FileUploadProduktBilled.SaveAs(Server.MapPath("~/Pictures/Produkter/") + FileUploadProduktBilled.FileName);

        if (File.Exists(Server.MapPath("~/Pictures/Produkter/") + FileUploadProduktBilled.FileName))
        {

            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;


            cmd.CommandText += "INSERT INTO  Produkter (Fk_ProduktKategori, Fk_ProduktGruppe, Navn, ProduktHeader, ProduktInfo, Fk_Kunde, Dato) VALUES (1, @Fk_ProduktGrupper, @Navn, @ProduktHeader, @ProduktInfo, @Fk_Kunde, @Dato);";

            //finder automatisk ID'et på produktet som den skal bruge
            cmd.CommandText += " Declare @produktId Int ; SET @produktId = @@Identity ;";
            bool first = true;

            // indsætter billederne i Databasen
            foreach (var billed in FileUploadProduktBilled.PostedFiles)
            {
                //cmd.CommandText += "INSERT INTO brandeovnImg (url, fk_brandeovnId) VALUES ('" + billed.FileName + "', @produktId);";
                cmd.CommandText += "INSERT INTO Billeder (Billed, Fk_ProduktBilled) VALUES ('" + billed.FileName + "', @produktId);";
                //cmd.CommandText += "INSERT INTO Billeder (Billed) VALUES ('" + billed.FileName + ")'";
                if (first)
                {
                    //finder automatisk ID'et på billedet som den skal bruge
                    cmd.CommandText += "Declare @ImgId Int ; SET @ImgId = @@Identity;";
                    first = false;
                }
                //gemmer billederne i en mappe
                billed.SaveAs(Server.MapPath("~/Pictures/Produkter/") + billed.FileName);
            }
            //cmd.CommandText += "UPDATE Produkter SET Fk_Billeder = @ImgId WHERE Id = @produktId";
            //cmd.CommandText += "UPDATE brandeovne SET fk_prevImg = @ImgId WHERE Id = @produktId";

            cmd.Parameters.Add("@Fk_ProduktGrupper", SqlDbType.Int).Value = DropDownListGrupper.SelectedValue;
            cmd.Parameters.Add("@Navn", SqlDbType.NVarChar).Value = TextBoxHeaderText.Text;
            cmd.Parameters.Add("@ProduktHeader", SqlDbType.NVarChar).Value = TextBoxHeaderInfoText.Text;
            cmd.Parameters.Add("@ProduktInfo", SqlDbType.NVarChar).Value = TextBoxInfoText.Text;
            cmd.Parameters.Add("@Fk_Kunde", SqlDbType.Int).Value = DropDownListKunde.SelectedValue;
            cmd.Parameters.Add("@Dato", SqlDbType.DateTime).Value = TextBoxDate.Text;

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();
            //tømmer textboxes for text
            //TextBoxNavn2.Text = "";
            //TextBoxVarenr2.Text = "";
            //TextBoxBeskrivelse2.Text = "";
            Page.DataBind();

            //udskriver besked i label og ændre dens farve grøn hvis tilføjet og rød hvis ikke
            //LabelBesked.Style.Add("color", "#6fbf59");
            //LabelBesked.Text = "Produktet er blevet tilføjet";
            //}
            //else
            //{
            //    LabelBesked.Style.Add("color", "#CC0000");
            //    LabelBesked.Text = "Der skete en fejl, produktet er ikke blevet tilføjet";
            //}
        }
    }

    protected void ButtonGemKunde_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;


        cmd.CommandText = "INSERT INTO Kunde (KundeNavn, KundeLink, Fk_Platform) VALUES (@KundeNavn, @KundeLink, @Fk_Platform)";/*, AntalFollowers & , @AntalFollowers*/

        cmd.Parameters.Add("@KundeNavn", SqlDbType.NVarChar).Value = Kundenavn.Text;
        cmd.Parameters.Add("@KundeLink", SqlDbType.NVarChar).Value = KundeLink.Text;
        cmd.Parameters.Add("@Fk_Platform", SqlDbType.Int).Value = DropDownListplatform.SelectedValue;
        //cmd.Parameters.Add("@AntalFollowers", SqlDbType.Int).Value = Followers.Text;

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        //tømmer textboxes
        Kundenavn.Text = "";
        KundeLink.Text = "";
        //Followers.Text = "";
        Page.DataBind();

    }

    protected void RepeaterRedigerProdukter_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "SletProdukt")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            //opadatere tablene i databasen
            cmd.CommandText = "DELETE FROM Produkter WHERE Id = @Id";

            //finder Id'et på produktet når man trykker på knappen
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = e.CommandArgument;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            //reloader repeateren
            RepeaterRedigerProdukter.DataBind();
            //LabelBesked.Style.Add("color", "#6fbf59");
            //LabelBesked.Text = "Nyheden er nu blevet slettet";
        }

        //finder e.commadname som er RedigerProd
        if (e.CommandName == "RedigerProdukt")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            //opadatere tablene i databasen
            cmd.CommandText = "UPDATE Produkter SET Navn = @Navn, ProduktHeader = @ProduktHeader, ProduktInfo = @ProduktInfo, Fk_Kunde = @Fk_Kunde, Fk_ProduktGruppe = @Fk_ProduktGruppe WHERE Id = @Id";

            //finder Id'et på produktet når man trykker på knappen
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = e.CommandArgument;

            //finder de foreskellige textboxes med e.item.findcontrol("navn på textbox")
            cmd.Parameters.Add("@Navn", SqlDbType.NVarChar).Value = ((TextBox)e.Item.FindControl("TextBoxProduktNavn")).Text;
            cmd.Parameters.Add("@ProduktHeader", SqlDbType.NVarChar).Value = ((TextBox)e.Item.FindControl("TextBoxProduktheader")).Text;
            cmd.Parameters.Add("@ProduktInfo", SqlDbType.NVarChar).Value = ((TextBox)e.Item.FindControl("TextBoxProduktInfo")).Text;
            cmd.Parameters.Add("@Fk_Kunde", SqlDbType.Int).Value = ((DropDownList)e.Item.FindControl("DropDownListProduktEjer")).SelectedValue;
            cmd.Parameters.Add("@Fk_ProduktGruppe", SqlDbType.Int).Value = ((DropDownList)e.Item.FindControl("DropDownListProduktKategorier")).SelectedValue;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            //reloader repeateren
            RepeaterRedigerProdukter.DataBind();
        }
    }

}