select distinct f.enable, f.Is_Query IS_QRY,DISABLE_DATE,s.LANGUAGEID LANG,t.userno, s.FLAG_TYPE,s.FLAG_NAME as FUNCNAME ,f.cerpcode as EXTEND1 

from outtype f 
inner join ( select FUNCNAME,EXTEND1,userno from UserFunction 
--where userno= 'admin' 
) t 
on t.EXTEND1 = f.cerpcode 
INNER JOIN dbo.V_SYS_PARAMETER s WITH(NOLOCK) 
ON s.FLAG_ID= f.cerpcode 
--AND s.FLAG_TYPE='OUTTYPE'
AND s.LANGUAGEID='zh-TW'
WHERE 1=1

ORDER BY userno,FLAG_TYPE,EXTEND1,FUNCNAME
-- NOTE by Mark, ���]���U���@ʾ
and enable !='1'
-- ���h��
and f.Is_Query!='1' and (DISABLE_DATE is null or DISABLE_DATE >= GetDate())


--select * from outtype f 

select userno,FUNCNAME,EXTEND1 from UserFunction where userno= 'admin'

					   


					  