<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WCS.aspx.cs" Inherits="WCS" %>

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
            <a href='./'>Index</a> ->WCS回報指令完成</h1>
        NOTE:
        <ul>
            <li>   在實際現場的配置, WCS完成立庫指令會主動調用我們的WEB-API。</li>
            <li>   在沒有WCS的情況下,目前的模擬做法如後。</li>
            <li>   實際上線後, PM 和 現場部署人員應將 [強制完成]按鈕 只開放權限較高人員,不給一般用戶使用。</li>
        </ul>
     

        <table class="gridtable">
            <tr>
                <th></th>
                <th>動作</th>
                <th>強制完成
                </th>
                <th>POSTMAN
                </th>
            </tr>
            <tr>
                <th>1</th>
                <td>入庫</td>
                <td>Y</td>
                <td>Y</td>
            </tr>
              <tr>
                <th>2</th>
                <td>出庫</td>
                <td>Y</td>
                <td>Y</td>
            </tr>
              <tr>
                <th>3</th>
                <td>返庫</td>
                <td>Y</td>
                <td>Y</td>
            </tr>
               <tr>
                <th>4</th>
                <td>循環盤單出庫</td>
                <td>-</td>
                <td>Y</td>
            </tr>
   <tr>
                <th>5</th>
         <td>循環盤單返庫</td>
                <td>-</td>
                <td>Y</td>
            </tr>


        </table>


        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
