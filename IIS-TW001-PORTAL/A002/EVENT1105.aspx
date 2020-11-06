<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EVENT1105.aspx.cs" Inherits="EVENT1105" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet"
        href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/styles/default.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/highlight.min.js"></script>


    <script>hljs.initHighlightingOnLoad();</script>


    <style>
        .bug {
            background-color: lightgoldenrodyellow;
            color: red;
            font-size: 135%;
            margin-left: 8px;
        }

        .wms-page {
            background-color: lightgray;
            color: navy;
            font-size: 125%;
            margin-left: 8px;
        }

        .key-condition {
            background-color: pink;
            color: navy;
            /*font-size: 125%;*/
            margin-left: 8px;
        }

        .pink-back {
            background-color: pink;
            color: navy;
            font-weight: bolder;
            /*font-size: 125%;*/
        }

        .bu-dan {
            background-color: yellow;
            color: red;
            font-weight: bolder;
            /*font-size: 125%;*/
        }

        table.gridtable {
            font-family: verdana, arial, sans-serif;
            font-size: 90%;
            /*color:#333333;*/
            color: black;
            border-width: 1px;
            /*border-color: #666666;*/
            border-color: #666666;
            border-collapse: collapse;
        }

            table.gridtable th {
                text-align: center;
                align-content: center;
                align-items: center;
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                /*border-color: #666666;*/
                border-color: #666666;
                background-color: #dedede;
            }

            table.gridtable td {
                border-width: 1px;
                padding: 8px;
                border-style: solid;
                /*border-color: #666666;*/
                border-color: #666666;
                background-color: #ffffff;
            }
    </style>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
</head>
<body>
    <div class="container-fluid">
        <h1>
            <br />
           <a href='./'>系統信息管理</a> ->EVENT1105 </h1>
              <div>
                  <hr />
                  <h3>跟據開平和先顥2020-11-05反應,客戶啟用系統,料號主檔部分不正確且已有入庫記錄。目前涉及2個料號  11個儲位</h3>
                  <hr />
                  <h4>預擬解決方案:</h4>
                  <ol>
                      <li>後台直接以正確的料號調整。
                          <ul>
                              <li>優:</li>
                              <li>缺:</li>
                          </ul>

                      </li>
                      <li>現場暫停, 以云3全新正確的料號頁面操作後數據全備還原。
                                <ul>
                              <li>優:</li>
                              <li>缺:</li>
                          </ul>

                      </li>
                      <li>增加庫存調整, 針對需求只調整料號。
                                <ul>
                              <li>優:</li>
                              <li>缺:</li>
                          </ul>

                      </li>

                  </ol>

            <hr />
                  <h3>現有庫存</h3>
     <%=GetHtmlTableWhRec(@"

SELECT cpositioncode,	cposition,	cinvcode,	cinvname,	iqty,T2.palletcode
FROM STOCK_CURRENT T1 INNER JOIN STOCK_CURRENT_SN T2 ON T1.id =T2.stock_id WHERE lastupdatetime< '2020-11-06'
ORDER BY cpositioncode
")%>
                  <hr />
                  <h3>入庫單</h3>
     <%=GetHtmlTableWhRec(@"

SELECT cticketcode,T2.cinvcode,T2.cinvname,iquantity,cpositioncode,cposition
FROM INBILL T1 INNER JOIN INBILL_D T2 ON T1.id =T2.id 
INNER JOIN INBILL_D_SN T3 ON T2.ids=T3.inbill_d_ids
WHERE dcreatetime< '2020-11-06'
ORDER BY cticketcode
")%>

                  <hr />
                                    <h3>入庫通知單</h3>
     <%=GetHtmlTableWhRec(@"

SELECT cticketcode, cinvcode,cinvname,iquantity
FROM INASN T1 INNER JOIN INASN_D T2 ON T1.id =T2.id WHERE dcreatetime< '2020-11-06'
ORDER BY cticketcode
")%>
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
