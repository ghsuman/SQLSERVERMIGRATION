USE master;
GO
SELECT *
FROM sys.symmetric_keys
WHERE name = '##MS_ServiceMasterKey##';
GO

-- Create database Key
USE dbname;
GO
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password123';
GO

-- Create symmetric Key
USE dbname;
GO
CREATE SYMMETRIC KEY SymmetricKey1 
 WITH ALGORITHM = AES_128 
 ENCRYPTION BY CERTIFICATE Certificate1;
GO

USE dbname;
GO
ALTER TABLE Customer_data 
ADD Credit_card_number_encrypt varbinary(MAX) NULL
GO

-- Populating encrypted data into new column
USE dbname;
GO
-- Opens the symmetric key for use
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
GO
UPDATE Customer_data
SET Credit_card_number_encrypt = EncryptByKey (Key_GUID('SymmetricKey1'),Credit_card_number)
FROM dbo.Customer_data;
GO

USE dbname;
GO
ALTER TABLE Customer_data
DROP COLUMN Credit_card_number;
GO

USE dbname;
GO
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
GO
-- Now list the original ID, the encrypted ID 
SELECT Customer_id, Credit_card_number_encrypt AS 'Encrypted Credit Card Number',
CONVERT(varchar, DecryptByKey(Credit_card_number_encrypt)) AS 'Decrypted Credit Card Number'
FROM dbo.Customer_data;
 
 -- Close the symmetric key
CLOSE SYMMETRIC KEY SymmetricKey1;
GO
-- Closes the symmetric key
CLOSE SYMMETRIC KEY SymmetricKey1;
GO


USE dbname;
GO
OPEN SYMMETRIC KEY SymmetricKey1
DECRYPTION BY CERTIFICATE Certificate1;
-- Performs the update of the record
INSERT INTO dbo.Customer_data (Customer_id, Customer_Name, Credit_card_number_encrypt)
VALUES (25665, 'mssqltips4', EncryptByKey( Key_GUID('SymmetricKey1'), CONVERT(varchar,'4545-58478-1245') ) );    
GO


Execute as user='test'
GO
SELECT Customer_id, Credit_card_number_encrypt AS 'Encrypted Credit Card Number',
CONVERT(varchar, DecryptByKey(Credit_card_number_encrypt)) AS 'Decrypted Credit Card Number'
FROM dbo.Customer_data;

----Step 12 - Grant Permissions to the Encrypted Data

--Permissions can be granted to a set of users to decrypt and read data using the commands below. 

GRANT VIEW DEFINITION ON SYMMETRIC KEY::SymmetricKey1 TO test; 
GO
GRANT VIEW DEFINITION ON Certificate::Certificate1 TO test;
GO