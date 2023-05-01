USE ApplicationDB

GO 
	DROP PROCEDURE IF EXISTS GetAccounts
GO
  DROP PROCEDURE IF EXISTS GetAddresses
GO
  DROP PROCEDURE IF EXISTS GetPaymentMethods
GO
  DROP PROCEDURE IF EXISTS GetCarts
GO
  DROP PROCEDURE IF EXISTS GetSales --Sales as in discounted products
GO
  DROP PROCEDURE IF EXISTS GetPastSales --Sales as in past purchases (removed from tables)
GO
  DROP PROCEDURE IF EXISTS GetProducts
GO
  DROP PROCEDURE IF EXISTS GetMensShirts
GO
  DROP PROCEDURE IF EXISTS GetMensJackets
GO
  DROP PROCEDURE IF EXISTS GetMensPants
GO
  DROP PROCEDURE IF EXISTS GetMensShorts
GO
  DROP PROCEDURE IF EXISTS GetWomensShirts
GO
  DROP PROCEDURE IF EXISTS GetWomensJackets
GO
  DROP PROCEDURE IF EXISTS GetWomensPants
GO
  DROP PROCEDURE IF EXISTS GetWomensShorts
GO
  DROP PROCEDURE IF EXISTS GetKidsShirts
GO
  DROP PROCEDURE IF EXISTS GetKidsJackets
GO
  DROP PROCEDURE IF EXISTS GetKidsPants
GO
  DROP PROCEDURE IF EXISTS GetKidsShorts
GO
  DROP PROCEDURE IF EXISTS GetBackpacks
GO
  DROP PROCEDURE IF EXISTS GetNecklaces
GO
  DROP PROCEDURE IF EXISTS GetWatches
GO
  DROP PROCEDURE IF EXISTS GetHats
GO
  DROP PROCEDURE IF EXISTS GetNewArrivals
GO

CREATE PROCEDURE GetAccounts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * 
  FROM Account;
END
GO

CREATE PROCEDURE GetAddresses
AS
BEGIN
	SET NOCOUNT ON;
	SELECT ac.*, ad.* 
  FROM Account ac 
  Left JOIN Address ad 
  ON ac.accountId = ad.accountId;
END
GO

CREATE PROCEDURE GetPaymentMethods
AS
BEGIN
	SET NOCOUNT ON;
	SELECT ac.*, pm.* 
  FROM Account ac 
  LEFT JOIN PaymentMethod pm 
  ON ac.accountId = pm.accountId;
END
GO

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
GO

CREATE PROCEDURE GetSales
AS
BEGIN
	SET NOCOUNT ON;
	SELECT s.*, sp.*
  FROM Sale s
	JOIN SaleProduct sp
	ON s.saleId = sp.saleId
	GROUP BY s.saleId
END
GO

CREATE PROCEDURE GetProducts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
  FROM Product
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetMensShirts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'men')
  AND (clothingType = 'shirt' OR clothingType = 'shirts')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetMensJackets
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'men')
  AND (clothingType = 'jacket' OR clothingType = 'jackets')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetMensPants
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'men')
  AND (clothingType = 'pants')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetMensShorts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'men')
  AND (clothingType = 'shorts')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetWomensShirts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	 price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'women')
  AND (clothingType = 'shirt' OR clothingType = 'shirts')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetWomensJackets
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'women')
  AND (clothingType = 'jacket' OR clothingType = 'jackets')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetWomensPants
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'women')
  AND (clothingType = 'pants')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetWomensShorts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'women')
  AND (clothingType = 'shorts')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetKidsShirts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'kids')
  AND (clothingType = 'shirt' OR clothingType = 'shirts')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetKidsJackets
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'kids')
  AND (clothingType = 'jacket' OR clothingType = 'jackets')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetKidsPants
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'kids')
  AND (clothingType = 'pants')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetKidsShorts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'kids')
  AND (clothingType = 'shorts')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetBackpacks
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'accessory' OR broadType = 'accessories')
  AND (clothingType = 'backpack' OR clothingType = 'backpacks')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetNecklaces
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product p
  WHERE (broadType = 'accessory' OR broadType = 'accessories')
  AND (clothingType = 'necklace' OR clothingType = 'necklace')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetWatches
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'accessory' OR broadType = 'accessories')
  AND (clothingType = 'watch' OR clothingType = 'watchs' OR clothingType = 'watches')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetHats
AS
BEGIN
	SET NOCOUNT ON;
	SELECT productId, name, broadType, clothingType,
	price, numStars, sku, image, manufacturer, height,
	length, width, weight, description, [isNewArrival]
	FROM Product
  WHERE (broadType = 'accessory' OR broadType = 'accessories')
  AND (clothingType = 'hat' OR clothingType = 'hats')
	ORDER BY productId;
END
GO

CREATE PROCEDURE GetNewArrivals
AS
BEGIN
  SET NOCOUNT ON;
  SELECT productId, name, broadType, clothingType,
  price, numStars, sku, image, manufacturer, height,
  length, width, weight, description, [isNewArrival]
  FROM Product
  WHERE ([isNewArrival] = 1)
  ORDER BY productId;
END
GO
