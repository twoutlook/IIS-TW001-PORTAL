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
    <div class="container">
          <h1>
            <br />
         <a href='./'>Index</a> ->CMD</h1>
     

        <h2>先確定是立庫</h2>
        <p>SELECT @PLCType = PLCType FROM dbo.BASE_CRANECONFIG WITH(NOLOCK) WHERE CRANEID = @P_LineId AND FLAG=0; </p>

        <%=GetHtmlTableWhRec(@"
SELECT PLCType ,CRANEID,FLAG
FROM dbo.BASE_CRANECONFIG WITH(NOLOCK) WHERE CRANEID ='1' AND FLAG=0;

")%>
        <hr />
        <h2>判断是否已存在未处理的入库命令</h2>


        <p>SELECT @P_Count = COUNT(*) FROM CMD_MST cmd WHERE cmd.LINEID = @P_LineId and cmd.StnNo = @P_SiteId and cmd.CmdSts in ('0'); </p>
<h3>1線1站</h3>
        <%=GetHtmlTableWhRec(@"
SELECT COUNT(*) 未处理的入库命令數 FROM CMD_MST cmd WHERE cmd.LINEID = 1 and cmd.StnNo = 1 and cmd.CmdSts in ('0');

")%>
        <br />
        <h3>1線2站</h3>

      
        <%=GetHtmlTableWhRec(@"
SELECT COUNT(*) 未处理的入库命令數 FROM CMD_MST cmd WHERE cmd.LINEID = 1 and cmd.StnNo = 2 and cmd.CmdSts in ('0');

")%>

             <br />
        <h3>未处理的入库命令列表</h3>

      
        <%=GetHtmlTableWhRec(@"
SELECT 
WmsTskId
,CmdSno
,CmdSts

,StnNo
,CmdMode
,Loc	
, TrnDate
,CMDNO
,LINEID
,CTICKETCODE
,PACKAGENO
,REMARK	 FROM CMD_MST cmd WHERE cmd.LINEID = 1 and cmd.StnNo in ('1','2') and cmd.CmdSts in ('0');

")%>
        



        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
