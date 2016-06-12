using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Configuration;
using System.Data;
using System.Text;
using System.Security.Cryptography;
using System.IO;

/// <summary>
/// CommDB
/// </summary>
/// All the command operation would presented here
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
        catch(Exception ex)
        {
            cn.Close();
            Console.WriteLine(ex);
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


    //*********************************************************************
    //*  Password encryption and decryption written on my own             *
    //*********************************************************************

    public string Encrypt(string clearText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                {
                    cs.Write(clearBytes, 0, clearBytes.Length);
                    cs.Close();
                }
                clearText = Convert.ToBase64String(ms.ToArray());
            }
        }
        return clearText;
    }

    public string Decrypt(string cipherText)
    {
        string EncryptionKey = "MAKV2SPBNI99212";
        byte[] cipherBytes = Convert.FromBase64String(cipherText);
        using (Aes encryptor = Aes.Create())
        {
            Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
            encryptor.Key = pdb.GetBytes(32);
            encryptor.IV = pdb.GetBytes(16);
            using (MemoryStream ms = new MemoryStream())
            {
                using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
                {
                    try
                    {
                        cs.Write(cipherBytes, 0, cipherBytes.Length);
                        cs.Close();
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex);

                    }
                }
                cipherText = Encoding.Unicode.GetString(ms.ToArray());
            }
        }
        return cipherText;
    }

}