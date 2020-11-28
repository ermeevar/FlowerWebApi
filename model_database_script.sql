create database flower;

use flower;
create table stores
(
	id int auto_increment primary key,
	name varchar(100) not null,
	description longtext null,
	firstPhone varchar(100) not null,
	secondPhone varchar(100) null,
	picture longblob null
);

create table shops
(
	id int auto_increment primary key,
    address varchar(1000) not null,
    storeId int not null,
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