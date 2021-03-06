﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Priser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    //protected void ButtonLidtDetajler_Command(object sender, CommandEventArgs e)
    //{
    //    Button BL = (Button)sender;

    //    if (e.CommandName == "DetajlerLidtClick")
    //    {
    //        if (BL.BackColor == Color.Green)
    //        {
    //            BL.BackColor = Color.White;
    //        }
    //        else
    //        {
    //            BL.BackColor = Color.Green;
    //        }
    //    }
    //}

    //protected void ButtonMellemDetajler_Command(object sender, CommandEventArgs e)
    //{
    //    Button BM = (Button)sender;
    //    if (e.CommandName == "DetajlerMellemClick")
    //    {
    //        if (BM.BackColor == Color.Green)
    //        {
    //            BM.BackColor = Color.White;
    //        }
    //        else
    //        {
    //            BM.BackColor = Color.Green;
    //        }
    //    }
    //}

    //protected void ButtonStorDetajler_Command(object sender, CommandEventArgs e)
    //{
    //    Button BS = (Button)sender;
    //    if (e.CommandName == "DetajlerStorClick")
    //    {
    //        if (BS.BackColor == Color.Green)
    //        {
    //            BS.BackColor = Color.White;
    //        }
    //        else
    //        {
    //            BS.BackColor = Color.Green; 
    //        }
    //    }

    //}

    protected void RepeaterDetajlePriser_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        //Button BL = (Button)source; 
        Button Lbtn = e.Item.FindControl("ButtonLidtDetajler") as Button;
        Button Mbtn = e.Item.FindControl("ButtonMellemDetajler") as Button;
        Button Sbtn = e.Item.FindControl("ButtonStorDetajler") as Button;
        if (e.CommandName == "DetajlerLidtClick")
        {
            if (Lbtn.BackColor == Color.Green)
            {
                Lbtn.BackColor = Color.White;
            }
            else
            {
                Lbtn.BackColor = Color.Green;
                Mbtn.BackColor = Color.White;
                Sbtn.BackColor = Color.White;
            }
        }

        if (e.CommandName == "DetajlerMellemClick")
        {
            if (Mbtn.BackColor == Color.Green)
            {
                Mbtn.BackColor = Color.White;
            }
            else
            {
                Lbtn.BackColor = Color.White;
                Mbtn.BackColor = Color.Green;
                Sbtn.BackColor = Color.White;
            }
        }

        if (e.CommandName == "DetajlerStorClick")
        {
            if (Sbtn.BackColor == Color.Green)
            {
                Sbtn.BackColor = Color.White;
            }
            else
            {
                Lbtn.BackColor = Color.White;
                Mbtn.BackColor = Color.White;
                Sbtn.BackColor = Color.Green;
            }
        }

        //if (e.CommandName == "GemKnap")
        //{
        //    SqlConnection conn = new SqlConnection();
        //    conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
        //    SqlCommand cmd = new SqlCommand();
        //    cmd.Connection = conn;

        //    // (Type, KategoriDetajler, SlutPris) VALUES (@Type, @KategoriDetajler, @SlutPris)
        //    cmd.CommandText = "INSERT INTO bestlling (Type) VALUES (@Type)";//"UPDATE forside SET Text = @text, overskrift = @overskrift";

        //    cmd.Parameters.Add("@Type", SqlDbType.NVarChar).Value = Request.QueryString["Id"];
        //    //cmd.Parameters.Add("@KategoriDetajler", SqlDbType.NVarChar).Value = ((Button)e.Item.FindControl("TextBox_overskrift")).Text;
        //    //cmd.Parameters.Add("@SlutPris", SqlDbType.Int).Value = ((Button)e.Item.FindControl("TextBox_overskrift")).Text;

        //    conn.Open();
        //    cmd.ExecuteNonQuery();
        //    conn.Close();

        //    //Page.DataBind();
        //}
    }

    protected void ButtonGem_Click(object sender, EventArgs e)
    {
        foreach (RepeaterItem item in RepeaterDetajlePriser.Items)
        {
            Label l1 = (Label)item.FindControl("Label1");
            //HiddenField h1 = (HiddenField)item.FindControl("HiddenField_OrderId");
            if (l1 != null)
            {
                string labelKategoriNavn = l1.Text;
                //string OrderId = h1.Value;

                SqlConnection conn = new SqlConnection();
                conn.ConnectionString = ConfigurationManager.ConnectionStrings["tomis_dk_dbConnectionString"].ToString();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;

                // (Type, KategoriDetajler, SlutPris) VALUES (@Type, @KategoriDetajler, @SlutPris)
                cmd.CommandText = "INSERT INTO bestlling (Type, KategoriDetajler, OrderId) VALUES (@Type, @KategoriDetajler, @OrderId)";//"UPDATE forside SET Text = @text, overskrift = @overskrift";

                cmd.Parameters.Add("@Type", SqlDbType.NVarChar).Value = Request.QueryString["KategoriNavn"];
                cmd.Parameters.Add("@KategoriDetajler", SqlDbType.NVarChar).Value = labelKategoriNavn;
                cmd.Parameters.Add("@OrderId", SqlDbType.DateTime).Value = DateTime.Now;
                //cmd.Parameters.Add("@SlutPris", SqlDbType.Int).Value = ((Button)e.Item.FindControl("TextBox_overskrift")).Text;

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                //Page.DataBind();
            }
        }
    }
}