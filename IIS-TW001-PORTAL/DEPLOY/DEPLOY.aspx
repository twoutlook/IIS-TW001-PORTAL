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
            <li>發佈 [AgvWebApi] IIS</li>
              <li>安裝並啟動 [AgvWebApi] Win Service</li>


        </ul>
        <p>NOTE: </p>
         <ul>
            <li>任何 WMS 要下命令給 WCS 都是由  [AgvWebApi] Win Service 按配置頻率主動發起。</li>
            <li>按照 WMS 和 WCS 的通信協議，WCS
                在完成任何立庫入出庫動作後，即調用 [AgvWebApi]，按照既有的程序，觸發 WMS 更新 ASRS 命令行的狀態。
            </li>
        

        </ul>
        <hr />
        <h3>注意事項</h3>

        <ul>
            <li>數據庫還原時，如已有該庫，要在Files 勾選 Relocate all files to folder。</li>
            <li>IIS 所使用端口，需要在防火牆打開。防火牆設置，保存即可，無需重啟任何服務。</li>
            <li>IIS 發佈站點時，只需將更新檔案寫入指定檔案夾，無需重啟任何服務。</li>
            <li>IIS 站點的 Web.config 需要更新數據庫連接設定。</li>
  <li>WMS 基礎資料->基礎資料導入，模板 物料信息.xls 在目前的云服務器需要改存為 物料信息.xlsx, 導入才有效果。</li>



        </ul>
        <hr />
        <h3>流程演練</h3>

        <ul>
            <li>入庫</li>
            <li>出庫</li>
            <li>返庫</li>
            <li>盤點</li>



        </ul>
        <hr />
        <h3>云服務器部署演練</h3>

        <ul>
            <li>第一云服務器  <a href='http://210.71.231.5'>210.71.231.5</a>
                <ul>
                    <li>由Mark陳炳陵負責維護

                    </li>
                    <li>DB: 開發和測試數據</li>
                    <li>IIS: 項目內和輔助的站點</li>




                </ul>

            </li>
            <li>第二云服務器 <a href='http://210.71.231.153'>210.71.231.153</a>
                <ul>
                    <li>模擬現場的安裝和調試
                    </li>
                    <li>DB: 直接在第一服務器獲取再行初值化或其它操作</li>
                    <li>IIS:
                        <ul>
                            <li>直接在第一服務器獲取</li>
                            <li>使用github服務</li>
                        </ul>
                    </li>




                </ul>


            </li>




        </ul>


        <hr />
        <h3>部署人員 Job Description</h3>

        <ul>
            <li>服務器和網絡
                   <ul>
                       <li>作業系統操作</li>
                       <li>網路連接設定和檢查</li>

                   </ul>
            </li>
            <li>數據庫
                <ul>
                    <li>數據庫全備和還原</li>
                    <li>數據庫單一表單數據導出和導入</li>
                    <li>數據庫查詢能力</li>
                    <li>運行給定的數據庫腳本</li>

                </ul>
            </li>
            <li>IIS
                <ul>
                    <li>IIS開設站點</li>
                    <li>IIS站點維護和狀況排除</li>
                    <li>更改config設定</li>
                </ul>
            </li>

            <li>WMS WEBPDA 及 權限平台
                <ul>
                    <li>調試不同環境整套運行。</li>
                    <li>以權限平台調試用戶的權限, 包括顯示或隱藏頁面上的按鈕。</li>
                    <li>用戶的基本的操作。</li>
                    <li>判斷系統狀態是否正常。</li>
                </ul>
            </li>
               <li>培訓及文檔
                <ul>
                   
                    <li>編制培訓計畫。</li>
                     <li>製作各式操作手冊, 含系統安裝、用戶使用手冊等。</li>
                    <li>實施培訓。</li>
                    <li>各式文檔維護, 含培訓記錄及問題記錄等。</li>
                </ul>
            </li>
             <li>現場
                <ul>
                    <li>熟悉現場連接其它設備的規範。</li>
                    <li>瞭解用戶操作習慣。</li>
                    <li>第一時間操作權限內的狀況排除。</li>
                    <li>清楚描述問題並仿真在第二或第一云服務器重現。</li>
                 
                </ul>
            </li>

        </ul>



        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />
        </div>

    </div>
</body>
</html>
