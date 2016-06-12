using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.Page
{
    //Using method CommDB
    CommDB db = new CommDB();
    string uid;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
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
                    string mysql = "SELECT * FROM TBLUSER WHERE FLDUSERNAME='" + uid + "' AND FLDTYPE=0";

                    //store record in integer i
                    int i = db.Rownum(mysql, "test", ref uid);

                    if (i > 0)
                    {
                        bind();
                    }
                    else
                    {
                        Response.Redirect("404.html");
                    }
                }
            }
        }
    }

    protected void gvOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        //Get index
        gvOrders.PageIndex = e.NewPageIndex;
        //Call method bind()
        bind();
    }

    protected void gvOrders_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            // Find the value in the Status column.
            string value = e.Row.Cells[6].Text;

            if (value == "0")
            {
                e.Row.Cells[6].Text = "Pending";
            }
            else if (value == "1")
            {
                e.Row.Cells[6].Text = "Accepted";
            }
        }
    }

    private void bind()
    {
        //Get the userid 
        uid = Session["uid"].ToString();

        //DataSet using at the same time
        DataSet ds = new DataSet();

        //Query orders from 3 tables 
        //string mysqlO = "SELECT TBLUSER.FLDUSERNAME,TBLAPP.FLDAPPNAME, TBLAPP.ID,TBLAPP.FLDPRICE,TBLITEM.FLDPURCHASEID,TBLPURCHASE.FLDSTATUS FROM TBLUSER INNER JOIN ((TBLAPP INNER JOIN TBLITEM ON TBLAPP.ID = TBLITEM.FLDAPPID) INNER JOIN TBLPURCHASE ON (TBLPURCHASE.ID = TBLITEM.FLDPURCHASEID) AND (TBLAPP.ID = TBLPURCHASE.APPID)) ON (TBLUSER.FLDUSERNAME = TBLPURCHASE.FLDPURCHASEUSERNAME) WHERE FLDUSERNAME='"+ uid +"'";
        string mysqlO = "SELECT DISTINCT TBLUSER.FLDUSERNAME,TBLRES.FLDAPPIMGPATH,TBLAPP.FLDAPPNAME, TBLAPP.ID,TBLAPP.FLDPRICE,TBLITEM.FLDPURCHASEID,TBLPURCHASE.FLDSTATUS, TBLPURCHASE.FLDTIME FROM TBLUSER INNER JOIN(((TBLAPP INNER JOIN tblItem ON TBLAPP.ID = TBLITEM.FLDAPPID) INNER JOIN TBLPURCHASE ON (TBLPURCHASE.ID = TBLITEM.FLDPURCHASEID) AND (TBLAPP.ID = TBLPURCHASE.APPID)) INNER JOIN TBLRES ON (TBLITEM.FLDAPPID = TBLRES.FLDAPPID) AND(TBLAPP.ID = TBLRES.FLDAPPID)) ON (TBLUSER.FLDUSERNAME = TBLPURCHASE.FLDPURCHASEUSERNAME) WHERE FLDPURCHASEUSERNAME ='" + uid + "'";
        //Set up the ds2
        ds = db.ExecuteQuery(mysqlO, "Orders");

        //DataSoucre from ds2
        gvOrders.DataSource = ds.Tables["Orders"];

        //Using the datakey name to bind field
        gvOrders.DataKeyNames = new string[] { "fldPurchaseID" };

        //Data binding
        gvOrders.DataBind();
    }
}