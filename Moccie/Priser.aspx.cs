using System;
using System.Collections.Generic;
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
    }
}