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

    protected void ButtonLidtDetajler_Command(object sender, CommandEventArgs e)
    {
        Button BL = (Button)sender;

        if (e.CommandName == "DetajlerLidtClick")
        {
            if (BL.BackColor == Color.Green)
            {
                BL.BackColor = Color.White;
            }
            else
            {
                BL.BackColor = Color.Green;
            }
        }
    }

    protected void ButtonMellemDetajler_Command(object sender, CommandEventArgs e)
    {
        Button BM = (Button)sender;
        if (e.CommandName == "DetajlerMellemClick")
        {
            if (BM.BackColor == Color.Green)
            {
                BM.BackColor = Color.White;
            }
            else
            {
                BM.BackColor = Color.Green;
            }
        }
    }

    protected void ButtonStorDetajler_Command(object sender, CommandEventArgs e)
    {
        Button BS = (Button)sender;
        if (e.CommandName == "DetajlerStorClick")
        {
            if (BS.BackColor == Color.Green)
            {
                BS.BackColor = Color.White;
            }
            else
            {
                BS.BackColor = Color.Green;
            }
        }

    }
}