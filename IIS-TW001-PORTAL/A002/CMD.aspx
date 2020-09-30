<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CMD.aspx.cs" Inherits="CMD" %>

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
         <a href='./'>系統信息管理</a> ->CMD</h1>
        <p>DB 數據字典 <a href="http://tmc.jungle123.com/hd/db/CMD_MST/">http://tmc.jungle123.com/hd/db/CMD_MST/</a> </p>
       <h3>命令列表-未處理 (09/30 14:00 包括狀態為0 和1)</h3>

      
        <%=GetHtmlTableWhRec(@"
SELECT 
WmsTskId
,CmdSno
,CmdSts

,StnNo
,CmdMode
,Loc	
,[TrnDate]
,[EndTime]
,CMDNO
,LINEID
,CTICKETCODE
,PACKAGENO
,REMARK	 FROM CMD_MST cmd WHERE cmd.LINEID = 1 and cmd.StnNo in ('1','2') and cmd.CmdSts in ('0','1');

")%>
        
NOTE:狀態1是指進行中,12,22,52 可以继续下命令,狀態會保持為1
            
        <ul>
            <li>12：入库任务下达主机命令</li>
<li>22：出库任务下达主机命令 </li>
<li>52：库对库任务下达主机命令</li>

             
             
            
        </ul>


        <hr />
     
        
          <h3>命令列表-最近30筆</h3>
 
      
        <%=GetHtmlTableWhRec(@"
SELECT TOP 30
WmsTskId
,CmdSno
,CmdSts

,StnNo
,CmdMode
,Loc	
,[TrnDate]
,[EndTime]
,CMDNO
,LINEID
,CTICKETCODE
,PACKAGENO
,REMARK	 FROM CMD_MST cmd WHERE cmd.LINEID = 1 and cmd.StnNo in ('1','2') 
ORDER BY WmsTskId DESC
;

")%>

        NOTE:        ,FORMAT(CAST([TrnDate] As DATETIME),'MM/dd HH:mm') TRANS  遇到不同格式的日期時間會出錯。
        
           <hr />

        



        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
