CREATE PROCEDURE GetAddresses
AS
BEGIN
	SET NOCOUNT ON;
	SELECT ac.*, ad.* 
  FROM Account ac 
  Left JOIN Address ad 
  ON ac.accountId = ad.accountId;
END