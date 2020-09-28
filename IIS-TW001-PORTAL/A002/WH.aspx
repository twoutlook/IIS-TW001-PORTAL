<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WH.aspx.cs" Inherits="WH" %>

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
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href='./'>系統信息管理</a> -> 儲位示意圖 Max(X,Y,Z) =(2,21,5)</h1>

        <table class="gridtable">
            <tr>
                <a href="WH_LIST.aspx">WH_LIST.aspx</a>
                <Td  style="border-width:0px">

                 </Td><th colspan="21">030庫M料架</th>
            </tr>

            <%=GetTW_WH_L_Z_X(1,5,1)%>
            <%=GetTW_WH_L_Z_X(1,4,1)%>
            <%=GetTW_WH_L_Z_X(1,3,1)%>
            <%=GetTW_WH_L_Z_X(1,2,1)%>
            <%=GetTW_WH_L_Z_X(1,1,1)%>
                   <tr  style='font-size:85%; color:gray'>
                <%--<Td  style="border-width:0px"></Td>--%>
                <td style="border-width:0px "></td>
                <th>001</th>
                <th>002</th>
                <th>003</th>
                <th>004</th>
                <th>005</th>
                <th>006</th>
                <th>007</th>
                <th>008</th>
                <th>009</th>
                <th>010</th>
                <th>011</th>
              
                <th>012</th>
                <th>013</th>
                <th>014</th>
                <th>015</th>
                <th>016</th>
                <th>017</th>
                <th>018</th>
                <th>019</th>
                <th>020</th>
                   <th>021</th>

            </tr>
            <tr>
                <%--<Td  style="border-width:0px"></Td>--%>
                <td colspan="21" style="border-width: 0px"></td>
            </tr>
            <tr>
                <%--<Td  style="border-width:0px"></Td>--%>
                <td colspan="21" style="border-width: 0px"></td>
            </tr>
            <tr>
                <Td  style="border-width:0px"></Td>
                <th colspan="21">030庫N料架</th>
            </tr>

            <%=GetTW_WH_L_Z_X(1,5,2)%>
            <%=GetTW_WH_L_Z_X(1,4,2)%>
            <%=GetTW_WH_L_Z_X(1,3,2)%>
            <%=GetTW_WH_L_Z_X(1,2,2)%>
            <%=GetTW_WH_L_Z_X(1,1,2)%>
            <tr  style='font-size:85%; color:gray'>
                <%--<Td  style="border-width:0px"></Td>--%>
                <td style="border-width:0px "></td>
                <th>001</th>
                <th>002</th>
                <th>003</th>
                <th>004</th>
                <th>005</th>
                <th>006</th>
                <th>007</th>
                <th>008</th>
                <th>009</th>
                <th>010</th>
                <th>011</th>
              
                <th>012</th>
                <th>013</th>
                <th>014</th>
                <th>015</th>
                <th>016</th>
                <th>017</th>
                <th>018</th>
                <th>019</th>
                <th>020</th>
                   <th>021</th>

            </tr>
        </table>








        <%--      <%=GetHtmlTableWhRec(@"
SELECT L,X,Y,Z FROM TW_WH01

")%>--%>
        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
