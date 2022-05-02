/*------------Address Book Service-------------*/

/*-----------UC1-------------*/
create database address_book;
use address_book;

/*-----------UC2-------------*/
create table address_book(
	id int not null auto_increment,
    fname varchar(50) not null,
    lname varchar(50) not null,
    address varchar(100) not null,
    city varchar(50) not null,
    state varchar(50) not null,
    zip int not null,
    phoneno long not null,
    email varchar(50) not null,
    primary key(id)
);

select * from address_book;

/*-----------UC3-------------*/
insert into address_book(fname,lname,address,city,state,zip,phoneno,email) 
values('Koda', 'Ashok','Visakhapatnam','Vizag','AP',531163,7396382672,'test@gmail.com');
insert into address_book(fname,lname,address,city,state,zip,phoneno,email) 
values('Myla', 'Gireish','Visakhapatnam','Vizag','AP',521162,8154785412,'test1@gmail.com');
insert into address_book(fname,lname,address,city,state,zip,phoneno,email)
values('Vasu', 'Navin','Chennai','Pormandal','TN',622012,9154897702,'test3@gmail.com');
insert into address_book(fname,lname,address,city,state,zip,phoneno,email)
values('Charan', 'Kumar','Goa','Goa','GA',11223344,7896541230,'test4@gmail.com');

select * from address_book;

/*-----------UC4-------------*/
update address_book set fname = 'Polamerseti', lname = 'Sanju' where id = 4;
select * from address_book;

/*-----------UC5-------------*/
delete from address_book where id = 3;

/*-----------UC6-------------*/
select * from address_book where state = 'AP' or city = 'vizag';

/*-----------UC7-------------*/
SELECT  city, state, COUNT(*) from address_book where city = 'vizag' AND state = 'AP';

/*-----------UC8-------------*/
select * from address_book where state = 'AP' order by fname ASC;
select * from address_book where state = 'AP' order by fname DESC;

/*-----------UC9-------------*/
alter table address_book
add family varchar(5),
add friends varchar(5),
add profession varchar(5);

select * from address_book;

update address_book set family = 'Y' where id = 1;
update address_book set family = 'Y' where id = 2;
update address_book set friends = 'Y' where id = 4;

select * from address_book where fname = 'Koda' and family = 'Y';
select * from address_book where family = 'Y';

/*-----------UC10-------------*/
select family, friends, profession, count(*) from address_book group by
family = 'Y', friends = 'Y', profession = 'Y';

/*-----------UC11-------------*/
insert into address_book(fname,lname,address,city,state,zip,phoneno,email,family,friends,profession) 
values('Koda', 'Ashok','Visakhapatnam','Vizag','AP',531163,7396382672,'test@gmail.com','Y','Y','');

select * from address_book;

/*-----------UC12-------------*/
create table contact(
	id int not null auto_increment primary key,
    fname varchar(50) not null,
    lname varchar(50),
    phoneno long,
    email varchar(50)
);

insert into contact(fname,lname,phoneno,email) values
('K','Ashok',7396382672,'koda121@gmail.com'),
('M','Pooja',8123654125,'pooja123@gmail.com'),
('M','Bargavi',9949087859,'bargavi112@gmail.com'),
('V','Bhanu',7894561230,'bhanu746@gmail.com'),
('R','Kishore',8855214578,'kishore00@gmail.com');

create table address(
	id int not null auto_increment primary key,
    city varchar(50),
    state varchar(50),
    zip int,
    contact_id int not null,
    foreign key(contact_id) references contact(id)
);

insert into address(city,state,zip,contact_id) values
('Visakhapatnam','AP','531163',1),
('Visakhapatnam','AP','540023',2),
('Hyderabad','TS','500011',3),
('Secendrabad','TS','500011',4),
('Palaknama','TN','400123',5);

select * from address;
select * from address where state = 'AP';

insert into contact(fname,lname,phoneno,email) values
('K','Harish',9154897701,'harish000@gmail.com');
insert into address(city,state,zip,contact_id) values
('Pulihora','TN','400123',6);

select contact.id,contact.lname, address.city,address.state,address.zip
from contact
inner join address
on contact.id=address.id;