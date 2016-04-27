using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class More : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["uid"] == null)
            {
                //Response.Write("Not login yet");
            }

            else
            {
                LoginLink.Text = Session["uid"].ToString();
                ResigterLink.Text = null;
                LoginLink.Enabled = false;
            }
        }

    }

    protected void CatLink_Click(object sender, EventArgs e)
    {
        LinkButton b = (LinkButton)sender;
        Session["GetType"] = b.Text;
        Response.Redirect("~/More.aspx");
        //ds.Tables.Clear();
    }

  

    //protected void Created_dynamic_imagebox(string imagebox_)
    //{
    //    HtmlGenericControl div = new HtmlGenericControl("div");
    //    HtmlGenericControl div2 = new HtmlGenericControl("div");
    //    ImageButton imgb = new ImageButton();
    //    imgb.ImageUrl = "~/img/app1.png";
        
    //    div.Controls.Add(imgb);
    //    div2.Controls.Add(div);
    //    ph1.Controls.Add(div2);
    //}
}