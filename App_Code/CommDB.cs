using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Configuration;
using System.Data;

/// <summary>
/// CommDB 的摘要说明
/// </summary>
/// All the common operation would presented here
public class CommDB
{
    //Connection string saved in webconfig which can be encrypt on the server
    public static readonly string mystr = System.Configuration.ConfigurationManager.AppSettings["mcstring"].ToString() + System.Web.HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings["dbPath"]) + ";";
    
    public CommDB()
    {

    }

    //***************************************************
    //*  Select Command Operation would presented here  *
    //***************************************************

    public int Rownum(string sql, string name, ref string username)
    {

        int i = 0;
        OleDbConnection cn = new OleDbConnection(); //New connection cn
        cn.ConnectionString = mystr;
        cn.Open();
        OleDbCommand cd = new OleDbCommand(sql, cn); //New command cd
        OleDbDataReader dr = cd.ExecuteReader();
        while (dr.Read())
        {
            username = dr[0].ToString();
            i++;
        }
        cn.Close();
        return i;

    }

    //*********************************************************************
    //*  Update,insert and delete Command Operation would presented here  *
    //*********************************************************************

    public Boolean ExecuteNonQuery(string sql)
    {
        OleDbConnection cn = new OleDbConnection(); //New Connection cn
        cn.ConnectionString = mystr;
        cn.Open();
        OleDbCommand cd = new OleDbCommand(sql, cn);//New Command cd
        try
        {
            cd.ExecuteNonQuery();
            cn.Close();
        }
        catch
        {
            cn.Close();
            return false;
        }

        return true;

    }

    //*********************************************************************
    //*  Select Command Operation and return a Dataset                    *
    //*********************************************************************

    public DataSet ExecuteQuery(string sql, string any)
    {
        OleDbConnection cn = new OleDbConnection(); //New connection cn
        cn.ConnectionString = mystr;
        cn.Open();
        OleDbDataAdapter da = new OleDbDataAdapter(sql, cn);//New DataAdapter da
        DataSet ds = new DataSet();
        ds.Clear();
        da.Fill(ds, any);
        cn.Close();
        return ds;

    }

}