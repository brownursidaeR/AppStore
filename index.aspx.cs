using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;


public partial class index : System.Web.UI.Page
{
    //Using method CommDB
    CommDB db = new CommDB();

    //Set up a new dataset
    public DataSet ds = new DataSet();

    //mysql string
    string mysql;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["uid"] == null)
            {
                //Disabled account function if not login
                Account.Enabled = false;
                Account.CssClass = "list-group-item col-md-12 col-xs-2 disabled";
                Logout.Enabled = false;
                Logout.Text = null;
            }

            else
            {
                //Get Session type
                string uid = Session["uid"].ToString();
                //Remember user and enable some function

                LoginLink.Text = "<i class=\"material-icons\">face</i> " + Session["uid"].ToString();

                //Hide Register link
                ResigterLink.Text = null;

                //Disable Login function
                LoginLink.Enabled = false;

                //Enable account session
                Account.Enabled = true;

                //Adjust Account Css
                Account.CssClass = "list-group-item col-md-12 col-xs-2";

                //Navigate URL
                Account.NavigateUrl = "User.aspx?="+Session["uid"].ToString() + "";

                Logout.Enabled = true;

                Logout.Text = "Log out";

                

                //Query string for Administrator
                string mysql = "SELECT * FROM TBLUSER WHERE FLDUSERNAME='" + uid + "' AND FLDTYPE=1";

                //store record in integer i
                int i = db.Rownum(mysql, "test", ref uid);

                if (i > 0)
                {
                    string style = "<i class=\"material-icons\">build</i> Manage";

                    Account.Text = style;
                    
                    Account.NavigateUrl = "Manage.aspx";
                }
               
            }
        }

        index_Query();
    }

    private void index_Query()
    {
        //query string of the app
        mysql = "SELECT DISTINCT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE FROM TBLRES, TBLAPP WHERE (([TBLRES].[FLDAPPID]=[TBLAPP].[ID])) ORDER BY FLDAPPID DESC";

        //Back up the query string
        Session["QueryAppSQL"] = mysql;

        //execute the string 
        ds = db.ExecuteQuery(mysql, "App");
    }

    protected void CatLink_Click(object sender, EventArgs e)
    {
        //get the type by clicking the linkbutton 
        LinkButton b = (LinkButton)sender;

        //Store the type by using Session
        Session["GetType"] = b.ID.ToString();

        //Redirect page with Type
        Response.Redirect("~/More.aspx?Type="+ b.ID.ToString());
    }




    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["Search"] = txbSearch.Text;
        Response.Redirect("Search.aspx?="+ txbSearch.Text);
    }

    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("~/index.aspx");
    }
}