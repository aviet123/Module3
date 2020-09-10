create table khoa(
makhoa char(10) primary key,
tenkhoa char(10),
dienthoai char(10) 
);
create table giangvien(
magv int primary key,
hotengv char(30),
luong decimal(5,2),
makhoa char(10)
);
create table sinhvien(
masv int primary key,
hotensv char(30),
makhoa char(10),
namsinh int,
quequan char(30)
);
create table detai(
madt char(10) primary key,
tendt char(30),
kinhphi int,
NoiThucTap char(30)
);

create table huongdan (
masv int,
madt char(10),
magv int,
ketqua decimal(5,2)
); 

alter table khoa 
modify tenkhoa char(30);

alter table giangvien
add foreign key(makhoa) references khoa(makhoa);
alter table sinhvien 
add foreign key(makhoa) references khoa(makhoa);
alter table huongdan
add foreign key(masv) references sinhvien(masv);
alter table detai 
drop column magv;

INSERT INTO khoa VALUES('Geo','Dia ly va QLTN',3855413),('Math','Toan',3855411),('Bio','Cong nghe Sinh hoc',3855412);
INSERT INTO giangvien VALUES(11,'Thanh Binh',700,'Geo'),(12,'Thu Huong',500,'Math'),(13,'Chu Vinh',650,'Geo'),(14,'Le Thi Ly',500,'Bio'),(15,'Tran Son',900,'Math');
INSERT INTO sinhvien VALUES(1,'Le Van Son','Bio',1990,'Nghe An'),(2,'Nguyen Thi Mai','Geo',1990,'Thanh Hoa'),(3,'Bui Xuan Duc','Math',1992,'Ha Noi'),(4,'Nguyen Van Tung','Bio',null,'Ha Tinh'),(5,'Le Khanh Linh','Bio',1989,'Ha Nam'),(6,'Tran Khac Trong','Geo',1991,'Thanh Hoa'),(7,'Le Thi Van','Math',null,'null'),(8,'Hoang Van Duc','Bio',1992,'Nghe An');
INSERT INTO detai VALUES('Dt01','GIS',100,'Nghe An'),('Dt02','ARC GIS',500,'Nam Dinh'),('Dt03','Spatial DB',100, 'Ha Tinh'),('Dt04','MAP',300,'Quang Binh' );
INSERT INTO huongdan VALUES(1,'Dt01',13,8),(2,'Dt03',14,0),(3,'Dt03',12,10),(5,'Dt04',14,7),(6,'Dt01',13,Null),(7,'Dt04',11,10),(8,'Dt03',15,6);

select magv, hotengv, makhoa from giangvien;

select gv.magv, gv.hotengv, gv.makhoa, khoa.tenkhoa from giangvien as gv join khoa on gv.makhoa = khoa.makhoa
where khoa.tenkhoa = 'Dia ly va QLTN';

select count(masv) from sinhvien join khoa on sinhvien.makhoa = khoa.makhoa 
where khoa.tenkhoa = 'Cong nghe Sinh hoc' group by hotensv;

select sinhvien.masv, sinhvien.hotensv, sinhvien.namsinh, khoa.tenkhoa from sinhvien 
join khoa on sinhvien.makhoa = khoa.makhoa 
where khoa.tenkhoa = 'TOAN';

select count(magv) as soluong from giangvien join khoa on giangvien.makhoa = khoa.makhoa
where khoa.tenkhoa = 'TOAN';

select sv.masv, sv.hotensv, sv.namsinh, sv.quequan from sinhvien as sv left join huongdan on huongdan.masv = sv.masv
where huongdan.masv is null ;

select gv.makhoa, khoa.tenkhoa, count(gv.makhoa) as soluonggv from giangvien as gv 
join khoa on gv.makhoa = khoa.makhoa group by khoa.tenkhoa;

select khoa.dienthoai, sinhvien.hotensv from sinhvien join khoa on sinhvien.makhoa = khoa.makhoa
where sinhvien.hotensv = 'Le Van Son';

select detai.madt, detai.tendt from detai 
join huongdan on detai.madt = huongdan.madt
join giangvien on huongdan.magv = giangvien.magv
where giangvien.hotengv = 'Tran Son';

select detai.tendt from detai left join huongdan on detai.madt = huongdan.madt
where huongdan.madt is null;

select gv.magv, gv.hotengv, khoa.tenkhoa, count(sinhvien.masv) as soluongsv from giangvien as gv
join sinhvien on gv.makhoa = sinhvien.makhoa 
join khoa on sinhvien.makhoa = khoa.makhoa 
group by gv.hotengv
having soluongsv > 3;

select detai.madt, detai.tendt, detai.kinhphi from detai order by detai.kinhphi desc limit 1;

select  detai.madt, detai.tendt, count(hd.madt) soluongsv from detai join huongdan as hd on detai.madt = hd.madt
group by hd.madt
having soluongsv > 2;

select sv.masv, sv.hotensv, hd.ketqua from sinhvien as sv 
join huongdan as hd on sv.masv = hd.masv 
join khoa on sv.makhoa = khoa.makhoa
where khoa.tenkhoa = 'Cong nghe Sinh hoc';

select khoa.tenkhoa, count(sv.masv) as soluongsv from khoa join sinhvien as sv on khoa.makhoa = sv.makhoa 
group by khoa.tenkhoa;

select sv.*, detai.NoiThucTap from sinhvien as sv join detai on sv.quequan = detai.NoiThucTap
where sv.quequan = detai.NoiThucTap;

select sv.*, huongdan.ketqua from sinhvien as sv join huongdan on huongdan.masv = sv.masv
where huongdan.ketqua is null ;

select sv.masv, sv.hotensv, huongdan.ketqua from sinhvien as sv join huongdan on sv.masv = huongdan.masv 
where huongdan.ketqua = 0;








