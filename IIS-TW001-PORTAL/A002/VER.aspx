<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VER.aspx.cs" Inherits="VER" %>

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
        <h1>
            <br />
            版本</h1>
        <hr />
          <h3>2020-09-19</h3>
        <ul>
            <li>Mark隱藏掉入庫通知單的整單生成入庫單column。</li>
          
          
   

             </li>

        </ul>
         <h3>2020-09-18</h3>
        <ul>
            <li>由捲捲開始測新增物料使用編碼規範,並以規範物料入庫。</li>
            <li>文生feedback a BUG,入出庫狀態設罝[作廢]無效。</li>
             <li>小仲提供的出庫[強制完成+刷新]已實現。要注意物料是否保稅的屬性。另技術上,出庫[刷新]和入庫的情況類似, 有一個部署的梗,在云服務器會報錯。</li>
          
   


        </ul>
        <h3>2020-09-17</h3>
        <ul>
            <li>開平獲得客戶儲位編碼表。MZYY NZYY。M是X=1,N是X=2, Z 是層高, Y 是縱深。</li>
            <li>Mark按客戶儲位編碼顯示在 <a href='WH.aspx'>WH.aspx</a>, 這個 dashboard  現階段供測試快速查看入庫出庫成功的結果。</li>
            <li>Mark調試透過 GITHUB 快速發佈云服務器的IIS站點。</li>
            <li>小仲協助解決發佈到云服務器欠某個數據庫配置的問題。這問題卡到入庫強制完成後無法刷新狀態。</li>
             <li>Mark透過Zoom連線示範入庫做法給開平和捲捲。查看<a href="VER0907.aspx">錄制視頻</a> 。
                 兩人都能完成入庫。但開平有一單遭遇問題,[刷新]無效, 像是有特定狀態組合的BUG。
   

             </li>

        </ul>
        <hr />
        <h3>2020-09-16</h3>
        <ul>
            <li>入庫虚擬棧板, 一處已實現, 另一處待處理。</li>
            <li>獲得盟立WCS通信協議版本。接口參數部份需要調整。</li>

        </ul>
        <hr />
        <div>項目入口網站<a href="http://210.71.231.5:8080/TAIWAY.html">http://210.71.231.5:8080/TAIWAY.html</a>  </div>
    </div>

</body>
</html>
