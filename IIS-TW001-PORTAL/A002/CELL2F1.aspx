<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CELL2F1.aspx.cs" Inherits="CELL2F1" %>

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
        <h4>
            <br />
            <a href='WH2.aspx'>回到儲位示意圖</a></h4>
        <h3>[dbo].[Fun_IsAllowAction]</h3>


        <pre><code>

            USE [TaiWei]
GO

/****** Object:  UserDefinedFunction [dbo].[Fun_IsAllowAction]    Script Date: 2020/11/2 22:32:37 ******/
DROP FUNCTION [dbo].[Fun_IsAllowAction]
GO

/****** Object:  UserDefinedFunction [dbo].[Fun_IsAllowAction]    Script Date: 2020/11/2 22:32:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:ch
-- Create date: 2019-06-05
-- Description:	判断库存调整单是否可以做删除或者确认操作
-- =============================================

CREATE FUNCTION [dbo].[Fun_IsAllowAction]
(	@P_ID VARCHAR(50),
	@P_Flag VARCHAR(10)
)
RETURNS NVARCHAR(500)
AS
BEGIN		
		DECLARE @P_Count INT
		DECLARE @P_Count_d INT
		DECLARE @returnvalue VARCHAR(500)
		DECLARE @t_Cinvcode NVARCHAR(200),@t_CpositionCode VARCHAR(100) ,@t_cticketcode VARCHAR(50),@t_SNCODE VARCHAR(100),@t_msg NVARCHAR(500)
		

		SET @returnvalue = 'OK'
		IF @P_Flag = '0' ---删除操作
		BEGIN
		    SELECT @P_Count = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST a WITH(NOLOCK)
			LEFT JOIN dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) ON a.id = d.id
			WHERE a.id = @P_ID AND a.cstatus ='0' 

			IF @P_Count = 0
			BEGIN
				SET @returnvalue = dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG1','') + '！';--库存调整单不是未处理状态
				RETURN @returnvalue;  		   
			END
		END	

		IF @P_Flag = '1'  ---确认操作
		BEGIN
		    SELECT @P_Count = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST a WITH(NOLOCK)
			LEFT JOIN dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) ON a.id = d.id
			WHERE a.id = @P_ID AND a.cstatus ='0' 

			IF @P_Count = 0
			BEGIN
				SET @returnvalue = dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG1','') + '！';--库存调整单不是未处理状态
				RETURN @returnvalue;  		   
			END

			SELECT @P_Count = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST a WITH(NOLOCK)
			LEFT JOIN dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) ON a.id = d.id
			WHERE a.id = @P_ID AND a.cstatus ='0' AND d.ids IS NOT NULL

			IF @P_Count = 0
			BEGIN
				SET @returnvalue = dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG2','') + '！';	--库存调整单没有明细数据
				RETURN @returnvalue;  	   
			END		   		  
		   

		   -----当前库存调整单明细中的sn有未完成的入库单或者出库单或者调拨单 END
           IF EXISTS (SELECT 1 FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id= @P_ID AND LEN(dbo.CheckSn_Code(d.sncode,'',@P_ID))>0 )
		   BEGIN		       
			   SELECT TOP 1 @t_msg = dbo.CheckSn_Code(d.sncode,'',@P_ID),@t_Cinvcode = d.cinvcode, @t_CpositionCode= d.cpositioncode  FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id= @P_ID AND LEN(dbo.CheckSn_Code(d.sncode,'',@P_ID))>0
			   SELECT @t_cticketcode = cticketcode FROM 	STOCK_CURRENT_ADJUST WITH(NOLOCK) WHERE id = @P_ID;	     		
			   SET @returnvalue = dbo.Fun_GetResourceValue('Common_KUCUNTIAOZHENGDAN','') + '['+ @t_cticketcode +']' + dbo.Fun_GetResourceValue('Common_ZHONG','') + ' ' + @t_msg;--库存调整单['+ @t_cticketcode +']中 ' + @t_msg
			   RETURN @returnvalue;
		   END
		 -----当前库存调整单明细中的sn有未完成的入库单或者出库单或者调拨单 END
		   IF EXISTS (SELECT 1 FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id = @P_ID GROUP BY d.cinvcode,d.cpositioncode,d.sncode HAVING (COUNT(1)>1))
		   BEGIN
			   SELECT TOP 1 @t_Cinvcode = d.cinvcode, @t_CpositionCode= d.cpositioncode FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id = @P_ID GROUP BY d.cinvcode,d.cpositioncode,d.sncode HAVING (COUNT(1)>1)	
			   SELECT @t_cticketcode = cticketcode FROM 	STOCK_CURRENT_ADJUST WITH(NOLOCK) WHERE id = @P_ID;	     		
			   SET @returnvalue = dbo.Fun_GetResourceValue('Common_KUCUNTIAOZHENGDAN','') + '['+ @t_cticketcode +']' + dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG3','') 
			                      + '['+ @t_Cinvcode +'],' + dbo.Fun_GetResourceValue('Common_CW','') + '['+ @t_CpositionCode +']' + dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG4','') + '。';--明细表中料号['+ @t_Cinvcode +'],储位['+ @t_CpositionCode +']上有重复的SN.请删除后重新添加
			   RETURN @returnvalue;
		   END
		   

		   SELECT TOP 1 @t_CpositionCode = d.cpositioncode
		   FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK)
		   INNER JOIN dbo.STOCK_CURRENT st WITH(NOLOCK) ON st.cpositioncode = d.cpositioncode
		   WHERE d.id =@P_ID AND d.newqty=0
		    GROUP BY d.cpositioncode
		   HAVING COUNT(DISTINCT st.cinvcode) = COUNT(DISTINCT d.cinvcode)

		   IF @t_CpositionCode IS NOT NULL
		   BEGIN		   
		        SET @returnvalue ='储位['+ @t_CpositionCode +'] 不能没有库存 ';
			    RETURN @returnvalue;
		   END

		END	
		ELSE IF @P_Flag = '2' ---审核操作
		BEGIN
		    SELECT @P_Count = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST a WITH(NOLOCK)
			WHERE a.cstatus ='1' AND a.id = @P_ID 

			IF @P_Count = 0
			BEGIN
				SET @returnvalue = dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG5','') + '！';--库存调整单不是已确认状态
				RETURN @returnvalue;
			END	

			SELECT @P_Count = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK)
			JOIN dbo.STOCK_CURRENT_ADJUST a WITH(NOLOCK) ON d.id = a.id
			JOIN dbo.STOCK_CURRENT_SN sn WITH(NOLOCK) ON sn.sncode = d.sncode
			JOIN dbo.STOCK_CURRENT s WITH(NOLOCK) ON sn.stock_id = s.id AND d.cinvcode = s.cinvcode
			WHERE s.cpositioncode = d.cpositioncode AND a.cstatus ='1'
			 AND a.id = @P_ID 

			SELECT @P_Count_d = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST_D WITH(NOLOCK) 
			WHERE id = @P_ID;

			IF @P_Count = 0 OR @P_Count_d <> @P_Count
			BEGIN
				SET @returnvalue = dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG6','') + '！' + CONVERT(VARCHAR(50),@P_Count_d) + '-'+ CONVERT(VARCHAR(50),@P_Count);--库存调整单明细表中的储位跟库存表中的不一致	
				RETURN @returnvalue;   
			END	

			SELECT @P_Count = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK)
			JOIN dbo.STOCK_CURRENT_ADJUST a WITH(NOLOCK) ON d.id = a.id
			JOIN dbo.STOCK_CURRENT_SN sn WITH(NOLOCK) ON sn.sncode = d.sncode
			JOIN dbo.STOCK_CURRENT s WITH(NOLOCK) ON sn.stock_id = s.id AND d.cinvcode = s.cinvcode
			WHERE s.cpositioncode = d.cpositioncode AND a.cstatus ='1'
			 AND a.id = @P_ID AND sn.qty = d.oriqty

			SELECT @P_Count_d = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST_D WITH(NOLOCK) 
			WHERE id = @P_ID;

			IF @P_Count = 0 OR @P_Count_d <> @P_Count
			BEGIN
				SET @returnvalue = dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG7','') + '！';	--库存调整单明细表中的原始数量跟库存表中的不一致	
				RETURN @returnvalue;   
			END	

			SELECT @P_Count = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK)
			JOIN dbo.STOCK_CURRENT_ADJUST a WITH(NOLOCK) ON d.id = a.id
			JOIN dbo.STOCK_CURRENT_SN sn WITH(NOLOCK) ON sn.sncode = d.sncode
			JOIN dbo.STOCK_CURRENT s WITH(NOLOCK) ON sn.stock_id = s.id
			WHERE s.cpositioncode = d.cpositioncode AND a.cstatus ='1'
			 AND a.id = @P_ID AND sn.qty = d.oriqty  AND s.cinvcode = d.cinvcode

			SELECT @P_Count_d = COUNT(1)
			FROM dbo.STOCK_CURRENT_ADJUST_D WITH(NOLOCK) 
			WHERE id = @P_ID;

			IF @P_Count = 0 OR @P_Count_d <> @P_Count
			BEGIN
				SET @returnvalue = dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG8','') + '！';	--库存调整单明细表中的料号跟库存表中的不一致	
				RETURN @returnvalue;   
			END	
		  
		   -----当前库存调整单明细中的sn有未完成的入库单或者出库单或者调拨单 END
           IF EXISTS (SELECT 1 FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id= @P_ID AND LEN(dbo.CheckSn_Code(d.sncode,'',@P_ID))>0 )
		   BEGIN		       
			   SELECT TOP 1 @t_msg = dbo.CheckSn_Code(d.sncode,'',@P_ID),@t_Cinvcode = d.cinvcode, @t_CpositionCode= d.cpositioncode  FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id= @P_ID AND LEN(dbo.CheckSn_Code(d.sncode,'',@P_ID))>0
			   SELECT @t_cticketcode = cticketcode FROM 	STOCK_CURRENT_ADJUST WITH(NOLOCK) WHERE id = @P_ID;	     		
			   SET @returnvalue = dbo.Fun_GetResourceValue('Common_KUCUNTIAOZHENGDAN','') + '['+ @t_cticketcode +']' + dbo.Fun_GetResourceValue('Common_ZHONG','') + ' ' + @t_msg;
			   RETURN @returnvalue;
		   END
		 -----当前库存调整单明细中的sn有未完成的入库单或者出库单或者调拨单 END

		   IF EXISTS (SELECT 1 FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id = @P_ID GROUP BY d.cinvcode,d.cpositioncode,d.sncode HAVING (COUNT(1)>1))
		   BEGIN
			   SELECT TOP 1 @t_Cinvcode = d.cinvcode, @t_CpositionCode= d.cpositioncode FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK) WHERE d.id = @P_ID GROUP BY d.cinvcode,d.cpositioncode,d.sncode HAVING (COUNT(1)>1)	
			   SELECT @t_cticketcode = cticketcode FROM 	STOCK_CURRENT_ADJUST WITH(NOLOCK) WHERE id = @P_ID;	     		
			   SET @returnvalue = dbo.Fun_GetResourceValue('Common_KUCUNTIAOZHENGDAN','') + '['+ @t_cticketcode +']' + dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG3','') 
			                      + '['+ @t_Cinvcode +'],' + dbo.Fun_GetResourceValue('Common_CW','') + '['+ @t_CpositionCode +']' + dbo.Fun_GetResourceValue('WMS_Common_Fun_IsAllowAction_MSG4','') + '。';
			   RETURN @returnvalue;
		   END


		   SELECT TOP 1 @t_CpositionCode = d.cpositioncode
		   FROM dbo.STOCK_CURRENT_ADJUST_D d WITH(NOLOCK)
		   INNER JOIN dbo.STOCK_CURRENT st WITH(NOLOCK) ON st.cpositioncode = d.cpositioncode
		   WHERE d.id =@P_ID AND d.newqty=0
		    GROUP BY d.cpositioncode
		   HAVING COUNT(DISTINCT st.cinvcode) = COUNT(DISTINCT d.cinvcode)

		   IF @t_CpositionCode IS NOT NULL
		   BEGIN		   
		        SET @returnvalue ='储位['+ @t_CpositionCode +'] 不能没有库存 ';
			    RETURN @returnvalue;
		   END

		END
		RETURN @returnvalue;
END
GO


             </code></pre>


        <div>
            <hr />
            頁面更新時間: <%=showTime()%>
            <hr />

        </div>
    </div>
</body>
</html>
