using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;


public partial class Manage : System.Web.UI.Page
{
    CommDB db = new CommDB();

    DataSet ds = new DataSet();

    DataTable App = new DataTable();

    OleDbDataAdapter da = new OleDbDataAdapter();

    string mysql;
    
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            { bind(); }
        }
    }

    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
        bind();
    }

    protected void gv_RowEditing(object sender, GridViewEditEventArgs e)
    {
        string appid = gv.DataKeys[e.NewEditIndex].Value.ToString();
        Response.Redirect("Edit.aspx?ID=" + appid);
    }

    protected void gv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string appid = gv.DataKeys[e.RowIndex].Value.ToString();
        Response.Redirect("Edit.aspx?ID=" + appid);
        bind();
    }

    private void bind()
    {
        mysql = Session["QueryAppSQL"].ToString();
        ds = db.ExecuteQuery(mysql, "App");
        gv.DataSource = ds.Tables["App"];
        gv.DataKeyNames = new string[] { "fldAppID" };
        gv.DataBind();
    }



}