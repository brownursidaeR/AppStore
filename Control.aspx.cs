using CuteWebUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Control : System.Web.UI.Page
{
    CommDB db = new CommDB();

    public DataSet ds = new DataSet();

    OleDbDataAdapter da = new OleDbDataAdapter();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            { bind();}
        }
        
    }


    protected void Uploader1_FileValidating(object sender, UploaderEventArgs args)
    {
        string virpath = "/img/" + args.FileGuid + System.IO.Path.GetExtension(args.FileName);

        string savepath = Server.MapPath(virpath);
        
        string imgpath = virpath.Substring(virpath.LastIndexOf("/") + 1, virpath.LastIndexOf(".") - 1);


        //TEXT: never override existing file unless it's uploaded by same people.
        if (System.IO.File.Exists(savepath))
            return;

        string folder = System.IO.Path.GetDirectoryName(savepath);
        if (!System.IO.Directory.Exists(folder)) System.IO.Directory.CreateDirectory(folder);

        //now copy the file instead of 
        args.CopyTo(savepath);

        //send server information to client side.
        Uploader1.SetValidationServerData(virpath);

        string appid = Request.QueryString["ID"];
        //update imgpath
        string mysql = "UPDATE TBLRES SET FLDAPPIMGPATH='" + imgpath + "' WHERE FLDAPPID =" + appid + "";
        db.ExecuteNonQuery(mysql);
        //refresh page
        bind();
        Response.AddHeader("Refresh", "0");
    }

    protected void Update(object sender, EventArgs e)
    {
        string appid = Request.QueryString["ID"];
        string mysql = "UPDATE TBLAPP SET FLDAPPNAME='"+ AppName.Text +"',FLDAPPINFO='"+ AppInfo.Text +"',FLDAPPDETAIL='"+AppDetail.Text+"',FLDPRICE='"+AppPrice.Text+"',FLDTYPE='"+ AppType.SelectedItem.Value.ToString()+"' WHERE ID="+appid+"";
        db.ExecuteNonQuery(mysql);
        bind();
        Response.AddHeader("Refresh", "0");
    }

    protected void bind()
    {
        string appid = Request.QueryString["ID"];
        string mysql, appimgpath, appname, appinfo, appdetail, price; ;
        mysql = "SELECT TBLRES.FLDAPPID,TBLRES.FLDAPPIMGPATH,TBLRES.FLDAPPSCREENSHOT,TBLRES.FLDAPPCOVER,TBLAPP.FLDAPPNAME,TBLAPP.FLDAPPINFO,TBLAPP.FLDAPPDETAIL,TBLAPP.FLDPRICE,TBLAPP.FLDTYPE,TBLRES.FLDREVIEW,TBLRES.FLDREVIEWER FROM TBLRES, TBLAPP WHERE [TBLRES].[FLDAPPID]=[TBLAPP].[ID] AND [TBLAPP].[ID]=" + appid + "";
        ds = db.ExecuteQuery(mysql, "App");
        appimgpath = ds.Tables["App"].Rows[0][1].ToString();
        appimgpath = ds.Tables["App"].Rows[0][1].ToString();
        appname = ds.Tables["App"].Rows[0][4].ToString();
        appinfo = ds.Tables["App"].Rows[0][5].ToString();
        appdetail = ds.Tables["App"].Rows[0][6].ToString();
        price = ds.Tables["App"].Rows[0][7].ToString();

        appimg.ImageUrl = "~/img/" + appimgpath + "";
        AppName.Text = appname;
        AppInfo.Text = appinfo;
        AppDetail.Text = appdetail;
        AppPrice.Text = price;
       
    }

    

}