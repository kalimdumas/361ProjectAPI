CREATE PROCEDURE GetMensShirts
AS
BEGIN
	SET NOCOUNT ON;
	SELECT p.productId, p.name, c.name AS category, p.broadType, 
	p.clothingType, p.price, p.numStars, p.sku, p.image, p.manufacturer, p.height, 
	p.length, p.width, p.description AS productDescription, c.description AS categoryDescription 
	FROM Product p 
	LEFT JOIN CategoryProduct cp 
	ON p.productId = cp.productId 
	LEFT JOIN Category c 
	ON cp.categoryId = c.categoryId 
  WHERE (broadType = 'men' OR broadType = 'adults' OR broadType = 'everybody')
  AND clothingType = 'shirt'
	ORDER BY productId;
END