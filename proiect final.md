create database Club_de_fotbal;
create table Date_copii(
ID int unsigned auto_increment primary key,
Nume varchar(20) not null,
Prenume varchar(20) not null,
Data_nasterii date not null
);

insert into Date_copii (Nume,Prenume,Data_nasterii) values ('Craciun','Sebastian','2019-01-19');
insert into Date_copii (Nume,Prenume,Data_nasterii) values 
('Badea','Filip','2019-01-17'),
('Pruteanu','Andrei','2019-01-18'),
('Gache','Razvan','2019-01-18'),
('Neagu','Teodor','2019-02-25'),
('Mihai','Gabi','2019-03-12'),
'Bucatariu','David','2019-10-10'),
('Muresan','Patrick','2019-10-14'),
('Babos','Patrick','2019-12-12');
select * from Date_copii;
alter table Date_copii add column ID_antrenor int not null;
alter table Date_copii add foreign key (ID_antrenor) references Antrenor(ID);


update Date_copii set ID_antrenor='1' where(ID_copil=1) or (ID_copil=3) or (ID_copil=6) or (ID_copil=5);
update Date_copii set ID_antrenor='3' where (ID_copil=2) or (ID_copil=4) or (ID_copil=7) or (ID_copil=8);
update Date_copii set ID_antrenor='2' where ID_copil=9;


create table Date_parinti(ID int primary key not null,Nume varchar(20) not null,Prenume varchar(20) not null,Numar_telefon varchar(10),
ID_copil int not null);
insert into Date_parinti values
(1,'Craciun','Ioana','0773974717',1),
(2,'Badea','Lucian','0751127286',2),
(3,'Bucatariu','Madalina','0747222111',7),
(4,'Neagu','Razvan','0778555111',5),
(5,'Mihai','Razvan','0747555444',6),
(6,'Craciun','Adrian','0777125286',1);

delete from Taxa where id=5;
drop table Meciuri;
Alter table Date_parinti add foreign key (ID_copil) references Date_copii(ID_copil);
update Date_copii set ID_antrenor='1' where(ID_copil=1) or (ID_copil=3) or (ID_copil=6) or (ID_copil=5);


select * from Date_parinti;
create table Echipamente
(ID int primary key not null,
Marime varchar(10),
Nume_inscriptionat varchar(10),
Numar_inscriptionat int,
ID_copil int not null,
foreign key (ID_copil) references Date_copii(ID_copil));
drop table Echipamente;
insert into Echipamente
 values(1,'s','Sebi',19,1),
 (2,'XS','Andrei',12,3),
 (3,'M','David',11,7),
 (4,'s','Gabi',15,6),
 (5,'s','Patrick',10,8),
 (6,'xs','Teo',1,5);
select * from Echipamente;



create table Taxa
(ID int primary key not null,
ID_copil int not null,
Ianuarie varchar(10),
Februarie varchar(10),
Martie varchar(10),
Aprilie varchar(10),
Mai varchar(10),
Iunie varchar(10),
Iulie varchar(10),
August varchar(10),
Septembrie varchar(10),
Octombrie varchar(10),
Noiembrie varchar(10),
Decembrie varchar(10),
foreign key(ID_copil) references Date_copii(ID_copil));
insert into Taxa 
values(1,1,'Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(2,2,'Achitat','Achitat','Achitat','Achitat','Achitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(3,5,'Achitat','Achitat','Achitat','Neachitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(4,4,'Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(5,9,'Neachitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat');


select * from Taxa;
drop table Taxa;

create table Antrenori
(ID int primary key not null auto_increment,
Nume_antrenor varchar(10),
Prenume_antrenor varchar(10),
Numar_telefon varchar(13));
insert into Antrenori (Nume_antrenor,Prenume_antrenor,Numar_telefon) 
values ('Ciocan','Cristian','0741222545'),
('Darstar','Liviu','0751124356'),
('Marin','Gheorghe','0789254631');
select * from Antrenori;


--afisam corespondenta dintre copii si parinti
select * from Date_copii cross join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil;

--afisam doar copiii ce au echipamente
select * from Date_copii inner join Echipamente on Date_copii.ID_copil=Echipamente.ID_copil;

--afisez doar copii ai caror parinti au numele Craciun
select * from Date_copii left join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil where Date_parinti.Nume='Craciun';

select Nume,Prenume from Date_copii order by Nume;
select * from Date_copii order by Date_copii.data_nasterii;
select Nume,prenume,ID_antrenor from Date_copii where id_antrenor=2;
select Nume_antrenor,Prenume_antrenor from Antrenori where Nume_antrenor like '%an';
select * from Date_copii left join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil where Date_parinti.Nume='Craciun';
select * from Date_copii inner join Echipamente on Date_copii.ID_copil=Echipamente.ID_copil;
select * from Date_copii cross join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil;

