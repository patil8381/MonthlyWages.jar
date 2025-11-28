#login sing root user 
#the following sql statement can throw error as user may not exist 
#the drop user if exists sql statement works above verison 5.7
drop user 'ajax_prototype'@'localhost';
create user 'ajax_prototype'@'localhost' identified by 'ajax_prototype';
drop database if exists ajax_prototype_db;
create database ajax_prototype_db;
grant all privileges on ajax_prototype_db.* to 'ajax_prototype'@'localhost' with grant option;
use ajax_prototype_db;

create table hobby
(
code int primary key auto_increment,
hobby char(50) not null unique
);

insert into hobby (hobby) values
('Reading'),
('Writing'),
('Music'),
('Cooking'),
('Swimming'),
('Trekking');

create table city
(
code int primary key auto_increment,
name char(35) not null unique
);

insert into city (name) values
('Ujjain'),
('Indore'),
('Dewas'),
('Agar'),
('Nagda'),
('Mahidpur'),
('Bhopal');

create table student
(
roll_number int primary key auto_increment,
first_name char(35) not null,
last_name char(35) not null,
gender char(1) not null,
date_of_birth date not null,
is_indian bool not null,
income_of_family decimal(12,2) not null,
city_code int not null,
foreign key (city_code) references city(code)
);

create table student_address
(
roll_number int not null,
address varchar(1000) not null,
foreign key (roll_number) references student(roll_number)
);

create table student_hobby_mapping
(
roll_number int not null,
hobby_code int not null,
primary key(roll_number,hobby_code),
foreign key (roll_number) references student(roll_number),
foreign key (hobby_code) references hobby(code)
);
