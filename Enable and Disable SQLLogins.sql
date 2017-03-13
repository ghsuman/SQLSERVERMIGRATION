USE master; 

GO 

SELECT 'ALTER LOGIN ['+name+'] ENABLE;' 

FROM sys.syslogins

WHERE hasaccess = 1

AND name not in ('TMKMHC\DBADM6','TMKMHC\DBADM5','TMKMHC\DBADM4','TMKMHC\U46','TMKMHC\EA1','TMKMHC\CS5','sa','TMKMHC\DBADMINS')
AND name not like '%NT%'
AND name not like '%MS%'
AND name not like '%Domain%'




 
