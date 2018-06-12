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
                cmd.CommandText += "INSERT INTO Billeder (Billed, Fk_ProduktBilled) VALUES ('" + billed.FileName + "', @produktId);";
                if (first)
                {
                    //finder automatisk ID'et på billedet som den skal bruge
                    cmd.CommandText += "Declare @ImgId Int ; SET @ImgId = @@Identity;";
                    first = false;
                }
                //gemmer billederne i en mappe
                billed.SaveAs(Server.MapPath("~/Pictures/Produkter/") + billed.FileName);
            }


            cmd.Parameters.Add("@Fk_ProduktGrupper", SqlDbType.Int).Value = DropDownListGrupper.SelectedValue;
            cmd.Parameters.Add("@Navn", SqlDbType.NVarChar).Value = TextBoxHeaderText.Text;
            cmd.Parameters.Add("@ProduktHeader", SqlDbType.NVarChar).Value = TextBoxHeaderInfoText.Text;
            cmd.Parameters.Add("@ProduktInfo", SqlDbType.NVarChar).Value = TextBoxInfoText.Text;
            cmd.Parameters.Add("@Fk_Kunde", SqlDbType.Int).Value = DropDownListKunde.SelectedValue;
            cmd.Parameters.Add("@Dato", SqlDbType.Date).Value = TextBoxDate.Text;

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();

            TextBoxHeaderText.Text = "";
            TextBoxHeaderInfoText.Text = "";
            TextBoxInfoText.Text = "";

            Page.DataBind();
            Label_besked.Text = "Produkt tilføjet til databasen";
            Label_besked.Style.Add("color", "#FFF");
            Label_besked.Style.Add("background-color", "#E06973");
            Label_besked.Style.Add("height", "100%");
            Label_besked.Style.Add("border-radius", "15px");
            Label_besked.Style.Add("padding", "25px");
            Label_besked.Style.Clear();

        }
    }

    protected void ButtonGemKunde_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection();
        conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = conn;


        cmd.CommandText = "INSERT INTO Kunde (KundeNavn, KundeLink) VALUES (@KundeNavn, @KundeLink)";/*, AntalFollowers & , @AntalFollowers*/

        cmd.Parameters.Add("@KundeNavn", SqlDbType.NVarChar).Value = Kundenavn.Text;
        cmd.Parameters.Add("@KundeLink", SqlDbType.NVarChar).Value = KundeLink.Text;
        //cmd.Parameters.Add("@Fk_Platform", SqlDbType.Int).Value = DropDownListplatform.SelectedValue;

        conn.Open();

        cmd.ExecuteNonQuery();

        conn.Close();

        //tømmer textboxes
        Kundenavn.Text = "";
        KundeLink.Text = "";
        //Followers.Text = "";
        Page.DataBind();
        Label_besked.Text = "";
        Label_besked.Style.Clear();

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
            Label_besked.Text = "";
            Label_besked.Style.Clear();
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
            Label_besked.Text = "";
            Label_besked.Style.Clear();
        }
    }


    protected void GemKate_Click(object sender, EventArgs e)
    {
        FileUploadkategori.SaveAs(Server.MapPath("~/Pictures/KategoriGruppe/") + FileUploadkategori.FileName);

        if (File.Exists(Server.MapPath("~/Pictures/KategoriGruppe/") + FileUploadkategori.FileName))
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            cmd.CommandText += "INSERT INTO [ProduktGruppe] (Fk_ProduktKategori, Navn, Billed) VALUES (@Fk_ProduktKategori, @Navn, @Billed)";

            cmd.Parameters.Add("@Fk_ProduktKategori", SqlDbType.Int).Value = DropDownListProduktKategori.SelectedValue;
            cmd.Parameters.Add("@Navn", SqlDbType.NVarChar).Value = NyKate.Text;
            cmd.Parameters.Add("@Billed", SqlDbType.NVarChar).Value = FileUploadkategori.FileName;

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();

            Response.Redirect("../Admin/TegningerAdmin.aspx");
            Label_besked.Text = "";
            Label_besked.Style.Clear();
        }
    }



    protected void Repeaterkategorier_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "SletKate")
        {


            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            //opadatere tablene i databasen
            cmd.CommandText = "DELETE FROM ProduktGruppe WHERE Id = @Id";

            //finder Id'et på produktet når man trykker på knappen
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = e.CommandArgument;

            conn.Open();

            SqlTransaction sqlTransaction = conn.BeginTransaction();

            cmd.Connection = conn;
            cmd.Transaction = sqlTransaction;

            try
            {
                cmd.ExecuteNonQuery();
                sqlTransaction.Commit();
            }
            catch (Exception ex)
            {
                //trace error log here

                sqlTransaction.Rollback();
                Label_besked.Text = "Alle produkter i denne kategori gruppe skal slettes, før du kan slette kategori gruppen";
                Label_besked.Style.Add("color", "#FFF");
                Label_besked.Style.Add("background-color", "#E06973");
                Label_besked.Style.Add("height", "100%");
                Label_besked.Style.Add("border-radius", "15px");
                Label_besked.Style.Add("padding", "25px");
            }
            finally
            {
                conn.Close();
                conn.Dispose();
            }


            //conn.Close();
            //reloader repeateren
            Repeaterkategorier.DataBind();
        }

        if (e.CommandName == "RediKate")
        {
            foreach (RepeaterItem item in Repeaterkategorier.Items)
            {
                FileUpload fKategori = (FileUpload)item.FindControl("FileUploadKategoriUpdate");

                //fKategori.SaveAs(Server.MapPath("~/Pictures/KategoriGruppe/") + fKategori.FileName); //\Pictures\KategoriGruppe

                //if (File.Exists(Server.MapPath("~/Pictures/KategoriGruppe/") + fKategori.FileName))
                //{
                //if (fKategori != null)
                //{
                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                foreach (var billed in fKategori.PostedFiles)
                {
                    cmd.CommandText += "UPDATE ProduktGruppe SET Billed = @Billed WHERE Id = @Id"; //(url, fk_brandeovnId) VALUES ('" + billed.FileName + "', @produktId);";
                    //gemmer billederne i en mappe
                    billed.SaveAs(Server.MapPath(@"~\Pictures\KategoriGruppe\") + billed.FileName);
                    cmd.Parameters.Add("@Billed", SqlDbType.NVarChar).Value = fKategori.FileName;
                    cmd.Parameters.Add("@Id", SqlDbType.Int).Value = e.CommandArgument;
                }

                ////opadatere tablene i databasen
                //cmd.CommandText += "UPDATE ProduktGruppe SET Navn = @Navn WHERE Id = @Id";

                ////finder Id'et på produktet når man trykker på knappen
                //cmd.Parameters.Add("@Id", SqlDbType.Int).Value = e.CommandArgument;

                ////finder de foreskellige textboxes med e.item.findcontrol("navn på textbox")
                //cmd.Parameters.Add("@Navn", SqlDbType.NVarChar).Value = ((TextBox)e.Item.FindControl("TextBoxShowKate")).Text;


                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                    //reloader repeateren
                    Repeaterkategorier.DataBind();
                    Label_besked.Text = "";
                    Label_besked.Style.Clear();
                    //}
                }
            }
        }
    }


    protected void RepeaterKunder_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "RediKunde")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            //opadatere tablene i databasen
            cmd.CommandText = "UPDATE Kunde SET KundeNavn = @KundeNavn WHERE Id = @Id";

            //finder Id'et på produktet når man trykker på knappen
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = e.CommandArgument;

            //finder de foreskellige textboxes med e.item.findcontrol("navn på textbox")
            cmd.Parameters.Add("@KundeNavn", SqlDbType.NVarChar).Value = ((TextBox)e.Item.FindControl("TextBoxShowKate")).Text;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            //reloader repeateren
            RepeaterKunder.DataBind();
            Label_besked.Text = "";
            Label_besked.Style.Clear();
        }
        if (e.CommandName == "SletKunde")
        {
            SqlConnection conn = new SqlConnection();
            conn.ConnectionString = ConfigurationManager.ConnectionStrings["MoccieDBConnectionString"].ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;

            //opadatere tablene i databasen
            cmd.CommandText = "DELETE FROM Kunde WHERE Id = @Id";

            //finder Id'et på produktet når man trykker på knappen
            cmd.Parameters.Add("@Id", SqlDbType.Int).Value = e.CommandArgument;

            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            //reloader repeateren
            RepeaterKunder.DataBind();
            Label_besked.Text = "";
            Label_besked.Style.Clear();
        }
    }
}