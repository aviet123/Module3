use classdata;
drop table classes;
create table classes(
ID int(11) not null,
TEN varchar(50) not null,
TUOI int(2) not null,
KHOAHOC varchar(50) not null,
SOTIEN int not null
);
insert into classes values(1,'hoang',21,'cntt',400000);
insert into classes values(2,'viet',19,'cntt',320000);
insert into classes values(3,'thanh',18,'cntt',400000);
insert into classes values(4,'nhan',19,'cntt',450000);
insert into classes values(5,'huong',20,'cntt',500000);
insert into classes values(5,'huong',20,'cntt',200000);

select TEN from classes group by TEN;

