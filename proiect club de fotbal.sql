#creez baza de date
create database Club_de_fotbal;

#creez tabelul Date_copii
create table Date_copii(
ID int unsigned auto_increment primary key,
Nume varchar(20) not null,
Prenume varchar(20) not null,
Data_nasterii date not null
);

#introduc valori in tabelul Date_copii
insert into Date_copii (Nume,Prenume,Data_nasterii) values ('Craciun','Sebastian','2019-01-19');
insert into Date_copii (Nume,Prenume,Data_nasterii) values 
('Badea','Filip','2019-01-17'),
('Pruteanu','Andrei','2019-01-18'),
('Gache','Razvan','2019-01-18'),
('Neagu','Teodor','2019-02-25'),
('Mihai','Gabi','2019-03-12'),
('Bucatariu','David','2019-10-10'),
('Muresan','Patrick','2019-10-14'),
('Babos','Patrick','2019-12-12');

#afisez toate valorile din tabelul Date_copii
select * from Date_copii;

#modific tabelul Date_copii si adaug coloana ID_antrenor si o setez ca si foreign key pentru coloana ID din tabelul Antrenor
alter table Date_copii add column ID_antrenor int not null;
alter table Date_copii add foreign key (ID_antrenor) references Antrenor(ID);

#introduc valori in tabelul Date copii pentru coloana adaugata ID_antrenor in fuctie de ID_copil
update Date_copii set ID_antrenor='1' where(ID_copil=1) or (ID_copil=3) or (ID_copil=6) or (ID_copil=5);
update Date_copii set ID_antrenor='3' where (ID_copil=2) or (ID_copil=4) or (ID_copil=7) or (ID_copil=8);
update Date_copii set ID_antrenor='2' where ID_copil=9;

#creez tabelul Date_parinti
create table Date_parinti(ID int primary key not null,Nume varchar(20) not null,Prenume varchar(20) not null,Numar_telefon varchar(10),
ID_copil int not null);

#adaug date in tabelul Date_parinti
insert into Date_parinti values
(1,'Craciun','Ioana','0773974717',1),
(2,'Badea','Lucian','0751127286',2),
(3,'Bucatariu','Madalina','0747222111',7),
(4,'Neagu','Razvan','0778555111',5),
(5,'Mihai','Razvan','0747555444',6),
(6,'Craciun','Adrian','0777125286',1);

#afisez toate datele din tabelul Date_parinti
select * from Date_parinti;

#modific tabelul Date_parinti si setez foreign key ID_copil pentru coloana ID_copil din tabelul Date_copii
Alter table Date_parinti add foreign key (ID_copil) references Date_copii(ID_copil);

#creez tabelul Echipamente
create table Echipamente
(ID int primary key not null,
Marime varchar(10),
Nume_inscriptionat varchar(10),
Numar_inscriptionat int,
ID_copil int not null,
foreign key (ID_copil) references Date_copii(ID_copil));

# modificare dimensiune sir de caractere permis sa se introduca in coloana Marime
alter table Echipamente modify Marime varchar(20);

#adaug valori in tabelul Echipamente
insert into Echipamente
 values(1,'s','Sebi',19,1),
 (2,'XS','Andrei',12,3),
 (3,'M','David',11,7),
 (4,'s','Gabi',15,6),
 (5,'s','Patrick',10,8),
 (6,'xs','Teo',1,5);
 
#afisez toate datele din tabelul Echipamente
select * from Echipamente;

#creez tabelul Taxa
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

#adaug date in tabelul Taxa
insert into Taxa 
values(1,1,'Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(2,2,'Achitat','Achitat','Achitat','Achitat','Achitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(3,5,'Achitat','Achitat','Achitat','Neachitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(4,4,'Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(5,9,'Neachitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat');

#selectez toate datele din tabelul Taxa
select * from Taxa;

#sterg din tabelul Taxa inregistrarea ce corespunde id-ului 5
delete from Taxa where id=5;

# schimbare nume tabel
alter table Taxa rename Taxa_copii;



#creez tabelul Antrenori
create table Antrenori
(ID int primary key not null auto_increment,
Nume_antrenor varchar(10),
Prenume_antrenor varchar(10),
Numar_telefon varchar(13));

#adaug date in tabelul Antrenori
insert into Antrenori (Nume_antrenor,Prenume_antrenor,Numar_telefon) 
values ('Ciocan','Cristian','0741222545'),
('Darstar','Liviu','0751124356'),
('Marin','Gheorghe','0789254631');

#selectez toate datele din tabelul Antrenori
select * from Antrenori;

#afisam corespondenta dintre copii si parinti
select * from Date_copii cross join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil;

#afisam doar copiii ce au echipamente
select * from Date_copii inner join Echipamente on Date_copii.ID_copil=Echipamente.ID_copil;

# afisez doar copii ai caror parinti au numele Craciun
select * from Date_copii left join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil where Date_parinti.Nume='Craciun';

#afisez din tabelul Date_copii doar coloanele Nume si Prenume ordonate in functie de Nume
select Nume,Prenume from Date_copii order by Nume;

#afisez din tabelul Date_copii toate datele ordonate dupa data nasterii
select * from Date_copii order by Date_copii.data_nasterii;

#afisez din tabelul Date_copii coloanele Nume,Prenume,ID_antrenor pentru copiii ce corespund antrnorului cu id-ul 2
select Nume,prenume,ID_antrenor from Date_copii where id_antrenor=2;

#afisez din tabelul Antrenori coloanele cu numele si prenumele pentru cei al caror nume se termina cu "an"
select Nume_antrenor,Prenume_antrenor from Antrenori where Nume_antrenor like '%an';

#afisez numele si prenumele copilului caruia ii corespunde id-ul de antrenor 3 si are prenumele Filip
select  Nume,Prenume
from  Date_copii
where id_antrenor=3
having prenume='Filip';

#afisez numele,prenumele si Id-ul antrenorului pentru copii carora le corespunde id-ul de antrenor 1 sau 3
select Nume,Prenume,id_antrenor from Date_copii where id_antrenor=1 or Id_antrenor=3;

#afisez toate coloanele din tabelul date_copii pentru copilul ce are numele Craciun si prenumele Sebastian
select * from Date_copii where Nume= 'Craciun'and Prenume= 'Sebastian';

select * from Echipamente group by id;

    
select *
from Date_copii
group by ID_antrenor;
    
#instructiuni de stergere a tabelelor
drop table Taxa;
drop table Echipamente;
drop table Meciuri;











