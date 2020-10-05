<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CYCLE.aspx.cs" Inherits="CYCLE" %>

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
         <a href='./'>Index</a> ->盤點-出庫</h1>
         <h3>循环盘点列表</h3>

      
    

          <h3>狀態為 1 或 6</h3>
        
        <%=GetHtmlTableWhRec(@"

SELECT sc.cstatus STAT, sc.cticketcode TICKET
,sc.checktype CHK,sc.worktype WRK
,FORMAT(sc.dcirclecheckbegindate,'yyyy-MM-dd') START_DT
,FORMAT(sc.dcirclecheckenddate,'yyyy-MM-dd') END_DT
,scd.cpositioncode CELL,scd.palletcode PALLET ,scd.cinvcode PART, scd.iquantity QTY 

FROM STOCK_CHECKBILL sc WITH(NOLOCK) 
INNER JOIN STOCK_CHECKBILL_D scd on sc.id = scd.id 
WHERE sc.cstatus in ('1','6') ORDER BY sc.cticketcode DESC, scd.cpositioncode

")%>
        

      
        <hr />
     NOTE:http://tmc.jungle123.com/hd/db/STOCK_CHECKBILL/
        <ul>
            <li>CHK checktype 	盘点类型（0:物理，1:循环，2:抽盘）</li>
<li>WRK worktype 作业方式</li>

        </ul>

        
           <hr />
          <h3>入庫單狀態統計表</h3>
        
        <%=GetHtmlTableWhRec(@"

        SELECT 	cstatus, operationtype,count(*) cnt FROM inbill
group by cstatus, operationtype
order by cstatus, operationtype
")%>
            
           <hr />
               <h3>出庫單狀態統計表</h3>
        
        <%=GetHtmlTableWhRec(@"

SELECT 	cstatus, operationtype,count(*) cnt FROM outbill
group by cstatus, operationtype
order by cstatus, operationtype
")%>
        

           <hr />
          <h3>調撥單狀態統計表</h3>
        
        <%=GetHtmlTableWhRec(@"

      SELECT 	cstatus, cdefine1,count(*) cnt FROM ALLOCATE
group by cstatus, cdefine1
order by cstatus, cdefine1

")%>



        
         NOTE:http://tmc.jungle123.com/hd/db/STOCK_CHECKBILL/
        <ul>
            <li>cstatus 	0:未處理，1:已審核，2:...）</li>
<li>cdefine1 自定义1 0:普通调拨 1：出库调拨至备料储位 2：备料储位回库</li>

        </ul>



        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
