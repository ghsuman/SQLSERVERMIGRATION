EXEC sp_MSforeachdb N'IF EXISTS
(
SELECT 1 FROM sys.databases WHERE name = "?"
AND Is_read_only <> 1 and database_id in (5,6,15,19,22) 
)
BEGIN
print "Use [?]; GRANT Showplan TO [DominName\username]"
END';


--SELECT * FROM sys.databases 
--where name in ('Ice_appdata','ICE_TravisFlex','IceClient','IcePortal','NextSTEPP')
