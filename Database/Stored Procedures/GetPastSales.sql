CREATE PROCEDURE GetPastSales
AS
BEGIN
	SET NOCOUNT ON;
  SELECT a.*, p.* 
  FROM Sale s 
  RIGHT JOIN SaleProduct sp 
  ON s.saleId = sp.saleId 
  RIGHT JOIN Product p 
  ON sp.productId = p.productId 
  RIGHT JOIN Account a 
  ON s.accountId = a.accountId;
END