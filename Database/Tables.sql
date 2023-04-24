USE ApplicationDB;

DROP TABLE IF EXISTS SaleProduct;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS CartProduct;
DROP TABLE IF EXISTS Cart;

DROP TABLE IF EXISTS DiscountDeterminant;
DROP TABLE IF EXISTS Discount;
DROP TABLE IF EXISTS CategoryProduct;
DROP TABLE IF EXISTS Category;

DROP TABLE IF EXISTS Stock;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS PaymentMethod;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Account;

CREATE TABLE Account (
accountId   INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
username    VARCHAR(32) NOT NULL,
password    VARCHAR(32) NOT NULL,
firstName   VARCHAR(32) NOT NULL,
lastName    VARCHAR(32) NOT NULL,
email       VARCHAR(128) NOT NULL,
phoneNumber VARCHAR(16)
);

CREATE TABLE Address (
addressId     INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
accountID      INT NOT NULL,
streetLineOne VARCHAR(32) NOT NULL,
streetLineTwo VARCHAR(32),
city          VARCHAR(64) NOT NULL,
state         VARCHAR(64),
country       VARCHAR(64) NOT NULL,
zipCode       VARCHAR(16) NOT NULL,
FOREIGN KEY (accountID) REFERENCES Account(accountID)
);

CREATE TABLE PaymentMethod (
paymentMethodId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
accountID       INT NOT NULL,
cardNumber      BIGINT NOT NULL,
expDate         DATE NOT NULL,
cvvNumber       INT,
FOREIGN KEY (accountID) REFERENCES Account(accountID)
);

CREATE TABLE Product (
productId    INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
name         VARCHAR(64) NOT NULL,
broadType    VARCHAR(32) NOT NULL,
clothingType VARCHAR(32) NOT NULL,
price        FLOAT,
numStars     FLOAT,
sku          VARCHAR(16),
image        VARCHAR(2048),
manufacturer VARCHAR(64) NOT NULL,
height       FLOAT NOT NULL,  /* centimeters */
length       FLOAT NOT NULL,  /* centimeters */
width        FLOAT NOT NULL,  /* centimeters */
weight       FLOAT NOT NULL,  /* kilograms */
description  VARCHAR(256)
);

