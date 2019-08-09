using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default_moccie : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region view index
        //laver en variable kaldet "qs", og laver en querystring kaldet "view" til url'en
        var qs = Request.QueryString["view"];

        if (qs != null)
        {
            // hvis qs er det samme som 1(ViewTegnGruppeProd), viser den index 1 som er et view
            if (qs == "1")
            {
                MultiViewTegn.ActiveViewIndex = 1;
            }
        }

        if (qs != null)
        {
            // hvis qs er det samme som 2(ViewEnkeltProdukt), viser den index 2 som er et view
            if (qs == "2")
            {
                MultiViewTegn.ActiveViewIndex = 2;
            }
        }
        #endregion
    }

    protected void LinkButtonGrupper_Command(object sender, CommandEventArgs e)
    {
        // bruger querystring til at redirect til det rigtige view (ViewTegnGruppeProd i dette tilfælde)
        Response.Redirect("Tegninger.aspx?view=1&KategoriId=" + e.CommandArgument);
    }
}
