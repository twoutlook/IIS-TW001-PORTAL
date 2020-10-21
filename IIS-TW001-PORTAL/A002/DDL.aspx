<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DDL.aspx.cs" Inherits="DDL" %>

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
         <a href='./'>系統信息管理</a> ->DDL</h1>
        <p>DB 數據字典 <a href="http://tmc.jungle123.com/hd/db/">http://tmc.jungle123.com/hd/db/</a> </p>
       <h3></h3>

      
        <%=GetHtmlTableWhRec(@"
select distinct f.enable, f.Is_Query IS_QRY,DISABLE_DATE,s.LANGUAGEID LANG,t.userno, s.FLAG_TYPE,s.FLAG_NAME as FUNCNAME ,f.cerpcode as EXTEND1 

from outtype f 
inner join ( select FUNCNAME,EXTEND1,userno from UserFunction 
--where userno= 'admin' 
) t 
on t.EXTEND1 = f.cerpcode 
INNER JOIN dbo.V_SYS_PARAMETER s WITH(NOLOCK) 
ON s.FLAG_ID= f.cerpcode 
--AND s.FLAG_TYPE='OUTTYPE'
AND s.LANGUAGEID='zh-TW'
WHERE 1=1

ORDER BY userno,FLAG_TYPE,EXTEND1,FUNCNAME

")%>
    <hr />    

<pre><code>
    select distinct f.enable, f.Is_Query IS_QRY,DISABLE_DATE,s.LANGUAGEID LANG,t.userno, s.FLAG_TYPE,s.FLAG_NAME as FUNCNAME ,f.cerpcode as EXTEND1 

from outtype f 
inner join ( select FUNCNAME,EXTEND1,userno from UserFunction 
--where userno= 'admin' 
) t 
on t.EXTEND1 = f.cerpcode 
INNER JOIN dbo.V_SYS_PARAMETER s WITH(NOLOCK) 
ON s.FLAG_ID= f.cerpcode 
--AND s.FLAG_TYPE='OUTTYPE'
AND s.LANGUAGEID='zh-TW'
WHERE 1=1

ORDER BY userno,FLAG_TYPE,EXTEND1,FUNCNAME
    </code>
</pre>
        



        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