CREATE TABLE Stock (
stockId   INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
productId INT NOT NULL,
size      VARCHAR(8) NOT NULL,
quantity  INT NOT NULL,  /* A value of -1 represents a discontinued size.  0 means out of stock. */
FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Category (
categoryId  INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
name        VARCHAR(32) NOT NULL,
description VARCHAR(256)
);

CREATE TABLE CategoryProduct (
categoryProductId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
categoryId        INT NOT NULL,
productId         INT NOT NULL,
FOREIGN KEY (categoryId) REFERENCES Category(categoryId),
FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Discount (
discountId   INT  NOT NULL IDENTITY(1,1) PRIMARY KEY,
name         VARCHAR(32) NOT NULL,
startDate    DATE NOT NULL,
endDate      DATE NOT NULL,
/* Values below are mutually exclusive. */
percentage   FLOAT,  /* 25, not 0.25 */
dollarAmount FLOAT
);

CREATE TABLE DiscountDeterminant (
discountDeterminantId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
discountId INT NOT NULL,
/* Values below are mutually exclusive. */
categoryId            INT,
productId             INT,
broadType             VARCHAR(32),
clothingType          VARCHAR(32),
FOREIGN KEY (discountId) REFERENCES Discount(discountId),
FOREIGN KEY (categoryId) REFERENCES Category(categoryId),
FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Cart (
cartId    INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
accountID INT NOT NULL,
FOREIGN KEY (accountID) REFERENCES Account(accountID)
);

CREATE TABLE CartProduct (
cartProductId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
cartId        INT NOT NULL,
productId     INT NOT NULL,
quantity      INT NOT NULL,
FOREIGN KEY (cartId) REFERENCES Cart(cartId),
FOREIGN KEY (productId) REFERENCES Product(productId)
);

CREATE TABLE Sale (
saleId    INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
accountID INT NOT NULL,
FOREIGN KEY (accountID) REFERENCES Account(accountID)
);

CREATE TABLE SaleProduct (
saleProductId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
saleId        INT NOT NULL,
productId     INT NOT NULL,
quantity      INT NOT NULL,
FOREIGN KEY (saleId) REFERENCES Sale(saleId),
FOREIGN KEY (productId) REFERENCES Product(productId)
);

INSERT INTO Account (username, password, firstName, lastName, email, phoneNumber) VALUES ('Snorris_', '3iyri', 'Spencer', 'Norris', 'snorris7@huskers.unl.edu', 5805747854);
INSERT INTO Cart (AccountId) VALUES (1);
INSERT INTO Account (username, password, firstName, lastName, email, phoneNumber) VALUES ('Misty', 'iow@?!.,feyuih43', 'Misty', 'Spence', 'misty@gmail.com', 5784673632);
INSERT INTO Cart (AccountId) VALUES (2);
INSERT INTO Account (username, password, firstName, lastName, email, phoneNumber) VALUES ('Bobbert913', '973riwsdcrd!', 'Bob', 'Roberts', 'baxton@hotmail.com', 1674835578);
INSERT INTO Cart (AccountId) VALUES (3);
INSERT INTO Account (username, password, firstName, lastName, email, phoneNumber) VALUES ('JPaccounting', '8934yg7t834t', 'Jackson', 'Pierce', 'JPaccounting@paxon.com', 8374629384);
INSERT INTO Cart (AccountId) VALUES (4);
INSERT INTO Account (username, password, firstName, lastName, email, phoneNumber) VALUES ('Sammy', 'w4ioy8t', 'Samantha', 'Jones', 'sammyjonesey@gmail.com', 9483746223);
INSERT INTO Cart (AccountId) VALUES (5);
INSERT INTO Account (username, password, firstName, lastName, email, phoneNumber) VALUES ('Sanders', '45u6ruftjg', 'Sasha', 'Anderson', 'notrelatedtobernie@gmail.com', 1123345566);
INSERT INTO Cart (AccountId) VALUES (6);
INSERT INTO Account (username, password, firstName, lastName, email, phoneNumber) VALUES ('CombineShotgunSoldier1', 'ery5468t6fh', 'Jacob', 'South', 'CombineShotgunSoldier1@gmail.com', 9875648596);
INSERT INTO Cart (AccountId) VALUES (7);
INSERT INTO Account (username, password, firstName, lastName, email) VALUES ('Jaquop', 'ru65tyg', 'Jacob', 'Avidan', 'jacobAvidan96@hotmail.com');
INSERT INTO Cart (AccountId) VALUES (8);
INSERT INTO Account (username, password, firstName, lastName, email) VALUES ('Peppa', 'e4hdt65rutfh', 'Peppa', 'Pig', 'PeppaPig@hotmail.com');
INSERT INTO Cart (AccountId) VALUES (9);
INSERT INTO Account (username, password, firstName, lastName, email) VALUES ('Smithers64', 'eydhcer4535', 'Johnathan', 'Smith', 'smithersfan64@yahoo.com');
INSERT INTO Cart (AccountId) VALUES (10);

INSERT INTO Address (accountID, streetLineOne, streetLineTwo, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Spencer'), '1780 R St', 'USuites 150', 'Lincoln', 'Nebraska', 'United States', '68508');
INSERT INTO Address (accountID, streetLineOne, streetLineTwo, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Misty'), '1780 R St', 'USuites 550', 'Lincoln', 'Nebraska', 'United States', '68508');
INSERT INTO Address (accountID, streetLineOne, streetLineTwo, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Bob'), '600 N St', 'Selleck 7250', 'Lincoln', 'Nebraska', 'United States', '68508');
INSERT INTO Address (accountID, streetLineOne, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Samantha'), '1256 Cash Hill', 'Gretna', 'Nebraska', 'United States', '68028');
INSERT INTO Address (accountID, streetLineOne, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Jackson'), '313 Harry Bell Rd', 'Fort Leavenworth', 'Kansas', 'United States', '66027');
INSERT INTO Address (accountID, streetLineOne, streetLineTwo, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Sasha'), '1055 N 16th St', 'The Village 250', 'Lincoln', 'Nebraska', 'United States', '68508');
INSERT INTO Address (accountID, streetLineOne, city, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Sasha'), '38 Dunmow Road', 'Gualachulain', 'United Kingdom', 'PA39 6QD');
INSERT INTO Address (accountID, streetLineOne, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE lastName = 'South'), 'Michaelkirchstr. 73', 'Spangenberg', 'Hessen', 'Germany', '34286');
INSERT INTO Address (accountID, streetLineOne, city, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE lastName = 'Avidan'), 'Villagatan 29', 'Svanesund', 'Sweden', '440 92');
INSERT INTO Address (accountID, streetLineOne, city, state, country, zipCode) VALUES 
((SELECT accountId FROM Account WHERE firstName = 'Johnathan'), 'Ota', 'Miyako-shi', 'Iwate', 'Japan', '330-1199');

INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Spencer'), 1234567890123456, '2027/05/01', 123);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Misty'), 7845673456239078, '2026/06/01', 275);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Misty'), 09878743864323908, '2028/12/01', 663);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Bob'), 7582937265305965, '2025/10/01', 367);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Jackson'), 1345267485960433, '2024/02/01', 865);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Samantha'), 8844736290657843, '2021/01/01', 452);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Sasha'), 6273844467793923, '2022/03/01', 266);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Sasha'), 1111222244443333, '2024/07/01', 564);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE lastName  = 'South'), 7854902233344565, '2030/09/01', 489);
INSERT INTO PaymentMethod (accountID, cardNumber, expDate, cvvNumber) VALUES ((SELECT accountId FROM Account WHERE firstName = 'Johnathan'), 2271829304948576, '2031/11/01', 196);

INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, description, sku, height, length, width, weight) VALUES 
('USA Muscle Shirt', 19.99, 'men', 'shirt', 'IMAGE HERE', 'US Corps', 4.95, 'Rep your AMERICAN pride with the most AMERICAN MUSCLE SHIRT in the WORLD!', 'HFGUS645', 2.30, 8.70, 12.60, 0.40);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, sku, height, length, width, weight) VALUES 
('Button-Up', 14.99, 'men', 'shirt', 'IMAGE HERE', 'Professional Co.', 4.58, 'WAT15SKU', 5.00, 10.00, 8.00, 0.45);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, sku, height, length, width, weight) VALUES 
('Pride Coat', 18.99, 'adults', 'jacket', 'IMAGE HERE', 'Spencers Inc.', 4.12, 'NCJSH523', 7.00, 18.00, 16.00, 2.03);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, sku, height, length, width, weight) VALUES 
('American-Made Long Johns', 24.99, 'women', 'pants', 'IMAGE HERE', 'Long Johns Corps', 3.68, 'MKCJS138', 6.40, 16.80, 16.60, 1.77);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, sku, height, length, width, weight) VALUES 
('Sweatpants', 22.74, 'kids', 'pants', 'IMAGE HERE', 'New Fashion Inc.', 3.57, 'IH8B33RS', 4.00, 10.00, 10.00, 0.98);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, sku, height, length, width, weight) VALUES 
('Running Shorts', 10.99, 'men', 'shorts', 'IMAGE HERE', 'Athletic Co.', 3.76, 'NBR11167', 3.00, 8.00, 8.00, 0.26);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, sku, height, length, width, weight) VALUES 
('Lounging Shorts', 12.99, 'women', 'shorts', 'IMAGE HERE', 'Relax Co.', 3.31, 'LOV12224', 5.00, 8.00, 7.00, 0.50);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, numStars, sku, height, length, width, weight) VALUES 
('Socks for kids', 8.50, 'kids', 'socks', 'IMAGE HERE', 'New Fashion Inc.', 4.24, 'XXVHG234', 4.80, 10.90, 10.10, 1.26);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, sku, height, length, width, weight) VALUES 
('B33R HELMET', 15.99, 'adults', 'hat', 'IMAGE HERE', 'Have Fun Co.', 'BEER4LYF', 24.50, 32.50, 32.50, 4.20);
INSERT INTO Product (name, price, broadType, clothingType, image, manufacturer, sku, height, length, width, weight) VALUES 
('Husker Baseball Cap', 19.99, 'everybody', 'hat', 'IMAGE HERE', 'Athletic Co.', 'MLB13233', 11.31, 15.16, 11.65, 0.75);

INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), '1xsmall', 250);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), 'small', 500);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), 'medium', 1250);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), 'large', 2500);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), '1xlarge', 1750);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), '2xlarge', 1000);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), '3xlarge', 500);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'), '4xlarge', 250);

INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'Sweatpants'), 'small', 300);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'Sweatpants'), 'medium', 550);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'Sweatpants'), 'large', 400);

INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'B33R HELMET'), 'small', 994);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'B33R HELMET'), 'medium', 2485);
INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'B33R HELMET'), 'large', 13);

INSERT INTO Stock (productId, size, quantity) VALUES ((SELECT productId FROM Product WHERE name = 'Husker Baseball Cap'), 'OSFA', 80000); /* OSFA = One Size Fits All */

INSERT INTO Category (name, description) VALUES ('USA', 'Celebrating the 250th Independence Day!');
INSERT INTO Category (name) VALUES ('Xmas');
INSERT INTO Category (name) VALUES ('LGBTQ+');
INSERT INTO Category (name) VALUES ('Cornhusker');

INSERT INTO CategoryProduct (categoryId, productId) VALUES ((SELECT categoryId FROM Category WHERE name = 'USA'), (SELECT productId FROM Product WHERE name = 'USA Muscle Shirt'));
INSERT INTO CategoryProduct (categoryId, productId) VALUES ((SELECT categoryId FROM Category WHERE name = 'USA'), (SELECT productId FROM Product WHERE name = 'American-Made Long Johns'));
INSERT INTO CategoryProduct (categoryId, productId) VALUES ((SELECT categoryId FROM Category WHERE name = 'Cornhusker'), (SELECT productId FROM Product WHERE name = 'Husker Baseball Cap'));
INSERT INTO CategoryProduct (categoryId, productId) VALUES ((SELECT categoryId FROM Category WHERE name = 'LGBTQ+'), (SELECT productId FROM Product WHERE name = 'Pride Coat'));

INSERT INTO Discount (name, startDate, endDate, percentage) VALUES ('Four and a half years', '2021/01/01', '2025/07/01', 15);
INSERT INTO Discount (name, startDate, endDate, dollarAmount) VALUES ('2023 April Fools!', '2023/04/01', '2024/04/01', 4.2);
INSERT INTO Discount (name, startDate, endDate, dollarAmount) VALUES ('2017 Christmas Socks Sale', '2017/12/01', '2017/12/31', 5.00);
INSERT INTO Discount (name, startDate, endDate, percentage) VALUES ('250th Independence Day Sale', '2026/06/04', '2026/07/04', 40);

INSERT INTO DiscountDeterminant (discountId, categoryId) VALUES ((SELECT discountId FROM Discount WHERE name = '250th Independence Day Sale'), (SELECT categoryId FROM Category WHERE name = 'USA'));
INSERT INTO DiscountDeterminant (discountId, categoryId) VALUES ((SELECT discountId FROM Discount WHERE name = 'Four and a half years'), (SELECT categoryId FROM Category WHERE name = 'Cornhusker'));
INSERT INTO DiscountDeterminant (discountId, productId) VALUES ((SELECT discountId FROM Discount WHERE name = '2023 April Fools!'), (SELECT productId FROM Product WHERE name = 'B33R HELMET'));
INSERT INTO DiscountDeterminant (discountId, clothingType) VALUES ((SELECT discountId FROM Discount WHERE name = '2017 Christmas Socks Sale'), 'Socks');

INSERT INTO CartProduct (cartId, productId, quantity) VALUES (10, 1, 2);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (10, 4, 2);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (10, 9, 2);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (6, 3, 1);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (7, 6, 6);

INSERT INTO Sale (accountId) VALUES (2);
INSERT INTO SaleProduct (saleId, productId, quantity) VALUES (1, 5, 1);
INSERT INTO Sale (accountId) VALUES (6);
INSERT INTO SaleProduct (saleId, productId, quantity) VALUES (2, 5, 1);
INSERT INTO SaleProduct (saleId, productId, quantity) VALUES (2, 10, 1);
INSERT INTO Sale (accountId) VALUES (8);
INSERT INTO SaleProduct (saleId, productId, quantity) VALUES (3, 10, 2);
INSERT INTO SaleProduct (saleId, productId, quantity) VALUES (3, 6, 2);

SELECT c.*, p.* FROM Category c JOIN CategoryProduct cp ON c.categoryId = cp.categoryId JOIN Product p ON cp.productId = p.productId WHERE c.name = 'USA' ORDER BY c.categoryId;