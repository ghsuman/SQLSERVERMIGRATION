BACKUP DATABASE [vbs_cle_testing_qc_db] 
TO  DISK = N'\\LKF-DSQL04\SQL Backups\DEV\vbs_cle_testing_qc_db_test.bak' WITH NOFORMAT, INIT,  
NAME = N'vbs_cle_testing_qc_db-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO
