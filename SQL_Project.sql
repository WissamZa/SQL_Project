# DDL - Create
create database if not exists store;
use store;

create table if not exists countries
(
    code           int primary key,
    name           varchar(20) unique,
    continent_name varchar(20) not null
);

create table if not exists users
(
    id            int primary key,
    full_name     varchar(20),
    email         varchar(30),
    gender        char(1),
    date_of_birth varchar(15),
    created_at    datetime default CURRENT_TIMESTAMP,
    country_code  int ,

    unique (email),
    check (gender = 'm' or gender = 'f'),
    foreign key (country_code) references countries(code)
);

create table if not exists orders
(
    id         int primary key,
    user_id    int,
    status     varchar(6) check ( status = 'start' or status = 'finish' ),
    created_at datetime default CURRENT_TIMESTAMP,

    foreign key (user_id) references users(id)

);

create table if not exists products
(
    id         int primary key,
    name       varchar(10) not null,
    price      int default 0,
    status     varchar(10) check ( status = 'valid' or status = 'expired' ),
    created_at datetime default CURRENT_TIMESTAMP
);

create table if not exists order_products
(
    order_id   int primary key,
    product_id int,
    quantity   int default 0,

    foreign key (order_id) references orders(id),
    foreign key (product_id) references products(id)


);

insert into countries values (1,'Saudi Arabia','Asia');
insert into users values (1,'Wissam Zaidi','bargsaudi@hotmail.com','m','30/03/1995',DEFAULT,1);
insert into orders values (1,1,'start',DEFAULT);
insert into products values (001,'Galaxy S21',2599,'valid',DEFAULT);
insert into products values (002,'Galaxy S22',3499,'valid',DEFAULT);
insert into order_products values (1,002,1);

update countries
set continent_name = 'Jeddah'
where continent_name = 'Asia';

delete from products where name = 'Galaxy S21';

