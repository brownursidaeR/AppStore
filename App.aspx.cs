using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class App : System.Web.UI.Page
{
    //Using method CommDB
    CommDB db = new CommDB();

    //Set up a new DataSet
    public DataSet ds = new DataSet();

    public DataSet ds2 = new DataSet();

    //String announcement
    string mysql, appid, uid, type;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            checkLogin();
        }

        try {

            App_Query();
        }
        catch (Exception ex) {
            Response.Write(ex.Message);
        }
    }

    private void checkLogin()
    {
        if (Session["uid"] == null)
        {
            //Disabled account function if not login
            Account.Enabled = false;
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

    private void App_Query()
    {


        //Request the ID and store into appid
        appid = Request.QueryString["ID"];

        string appimgpath, price;

        //Query 1 application detial in 2 table, TBLAPP & TBLRES
        mysql = "SELECT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE,TBLRES.FLDREVIEW,TBLRES.FLDREVIEWER FROM TBLRES, TBLAPP WHERE [TBLRES].[FLDAPPID]=[TBLAPP].[ID] AND [TBLAPP].[ID]=" + appid + "";

        //Execute the query and return data
        ds = db.ExecuteQuery(mysql, "App");

        //Get the application image path
        appimgpath = ds.Tables["App"].Rows[0][1].ToString();

        //Store the price as string
        price = ds.Tables["App"].Rows[0][7].ToString();

        type = ds.Tables["App"].Rows[0][8].ToString();

        //Convert the price into Integer for comparsion
        int Priceint = Convert.ToInt32(price);

        //ImageUrl on Client Side
        appimg.ImageUrl = "~/img/" + appimgpath + "";

        //Application Name on Client Side
        AppName.Text = ds.Tables["App"].Rows[0][4].ToString();

        //Application Information on Client Side
        AppInfo.Text = ds.Tables["App"].Rows[0][5].ToString();

        //Appliacation detail on Client Side
        Appdetail.Text = ds.Tables["App"].Rows[0][6].ToString();

        if ( Session["uid"] == null)
        {
            //User not login yet
        }
        else {
            //Get the user id for next
            uid = Session["uid"].ToString();

            //Check if the item already in users purchase list and its status
            mysql = "SELECT * FROM TBLPURCHASE WHERE fldPurchaseUsername='" + uid + "' AND APPID = " + appid + " ";

            //Store the record for comparsion
            int i = db.Rownum(mysql, "test", ref uid);

            if (i > 0)
            {
                btnDownload.Text = "Owned";
                btnDownload.Enabled = false;
            }
            else {
                if (Priceint > 0)
                {
                    //Change the Download button
                    Price.Text = "$ " + price.ToString();
                    btnDownload.Text = "Purchase";
                }
                else
                {
                    //Change the tips
                    Price.Text = "Free";
                }

            }

        }



        //Query the application by type
        mysql = "SELECT distinct tblRes.fldAppID,tblRes.fldAppImgPath,tblRes.fldAppScreenshot,tblRes.fldAppCover,tblApp.fldAppName,tblApp.fldAppInfo,tblApp.fldAppdetail,tblApp.fldPrice,tblApp.fldType FROM tblRes, tblApp WHERE (([tblRes].[fldAppID]=[tblApp].[ID])) and fldType='" + type + " ' order by fldAppID desc ";

        //Execute Query String
        ds2 = db.ExecuteQuery(mysql, "Type");

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


    protected void btnDownload_Click(object sender, EventArgs e)
    {
        if (Session["uid"] == null)
        {
            //Login Validation
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { LoginFirst(); });", true);
        }
        else
        {

            //Get the appid 
            appid = Request.QueryString["ID"];

            //Get the user id
            uid = Session["uid"].ToString();

            try
            {
                DateTime dt = DateTime.Now; // Or whatever

                string s = string.Format("{0:yyyyMMddHHmmss}", dt);

                //Insert a record into database for new purchase order
                mysql = "INSERT INTO TBLPURCHASE (FLDPURCHASEUSERNAME,APPID,FLDSTATUS,FLDTIME) VALUES ('" + uid + "'," + appid + ",0,'"+ s +"')";

                //Execute the insert string
                db.ExecuteNonQuery(mysql);

                //insert item string
                string mysqlitem = "INSERT INTO TBLITEM (FLDPURCHASEID, FLDAPPID) SELECT ID, APPID FROM TBLPURCHASE WHERE NOT EXISTS(SELECT * FROM TBLITEM WHERE TBLITEM.FLDPURCHASEID = TBLPURCHASE.ID); ";

                //Execute the insert item string
                db.ExecuteNonQuery(mysqlitem);

                //Notify the user for about checking their account
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { Ordersubmit(); });", true);


            }
            catch (InvalidCastException ex)
            {
                Console.WriteLine(ex.Message);
            }

        }
    }

    

}