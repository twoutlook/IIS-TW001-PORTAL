<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TODO1019X7.aspx.cs" Inherits="TODO1019X7" %>

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
            <a href='./'>系統信息管理</a> ->  <a href='./TODO1019.aspx'>TODO 10/19</a></h1>
        <h3></h3>
        <img src="img/TODO1019/1019X7.png" />
        <div style="display:none"
        <table class="gridtable">

            <tr>
                <th></th>
                <th width="50%">by 開平</th>
                <th>NOTE by Mark</th>
                <th>Remarks</th>
            </tr>

            <tr>
                <th>1</th>
                <td>入庫通知單
新建入庫通知單明細時,使用查詢介面選取帶RANK的料號,帶回上層畫面時RANK沒有被帶回去,導致料號不存在,存檔失敗.
                    
                    
                </td>
                <td>由 陳先顥(捲捲) 負責 </td>
                <td></td>


            </tr>
            <tr>
                <th>2</th>
                <td>出庫通知單
新建出庫通知單時,使用查詢介面選取帶RANK的料號,帶回上層畫面時RANK沒有被帶回去,導致料號不存在,存檔失敗.

                </td>
                    <td>由 陳先顥(捲捲) 負責 </td>
                <td></td>
            </tr>
            <tr>

                <th>3</th>
                <td>調撥單
調撥單查詢UI須加上RANK欄位
                </td>
                        <td>由 陳先顥(捲捲) 負責 </td>
        
                <td></td>
            </tr>


            <tr>

                <th>4</th>
                <td>循環盤點
新增盤點單UI須加上RANK欄位 (循環盤點->盤點單->新增)
                </td>
                        <td>由 陳先顥(捲捲) 負責 </td>
        
                <td></td>
            </tr>

            <tr>

                <th>5</th>
                <td>循環盤點明細維護
循環盤點明細維護查詢’UI須加上RANK欄位
                </td>
                        <td>由 陳先顥(捲捲) 負責 </td>
        
                <td></td>
            </tr>

            <tr>

                <th>6</th>
                <td>庫存調整單
新增庫存調整單UI之查詢料號功能須加上RANK欄位
                </td>
                     <td>由 陳先顥(捲捲) 負責 </td>
                <td></td>
            </tr>

            <tr>

                <th>7</th>
                <td>PDA盤點單
PDA盤點補單也需要可以料號和RANK分開輸入
                </td>
                        <td>由 Mark陳炳陵 負責 </td>
        
                <td></td>
            </tr>


            <tr>

                <th>8</th>
                <td>針對客戶的撿料需求, 撿完料之後須要由原出庫站口(2號站)把剩餘的料直接返庫, 目前的設計是客戶必須把撿完料的棧板移到入庫專用站口(1號站)才能返庫, 客戶認為這個移動棧板的動作很不方便
                </td>
                      <td>由 Mark陳炳陵 負責 </td>
                <td></td>
            </tr>
            <tr>
                <th>9</th>
                <td>由ASRS發出的出庫,入庫強制取消都會造成卡單, 目前只能由我方人員經由修改數據庫來排除, 客戶希望有可以自行排除的方法. 參考@杜文生 的建議

                </td>
                    <td>建議開平和文生能先列出已知情境，看那些是目前頁面無法操作仍有卡單現象，如果是屬於項目共通性的，建議由SZ主導，如果只發生在台惟案，由台北組員負責。</td>
                <td></td>


            </tr>



        </table>

            </div>
        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
