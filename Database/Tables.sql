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
accountID     INT NOT NULL,
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
cardNumber      VARCHAR(16) NOT NULL,
expDate         DATE NOT NULL,
cvvNumber       INT,
FOREIGN KEY (accountID) REFERENCES Account(accountID)
);

CREATE TABLE Product (
productId    INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
name         VARCHAR(64) NOT NULL,
broadType    VARCHAR(32) NOT NULL,
clothingType VARCHAR(32) NOT NULL,
price        FLOAT(24),
numStars     FLOAT(24),
sku          VARCHAR(16),
image        VARCHAR(2048),
manufacturer VARCHAR(64) NOT NULL,
height       FLOAT(24) NOT NULL,  /* centimeters */
length       FLOAT(24) NOT NULL,  /* centimeters */
width        FLOAT(24) NOT NULL,  /* centimeters */
weight       FLOAT(24) NOT NULL,  /* kilograms */
description  VARCHAR(256)
);

CREATE TABLE Discount (
discountId   INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
name         VARCHAR(32) NOT NULL,
startDate    DATE NOT NULL,
endDate      DATE NOT NULL,
/* VALUES below are mutually exclusive. */
percentage   FLOAT,  /* 25, not 0.25 */
dollarAmount FLOAT
);

CREATE TABLE DiscountDeterminant (
discountDeterminantId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
discountId            INT NOT NULL,
productId             INT,
FOREIGN KEY (discountId) REFERENCES Discount(discountId),
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

INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Coffee Guatemala Dark', 'men', 'pants', 35.29, 3.5, '406899209-6', 'http://dummyimage.com/188x100.png/ff4444/ffffff', 'Browsetype', 23.71, 41.71, 59.32, 94.18, 'Mercedes-Benz');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Goldschalger', 'women', 'pants', 8.45, 0.2, '410632882-8', 'http://dummyimage.com/227x100.png/cc0000/ffffff', 'Eire', 20.33, 45.6, 13.32, 64.71, 'Mazda');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Wiberg Super Cure', 'women', 'shorts', 74.73, 4.9, '169079242-6', 'http://dummyimage.com/199x100.png/cc0000/ffffff', 'Yacero', 87.76, 61.22, 32.87, 99.23, 'Chrysler');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Wanton Wrap', 'everyone', 'pants', 42.71, 0.3, '372865228-8', 'http://dummyimage.com/194x100.png/5fa2dd/ffffff', 'Centimia', 72.11, 4.5, 41.83, 26.64, 'Pontiac');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Frangelico', 'everyone', 'shirt', 8.36, 1.0, '910618742-0', 'http://dummyimage.com/149x100.png/5fa2dd/ffffff', 'Buzzdog', 57.81, 53.44, 40.55, 40.81, 'Lamborghini');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Mussels - Frozen', 'kids', 'shirt', 47.15, 0.5, '829201796-8', 'http://dummyimage.com/211x100.png/dddddd/000000', 'Eidel', 49.92, 24.33, 44.88, 69.0, 'Mazda');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Juice - Pineapple, 341 Ml', 'kids', 'shorts', 26.96, 0.3, '630933583-9', 'http://dummyimage.com/161x100.png/5fa2dd/ffffff', 'Kwinu', 43.7, 51.94, 12.22, 60.77, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Cake Slab', 'kids', 'shirt', 5.14, 2.6, '682295125-3', 'http://dummyimage.com/212x100.png/5fa2dd/ffffff', 'Quimm', 62.51, 29.78, 55.74, 81.96, 'GMC');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Lettuce - Lolla Rosa', 'women', 'shorts', 94.92, 1.8, '256030721-9', 'http://dummyimage.com/109x100.png/ff4444/ffffff', 'Dabfeed', 32.68, 11.78, 54.63, 31.25, 'Toyota');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Container Clear 8 Oz', 'women', 'pants', 58.24, 2.6, '765934522-2', 'http://dummyimage.com/203x100.png/ff4444/ffffff', 'Youbridge', 85.97, 82.67, 76.19, 31.55, 'Cadillac');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Cheese - Cheddar, Medium', 'kids', 'shorts', 97.68, 1.7, '256298072-7', 'http://dummyimage.com/213x100.png/5fa2dd/ffffff', 'Leexo', 24.45, 90.02, 9.65, 75.59, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Pants Custom Dry Clean', 'women', 'jacket', 59.04, 4.0, '717356192-2', 'http://dummyimage.com/178x100.png/ff4444/ffffff', 'Blognation', 19.93, 78.24, 57.23, 35.03, 'Mercedes-Benz');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Berry Brulee', 'women', 'shirt', 80.25, 3.9, '454543390-1', 'http://dummyimage.com/178x100.png/ff4444/ffffff', 'Voolith', 20.15, 70.24, 52.37, 30.79, 'Lincoln');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Pail - 4l White, With Handle', 'women', 'shirt', 68.6, 0.8, '644597669-7', 'http://dummyimage.com/250x100.png/dddddd/000000', 'Mynte', 42.75, 7.9, 53.54, 92.36, 'Mitsubishi');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Peas - Frozen', 'women', 'jacket', 6.4, 0.3, '772848080-4', 'http://dummyimage.com/141x100.png/5fa2dd/ffffff', 'Eazzy', 36.77, 14.51, 33.25, 42.84, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Steampan Lid', 'women', 'pants', 49.98, 3.4, '409401075-0', 'http://dummyimage.com/237x100.png/cc0000/ffffff', 'Jayo', 76.17, 92.17, 70.12, 82.9, 'Dodge');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Beef Ground Medium', 'kids', 'shorts', 78.41, 2.3, '680654711-7', 'http://dummyimage.com/191x100.png/cc0000/ffffff', 'Fivechat', 62.58, 90.22, 23.62, 98.62, 'Chevrolet');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Puff Pastry - Sheets', 'kids', 'shirt', 3.13, 1.8, '485684181-5', 'http://dummyimage.com/109x100.png/ff4444/ffffff', 'Youopia', 93.0, 67.94, 3.88, 75.7, 'Hyundai');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Bread - Corn Muffaletta', 'everyone', 'shorts', 79.04, 0.7, '496188433-2', 'http://dummyimage.com/129x100.png/5fa2dd/ffffff', 'Dabtype', 73.49, 44.61, 98.65, 5.78, 'Toyota');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Mushroom - Chanterelle, Dry', 'everyone', 'shirt', 48.36, 0.3, '908748997-8', 'http://dummyimage.com/199x100.png/5fa2dd/ffffff', 'Eidel', 43.81, 74.26, 56.7, 79.72, 'Kia');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Oven Mitts 17 Inch', 'men', 'shorts', 48.06, 2.1, '721032426-7', 'http://dummyimage.com/171x100.png/cc0000/ffffff', 'Tazz', 55.47, 9.67, 34.02, 7.85, 'Bentley');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Tumeric', 'kids', 'shirt', 95.55, 1.2, '712848704-2', 'http://dummyimage.com/244x100.png/dddddd/000000', 'Devcast', 41.96, 64.58, 0.94, 19.59, 'Pontiac');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Soap - Hand Soap', 'women', 'jacket', 35.25, 0.5, '211958386-2', 'http://dummyimage.com/229x100.png/ff4444/ffffff', 'Wordpedia', 2.51, 8.43, 93.39, 67.88, 'Volkswagen');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Glaze - Clear', 'men', 'shorts', 49.63, 0.8, '209339290-9', 'http://dummyimage.com/142x100.png/cc0000/ffffff', 'Skipfire', 50.0, 88.15, 29.7, 35.56, 'Volvo');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Foil Wrap', 'everyone', 'jacket', 47.77, 0.1, '485871758-5', 'http://dummyimage.com/163x100.png/ff4444/ffffff', 'Meedoo', 40.73, 83.07, 71.96, 98.68, 'Toyota');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Bagel - Ched Chs Presliced', 'everyone', 'pants', 24.78, 2.7, '643542530-2', 'http://dummyimage.com/241x100.png/dddddd/000000', 'Kwideo', 65.5, 49.76, 32.56, 56.63, 'Lincoln');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Turnip - Wax', 'kids', 'pants', 78.25, 0.9, '082323120-8', 'http://dummyimage.com/232x100.png/5fa2dd/ffffff', 'Gigashots', 26.4, 71.18, 29.2, 75.7, 'Land Rover');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Bar Mix - Pina Colada, 355 Ml', 'men', 'shorts', 34.28, 1.2, '919069578-X', 'http://dummyimage.com/173x100.png/dddddd/000000', 'Skinte', 74.3, 30.9, 82.45, 22.87, 'Mercedes-Benz');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Wine - Cousino Macul Antiguas', 'men', 'pants', 28.1, 4.6, '619458161-1', 'http://dummyimage.com/207x100.png/5fa2dd/ffffff', 'Mydeo', 47.46, 36.95, 80.63, 93.3, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Carbonated Water - White Grape', 'everyone', 'jacket', 60.56, 0.6, '517623564-1', 'http://dummyimage.com/246x100.png/5fa2dd/ffffff', 'Yodoo', 30.69, 88.93, 67.49, 6.45, 'Bentley');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Pork - European Side Bacon', 'men', 'jacket', 21.15, 3.3, '636544221-1', 'http://dummyimage.com/184x100.png/5fa2dd/ffffff', 'Kwilith', 84.44, 55.02, 63.52, 8.16, 'Lincoln');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Wine - Niagara,vqa Reisling', 'everyone', 'shorts', 12.6, 2.8, '311136973-0', 'http://dummyimage.com/167x100.png/ff4444/ffffff', 'Oyoloo', 48.19, 8.07, 21.65, 34.62, 'Buick');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Halibut - Fletches', 'women', 'pants', 99.25, 1.3, '668688688-2', 'http://dummyimage.com/124x100.png/cc0000/ffffff', 'Gabcube', 91.29, 5.27, 40.57, 8.64, 'Honda');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Crush - Orange, 355ml', 'men', 'jacket', 42.31, 2.2, '261375752-3', 'http://dummyimage.com/104x100.png/cc0000/ffffff', 'Thoughtstorm', 93.55, 42.26, 19.76, 25.48, 'Cadillac');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Anchovy Paste - 56 G Tube', 'men', 'shirt', 9.15, 2.4, '597365814-7', 'http://dummyimage.com/165x100.png/ff4444/ffffff', 'Trunyx', 41.75, 34.83, 35.36, 26.43, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Dc - Sakura Fu', 'everyone', 'pants', 79.31, 2.0, '540642148-4', 'http://dummyimage.com/116x100.png/dddddd/000000', 'Gigazoom', 14.6, 67.67, 88.04, 22.42, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Salmon - Atlantic, No Skin', 'everyone', 'pants', 42.44, 3.9, '219590158-6', 'http://dummyimage.com/245x100.png/cc0000/ffffff', 'Skinte', 7.02, 15.79, 91.69, 95.76, 'Lexus');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nutmeg - Ground', 'everyone', 'shirt', 18.1, 2.8, '206636743-5', 'http://dummyimage.com/250x100.png/ff4444/ffffff', 'Fliptune', 87.48, 58.41, 4.59, 37.25, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Basil - Primerba, Paste', 'men', 'pants', 48.06, 0.3, '691053528-6', 'http://dummyimage.com/234x100.png/ff4444/ffffff', 'Skyndu', 38.57, 75.68, 24.88, 48.35, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Pomello', 'men', 'shorts', 0.17, 1.7, '877228917-1', 'http://dummyimage.com/222x100.png/ff4444/ffffff', 'Flipstorm', 18.3, 16.72, 65.98, 93.43, 'Nissan');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nectarines', 'kids', 'jacket', 94.16, 2.9, '660865405-7', 'http://dummyimage.com/200x100.png/5fa2dd/ffffff', 'Dabvine', 58.31, 33.9, 61.03, 31.48, 'Cadillac');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Milk - 1%', 'kids', 'pants', 20.33, 2.2, '827935831-5', 'http://dummyimage.com/119x100.png/dddddd/000000', 'Katz', 20.64, 97.32, 74.23, 18.05, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Melon - Watermelon, Seedless', 'men', 'shirt', 75.21, 4.5, '811296479-3', 'http://dummyimage.com/227x100.png/ff4444/ffffff', 'Yombu', 80.33, 22.22, 19.23, 84.48, 'Volvo');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Lettuce - Treviso', 'kids', 'shorts', 66.49, 0.7, '502392003-8', 'http://dummyimage.com/138x100.png/cc0000/ffffff', 'Riffpath', 22.4, 85.93, 86.1, 68.06, 'Holden');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Pasta - Shells, Medium, Dry', 'women', 'shorts', 24.51, 3.0, '293755617-5', 'http://dummyimage.com/221x100.png/5fa2dd/ffffff', 'Browsezoom', 23.08, 28.19, 14.86, 94.2, 'Oldsmobile');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Beets - Pickled', 'women', 'jacket', 44.37, 2.7, '918385971-3', 'http://dummyimage.com/113x100.png/ff4444/ffffff', 'Centizu', 4.84, 86.85, 21.93, 31.15, 'Honda');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Cape Capensis - Fillet', 'everyone', 'shirt', 0.04, 4.4, '342423062-6', 'http://dummyimage.com/192x100.png/5fa2dd/ffffff', 'Wikizz', 80.12, 42.42, 63.6, 1.68, 'Volkswagen');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Apple - Granny Smith', 'women', 'shorts', 11.35, 3.1, '804834054-2', 'http://dummyimage.com/204x100.png/cc0000/ffffff', 'Gigashots', 24.02, 16.71, 57.49, 43.65, 'Lincoln');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Pepper - Red Bell', 'women', 'shorts', 12.46, 1.4, '642804445-5', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 'Trupe', 4.18, 39.76, 41.61, 28.99, 'Ford');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Gelatine Powder', 'men', 'pants', 74.32, 2.4, '249240288-6', 'http://dummyimage.com/137x100.png/5fa2dd/ffffff', 'Flashdog', 77.05, 7.75, 67.2, 45.09, 'Audi');


INSERT INTO Discount (name, startDate, endDate, percentage) VALUES ('Four and a half years', '2021/01/01', '2025/07/01', 15);
INSERT INTO Discount (name, startDate, endDate, dollarAmount) VALUES ('2023 April Fools!', '2023/04/01', '2024/04/01', 4.2);
INSERT INTO Discount (name, startDate, endDate, dollarAmount) VALUES ('2017 Christmas Socks Sale', '2017/12/01', '2017/12/31', 5.00);
INSERT INTO Discount (name, startDate, endDate, percentage) VALUES ('250th Independence Day Sale', '2026/06/04', '2026/07/04', 40);

--INSERT INTO DiscountDeterminant (discountId) VALUES ((SELECT discountId FROM Discount WHERE name = '250th Independence Day Sale'));
--INSERT INTO DiscountDeterminant (discountId) VALUES ((SELECT discountId FROM Discount WHERE name = 'Four and a half years'));
--INSERT INTO DiscountDeterminant (discountId, productId) VALUES ((SELECT discountId FROM Discount WHERE name = '2023 April Fools!'), (SELECT productId FROM Product WHERE name = 'B33R HELMET'));
--INSERT INTO DiscountDeterminant (discountId, clothingType) VALUES ((SELECT discountId FROM Discount WHERE name = '2017 Christmas Socks Sale'), 'Socks');

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

