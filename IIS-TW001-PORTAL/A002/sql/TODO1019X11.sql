select distinct f.enable, f.Is_Query IS_QRY,DISABLE_DATE,s.LANGUAGEID LANG,s.FLAG_NAME as FUNCNAME ,f.cerpcode as EXTEND1 

from outtype f 
inner join ( select FUNCNAME,EXTEND1 from UserFunction where userno= 'admin' ) t 
on t.EXTEND1 = f.cerpcode 
INNER JOIN dbo.V_SYS_PARAMETER s WITH(NOLOCK) 
ON s.FLAG_ID= f.cerpcode 
AND s.FLAG_TYPE='OUTTYPE'
AND s.LANGUAGEID='zh-TW'
WHERE 1=1
-- NOTE by Mark, 考慮作廢不顯示
and enable !='1'
-- 增刪改
and f.Is_Query!='1' and (DISABLE_DATE is null or DISABLE_DATE >= GetDate())


--select * from outtype f 

					   


					  