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