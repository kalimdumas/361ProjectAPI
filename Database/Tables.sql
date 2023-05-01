USE ApplicationDB;

--The following are discontinued tables
DROP TABLE IF EXISTS DiscountDeterminant;
DROP TABLE IF EXISTS Discount;
DROP TABLE IF EXISTS CategoryProduct;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Stock;

--The following are current
DROP TABLE IF EXISTS SaleProduct;
DROP TABLE IF EXISTS Sale;
DROP TABLE IF EXISTS CartProduct;
DROP TABLE IF EXISTS Cart;
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
name         VARCHAR(128) NOT NULL,
broadType    VARCHAR(32) NOT NULL,
clothingType VARCHAR(32) NOT NULL,
price        FLOAT(24),
numStars     FLOAT(24),
sku          VARCHAR(16),
image        VARCHAR(2048),
manufacturer VARCHAR(64) NOT NULL,
height       FLOAT(24) NOT NULL, --centimeters
length       FLOAT(24) NOT NULL, --centimeters
width        FLOAT(24) NOT NULL, --centimeters
weight       FLOAT(24) NOT NULL, --kilograms
description  VARCHAR(2048)
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
saleId       INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
name         VARCHAR(32) NOT NULL,
startDate    DATE NOT NULL,
endDate      DATE NOT NULL,
--VALUES below are mutually exclusive.
percentage   FLOAT, --25, not 0.25
dollarAmount FLOAT
);

