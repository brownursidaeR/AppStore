using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class More : System.Web.UI.Page
{
    CommDB db = new CommDB();

    public DataSet ds = new DataSet();

    OleDbDataAdapter da = new OleDbDataAdapter();

    string mysql,uid;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            CheckLogin();
        }
        Type_Query();

    }

    private void CheckLogin()
    {
        if (Session["uid"] == null)
        {
            //Disabled account function if not login
            Account.Enabled = false;

            //Adjust Account Css
            Account.CssClass = "list-group-item col-md-12 col-xs-2 disabled";
        }

        else
        {
            uid = Session["uid"].ToString();

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

    private void Type_Query()
    {
        //Store the type in string
        string type = Session["GetType"].ToString();

        //Query the application by type
        mysql = "SELECT distinct tblRes.fldAppID,tblRes.fldAppImgPath,tblRes.fldAppScreenshot,tblRes.fldAppCover,tblApp.fldAppName,tblApp.fldAppInfo,tblApp.fldAppdetail,tblApp.fldPrice,tblApp.fldType FROM tblRes, tblApp WHERE (([tblRes].[fldAppID]=[tblApp].[ID])) and fldType='" + type + " ' order by fldAppID desc ";

        //Execute Query String
        ds = db.ExecuteQuery(mysql, "Type");
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
        Session["Search"] = txbSearch.Text;
        Response.Redirect("Search.aspx?=" + txbSearch.Text);
    }
}