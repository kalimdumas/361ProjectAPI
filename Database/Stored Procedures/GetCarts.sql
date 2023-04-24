CREATE PROCEDURE GetCarts
AS
BEGIN
	SET NOCOUNT ON;
  SELECT a.*, p.* 
  FROM Cart c 
  RIGHT JOIN CartProduct cp 
  ON c.cartId = cp.cartId 
  RIGHT JOIN Product p 
  ON cp.productId = p.productId 
  RIGHT JOIN Account a 
  ON c.accountId = a.accountId;
END