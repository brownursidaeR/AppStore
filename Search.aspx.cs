using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Search : System.Web.UI.Page
{
    //Using method CommDB
    CommDB db = new CommDB();

    //Set up a new dataset
    public DataSet ds = new DataSet();

    //mysql string
    string mysql,search;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CheckLogin();
           
        }
        
        //Store the type in string
        search = Session["Search"].ToString();
        Search_Query();
    }

    private void CheckLogin()
    {
        if (Session["uid"] == null)
        {
            //Disabled account function if not login
            Account.Enabled = false;
            Account.CssClass = "list-group-item col-md-12 col-xs-2 disabled";
        }
        else
        {
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
            Account.NavigateUrl = "User.aspx?=" + Session["uid"].ToString() + "";
        }
    }

    private void Search_Query()
    {
        ds.Clear();

        

        //Query the application by type
        mysql = "SELECT DISTINCT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE FROM TBLRES, TBLAPP WHERE (([TBLRES].[FLDAPPID]=[TBLAPP].[ID])) AND FLDAPPNAME LIKE '%%"+ search +"%%'";

        //Execute Query String
        ds = db.ExecuteQuery(mysql, "Query");

    }

    protected void CatLink_Click(object sender, EventArgs e)
    {
        //get the type by clicking the linkbutton 
        LinkButton b = (LinkButton)sender;

        //Store the type by using Session
        Session["GetType"] = b.ID.ToString();

        //Redirect page with Type
        Response.Redirect("~/More.aspx?Type=" + b.ID.ToString());
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Session["NewQuery"] = txbSearch.Text;
        search = Session["NewQuery"].ToString();
        Search_Query();
    }
}