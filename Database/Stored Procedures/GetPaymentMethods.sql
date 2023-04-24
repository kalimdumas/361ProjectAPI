CREATE PROCEDURE GetPaymentMethods
AS
BEGIN
	SET NOCOUNT ON;
	SELECT ac.*, pm.* 
  FROM Account ac 
  LEFT JOIN PaymentMethod pm 
  ON ac.accountId = pm.accountId;
END