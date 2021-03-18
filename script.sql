CREATE SCHEMA `flower`;
USE `flower`;

CREATE TABLE IF NOT EXISTS `flower`.`orderstatuses` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `flower`.`templatecategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `flower`.`productcategories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE IF NOT EXISTS `flower`.`accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(100) NOT NULL,
  `passwordHash` VARCHAR(100) NULL DEFAULT NULL,
  `salt` VARCHAR(100) NULL DEFAULT NULL,
  `role` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`));
CREATE UNIQUE INDEX `login` ON `flower`.`accounts` (`login` ASC) VISIBLE;

CREATE TABLE IF NOT EXISTS `flower`.`stores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `firstPhone` VARCHAR(100) NOT NULL,
  `secondPhone` VARCHAR(100) NULL DEFAULT NULL,
  `picture` LONGBLOB NULL DEFAULT NULL,
  `accountId` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (accountId) REFERENCES accounts(id) ON DELETE CASCADE);
  
  CREATE TABLE IF NOT EXISTS `flower`.`shops` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(1000) NOT NULL,
  `storeId` INT NOT NULL,
  `accountId` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (accountId) REFERENCES accounts(id) on delete cascade,
  FOREIGN KEY (storeId) REFERENCES stores(id) on delete cascade);

CREATE TABLE IF NOT EXISTS `flower`.`products` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `picture` LONGBLOB NULL DEFAULT NULL,
  `cost` DOUBLE NOT NULL,
  `storeId` INT NOT NULL,
  `productCategoryId` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (storeId) REFERENCES stores(id) on delete cascade,
  FOREIGN KEY (productCategoryId) REFERENCES productcategories(id) on delete cascade);

CREATE TABLE IF NOT EXISTS `flower`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(100) NULL DEFAULT NULL,
  `name` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(100) NOT NULL,
  `picture` LONGBLOB NULL DEFAULT NULL,
  `accountId` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (accountId) REFERENCES accounts(id) on delete cascade);

CREATE TABLE IF NOT EXISTS `flower`.`bouquets` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `cost` DOUBLE NOT NULL,
  `storeId` INT NULL DEFAULT NULL,
  `userId` INT NOT NULL,
   PRIMARY KEY (`id`),
   FOREIGN KEY (storeId) REFERENCES stores(id) on delete set null,
   FOREIGN KEY (userId) REFERENCES users(id) on delete cascade);

CREATE TABLE IF NOT EXISTS `flower`.`bouquetproducts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `productId` INT NOT NULL,
  `bouquetId` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY(productId) REFERENCES products(id) on delete cascade,
  FOREIGN KEY (bouquetId) REFERENCES bouquets(id) on delete cascade);

CREATE TABLE IF NOT EXISTS `flower`.`templates` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `templateCategoryId` INT NOT NULL,
  `storeId` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (storeId) REFERENCES stores(id) on delete cascade,
  FOREIGN KEY (templateCategoryId) REFERENCES templateCategories(id) on delete cascade);

