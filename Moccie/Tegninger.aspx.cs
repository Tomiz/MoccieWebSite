using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tegninger : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }

    protected void LinkButtonGrupper_Command(object sender, CommandEventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }

    protected void LinkButtonEnkeltProdukt_Command(object sender, CommandEventArgs e)
    {
        MultiView1.ActiveViewIndex = 2;
    }
}