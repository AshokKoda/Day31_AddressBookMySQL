/*------------UC1------------------*/
show databases;
use addressbook_system;

/*------------UC2------------------*/
create table addressbook (
	id int not null auto_increment,
	firstname varchar(50) not null,
	lastname varchar(50) not null,
	address varchar(100),
	city varchar(50) not null,
	state varchar(50) not null,
	zip varchar(6) not null,
	phoneno varchar(12),
	email varchar(50),
    PRIMARY KEY (id)
);
select * from addressbook;

/*------------UC3------------------*/
insert into addressBook(firstname, lastname, address, city, state, zip, phoneno, email)
values('Koda','Ashok','#20 Abc Apartments', 'Vizag','AP','531163','9012345670','ashok@gmail.com');
insert into addressBook(firstname, lastname, address, city, state, zip, phoneno, email)
values('Harish','Kumar','#30 Dynamic Apartments', 'Warangal','TN','560026','8066456780','harish@gmail.com');
insert into addressBook(firstname, lastname, address, city, state, zip, phoneno, email)	
values('Tejas','Singh','#12 Vrindavan Apartments', 'Vizag','AP','403201','9874320023','tejas@gmail.com');
insert into addressBook(firstname, lastname, address, city, state, zip, phoneno, email)	
values('Abhijeet','Kumar','#65 Lake View Apartments', 'Warangal','TN','340340','7123456789','abhijeet@gmail.com');
insert into addressBook(firstname, lastname, address, city, state, zip, phoneno, email)	
values('Nilesh','Dev','#11 SLV Apartments', 'Jaipur','Rajasthan','340321','812345676','nilesh@gmail.com');

select * from addressbook;

/*------------UC4------------------*/
update addressbook set phoneno = '7396382673' where id = 1;

/*------------UC5------------------*/
delete from addressbook where id = 5;

/*------------UC6------------------*/
select * from addressbook where state = 'AP';
select * from addressbook where city = 'Vizag';

/*------------UC7------------------*/
select state, count(state) from addressbook group by state;
select city, count(city) from addressbook group by city;

/*------------UC8------------------*/
select * from addressbook where city = 'Vizag' order by firstname ASC;

/*------------UC9------------------*/
alter table addressbook
add column addressbookname varchar(50),
add column addressbooktype varchar(50);

select * from addressbook;

update addressbook set addressbookname = 'Book1' where id = 1;
update addressbook set addressbookname = 'Book2' where id = 2;
update addressbook set addressbookname = 'Book3' where id = 3;
update addressbook set addressbookname = 'Book1' where id = 4;
update addressbook set addressbookname = 'Book2' where id = 5;

update addressbook set addressbooktype = 'Family' where id = 1;
update addressbook set addressbooktype = 'Friend' where id = 2;
update addressbook set addressbooktype = 'Family' where id = 3;
update addressbook set addressbooktype = 'Friend' where id = 4;
update addressbook set addressbooktype = 'Family' where id = 5;

/*------------UC10------------------*/
select addressbooktype, count(addressbooktype) from addressbook group by addressbooktype;

/*------------UC11------------------*/
select * from addressbook;

create table addressbooknames(
	book_id int not null primary key auto_increment,
    bookname varchar(50) not null,
    addressbook_id int not null,
    foreign key(addressbook_id) references addressbook(id)
    on delete cascade
    on update cascade
);
select * from addressbooknames;

insert into addressbooknames(bookname, addressbook_id)values('FamilyAddressBook', 1);
insert into addressbooknames(bookname, addressbook_id)values('FriendsAddressBook', 1);

insert into addressbooknames(bookname, addressbook_id)values('FamilyAddressBook', 2);
insert into addressbooknames(bookname, addressbook_id)values('FriendsAddressBook', 3);
insert into addressbooknames(bookname, addressbook_id)values('ProfessionAddressBook', 4);
insert into addressbooknames(bookname, addressbook_id)values('ProfessionAddressBook', 5);

insert into addressbooknames(bookname, addressbook_id)values('ProfessionAddressBook', 2);

select * from addressbook;
alter table addressbook drop column addressbookname;

select a.id,a.firstname,a.lastname,a.address,a.city,a.state,a.zip,a.phoneno,a.email,ab.bookname,ab.addressbook_id from addressbook a, addressbooknames ab 
where a.id = ab.addressbook_id;