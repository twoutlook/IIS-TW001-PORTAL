<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CASE0826.aspx.cs" Inherits="Apps_A001_CASE0826" %>

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
        <form id="form1" runat="server">
            <div>
            </div>
        </form>
        <h1>CASE0826</h1>
        <h2>(root)入庫通知單 InAsn2008260001 </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM V_INASN
WHERE cticketcode='InAsn2008260001'
")%>
        <h2>(root 明細)入庫通知單明細 19e0e18a-fcd6-4be8-a482-c2dc627bd003 </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM INASN_D
WHERE id='19e0e18a-fcd6-4be8-a482-c2dc627bd003'
")%>


      <h2>入庫通知單明細 狀態 </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM SYS_PARAMETER
WHERE flag_type='IS'
order by flag_id
")%>



        <h2>入庫單  </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM INBILL
WHERE casnid='19e0e18a-fcd6-4be8-a482-c2dc627bd003'
")%>

             <h2>入庫單 狀態 </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM SYS_PARAMETER
WHERE flag_type='INBILL'
order by flag_id
")%>
        <h2>入庫單 	012008270002 明細 </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM INBILL_D
WHERE id='94C8987A-6750-4C46-8114-376DB37ADA84'
")%>
        <h2>入庫單 012008270002 明細 </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM INBILL_D_SN
WHERE inbill_id='94C8987A-6750-4C46-8114-376DB37ADA84'
")%>
       

        <h2>入庫單 	012008270003 明細</h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM INBILL_D
WHERE id='F8C4FDB4-1603-457B-A75D-CFDD615B8C4D'
")%>

                <h2>入庫單 	012008270003 明細 SN </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM INBILL_D_SN
WHERE inbill_id='F8C4FDB4-1603-457B-A75D-CFDD615B8C4D'
")%>

                      <h2>入庫通知單 	InAsn2008260001  裝箱明細 FrmINASNEMTList.aspx</h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM 	TEMP_INBILL_D
WHERE id ='InAsn2008260001'
")%>

        <h2> 裝箱明細  狀態 </h2>

        <%=GetHtmlTableWhRec(@"
SELECT * FROM SYS_PARAMETER
WHERE flag_type='EMT'
order by flag_id
")%>
</body>
</html>
