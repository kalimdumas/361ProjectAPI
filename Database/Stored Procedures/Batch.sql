USE ApplicationDB
GO 

 DROP PROCEDURE IF EXISTS GetAccounts

GO

    DROP PROCEDURE IF EXISTS GetAddresses

GO

    DROP PROCEDURE IF EXISTS GetBackpacks

GO


    DROP PROCEDURE IF EXISTS GetCarts

GO


    DROP PROCEDURE IF EXISTS GetHats

GO


    DROP PROCEDURE IF EXISTS GetKidsJackets

GO


    DROP PROCEDURE IF EXISTS GetKidsPants
GO


    DROP PROCEDURE IF EXISTS GetKidsShirts

GO


    DROP PROCEDURE IF EXISTS GetKidsShorts

GO


    DROP PROCEDURE IF EXISTS GetMensJackets

GO

    DROP PROCEDURE IF EXISTS GetMensPants

GO


    DROP PROCEDURE IF EXISTS GetMensShirts

GO


    DROP PROCEDURE IF EXISTS GetMensShorts

GO


    DROP PROCEDURE IF EXISTS GetNecklaces

GO


    DROP PROCEDURE IF EXISTS GetPastSales

GO


    DROP PROCEDURE IF EXISTS GetPaymentMethods

GO


    DROP PROCEDURE IF EXISTS GetProducts

GO


    DROP PROCEDURE IF EXISTS GetWatches

GO


    DROP PROCEDURE IF EXISTS GetWomensJackets

GO


    DROP PROCEDURE IF EXISTS GetWomensPants

GO


    DROP PROCEDURE IF EXISTS GetWomensShirts

GO


    DROP PROCEDURE IF EXISTS GetWomensShorts
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
CREATE PROCEDURE GetBackpacks
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'accessory')
  AND clothingType = 'backpack'
	ORDER BY productId;
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
CREATE PROCEDURE GetHats
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'accessory')
  AND clothingType = 'hat'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetKidsJackets
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'kids' OR broadType = 'everybody')
  AND clothingType = 'jacket'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetKidsPants
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'kids' OR broadType = 'everybody')
  AND clothingType = 'pants'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetKidsShirts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'kids' OR broadType = 'everybody')
  AND clothingType = 'shirt'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetKidsShorts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'kids' OR broadType = 'everybody')
  AND clothingType = 'shorts'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetMensJackets
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'men' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'jacket'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetMensPants
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'men' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'pants'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetMensShirts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'men' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'shirt'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetMensShorts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'men' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'shorts'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetNecklaces
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'accessory')
  AND clothingType = 'necklace'
	ORDER BY productId;
END
GO
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
CREATE PROCEDURE GetProducts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetWatches
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'accessory')
  AND clothingType = 'watch'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetWomensJackets
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'women' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'jacket'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetWomensPants
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'women' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'pants'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetWomensShirts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'women' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'shirt'
	ORDER BY productId;
END
GO
CREATE PROCEDURE GetWomensShorts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.weight, p.description AS productDescription, c.name AS category, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'women' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'shorts'
	ORDER BY productId;
END

GO