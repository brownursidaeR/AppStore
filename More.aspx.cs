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

    string mysql;

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
        string type = Session["GetType"].ToString();
        mysql = "SELECT distinct tblRes.fldAppID,tblRes.fldAppImgPath,tblRes.fldAppScreenshot,tblRes.fldAppCover,tblApp.fldAppName,tblApp.fldAppInfo,tblApp.fldAppdetail,tblApp.fldPrice,tblApp.fldType FROM tblRes, tblApp WHERE (([tblRes].[fldAppID]=[tblApp].[ID])) and fldType='"  + type +" ' order by fldAppID desc ";
        ds = db.ExecuteQuery(mysql,"Type");
        int z= ds.Tables["Type"].Rows.Count;

    }

    protected void CatLink_Click(object sender, EventArgs e)
    {
        LinkButton b = (LinkButton)sender;
        Session["GetType"] = b.ID.ToString();
        Response.Redirect("~/More.aspx?Type=" + b.ID.ToString());
    }

}