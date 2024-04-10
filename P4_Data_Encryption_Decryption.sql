--------------------------------------------------------------------------------
-- Column Data Encryption And Decryption
--------------------------------------------------------------------------------

-- Encryption

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Grp_15_Column_Encryption';
CREATE CERTIFICATE MyCertificate WITH SUBJECT = 'Column Encryption';

CREATE SYMMETRIC KEY MySymmetricKey
WITH ALGORITHM = AES_256
ENCRYPTION BY CERTIFICATE MyCertificate;

ALTER TABLE SPONSOR ADD Contact_Email_Encrypted VARBINARY(MAX);
ALTER TABLE SPONSOR ADD Contact_Phone_Encrypted VARBINARY(MAX);

ALTER TABLE ATTENDEE ADD Contact_Email_Encrypted VARBINARY(MAX);
ALTER TABLE ATTENDEE ADD Contact_Phone_Encrypted VARBINARY(MAX);

ALTER TABLE ORGANIZER ADD Contact_Email_Encrypted VARBINARY(MAX);
ALTER TABLE ORGANIZER ADD Contact_Phone_Encrypted VARBINARY(MAX);

ALTER TABLE EVENT_SPEAKERS ADD Contact_Email_Encrypted VARBINARY(MAX);
ALTER TABLE EVENT_SPEAKERS ADD Contact_Phone_Encrypted VARBINARY(MAX);

OPEN SYMMETRIC KEY MySymmetricKey DECRYPTION BY CERTIFICATE MyCertificate;

-- Update encrypted data for ATTENDEE table
UPDATE ATTENDEE
SET Contact_Email_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Email),
    Contact_Phone_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Phone);

UPDATE EVENT_SPEAKERS
SET Contact_Email_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Email),
    Contact_Phone_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Phone);

UPDATE ORGANIZER
SET Contact_Email_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Email),
    Contact_Phone_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Phone);

UPDATE SPONSOR
SET Contact_Email_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Email),
    Contact_Phone_Encrypted = EncryptByKey(Key_GUID('MySymmetricKey'), Contact_Phone);

CLOSE SYMMETRIC KEY MySymmetricKey;

INSERT INTO Organizer ( Name, Description, Address, Contact_Email, Contact_Phone) VALUES
('Test', 'Test', 'Test', 'Test@fandbexpos.com', '111-111-1111');

SELECT * FROM Event_Speakers;

--------------------------------------------------------------------------------
-- Decryption
--------------------------------------------------------------------------------

OPEN SYMMETRIC KEY MySymmetricKey DECRYPTION BY CERTIFICATE MyCertificate;

SELECT 
    sponsor_ID,
    Name,
    CONVERT(VARCHAR, DecryptByKey(Contact_Email_Encrypted)) AS Contact_Email_Decrypted,
    CONVERT(VARCHAR, DecryptByKey(Contact_Phone_Encrypted)) AS Contact_Phone_Decrypted
FROM 
    SPONSOR;


SELECT 
    Attendee_ID,
    First_name,
    Last_name,
    CONVERT(VARCHAR, DecryptByKey(Contact_Email_Encrypted)) AS Contact_Email_Decrypted,
    CONVERT(VARCHAR, DecryptByKey(Contact_Phone_Encrypted)) AS Contact_Phone_Decrypted
FROM 
    ATTENDEE;


SELECT 
    organizer_ID,
    Name,
    Description,
    Address,
    CONVERT(VARCHAR, DecryptByKey(Contact_Email_Encrypted)) AS Contact_Email_Decrypted,
    CONVERT(VARCHAR, DecryptByKey(contact_phone_encrypted)) AS Contact_Phone_Decrypted
FROM 
    ORGANIZER;


SELECT 
    Speakers_ID,
    Event_ID,
    Full_Name,
    Biography,
    Expertise,
    CONVERT(VARCHAR, DecryptByKey(Contact_Email_Encrypted)) AS Contact_Email_Decrypted,
    CONVERT(VARCHAR, DecryptByKey(Contact_Phone_Encrypted)) AS Contact_Phone_Decrypted
FROM 
    EVENT_SPEAKERS;

CLOSE SYMMETRIC KEY MySymmetricKey;
GO

--------------------------------------------------------------------------------

