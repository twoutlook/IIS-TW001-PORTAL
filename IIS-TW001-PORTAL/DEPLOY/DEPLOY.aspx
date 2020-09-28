<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DEPLOY.aspx.cs" Inherits="DEPLOY" %>

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
            <a href='/index.htm'>首頁</a> ->部署</h1>
        <p>NOTE: 客戶使用 Win2016服務器 + SQL2019 </p>
           <hr />
        <h3>實施步驟</h3>
      

        <ul>
            <li>還原 [權限平台] DB</li>
            <li>還原 [WMS] DB</li>
            <li>發佈 [權限平台] IIS</li>
            <li>發佈 [WMS] IIS</li>
            <li>發佈 [WEBPDA] IIS</li>


        </ul>
          <p>NOTE: DB 及 IIS 全部取云服務器 http://210.71.231.5</p>
        <hr />
        <h3>注意事項</h3>

        <ul>
            <li>IIS 所使用端口, 需要在防火牆打開。防火牆設置,保存即可,無需重啟任何服務。</li>
            <li>還原 IIS 站點，只需將更新檔案寫入指定檔案夾,無需重啟任何服務。</li>
            <li>數據庫還原時，如已有該庫, 要在Files 勾選 Relocate all files to folder。</li>
            <li>IIS Web.config 需要更改新環境的數據庫連接設定。</li>



        </ul>
        <hr />
        <h3>流程演練</h3>

        <ul>
            <li>入庫</li>
            <li>出庫</li>
            <li>返庫</li>
            <li>盤點</li>



        </ul>






        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