CREATE TABLE SaleProduct (
saleProductId INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
saleId        INT NOT NULL,
productId     INT NOT NULL,
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

--Mens Shirts
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Sportswear Club T-shirt', 'men', 'shirt', 50.00, 4.2, 'AR4997-246', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2dc6383e-abf4-4a87-b213-9559e209e78c/sportswear-club-mens-t-shirt-ShrJfX.png', 'Nike', 0.2, 40.00, 30.00, 0.4, 'The Nike Sportswear Club T-Shirt is made with our everyday cotton fabric and a classic fit for a familiar feel right out of the bag. An embroidered Futura logo on the chest provides a signature Nike look.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Mens Button-Down Short-Sleeve Top', 'men', 'shirt', 70.00, 3.9, 'DX0898-386', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/ddd6cfa7-1b1c-4f23-ac7d-7fb7d5ba2455/club-mens-button-down-short-sleeve-top-9qjWl3.png', 'Nike', 0.2, 40.00, 30.00, 0.4, 'This Nike Club top puts a new spin on your classic collared button-down. Its roomy through the chest, shoulders and body to give you casual style and some extra space to move. The soft cotton construction lets it drape naturally for easy comfort. Plus, the hem features a round drawcord to let you decide how to wear it.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Sportswear Swoosh', 'men', 'shirt', 30.00, 4.7, 'DC5094-010', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2b6b741a-7080-4029-be52-d4821066a4ab/sportswear-swoosh-mens-t-shirt-LzncrX.png', 'Nike', 0.2, 40.00, 30.00, 0.4, 'Big and bold, the Nike Sportswear T-Shirt offers soft cotton construction and a prominent graphic at the chest.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Mens Tank Top', 'men', 'shirt', 30.00, 4.1, 'FB9764-246', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f49bc6e0-1583-4a72-a080-2b6d908ea97e/sportswear-mens-tank-top-h9p5SP.png', 'Nike', 0.2, 40.00, 30.00, 0.4, 'Go sleeveless with the Swoosh. Soft cotton and ribbed trim keep you comfortable, wherever your journey takes you.');
--Mens Jackets
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('ORIGINALS ALWAYS FRESH HOODIE', 'men', 'jacket', 42.00, 4.8, 'HD5259', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/b3bbf8588a8c45db96dbada2012aab5e_9366/Originals_Always_Fresh_Hoodie_Black_HD5259_21_model.jpg', 'Adidas', 0.3, 29.00, 23.00, 0.5, 'Theres no mistaking style. This adidas hoodie makes that extra clear. Its laid-back vibe will have you feeling good and fresh - looking it too.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nike Tech Fleece Mens Pullover Graphic Hoodie', 'men', 'jacket', 120.00, 0.0, 'DX0577-386', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6f31f70f-4e52-4c63-89ed-20fb14179a4c/tech-fleece-mens-pullover-graphic-hoodie-3GQNg6.png', 'Nike', 0.3, 29.00, 23.00, 0.5, 'Our Tech Fleece Hoodie elevates a layering essential with premium, low-profile warmth. Signature details like contrast taped trim and bonded pockets provide an elevated look. The roomy fit and articulation at the shoulders and sleeves creates a more natural shape for relaxed comfort and easy movement.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nike Dry Graphic Mens Dri-FIT Hooded Fitness Pullover', 'men', 'jacket', 70.00, 4.1, 'CZ2425-100', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/b711c6b9-a0af-4a85-864d-f4c36c988815/dry-graphic-mens-dri-fit-hooded-fitness-pullover-PcdFd2.png', 'Nike', 0.3, 29.00, 23.00, 0.5, 'The Nike Dry Graphic hoodie is made with sweat-wicking technology helps you stay dry before, during or after your workout. This product is made with 100% sustainable materials, using a blend of both recycled polyester and organic cotton fibers. The blend is at least 10% recycled fibers or at least 10% organic cotton fibers.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Classics Logo Mens Hoodie', 'men', 'jacket', 24.00, 5.0, '536238_79', 'https://tinyurl.com/3thdynv6', 'Puma', 0.3, 29.00, 23.00, 0.5, 'The Classics get a fresh update this season with more sustainable materials and signature good looks. This Classics Hoodie features a bold, eye-catching Archive logo across the chest and soft 100% cotton feel.');
--Mens Pants
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nike Tech Fleece Lightweight', 'men', 'pants', 60.00, 4.5, 'DX0826-291', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/78a9dea1-8c0a-4c18-a99c-ac48022d0ac3/tech-fleece-lightweight-mens-joggers-Z38h70.png', 'Nike', 0.2, 50.00, 20.00, 0.5, 'Perfect for those laid-back warm weather days, our classic fit Nike Tech Essentials joggers take their style cues from Tech Fleece. Unlike the insulating warmth of traditional Tech Fleece, however, these are made with a lightweight, stretchy knit fabric perfect for warmer months. The relaxed fit through the seat and thighs tapers down to the form-fitting, ribbed ankles for a tailored look that shows off your shoes.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nike Sportswear Tech Fleece', 'men', 'pants', 80.00, 3.6, 'CU4495-381', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0edee222-0c7a-4059-a4cd-6f4167ada32a/sportswear-tech-fleece-mens-joggers-4x29ft.png', 'Nike', 0.2, 50.00, 20.00, 0.5, 'Ready for cooler weather, the Nike Sportswear Tech Fleece Joggers feature an updated fit perfect for everyday wear. Roomy through the thigh, this tapered design narrows at the knee to give you a comfortable feel without losing the clean, tailored look you love. Tall ribbed cuffs complete the jogger look while a zippered pocket on the right leg provides secure small-item storage and elevate the look.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('ESSENTIALS WARM-UP TAPERED 3-STRIPES TRACK PANTS', 'men', 'pants', 45.00, 4.3, 'H46109', 'https://assets.adidas.com/images/h_2000,f_auto,q_auto,fl_lossy,c_fill,g_auto/9d0a73b13ddf4368a383ad23007e47f5_9366/Essentials_Warm-Up_Tapered_3-Stripes_Track_Pants_Grey_H46109_23_hover_model.jpg', 'Adidas', 0.2, 50.00, 20.00, 0.5, 'The perfect layer to get your mind and muscles ready, these adidas track pants are made from classic sport tricot for a smooth look and feel. The drawcord-elastic waist and cuffed hems help them stay in place. Take them off once you are in the zone, and pull them right back on when it is time to head out.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('TIRO 23 LEAGUE PANTS', 'men', 'pants', 50.00, 4.2, 'HS3528', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/f13f36ab641e4591ab85aefc00f2a99e_9366/Tiro_23_League_Pants_Red_HS3528_21_model.jpg', 'Adidas', 0.2, 50.00, 20.00, 0.5, 'Born for the beautiful game. Part of the Tiro 23 League range, these adidas soccer pants use AEROREADY to channel moisture away from your skin and keep you firing on all cylinders. Ankle zips mean they are easy to slide off when your session is done.');
--Mens Shorts
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Mens Woven Lined Flow Shorts', 'men', 'shorts', 50.00, 4.5, 'DM6829-491', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/4f2949e3-332d-4d13-b0c2-00361fe4ba80/sportswear-sport-essentials-mens-woven-lined-flow-shorts-5nvp4d.png', 'Nike', 0.2, 30.00, 34.00, 0.5, 'Whether you are running to the nearest food truck or diving into your favorite swimming hole, the Nike Sportswear Sport Essentials Lined Flow Shorts are a good idea. Lined for comfort, the smooth woven fabric is lightweight and lends itself to adventures of all kinds.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Mens Dri-FIT 5in Unlined Versatile Shorts', 'men', 'shorts', 60.00, 4.8, 'DV9336-084', 'https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/d71ef0be-01f5-443e-98d3-e07b969d3929/unlimited-mens-dri-fit-5-unlined-versatile-shorts-nlD0tf.png', 'Nike', 0.2, 30.00, 34.00, 0.5, 'Designed for running, training and yoga, our sweat-wicking Unlimited Shorts were made to do it all. Theyre here for whatever your workout requires, with stretchy fabric that helps you stay free to move. Plus, a hidden pocket lets you keep your phone close as you bring the heat to the gym or a run.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('DESIGNED FOR GAMEDAY SHORTS', 'men', 'shorts', 42.00, 5.0, 'HL3853', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c6de1b1f0a384657bd78ae9201398e67_9366/Designed_for_Gameday_Shorts_Beige_HL3853_21_model.jpg', 'Adidas', 0.2, 30.00, 34.00, 0.5, 'Get your head right and the rest will follow. Not always easy to do, but thats why you have these adidas shorts. On those days or in those hours, when you need to tune into yourself and tune out the rest, these shorts let you do just that. Rib inserts and the high-stretch fabric up the comfort, encouraging a full range of motion so you can sprawl out, stretch out and move how you need.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('ADICOLOR CLASSICS 3-STRIPES SWEAT SHORTS', 'men', 'shorts', 45.00, 5.0, 'IA6352', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/55db1e40402342f38366aefb011d493c_9366/Adicolor_Classics_3-Stripes_Sweat_Shorts_Blue_IA6352_21_model.jpg', 'Adidas', 0.2, 30.00, 34.00, 0.5, 'Score some retro style. These adidas sweat shorts are inspired by OG fashion from the archives but designed for today. The versatile design means you can wear them on chill days at home or when youre meeting up with friends. Theyre made of soft French terry fabric, so no matter where you go youll stay comfortable. Our cotton products support more sustainable cotton farming.');
--Womens Shirts
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('V-Neck (grey)', 'women', 'shirt', 76.39, 3, '836725485-6', 'https://s7.landsend.com/is/image/LandsEnd/527814_LEPP_LF_6YV', 'coolshirts', 0.2, 30, 34, 94.18, 'This is a shirt that is good for any occasion.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Cross Shirt', 'women', 'shirt', 83.82, 3.5, '746253748-6', 'https://m.media-amazon.com/images/I/41ShDOOB8NL._SS400_.jpg', 'shirttown', 0.2, 30, 34, 94.18, 'This shirt is cool because the fabric crosses on the lower belly, which makes it very cool.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Button Shirt', 'women', 'shirt', 36.47, 4, '463748593-6', 'https://cdni.llbean.net/is/image/wim/506694_0_44?hei=1092&wid=950&resMode=sharp2&defaultImage=llbprod/A0211793_2', 'trickyshirts', 0.2, 30, 34, 94.18, 'Pinstipes and buttons are very fun on a shirt. You''ll have so much fun wearing it.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Normal Shirt', 'women', 'shirt', 48.84, 4, '746354758-6', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQHJtzEV_1djPT5PsWcH49I0vXOcb7-9BXnMw&usqp=CAU', 'shirttown', 0.2, 30, 34, 94.18, 'This is pretty much a normal shirt. Wear it for all normal occasions.');
--Womens Jackets
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Anti Social Social Club Blue Precious Petals Hoodie - Black', 'women', 'jacket', 199.00, 3.3, 'SYUHRTDF', 'https://i0.wp.com/antisocialsocialclubofficial.co/wp-content/uploads/2023/01/Anti-Social-Social-Club-Blue-Precious-Petals-Hoodie-Black-1.webp?fit=700%2C700&ssl=1', 'Anti Social Social Club', 1.7, 27, 22, 256.08, 'The Anti-Social Social Club Blue Hoodie in black is perfect for that street-style look. This hoodie features a comfy, fleece-lined construction with an oversized drawstring hood, ribbed cuffs & waistband. The hoodie also features two front pockets and a kangaroo pouch pocket for extra storage and warmth.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('BAPE STORE MIAMI 3RD ANNIV. CROPPED SHARK FULL ZIP HOODIE LADIES', 'women', 'jacket', 419.00, 2.1, '1I72-215-001', 'https://cdn.shopify.com/s/files/1/0214/3706/products/001ZPI722001_MUL_A_1024x1024.jpg?v=1676036343', 'A Bathing Ape', 2.2, 34, 27, 102.52, 'MIAMI STORE 3RD ANNIVERSARY EXCLUSIVE.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Overdyed S Logo Hooded Sweatshirt', 'women', 'jacket', 158.00, 2.8, 'SW39_SS23', 'https://cdn.shopify.com/s/files/1/0644/5006/8714/products/SW39_SS23_OverdyedSLogoHoodedSweatshirt_WashedTeal_720x.jpg?v=1681765867', 'Supreme', 1.5, 26, 12.5, 136.23, 'Brushed-back fleece with pouch pocket. Embroidered logos on chest and hood.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('BASIC STÜSSY PIGMENT DYED HOODIE', 'women', 'jacket', 130.00, 4.9, '1924879', 'https://cdn.shopify.com/s/files/1/0087/6193/3920/products/1924879_NATL_1_ffd8b224-20f1-4d72-9ad4-2b0413332370_900x.jpg?v=1674759243', 'Stüssy', 2.6, 27.5, 13.5, 118.64, 'Longsleeve pigment dyed hooded sweatshirt.');
--Womens Pants
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Star wars pants', 'women', 'pants', 99.99, 4, '653749573-6', 'https://img.ltwebstatic.com/images3_pi/2022/06/21/1655801024dc493394217d950a39995f643d670321_thumbnail_900x.webp', 'coolpants', 0.2, 30, 34, 94.18, 'These pants look like Anakin would wear them.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Curtain Pants (green)', 'women', 'pants', 43.23, 4, '867463859-6', 'https://img1.shopcider.com/product/1652868248000-xTTpWS.jpg?x-oss-process=image/resize,w_350,m_lfit/quality,Q_80/interlace,1', 'pantstown', 0.2, 30, 34, 94.18, 'These are like if curtains were made into pants. Very stylish (mauve).');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Curtain Pants (mauve)', 'women', 'pants', 73.23, 5, '725647584-6', 'https://athleta.gap.com/webcontent/0029/672/555/cn29672555.jpg', 'pantstown', 0.2, 30, 34, 94.18, 'These are like if curtains were made into pants. Very stylish (green).');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Scottish pants', 'women', 'pants', 55.55, 4.5, '726485938-6', 'https://img.buzzfeed.com/store-an-image-prod-us-east-1/kvBhUeq5n.png?crop=1001:1500;199,0', 'TopPants', 0.2, 30, 34, 94.18, 'These pants look like bagpipes. Very stylish.');
--Womens Shorts
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Boyfriend Shorts', 'women', 'shorts', 49.00, 4.2, '5075082', 'https://n.nordstrommedia.com/id/sr3/4c9093d1-99b1-480c-8d50-081610d9cab9.jpeg?crop=pad&pad_color=FFF&format=jpeg&w=780&h=1196', 'Caslon', 1, 16, 14, 94.18, 'Front whiskering and a touch of distressing ages essential denim shorts in a boyfriend cut with a hint of slouch and rolled hems.')
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('WOMEN''S BALENCIAGA SWEAT SHORTS IN BEIGE', 'women', 'shorts', 795.00, 4.8, '674591TMVF57761', 'https://balenciaga.dam.kering.com/m/322c20e4de270fe0/Medium-674591TMVF57761_F.jpg?v=2', 'Balenciaga', 1, 32, 16, 163.23, 'Balenciaga Sweat Shorts in dark beige and black curly fleece.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('GG velvet shorts', 'women', 'shorts', 1350.00, 3.6, '677573ZAHGE3303', 'https://media.gucci.com/style/DarkGray_Center_0_0_800x800/1635551143/677573_ZAHGE_3303_001_100_0000_Light-GG-velvet-shorts.jpg', 'GUCCI', 1.3, 16, 29, 125.63, 'Marking the 100th anniversary of the House, Aria is a celebration of the history of Gucci. Taking cues from the House''s glamorous past, Alessandro Michele reinterprets a number of Tom Ford''s most iconic looks. These emerald green shorts recall the recognizable velvet pieces presented during his collections.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Gingham check shorts', 'women', 'shorts', 1290.00, 4.3, 'P216H_129G_F0C5Z', 'https://www.prada.com/content/dam/pradabkg_products/P/P21/P216H/129GF0C5Z/P216H_129G_F0C5Z_S_231_SLF.jpg/jcr:content/renditions/cq5dam.web.hebebed.1000.1000.crop.jpg', 'Prada', 0.75, 36, 71, 96.87, 'Evoking childhood memories and elegance, Prada explores the antithesis between minimalism and decoration, ancient and modern. Characterized by the reinterpretation of stylistic codes from the iconic vintage Tyrolean wardrobe, the garment is enhanced with the Prada triangle formed by zigzag trim that creates novel and modernist graphic elements in contrast with the classic gingham check.');
--Kids Shirts
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Mexico 22 Home Jersey', 'kids', 'shirt', 68.99, 4.3, 'Z72782', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/a66f75057d5644ef96ebaec200d78420_9366/Mexico_22_Home_Jersey_Green_HE8848_01_laydown.jpg', 'Adidas', 25, 6, 10, 1, 'A moisture-wicking Mexico home jersey made with recycled materials.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Trefoil Tee', 'kids', 'shirt', 24.99, 4.5, 'Y8938929', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/c30b56b4cc6f40dfaaf6a930014e57ed_9366/Trefoil_Tee_Black_DV2905_01_laydown.jpg', 'Adidas', 25, 6, 10, 1, 'A soft, cotton tee with an oversize logo graphic.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Vent Jacquard Short Sleeve', 'kids', 'shirt', 31.99, 3.9, 'W2983982', 'https://underarmour.scene7.com/is/image/Underarmour/PS1378546-508_HF?rp=standard-0pad|pdpZoomDesktop&scl=0.72&fmt=jpg&qlt=85&resMode=sharp2&cache=on,on&bgc=f0f0f0&wid=1836&hei=1950&size=1500,1500', 'Under Armour', 25, 6, 10, 1, 'The ultimate T for your hottest training days.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Team Short Sleeve', 'kids', 'shirt', 18.89, 4.8, 'V8929238', 'https://underarmour.scene7.com/is/image/Underarmour/PS1377487-001_HF?rp=standard-0pad|pdpZoomDesktop&scl=0.72&fmt=jpg&qlt=85&resMode=sharp2&cache=on,on&bgc=f0f0f0&wid=1836&hei=1950&size=1500,1500', 'Under Armour', 25, 6, 10, 1, 'Loose, light, and it keeps you cool.');
--Kids Jackets
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Reflective Splash Print Hoodie', 'kids', 'jacket', 35.29, 4.8, '2206238739282151', 'https://img.ltwebstatic.com/images3_pi/2022/07/22/1658455120ce25083a5f8e8b9e3ddc3a7c425c5468_thumbnail_900x.webp', 'Shein', 30, 25, .2, 5, 'Shein reflective hoodie.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('adidas Big Boys Lightweight Track Jacket', 'kids', 'jacket', 45.99, 4.5, '4353771', 'https://jcpenney.scene7.com/is/image/JCPenney/DP0531202109015022M?hei=550&wid=550&op_usm=.4%2C.8%2C0%2C0&resmode=sharp2&op_sharpen=1', 'adidas', 30, 25, .2, 5, 'Adidas track jacket.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Xersion Little & Big Boys Lightweight Track Jacket', 'kids', 'jacket', 36.49, 4, '4354868', 'https://jcpenney.scene7.com/is/image/JCPenney/DP0617202211312024M?hei=550&wid=550&op_usm=.4%2C.8%2C0%2C0&resmode=sharp2&op_sharpen=1', 'Xersion', 30, 25, .2, 5, 'Xersion track jacket.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Umbro Big Boys Lightweight Track Jacket', 'kids', 'jacket', 50.99, 0, '4356303', 'https://jcpenney.scene7.com/is/image/JCPenney/DP1202202207165740M?hei=550&wid=550&op_usm=.4%2C.8%2C0%2C0&resmode=sharp2&op_sharpen=1', 'Umbro', 30, 25, .2, 5, 'Umbro track jacket.');
--Kids Pants
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Sportswear Club Fleece', 'kids', 'pants', 35.99, 4.6, 'A892352', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/b480302c-e573-452b-b600-e80db39f0fa0/sportswear-club-fleece-little-kids-pants-QBf7Wp.png', 'Nike', 8, 20, 12, 0.5, 'The Nike Sportswear Club Fleece Pants are made with soft, lightweight fabric that feels comfy and cozy on days inside or during playtime.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nike Sportswear Woven Pants', 'kids', 'pants', 43.89, 3.2, 'B72733', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/038f1428-b419-4fac-b840-8e21678e38bd/sportswear-big-kids-girls-woven-pants-GCxdBB.png', 'Nike', 8, 20, 12, 0.5, 'There''s a special secret you''ll love about these pants. Fold over the elastic waistband for the length and look you want, and then...ta-da! See the fun wave of Swoosh logos around the inner waistband. Wear these durable woven pants any day, and for the full look, pair with our matching track jacket.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('3-Stripes Pants', 'kids', 'pants', 32.99, 4.9, 'Q238939', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/62cc305154404b0db30ea9510125ba6c_9366/3-Stripes_Pants_Black_DV2872_01_laydown.jpg', 'Adidas', 8, 20, 12, 0.5, 'Track pants with classic details and modern tapered legs.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Rekive Track Pants', 'kids', 'pants', 50.99, 4.2, 'Z838223', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/5d00193ceefa46afbbffaf0801197694_9366/adidas_Rekive_Track_Pants_Grey_IC3066_01_laydown.jpg', 'Adidas', 8, 20, 12, 0.5, 'Clean-lined track pants made with recycled materials.');
--Kids Shorts
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Little & Big Boys Super Mario Pull-On Short', 'kids', 'shorts', 26.99, 5, '4121530', 'https://jcpenney.scene7.com/is/image/JCPenney/DP0323202307051620M?hei=550&wid=550&op_usm=.4%2C.8%2C0%2C0&resmode=sharp2&op_sharpen=1', 'Mario', 30, 25, .2, 5, 'Mario shorts.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Puma Big Boys Mid Rise Pull-On Short', 'kids', 'shorts', 28.99, 0, '4356052', 'https://jcpenney.scene7.com/is/image/JCPenney/DP0403202313052055M?hei=550&wid=550&op_usm=.4%2C.8%2C0%2C0&resmode=sharp2&op_sharpen=1', 'Puma', 30, 25, .2, 5, 'Puma shorts.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Levi''s Big Boys Husky Cargo Short', 'kids', 'shorts', 42.99, 0, '4300374', 'https://jcpenney.scene7.com/is/image/JCPenney/DP0329202309141481M?hei=550&wid=550&op_usm=.4%2C.8%2C0%2C0&resmode=sharp2&op_sharpen=1', 'Levi', 30, 25, .2, 5, 'Levi camo shorts.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Balance Pull-On Big Boys Mid Rise Hybrid Short', 'kids', 'shorts', 26.99, 5, '4356030', 'https://jcpenney.scene7.com/is/image/JCPenney/DP0117202307221850M?hei=550&wid=550&op_usm=.4%2C.8%2C0%2C0&resmode=sharp2&op_sharpen=1', 'Balance', 30, 25, .2, 5, 'Balance red shorts.');
--Backpacks
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('CLASSIC 3-STRIPES BACKPACK', 'accessory', 'backpack', 39.00, 4.8, 'EX6513', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/4a6b0ba7b4144c91a851ac9f005afe67_9366/Classic_3-Stripes_Backpack_Black_EX6513_01_standard.jpg', 'Adidas', 0.4, 25.00, 15.00, 0.7, 'Your work-to-workout hero. This adidas backpack offers plenty of space for your gym clothes and workday essentials. An inner sleeve stores your laptop, and a zip pocket at the top lets you keep your most important items close. Heroes come in all shapes and sizes.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('CREATOR BACKPACK', 'accessory', 'backpack', 29.00, 4.8, 'EX6976', 'https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/7725f45eca9549e4888fad42001dfafa_9366/Creator_Backpack_Black_EX6976_01_standard.jpg', 'Adidas', 0.4, 25.00, 15.00, 0.7, 'Did someone say after-school pickup game? Be prepared for last-minute activity with this adidas backpack. A roomy main compartment and multiple zip pockets help keep school, work or workout gear organized. When it is game time, stash your sunglasses in the top zip pocket.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nike Sportswear RPM', 'accessory', 'backpack', 79.00, 3.8, 'BA5971-330', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/7f79b81a-d341-4b2f-a994-e670b462b0b6/sportswear-rpm-backpack-26l-f6pVpb.png', 'Nike', 0.4, 25.00, 15.00, 0.7, 'The Nike Sportswear RPM Backpack is made to hold it all. With a padded back for comfort and a versatile strap system, it is ideal for all your on-the-go needs.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Nike Hoops Elite Pro', 'accessory', 'backpack', 89.00, 4.1, 'DZ6857-010', 'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/0f7816c9-b907-4090-a2b4-5dc4631b0b2c/hoops-elite-pro-backpack-32l-J9wCWL.png', 'Nike', 0.4, 25.00, 15.00, 0.7, 'This backpack makes a statement both in its design and its storage capacity. It is also just a great bag for anyone who wants plenty of pockets and an organization system that will leave you wondering why you did not get it years ago. Multiple small-item pockets keep your quick-grab items at the ready, along with a separate, ventilated compartment for your smelly shoes.');
--Necklaces
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Miami Cuban Link 18in Chain Necklace (3mm) in 14k Gold', 'accessory', 'necklace', 682.50, 3.0, '12392183', 'https://slimages.macysassets.com/is/image/MCY/products/3/optimized/16429593_fpx.tif?op_sharpen=1&wid=700&hei=855&fit=fit,1&fmt=webp', 'Italian Gold', 0.0, 18.00, 0.00, 1.0, 'Bold and classic, let your style rule in this striking Miami Cuban link chain necklace from Italian Gold.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Diamond Halo 18" Pendant Necklace (3/4 ct. t.w.) in 14k White, Yellow or Rose Gold', 'accessory', 'necklace', 559.30, 4.9, '10523346', 'https://slimages.macysassets.com/is/image/MCY/products/6/optimized/17886486_fpx.tif?op_sharpen=1&wid=700&hei=855&fit=fit,1&fmt=webp', 'Macys', 0.0, 18.00, 0.00, 1.0, 'This elegant pendant necklace (1/3 ct. t.w.) features round-shape diamonds, set in a halo-style and suspended from a fine box link chain.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Kendra Scott Elisa Pendant Necklace for Women, Fashion Jewelry, 14k Gold-Plated', 'accessory', 'necklace', 65.90, 4.7, '4217717622', 'https://m.media-amazon.com/images/I/41-V9pJZSWL._AC_UY695_.jpg', 'Kendra Scott', 0.0, 15.00, 0.00, 1.0, 'If you love to layer or gravitate towards simpler styles, this piece is perfect for you. You won''t get tired of the Elisa Pendant Necklace, because it was made with everyday wear in mind.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Miabella Italian 925 Sterling Silver 3.5mm Curb Cuban Link Chain Necklace', 'accessory', 'necklace', 21.90, 4.3, 'B0B6TP94X4', 'https://m.media-amazon.com/images/I/713tkhR-EvL._AC_UX679_.jpg', 'Miabella', 0.0, 20.00, 0.00, 1.0, 'Add style to a basic look with this solid 925 sterling silver 3.5mm Curb chain. Our flat diamond-cut beveled links offer a much more reflective look than the standard curb chain for an elegant rich shine. Strong, durable and comfortable, this slim version of the classic Cuban is perfect for all ages and for any occasion. Wear alone with a casual or formal outfit for everyday modern elegance, with your favorite pendant for a personal statement or as a great layering chain.');
--Watches
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Timex Ironman Classic 30 Full-Size 38mm Watch', 'accessory', 'watch', 32.73, 4.6, 'B0842QF6JD', 'https://m.media-amazon.com/images/I/81YDWDSYSeL._AC_UY500_.jpg', 'Timex', 8.79, 7.50, 6.40, 0.08, 'Adjustable black 18mm resin strap fits up to 8-inch wrist circumference. 100-hour chronograph with 30-lap memory; 24-hour countdown timer. 3 daily, weekday or weekend alarms; 24-hour military time mode; 2 time zones; day, date & month calendar. Gray & black 38mm resin case with acrylic lens; gray digital display; Indiglo light-up watch dial. Water resistant to 100m (330ft): in general, suitable for swimming and snorkeling, but not diving.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('GRV Smart Watch for iOS and Android Phones', 'accessory', 'watch', 24.59, 4.1, 'B09J8SKX9G', 'https://m.media-amazon.com/images/I/51jzaIqrKNL._AC_SX569_.jpg', 'GRV', 25.00, 3.50, 1.70, 0.03, 'Accurate Fitness Tracker with 9 Sport Modes. This fitness tracker watch can accurately track calories burned, steps taken, sleep quality. 9 sports modes are optional, including various outdoor and indoor activities, allow you to get the real-time stats during your workouts on the watch. You can also connect it to smartphone''s GPS to track all your workout routes and distance traveled during exercise.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Amazfit Band 5 Activity Fitness Tracker with Alexa Built-in', 'accessory', 'watch', 31.99, 4.1, 'S2005OV1N', 'https://m.media-amazon.com/images/I/51ja6ds+pML._AC_SX679_.jpg', 'Amazfit', 1.27, 1.91, 4.72, 0.02, 'AMAZON ALEXA BUILT-IN: Talk to Amazon Alexa on your Amazfit Band 5. Ask questions, get translations, set alarms, and timers, create shopping lists, check the weather, control your smart home devices, and more.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Casio F91W-1 Classic Resin Strap Digital Sport Watch', 'accessory', 'watch', 15.84, 4.6, 'B000GAWSDG', 'https://m.media-amazon.com/images/I/51Nk5SEBARL._AC_SY879_.jpg', 'Casio', 9.00, 34.00, 39.00, 0.05, 'LED light, Stopwatch, Daily Alarm. Auto-calendar, 12/24 Hour Format. Approx. battery life: 7 years on CR2016. Water Resistant - Do not submerge in water, item is not waterproof, not meant for showering/bathing or swimming.');
--Hats
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Ron Jon UV Protection Rainbow Bucket Hat', 'accessory', 'hat', 24.99, 5.0, '1881012900001010', 'https://www.ronjonsurfshop.com/assets/ea/69/ea69a4a5-dd8c-4cf9-aea1-5d64d25fb1c3/d494x494-18810129000-ron-jon-rainbow-bucket-hat-front.jpg', 'Ron Jon Surf Shop', 14.50, 22.40, 22.40, 0.08, 'Show your love for the beach with colors as gorgeous as the beach at dusk.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('Outdoor Summer Boonie Hat for any Outdoor Activity', 'accessory', 'hat', 14.99, 3.7, '1132004000090230', 'https://i5.walmartimages.com/asr/7131e4aa-21b5-4a46-9edd-3b67c135a02d_1.a4668bb2484065b442d57eb5f04508be.jpeg?odnHeight=612&odnWidth=612&odnBg=FFFFFF', 'manufacturer', 13.17, 24.72, 24.72, 0.10, 'OUTDOOR BOONIE HAT : Introducing a super stylish boonie hat for all ages resembling a sleek military style cap. Each hat features an adjustable string / chin strap to provide additional security and comfort even in high level motion activity. The floppy look gives a sporty and rugged look for you to take on the great outdoors in style!');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('NEW HERBIE! HUSKER BASEBALL HERBIE HERO CAP', 'accessory', 'hat', 29.99, 0.0, 'HT-G7152', 'https://www.bestofbigred.com/resize/Shared/Images/Product/NEW-HERBIE-Husker-Baseball-Herbie-Hero-Cap/HT-G7152.jpg?bw=1000&w=1000&bh=1000&h=1000', 'manufacturer', 13.48, 20.44, 16.58, 00.15, 'Scarlet EZA adjustable snapback hat. Features Herbie Husker with a baseball bat. 100% cotton twill. OSFA.');
INSERT INTO Product (name, broadType, clothingType, price, numStars, sku, image, manufacturer, height, length, width, weight, description) VALUES ('New York Yankees New Era 2023 Spring Training Fitted Hat', 'accessory', 'hat', 29.99, 4.2, '4991352', 'https://fanatics.frgimages.com/new-york-yankees/mens-new-era-navy-new-york-yankees-2023-spring-training-59fifty-fitted-hat_ss5_p-4991352+pv-1+u-oajxizgg1fbrgzw7afsx+v-umk2jzisxtosb9xi2pon.jpg?_hv=2&w=900', 'manufacturer', 15.50, 21.00, 14.50, 00.12, 'Represent your favorite team with the same style the players wear. This New York Yankees 2023 Spring Training 59FIFTY Fitted Hat from New Era will make you feel like you''re taking the field with your favorite MLB stars every time you put it on. The sleek New York Yankees graphics are sure to help you stand out in any ballpark you step in this season.');

-- INSERT INTO Sale (name, startDate, endDate, dollarAmount) VALUES ('2017 Christmas Socks Sale', '2017/12/01', '2017/12/31', 5.00);
-- INSERT INTO Sale (name, startDate, endDate, percentage) VALUES ('Four and a half years', '2021/01/01', '2025/07/01', 15);
-- INSERT INTO Sale (name, startDate, endDate, dollarAmount) VALUES ('2023 April Fools!', '2023/04/01', '2024/04/01', 4.2);
-- INSERT INTO Sale (name, startDate, endDate, percentage) VALUES ('250th Independence Day Sale', '2026/06/04', '2026/07/04', 40);

--INSERT INTO SaleProduct (saleId, productId) VALUES ((SELECT saleId FROM Sale WHERE name = ''), (SELECT productId FROM Product WHERE name = ''));
--INSERT INTO SaleProduct (saleId, productId) VALUES ((SELECT saleId FROM Sale WHERE name = ''), (SELECT productId FROM Product WHERE name = ''));
--INSERT INTO SaleProduct (saleId, productId) VALUES ((SELECT saleId FROM Sale WHERE name = ''), (SELECT productId FROM Product WHERE name = ''));
--INSERT INTO SaleProduct (saleId, productId) VALUES ((SELECT saleId FROM Sale WHERE name = ''), (SELECT productId FROM Product WHERE name = ''));

INSERT INTO CartProduct (cartId, productId, quantity) VALUES (10, 1, 2);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (10, 4, 2);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (10, 9, 2);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (6, 3, 1);
INSERT INTO CartProduct (cartId, productId, quantity) VALUES (7, 6, 6);
