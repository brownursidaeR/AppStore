using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;
using CuteWebUI;




public partial class Manage : System.Web.UI.Page
{
    //Using method CommDB
    CommDB db = new CommDB();

    //String announcement
    public string appid, orderid, imgpath, mysql;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CheckLogin();
        }
    }

    private void CheckLogin()
    {
        if (Session["uid"] == null)
        {
            Response.Redirect("404.html");
        }
        else
        {
            //Get Session type
            string uid = Session["uid"].ToString();

            //Query string for Administrator
            string mysql = "SELECT * FROM TBLUSER WHERE FLDUSERNAME='" + uid + "' AND FLDTYPE=1";

            //store record in integer i
            int i = db.Rownum(mysql, "test", ref uid);

            if (i > 0)
            {
                adminuid.Text = "<i class=\"material-icons\">face</i> " + Session["uid"].ToString();
                bind();

            }
            else
            {
                Response.Redirect("404.html");
            }
        }
    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //Get index
        gv.PageIndex = e.NewPageIndex;

        //Call method bind()
        bind();
    }

    //Application Tab

    protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
    {
        //Using datakeys as appid
        appid = gv.DataKeys[e.NewEditIndex].Value.ToString();

        //Redirect to Control page with ID @appid
        Response.Redirect("Control.aspx?ID=" + appid);
    }

    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        //Get row index as appid
        appid = gv.DataKeys[e.RowIndex].Value.ToString();

        //Store appid as Session["Appid"]
        Session["Appid"] = appid;

        //Calling the Client side script on Confirm deleteing the record
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { DeleteConfirm(); });", true);
    }

    protected void Deleting_App(object sender, EventArgs e)
    {
        //Delete string
        string mysql = "DELETE FROM TBLAPP WHERE ID=" + Session["Appid"].ToString() + "";   //Delete from 2 tables!!!!!!

        //Execute delete string
        db.ExecuteNonQuery(mysql);

        //Refresh the page by calling bind();
        bind();
    }

    //Orders Tab
    protected void gvOrders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Find the value in the Status column.

            string value = e.Row.Cells[5].Text;

            if (value == "0")
            {
                e.Row.Cells[5].Text = "Pending";
            }
            else if (value == "1")
            {
                e.Row.Cells[5].Text = "Passed";
                e.Row.Cells[7].Enabled = false;
                e.Row.Cells[7].CssClass = "btn btn-default disabled";
                e.Row.Cells[7].ToolTip = "Already passed";
                e.Row.Cells[8].CssClass = "disabled";
                e.Row.Cells[8].Enabled = false;
            }
        }
    }

    protected void gvOrders_ConfirmOrders(object sender, GridViewEditEventArgs e)
    {
        //Using datakeys as appid
        ID = gvOrders.DataKeys[e.NewEditIndex].Value.ToString();

        //Update Orders status
        string mysqlS = "UPDATE TBLPURCHASE SET FLDSTATUS=1 WHERE ID=" + ID + "";

        db.ExecuteNonQuery(mysqlS);

        //Refresh Orders by calling bind()
        bind();
    }

    protected void gvOrders_DeletingOrders(object sender, GridViewDeleteEventArgs e)
    {
        //Get row index as datakey
        orderid = gvOrders.DataKeys[e.RowIndex].Value.ToString();

        //store orderid as Session["OrdersID"]
        Session["OrdersID"] = orderid;

        //Calling the Client side Script to confirm the deleteing operation
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "$(function() { DeleteOrders(); });", true);
    }

    protected void Deleting_Orders(object sender, EventArgs e)
    {
        //Delete orders string
        string mysql = "DELETE FROM TBLPURCHASE WHERE ID=" + Session["OrdersID"].ToString() + "";   //Delete from 2 tables!!!!!!

        //Execute delete string
        db.ExecuteNonQuery(mysql);

        //Refresh Orders by calling bind();
        bind();
    }


    private void bind()
    {
       
        DataSet ds = new DataSet();

        //Re-Using the QueryAppSQL
        string mysql = Session["QueryAppSQL"].ToString();

        //Set up the ds
        ds = db.ExecuteQuery(mysql, "App");

        //DataSoucre from ds
        gv.DataSource = ds.Tables["App"];

        //Using the datakey name to bind field
        gv.DataKeyNames = new string[] { "fldAppID" };

        //Data binding
        gv.DataBind();

        //DataSet using at the same time
        DataSet ds2 = new DataSet();

        //Query orders from 2 tables 
        string mysqlO = "SELECT TBLUSER.FLDUSERNAME,TBLAPP.FLDAPPNAME, TBLAPP.ID,TBLAPP.FLDPRICE,TBLITEM.FLDPURCHASEID,TBLPURCHASE.FLDSTATUS,TBLPURCHASE.FLDTIME FROM TBLUSER INNER JOIN ((TBLAPP INNER JOIN TBLITEM ON TBLAPP.ID = TBLITEM.FLDAPPID) INNER JOIN TBLPURCHASE ON (TBLPURCHASE.ID = TBLITEM.FLDPURCHASEID) AND (TBLAPP.ID = TBLPURCHASE.APPID)) ON (TBLUSER.FLDUSERNAME = TBLPURCHASE.FLDPURCHASEUSERNAME);";

        //Set up the ds2
        ds2 = db.ExecuteQuery(mysqlO, "Orders");

        //DataSoucre from ds2
        gvOrders.DataSource = ds2.Tables["Orders"];

        //Using the datakey name to bind field
        gvOrders.DataKeyNames = new string[] { "fldPurchaseID" };

        //Data binding
        gvOrders.DataBind();

    }



    protected void Logout_Click(object sender, EventArgs e)
    {
        Session["uid"] = null;
        Response.Redirect("~/index.aspx");
    }

    protected void Upload_Click(object sender, EventArgs e)
    {
        Response.Redirect("Add.aspx");
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (DropDown.SelectedValue == "App") {

            gv.DataSource = null;
            
            DataSet ds = new DataSet();

            //Query app
            string mysql = "SELECT DISTINCT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE FROM TBLRES, TBLAPP WHERE (([TBLRES].[FLDAPPID]=[TBLAPP].[ID])) AND FLDAPPNAME LIKE '%%" + txbSearch.Text.ToString() + "%%'";

            //Set up the ds
            ds = db.ExecuteQuery(mysql, "AppQ");

            //DataSoucre from ds
            gv.DataSource = ds.Tables["AppQ"];

            //Using the datakey name to bind field
            gv.DataKeyNames = new string[] { "fldAppID" };

            //Data binding
            gv.DataBind();

        } else if (DropDown.SelectedValue == "Order") {

            gvOrders.DataSource = null;

            //DataSet using at the same time
            DataSet ds2 = new DataSet();

            //Query orders from 2 tables 
            string mysqlO = "SELECT DISTINCT TBLUSER.FLDUSERNAME,TBLRES.FLDAPPIMGPATH,TBLAPP.FLDAPPNAME, TBLAPP.ID,TBLAPP.FLDPRICE,TBLITEM.FLDPURCHASEID,TBLPURCHASE.FLDSTATUS,TBLPURCHASE.FLDTIME FROM TBLUSER INNER JOIN(((TBLAPP INNER JOIN tblItem ON TBLAPP.ID = TBLITEM.FLDAPPID) INNER JOIN TBLPURCHASE ON (TBLPURCHASE.ID = TBLITEM.FLDPURCHASEID) AND (TBLAPP.ID = TBLPURCHASE.APPID)) INNER JOIN TBLRES ON (TBLITEM.FLDAPPID = TBLRES.FLDAPPID) AND(TBLAPP.ID = TBLRES.FLDAPPID)) ON (TBLUSER.FLDUSERNAME = TBLPURCHASE.FLDPURCHASEUSERNAME) WHERE FLDPURCHASEUSERNAME LIKE '%%" + txbSearch.Text.ToString() + "%%' ";

            //Set up the ds2
            ds2 = db.ExecuteQuery(mysqlO, "OrdersQ");

            //DataSoucre from ds2
            gvOrders.DataSource = ds2.Tables["OrdersQ"];

            //Using the datakey name to bind field
            gvOrders.DataKeyNames = new string[] { "fldPurchaseID" };

            //Data binding
            gvOrders.DataBind();
        }
        else {

        }
    }
}
