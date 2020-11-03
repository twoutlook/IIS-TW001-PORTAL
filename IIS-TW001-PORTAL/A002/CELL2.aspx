<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CELL2.aspx.cs" Inherits="CELL2" %>

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
        <form id="form1" runat="server">
            <div>
            </div>
        </form>
          <h4><br /><a href='WH2.aspx'>回到儲位示意圖</a></h4>
           <h3>儲位 <%=showCUST()%></h3>
                <h3> <%=showCellNum()%></h3>
     <hr />
       <h4>STOCK CURRENT</h4>
        <%=ShowSTOCK_CURRENT()%>
       <h4>STOCK CURRENT ADJUST</h4>
        <%=ShowSTOCK_CURRENT_ADJUST()%>
  <hr />
        <%--<%=ShowCell2()%>--%>
        NOTE: 在現有的 Business Logic 
        <a href="CELL2F1.aspx"> SQL </a>
            <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>
        <hr />
        以上是只限合乎本案物料編碼原則(-R)的列表,以下是全部
        <hr />
            <%=ShowCell()%>
    

  <%--      <%=GetHtmlTableWhRec(@"
SELECT L,X,Y,Z FROM TW_WH01

")%>--%>
       </div>
</body>
</html>
