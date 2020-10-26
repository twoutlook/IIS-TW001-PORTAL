<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TODO1019.aspx.cs" Inherits="TODO1019" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet"
        href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/styles/default.min.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.2/highlight.min.js"></script>


    <script>hljs.initHighlightingOnLoad();</script>


    <style>
        http://localhost:6398/A002/TAIWAY.html
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
            <a href='./'>系統信息管理</a> ->TODO 10/19</h1>
        <h3></h3>

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
                <td>由 陳先顥(捲捲) 負責,已完成 </td>
                <td>...開平測試驗証中。</td>

            </tr>
            <tr>
                <th>2</th>
                <td>出庫通知單
新建出庫通知單時,使用查詢介面選取帶RANK的料號,帶回上層畫面時RANK沒有被帶回去,導致料號不存在,存檔失敗.

                </td>
                <td>由 陳先顥(捲捲) 負責,已完成 </td>
                <td>...開平測試驗証中。</td>
            </tr>
            <tr>

                <th>3</th>
                <td>調撥單
調撥單查詢UI須加上RANK欄位
                </td>
                <td>由 陳先顥(捲捲) 負責,已完成 </td>
                <td>...開平測試驗証中。</td>
            </tr>



            <tr>

                <th>4</th>
                <td>循環盤點
新增盤點單UI須加上RANK欄位 (循環盤點->盤點單->新增)
                </td>
                <td>由 陳先顥(捲捲) 負責,已完成 </td>
                <td>...開平測試驗証中。</td>
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
                <td>由 Mark陳炳陵 負責,已完成, <a href="img/TODO1019/1019X7.png">如截屏</a> </td>

                <td>...開平測試驗証中。</td>
            </tr>


            <tr>

                <th>8</th>
                <td>針對客戶的撿料需求, 撿完料之後須要由原出庫站口(2號站)把剩餘的料直接返庫, 目前的設計是客戶必須把撿完料的棧板移到入庫專用站口(1號站)才能返庫, 客戶認為這個移動棧板的動作很不方便
                </td>
                <td>由 Mark陳炳陵 負責,已完成 </td>
                <td>...開平測試驗証中。</td>
            </tr>
            <tr>
                <th>9</th>
                <td>由ASRS發出的出庫,入庫強制取消都會造成卡單, 目前只能由我方人員經由修改數據庫來排除, 客戶希望有可以自行排除的方法. 參考@杜文生 的建議

                </td>
                <td>建議開平和文生能先列出已知情境，看那些是目前頁面無法操作仍有卡單現象，如果是屬於項目共通性的，建議由SZ主導，如果只發生在台惟案，由台北組員負責。</td>
                <td>Edward指示: 先就台惟個案需求處理。</td>


            </tr>

            <tr>
                <th>10</th>
                <td>開平在  基礎資料->入出庫狀態設置 要[作廢]某些類型失效,<a href="img/TODO1019/1019X10.mp4">如錄屏</a>。彥君 驗証局網的項目並無異常。
                </td>
                <td>經過打斷點Debug發現代碼直接判斷是否為 “入库”,<a href="img/TODO1019/1019X10.png">如截屏</a>，由於台惟案的語系基本是設為繁中,
因此在這裡進不去要做[作廢]的動作.

就台惟案部份, 建議開平先以 簡中 完成設置。</td>
                <td>Edward指示: 这是bug 需完善，由SZ 修复, 并改版至其他项目。</td>


            </tr>


            <tr>
                <th>11</th>
                <td>開平 (10/21 18:11) 請問為何出庫\入庫類型都成功作廢之後, 出庫通知單的下拉選單還是選得到? 我還缺修改哪裡的配置嗎?
                </td>
                <td>看了C#代碼及SQL語句,<a href="img/TODO1019/1019X11.mp4">如錄屏</a>，個人傾向[作廢]的就不再顯示。</td>
                <td></td>


            </tr>
                 <tr>
                <th>12</th>
                <td>開平 (10/21 20:20) 填加用戶的業務權限沒有能夠反映出來,<a href="img/TODO1019/1019X12.mp4">如錄屏</a>。按彥君(10/22 10:24) 数据同步。無效。
                </td>
                <td>看了数据同步的SQL語句,加上小仲的指導: 把这个sp里，权限平台的数据库引用换一下就ok了。<br />先在本機開發環境完成,<a href="img/TODO1019/1019X12A.mp4">如錄屏</a>。 並更新云1,<a href="img/TODO1019/1019X12B.mp4">如錄屏</a>。
                    
                    
                    <pre style="display:none"><code>
                    USE [TaiWei]
GO
/****** Object:  StoredProcedure [dbo].[Proc_SyncAccessRight]    Script Date: 2020/10/22 10:34:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Proc_SyncAccessRight]
(
@P_ProjectCode VARCHAR(100),
@P_Return_Value VARCHAR(10) OUTPUT
)
AS
BEGIN

SET @P_Return_Value='0';

DELETE  FROM [dbo].[UserFunction];

INSERT INTO [dbo].[UserFunction]
(id,userno,username,funcno,funcname,extend1,modno)
SELECT NEWID(), u.F_UserId,u.F_UserName,fd.F_FunctionCode,fd.F_Name,LTRIM(RTRIM(ISNULL(fd.F_Data,''))),'I'
  FROM [NFineBase].[dbo].[Base_User] u
  INNER JOIN [NFineBase].[dbo].Base_UserRole ur ON ur.F_UId=u.F_Id
  INNER JOIN [NFineBase].[dbo].Base_RoleFunctionNO rf ON rf.F_RoleId = ur.F_RId
  INNER JOIN [NFineBase].[dbo].Base_FunctionDetails fd ON fd.F_FunctionId = rf.F_FunctionId
  --LEFT JOIN [NFineBase].[dbo].BASE_ORGANIZATION org ON org.F_Id = u.F_CompanyId
  INNER JOIN [NFineBase].[dbo].Base_Project prj ON fd.F_ProjectId=prj.F_Id
WHERE prj.F_ProjectCode=@P_ProjectCode
AND fd.F_Type='bussiness'
ORDER BY u.F_UserId,fd.F_Type,u.F_CompanyId;


----操作人员同步
DELETE FROM dbo.ZSICT1_USER;

INSERT INTO dbo.ZSICT1_USER
        ( userno,username,password,sex,type,flag,lastmodifiedtime
        )
SELECT u.F_UserId,
       u.F_UserName,	   
       u.F_PassWord,
	   u.F_Gender,
	   '3',
	   u.F_Status,
	   u.F_CreatorTime	 
  FROM [NFineBase].[dbo].[Base_User] u
  INNER JOIN [NFineBase].[dbo].Base_Project prj ON u.F_CompanyId = prj.F_CompanyId  
WHERE prj.F_ProjectCode='SnowDragon001' AND u.F_Status = '0'
ORDER BY u.F_UserId,u.F_CompanyId;


IF @@ROWCOUNT=0
BEGIN
  SET @P_Return_Value='1'
END

END


                                      </code></pre></td>
                <td></td>


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