CREATE TABLE IF NOT EXISTS `flower`.`orders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `start` DATETIME NOT NULL,
  `finish` DATETIME NOT NULL,
  `isRandom` TINYINT(1) NULL DEFAULT '0',
  `orderStatusId` INT NULL DEFAULT NULL,
  `bouquetId` INT NULL DEFAULT NULL,
  `templateId` INT NULL DEFAULT NULL,
  `userId` INT NOT NULL,
  `cost` DOUBLE NULL DEFAULT NULL,
  `shopId` INT NULL DEFAULT NULL,
  `card` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (shopId) REFERENCES shops(id) on delete set null,
  FOREIGN KEY (userId) REFERENCES users(id) on delete cascade,
  FOREIGN KEY (orderStatusId) REFERENCES orderStatuses(id) on delete set null,
  FOREIGN KEY (bouquetId) REFERENCES bouquets(id) on delete set null,
  FOREIGN KEY (templateId) REFERENCES templates(id) on delete set null);

INSERT INTO `flower`.`accounts` (`login`, `passwordHash`, `role`) VALUES ('buket_stolici', 'qwerty', 'store');
INSERT INTO `flower`.`accounts` (`login`, `passwordHash`, `role`) VALUES ('magazin_21', 'qwerty', 'shop');
INSERT INTO `flower`.`accounts` (`login`, `passwordHash`, `role`) VALUES ('zavoyskaya_2105', 'qwerty', 'user');

INSERT INTO `flower`.`users` (`surname`, `name`, `phone`, `accountId`) VALUES ('Завойская', 'Рината', '8(927)022-08-55', '3');
INSERT INTO `flower`.`users` (`surname`, `name`, `phone`, `accountId`) VALUES ('Ермеева', 'Руфина', '8(900)232-55-52', '3');

INSERT INTO `flower`.`stores` (`name`, `firstPhone`, `secondPhone`, `accountId`) VALUES ('Букет столицы', '8(900)900-00-90', '8(840)700-20-20', '1');
INSERT INTO `flower`.`stores` (`name`, `firstPhone`, `secondPhone`, `accountId`) VALUES ('ЦветоBAZA', '8(926)705-05-05', '', '1');

INSERT INTO `flower`.`shops` (`address`, `storeId`, `accountId`) VALUES ('г.Казань, Мавлекаева 67Б', '1', '2');
INSERT INTO `flower`.`shops` (`address`, `storeId`, `accountId`) VALUES ('г.Казань, Солнышко 20', '2', '2');

INSERT INTO `flower`.`productcategories` (`name`) VALUES ('Цветок');
INSERT INTO `flower`.`productcategories` (`name`) VALUES ('Зелень');
INSERT INTO `flower`.`productcategories` (`name`) VALUES ('Украшение');

INSERT INTO `flower`.`products` (`name`, `cost`, `storeId`, `productcategoryId`) VALUES ('Роза', '128.10', '1', '1');
INSERT INTO `flower`.`products` (`name`, `cost`, `storeId`, `productcategoryId`) VALUES ('Лилия', '200.90', '1', '1');
INSERT INTO `flower`.`products` (`name`, `cost`, `storeId`, `productcategoryId`) VALUES ('Пион', '250.50', '1', '1');
INSERT INTO `flower`.`products` (`name`, `cost`, `storeId`, `productcategoryId`) VALUES ('Лаванда', '15.00', '2', '1');
INSERT INTO `flower`.`products` (`name`, `cost`, `storeId`, `productcategoryId`) VALUES ('Лента красная', '23.70', '3', '1');
INSERT INTO `flower`.`products` (`name`, `cost`, `storeId`, `productcategoryId`) VALUES ('Лаванда', '11.50', '2', '2');

INSERT INTO `flower`.`orderstatuses` (`name`) VALUES ('Ожидание');
INSERT INTO `flower`.`orderstatuses` (`name`) VALUES ('Изготовление');
INSERT INTO `flower`.`orderstatuses` (`name`) VALUES ('Готово');
INSERT INTO `flower`.`orderstatuses` (`name`) VALUES ('Выдано');

INSERT INTO `flower`.`bouquets` (`name`, `cost`, `storeId`, `userId`) VALUES ('Для Руфинки-мальвинки', '500.90', '1', '1');

INSERT INTO `flower`.`bouquetproducts` (`productId`, `bouquetId`) VALUES ('1', '1');
INSERT INTO `flower`.`bouquetproducts` (`productId`, `bouquetId`) VALUES ('2', '1');

INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('День рождение');
INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('Похороны');
INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('Свадьба');
INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('8 марта');

INSERT INTO `flower`.`templates` (`name`, `templateCategoryId`, `storeId`) VALUES ('Для самых любимых', '4', '1');
INSERT INTO `flower`.`templates` (`name`, `templateCategoryId`, `storeId`) VALUES ('Радость', '1', '1');

INSERT INTO `flower`.`orders` (`start`, `finish`, `bouquetId`, `userId` , `shopId`  , `orderStatusId` , `cost` ) VALUES ('19.12.2020', '21.12.2020', '1', '1', '1', '1', 500.9);






