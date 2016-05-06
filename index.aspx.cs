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
            }

            else
            {
                //Remember user and enable some function
                LoginLink.Text = Session["uid"].ToString();

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
            }
        }

        //query string of the app
        mysql = "SELECT distinct tblRes.fldAppID,tblRes.fldAppImgPath,tblRes.fldAppScreenshot,tblRes.fldAppCover,tblApp.fldAppName,tblApp.fldAppInfo,tblApp.fldAppdetail,tblApp.fldPrice,tblApp.fldType FROM tblRes, tblApp WHERE (([tblRes].[fldAppID]=[tblApp].[ID])) order by fldAppID desc ";
        
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


}