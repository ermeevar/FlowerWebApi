/*database constructer*/
create database flower;
use flower;

/*tables constructer*/
create table accounts
(
	id int auto_increment primary key,
    login varchar(100) unique not null,
    password varchar(100) not null,
    role varchar(100) not null
);

create table stores
(
	id int auto_increment primary key,
	name varchar(100) not null,
	description longtext null,
	firstPhone varchar(100) not null,
	secondPhone varchar(100) null,
	picture longblob null,
    accountId int not null,
    foreign key (accountId) references accounts(id) on delete cascade
);

create table shops
(
	id int auto_increment primary key,
    address varchar(1000) not null,
    storeId int not null,
    accountId int not null,
    foreign key (accountId) references accounts(id) on delete cascade,
    foreign key (storeId) references stores(id) on delete cascade
);

create table categories
(
	id int auto_increment primary key,
    name varchar(100) not null
);

create table storeProducts
(
	id int auto_increment primary key,
    name varchar(100) not null,
    picture longblob null,
    cost double not null,
    storeId int not null,
    categoryId int null,
    foreign key (storeId) references stores(id) on delete cascade,
    foreign key (categoryId) references categories(id) on delete cascade
);

create table shopProducts
(
	id int auto_increment primary key,
    isEmpty bool default true,
    storeProductId int not null,
    shopId int not null,
    foreign key (storeProductId) references storeProducts(id) on delete cascade,
    foreign key (shopId) references shops(id) on delete cascade
);

create table users
(
	id int auto_increment primary key,
    surname varchar(100) null,
    name varchar(100) not null,
    phone varchar(100) not null,
    picture longblob null,
    accountId int not null,
    foreign key (accountId) references accounts(id) on delete cascade
);

create table bouquets
(
	id int auto_increment primary key,
    name varchar(100) null,
    cost double not null,
    storeId int null,
    userId int not null,
    foreign key (storeId) references stores(id) on delete set null,
    foreign key (userId) references users(id) on delete cascade
);

create table bouquetProducts
(
	id int auto_increment primary key,
    shopProductId int not null,
    bouquetId int not null,
    foreign key (shopProductId) references shopProducts(id) on delete cascade,
    foreign key (bouquetId) references bouquets(id) on delete cascade
);

create table templateCategories
(
	id int auto_increment primary key,
    name varchar(100) not null
);

create table templates
(
	id int auto_increment primary key,
    name varchar(100) not null,
    templateCategoryId int not null,
    storeId int not null,
    foreign key (storeId) references stores(id) on delete cascade,
    foreign key (templateCategoryId) references templateCategories(id) on delete cascade
);

create table orderStatuses
(
	id int auto_increment primary key,
    name varchar(100) not null
);

create table orders
(
	id int auto_increment primary key,
    start datetime not null,
    finish datetime not null,
    isRandom bool default false,
    orderStatusId int null,
    bouquetId int null,
    templateId int null,
	userId int not null,
    cost double,
	shopId int null,
    foreign key (shopId) references shops(id) on delete set null,
    foreign key (userId) references users(id) on delete cascade,
    foreign key (orderStatusId) references orderStatuses(id) on delete set null,
    foreign key (bouquetId) references bouquets(id) on delete set null,
    foreign key (templateId) references templates(id) on delete set null
);

/*data*/
INSERT INTO `flower`.`accounts` (`login`, `password`, `role`) VALUES ('buket_stolici', 'qwerty', 'store');
INSERT INTO `flower`.`accounts` (`login`, `password`, `role`) VALUES ('magazin_21', 'qwerty', 'shop');
INSERT INTO `flower`.`accounts` (`login`, `password`, `role`) VALUES ('zavoyskaya_2105', 'qwerty', 'user');

INSERT INTO `flower`.`users` (`surname`, `name`, `phone`, `accountId`) VALUES ('Завойская', 'Рината', '8(927)022-08-55', '3');
INSERT INTO `flower`.`users` (`surname`, `name`, `phone`, `accountId`) VALUES ('Ермеева', 'Руфина', '8(900)232-55-52', '3');

INSERT INTO `flower`.`stores` (`name`, `firstPhone`, `secondPhone`, `accountId`) VALUES ('Букет столицы', '8(900)900-00-90', '8(840)700-20-20', '1');
INSERT INTO `flower`.`stores` (`name`, `firstPhone`, `secondPhone`, `accountId`) VALUES ('ЦветоBAZA', '8(926)705-05-05', '', '1');

INSERT INTO `flower`.`shops` (`address`, `storeId`, `accountId`) VALUES ('г.Казань, Мавлекаева 67Б', '1', '2');
INSERT INTO `flower`.`shops` (`address`, `storeId`, `accountId`) VALUES ('г.Казань, Солнышко 20', '2', '2');

INSERT INTO `flower`.`categories` (`name`) VALUES ('Цветок');
INSERT INTO `flower`.`categories` (`name`) VALUES ('Зелень');
INSERT INTO `flower`.`categories` (`name`) VALUES ('Открытка');
INSERT INTO `flower`.`categories` (`name`) VALUES ('Украшение');

INSERT INTO `flower`.`storeproducts` (`name`, `cost`, `storeId`, `categoryId`) VALUES ('Роза', '128.10', '1', '1');
INSERT INTO `flower`.`storeproducts` (`name`, `cost`, `storeId`, `categoryId`) VALUES ('Лилия', '200.90', '1', '1');
INSERT INTO `flower`.`storeproducts` (`name`, `cost`, `storeId`, `categoryId`) VALUES ('Лаванда', '11.50', '2', '2');

INSERT INTO `flower`.`shopproducts` (`isEmpty`, `storeProductId`, `shopId`) VALUES ('0', '2', '2');
INSERT INTO `flower`.`shopproducts` (`isEmpty`, `storeProductId`, `shopId`) VALUES ('0', '1', '1');
INSERT INTO `flower`.`shopproducts` (`isEmpty`, `storeProductId`, `shopId`) VALUES ('0', '2', '1');

INSERT INTO `flower`.`orderstatuses` (`name`) VALUES ('Ожидание');
INSERT INTO `flower`.`orderstatuses` (`name`) VALUES ('Изготовление');
INSERT INTO `flower`.`orderstatuses` (`name`) VALUES ('Готово');

INSERT INTO `flower`.`bouquets` (`name`, `cost`, `storeId`, `userId`) VALUES ('Для Руфинки-мальвинки', '500.90', '1', '1');

INSERT INTO `flower`.`bouquetproducts` (`shopProductId`, `bouquetId`) VALUES ('2', '1');
INSERT INTO `flower`.`bouquetproducts` (`shopProductId`, `bouquetId`) VALUES ('3', '1');

INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('День рождение');
INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('Похороны');
INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('Свадьба');
INSERT INTO `flower`.`templatecategories` (`name`) VALUES ('8 марта');

INSERT INTO `flower`.`templates` (`name`, `templateCategoryId`, `storeId`) VALUES ('Для самых любимых', '4', '1');
INSERT INTO `flower`.`templates` (`name`, `templateCategoryId`, `storeId`) VALUES ('Радость', '1', '1');

INSERT INTO `flower`.`orders` (`start`, `finish`, `bouquetId`, `userId` , `shopId`  , `orderStatusId` , `cost` ) VALUES ('19.12.2020', '21.12.2020', '1', '1', '1', '1', 500.9);





