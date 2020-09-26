﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CELL : System.Web.UI.Page
{
    public string cell_num = "";
    public string CUST = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        cell_num = Request.QueryString["CELL"];
        CUST = Request.QueryString["CUST"];
    }

    public string showCellNum()
    {
        return cell_num;
    }

    public string showCUST()
    {
        return CUST;
    }
    //https://www.it1352.com/1205195.html
    public static string DBConnection()
    {
        try
        {
            return System.Configuration.ConfigurationManager.AppSettings["connstring"];

        }
        catch (Exception ce)
        {

            throw new ApplicationException("Unable to get DB Connection string from Config File. Contact Administrator" + ce);
        }
    }
    /*
    V_A001
        SELECT Id, ProprietorCode AS OwnerCode, AbbreviationName AS OwnerName, Cstatus,
    ---,decode (Cstatus,'0','D','1','C','2','B','???') strStatus

    CASE WHEN Cstatus = '0' THEN '未启用'
WHEN Cstatus = '1' THEN '启用'
WHEN Cstatus = '2' THEN '作废'
ELSE '未設定' END AS strStatus

    FROM     dbo.Base_Proprietor

    <add name="connstring" connectionString="Server=192.168.88.2\SQL2012;database=NuoXin;User ID=sa;Password=sa;Max Pool Size=500;" providerName="System.Data.SqlClient" />
   
     */

    public string getWhileLoopData()
    {
        string htmlStr = "";
        string dbConnection = System.Configuration.ConfigurationManager.ConnectionStrings["connstring"].ConnectionString;
        SqlConnection thisConnection = new SqlConnection(dbConnection);
        SqlCommand thisCommand = thisConnection.CreateCommand();
        thisCommand.CommandText = "SELECT * from V_A001";
        thisConnection.Open();
        SqlDataReader reader = thisCommand.ExecuteReader();

        while (reader.Read())
        {
            string Id = reader.GetString(0);
            string OwnerCode = reader.GetString(1);
            string OwnerName = reader.GetString(2);
            htmlStr += "<tr><td>" + Id + "</td><td>" + OwnerCode + "</td><td>" + OwnerName + "</td></tr>";
        }

        thisConnection.Close();
        return htmlStr;
    }
    //https://stackoverflow.com/questions/681653/can-you-get-the-column-names-from-a-sqldatareader

    public string GetSpanClass(string data, string strClass)
    {
        return "<span class='" + strClass + "'>" + data + "</span>";
    }

    public string GetSpanClassKeyCondition(string data)
    {
        string strClass = "key-condition";
        return GetSpanClass(data, strClass);
    }
    public string GetSpanClassBug(string data)
    {
        string strClass = "bug";
        return GetSpanClass(data, strClass);
    }
    public string GetSpanClassWmsPage(string data)
    {
        string strClass = "wms-page";
        return GetSpanClass(data, strClass);
    }

    public string Get入庫通知單()
    {
        var str = "cticketcode=InAsn2008150001";
        //        return GetSpanClass(str, "key-condition");
        return GetSpanClassKeyCondition(str);

    }
    public string Get入庫通知單Page()
    {
        var str = "FrmINASNList.aspx";
        return GetSpanClassWmsPage(str);

    }

    public string Get入庫通知單明細()
    {
        var str = "id=ad8fe74c-d3b4-483a-b70f-f426b98e7d09";
        return GetSpanClassKeyCondition(str);

    }
    public string Get入庫通知單明細Page()
    {
        var str = "FrmINBILLEdit.aspx";
        return GetSpanClassWmsPage(str);

    }
    public string Get入庫單()
    {
        var str = "asncode='InAsn2008150001'";
        return GetSpanClassKeyCondition(str);

    }
    public string Get入庫單Page()
    {
        var str = "FrmINBILLList.aspx";
        return GetSpanClassWmsPage(str);

    }
    public string Get入庫單Bug1()
    {
        var str = @"入庫單扣賬時, 將會生成裝箱信息.目前裝箱信息的 PalletCode 欄位信息沒有出現,同時影響了[ 入库管理->装箱信息] 第一優先的[栈板号][查詢]
<ul>
<li>btnUpdateSTOCK</li>
<li>btnUpdateSTOCK_Click</li>
<li>InBill.BatchInBillTOStock_Currnt_Proc(SelectIds, WmsWebUserInfo.GetCurrentUser().UserNo)</li>
<li>InBill.Check_Proc_OutBillTOStock_Currnt(item, userNo, cguid, ref cmsg))</li>
<li>
Proc_InBillTOSTOCK_CURRENT</li>
</ul>
";
        return GetSpanClassBug(str);

    }
    public string Get入庫單明細()
    {
        var str = "id='997f7ac0-7cfa-46ef-bd00-7df7cbfec1c7'";
        return GetSpanClassKeyCondition(str);

    }
    public string Get入庫單明細Page()
    {
        var str = "FrmINBILLEdit.aspx";
        return GetSpanClassWmsPage(str);

    }

    //FrmINBILLEdit.aspx
    //FrmINBILL_DEdit.aspx

    public string Get入庫單明細SN()
    {
        var str = "inbill_d_ids='00362641-4B35-4295-9CD5-242A3976D7D0'";
        return GetSpanClassKeyCondition(str);

    }
    public string Get入庫單明細SNPage()
    {
        var str = "FrmINBILL_DEdit.aspx";
        return GetSpanClassWmsPage(str);

    }
    public string Get裝箱信息()
    {
        var str = "id='InAsn2008150001'";
        return GetSpanClassKeyCondition(str);

    }
    public string Get裝箱信息Page()
    {
        var str = "FrmINASNEMTList.aspx";
        return GetSpanClassWmsPage(str);

    }
    public string Get庫存查詢()
    {
        var str = "cposition='01-0202704'";
        return GetSpanClassKeyCondition(str);

    }
    public string Get庫存查詢Page()
    {
        var str = "FrmSTOCK_CurrentQueryList.aspx";
        return GetSpanClassWmsPage(str);

    }
    public string GetHTMLHeader(SqlDataReader reader)
    {
        var columns = new List<string>();
        StringBuilder sb = new StringBuilder("<tr>");


        for (int i = 0; i < reader.FieldCount; i++)
        {

            sb.AppendFormat("<th>{0}</th>", reader.GetName(i));
        }
        sb.Append("</tr>");
        return sb.ToString();
    }
    public string GetHTMLHeaderWhRec(SqlDataReader reader)
    {
        var columns = new List<string>();
        StringBuilder sb = new StringBuilder("<tr><th></th>");


        for (int i = 0; i < reader.FieldCount; i++)
        {

            sb.AppendFormat("<th>{0}</th>", reader.GetName(i));
        }
        sb.Append("</tr>");
        return sb.ToString();
    }

    //https://docs.microsoft.com/en-us/dotnet/api/system.data.sqlclient.sqldatareader?view=dotnet-plat-ext-3.1

    // https://stackoverflow.com/questions/1100260/multiline-string-literal-in-c-sharp
    public string GetHtmlTable(string strSQL)
    {
        // string htmlStr = "";
        StringBuilder sb = new StringBuilder("<table class='gridtable'>");
        string dbConnection = System.Configuration.ConfigurationManager.ConnectionStrings["connstring"].ConnectionString;
        SqlConnection thisConnection = new SqlConnection(dbConnection);
        SqlCommand thisCommand = thisConnection.CreateCommand();
        //        thisCommand.CommandText = "SELECT * from V_A001";
        thisCommand.CommandText = strSQL;

        thisConnection.Open();
        SqlDataReader reader = thisCommand.ExecuteReader();

        sb.Append(GetHTMLHeader(reader));
        sb.Append(GetHTMLData(reader));
        sb.Append("</table>");

        sb.Append("<p><span style='background-Color:yellow'>" + strSQL + "</span></p>");
        thisConnection.Close();
        return sb.ToString();
    }

    public string ShowCell()
    {
        string strSQL = "SELECT cinvcode 料號,	cinvname 品名,qty 數量 ,palletcode 棧板號 FROM R09_STOCK WHERE CELL = '" + cell_num + "'";
        return GetHtmlTableWhRec(strSQL);
    }

    public string ShowCell2()
    {
        string strSQL = String.Format(@"SELECT PART 料號,	RANK_FINAL [批/序號(RANK)],cinvname 品名,qty 數量 , palletcode 棧板號, PART_FULL 數據庫實際料號 
FROM R09_STOCK T1
INNER JOIN TW_BASE_PART T2
ON T1.cinvcode = T2.PART_FULL WHERE CELL = '{0}'"
            , cell_num);
        return GetHtmlTableWhRec(strSQL);
    }
    public string GetHtmlTableWhRec(string strSQL)
    {
        // string htmlStr = "";
        StringBuilder sb = new StringBuilder("<table class='gridtable'>");
        string dbConnection = System.Configuration.ConfigurationManager.ConnectionStrings["connstring"].ConnectionString;
        SqlConnection thisConnection = new SqlConnection(dbConnection);
        SqlCommand thisCommand = thisConnection.CreateCommand();
        //        thisCommand.CommandText = "SELECT * from V_A001";
        thisCommand.CommandText = strSQL;

        thisConnection.Open();
        SqlDataReader reader = thisCommand.ExecuteReader();

        sb.Append(GetHTMLHeaderWhRec(reader));
        sb.Append(GetHTMLDataWhRec(reader));
        sb.Append("</table>");

        //      sb.Append("<p  style='margin-top:5px;'><span style='background-Color:lightgrey'>" + strSQL + "</span></p>");
        thisConnection.Close();
        return sb.ToString();
    }
    public string GetWhOneRow(string strSQL)
    {
        // string htmlStr = "";
        StringBuilder sb = new StringBuilder("<table class='gridtable'>");
        string dbConnection = System.Configuration.ConfigurationManager.ConnectionStrings["connstring"].ConnectionString;
        SqlConnection thisConnection = new SqlConnection(dbConnection);
        SqlCommand thisCommand = thisConnection.CreateCommand();
        //        thisCommand.CommandText = "SELECT * from V_A001";
        thisCommand.CommandText = strSQL;

        thisConnection.Open();
        SqlDataReader reader = thisCommand.ExecuteReader();

        sb.Append(GetHTMLHeader(reader));
        sb.Append(GetWhOneRowData(reader));
        sb.Append("</table>");

        sb.Append("<p><span style='background-Color:yellow'>" + strSQL + "</span></p>");
        thisConnection.Close();
        return sb.ToString();
    }

    public string getA001()
    {
        // string htmlStr = "";
        StringBuilder sb = new StringBuilder("<table class='gridtable'>");
        string dbConnection = System.Configuration.ConfigurationManager.ConnectionStrings["connstring"].ConnectionString;
        SqlConnection thisConnection = new SqlConnection(dbConnection);
        SqlCommand thisCommand = thisConnection.CreateCommand();
        thisCommand.CommandText = "SELECT * from V_A001";
        thisConnection.Open();
        SqlDataReader reader = thisCommand.ExecuteReader();

        sb.Append(GetHTMLHeader(reader));
        sb.Append(GetHTMLData(reader));
        sb.Append("</table>");

        thisConnection.Close();
        return sb.ToString();
    }


    public string getHTMLRows()
    {
        string htmlStr = "";
        string dbConnection = System.Configuration.ConfigurationManager.ConnectionStrings["connstring"].ConnectionString;
        SqlConnection thisConnection = new SqlConnection(dbConnection);
        SqlCommand thisCommand = thisConnection.CreateCommand();
        thisCommand.CommandText = "SELECT * from V_A001";
        thisConnection.Open();
        SqlDataReader reader = thisCommand.ExecuteReader();

        //htmlStr += GetHTMLHeader(reader);

        while (reader.Read())
        {
            htmlStr += ReadSingleRowV2((IDataRecord)reader);
            //string Id = reader.GetString(0);
            //string OwnerCode = reader.GetString(1);
            //string OwnerName = reader.GetString(2);
            //htmlStr += "<tr><td>" + Id + "</td><td>" + OwnerCode + "</td><td>" + OwnerName + "</td></tr>";
        }

        thisConnection.Close();
        return htmlStr;
    }
    private static string ReadSingleRow(IDataRecord record)
    {
        //string Id = reader.GetString(0);
        //string OwnerCode = reader.GetString(1);
        //string OwnerName = reader.GetString(2);
        var htmlStr = "<tr><td>" + record[0] + "</td><td>" + record[1] + "</td><td>" + record[2] + "</td></tr>";
        return htmlStr;
    }

    private string GetHTMLData(SqlDataReader reader)
    {
        StringBuilder sb = new StringBuilder("");
        while (reader.Read())
        {
            sb.Append(ReadSingleRowV2((IDataRecord)reader));
        }
        return sb.ToString();
        //string Id = reader.GetString(0);
        //string OwnerCode = reader.GetString(1);
        //string OwnerName = reader.GetString(2);
        //htmlStr += "<tr><td>" + Id + "</td><td>" + OwnerCode + "</td><td>" + OwnerName + "</td></tr>";
    }


    private string GetHTMLDataWhRec(SqlDataReader reader)
    {
        StringBuilder sb = new StringBuilder("");
        int k = 0;
        while (reader.Read())
        {
            k++;
            sb.Append(ReadSingleRowV2WhRec((IDataRecord)reader, k));
        }
        return sb.ToString();
        //string Id = reader.GetString(0);
        //string OwnerCode = reader.GetString(1);
        //string OwnerName = reader.GetString(2);
        //htmlStr += "<tr><td>" + Id + "</td><td>" + OwnerCode + "</td><td>" + OwnerName + "</td></tr>";
    }

    // DOING
    private string GetWhOneRowData(SqlDataReader reader)
    {
        StringBuilder sb = new StringBuilder("<tr>");
        while (reader.Read())
        {
            sb.Append(ReadSingleRowV3Wh((IDataRecord)reader));
        }
        sb.Append("</tr>");
        return sb.ToString();
        //string Id = reader.GetString(0);
        //string OwnerCode = reader.GetString(1);
        //string OwnerName = reader.GetString(2);
        //htmlStr += "<tr><td>" + Id + "</td><td>" + OwnerCode + "</td><td>" + OwnerName + "</td></tr>";
    }

    private static string ReadSingleRowV2(IDataRecord record)
    {
        StringBuilder sb = new StringBuilder("<tr>");
        for (int i = 0; i < record.FieldCount; i++)
        {
            sb.AppendFormat("<td>{0}</td>", record[i]);

        }
        sb.Append("</tr>");
        //var htmlStr = "<tr><td>" + record[0] + "</td><td>" + record[1] + "</td><td>" + record[2] + "</td></tr>";
        return sb.ToString();
    }
    private static string ReadSingleRowV2WhRec(IDataRecord record, int rec)
    {
        StringBuilder sb = new StringBuilder("<tr><th>" + rec + "</th>");
        for (int i = 0; i < record.FieldCount; i++)
        {
            sb.AppendFormat("<td>{0}</td>", record[i]);

        }
        sb.Append("</tr>");
        //var htmlStr = "<tr><td>" + record[0] + "</td><td>" + record[1] + "</td><td>" + record[2] + "</td></tr>";
        return sb.ToString();
    }


    private static string ReadSingleRowV3Wh(IDataRecord record)
    {
        StringBuilder sb = new StringBuilder("");
        for (int i = 0; i < record.FieldCount; i++)
        {
            sb.AppendFormat("<td>{0}</td>", record[i]);

        }
        sb.Append("");
        //var htmlStr = "<tr><td>" + record[0] + "</td><td>" + record[1] + "</td><td>" + record[2] + "</td></tr>";
        return sb.ToString();
    }
}