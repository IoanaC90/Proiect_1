<h1> Baza de date Club de fotbal</h1>

***Aplicatia testata:*** Club de fotbal

***Tool-ul utilizat:*** MySQL Workbench

***Descrierea bazei de date:*** Baza de date este a unui club de fotbal pentru copii unde se tine evidenta copiilor,a parintilor,a echipamentelor primite,a taxei si a antrenorilor.

<ol>
<li><strong>Schema bazei de date</strong> </li>
<br>
Mai jos gasiti schema bazei de date si contine toate tabelele si relatiile dintre ele.


<strong> Tabelele sunt conectate intre ele astfel: </strong>

<ul>
  <li> Tabelul <strong>Date_copii </strong> este conectat cu tabelul <strong>Date_parinti </strong> printr-o relatie <strong>one-to-many</strong> care a fost implementata prin Date_copii.Id_copil ca primary key si Date_parinti.Id_copil ca foreign key </li>
  <li> Tabelul <strong>Date_copii </strong> este conectat cu tabelul <strong>Echipamente</strong> printr-o relatie <strong>one-to-one </strong> care a fost implementata prin Date_copil.Id_copil ca primary key si Echipamente.Id_copil ca foreign key</li>
  <li> Tabelul <strong>Date_copii</strong> este conectat cu tabelul <strong>Taxa</strong> printr-o relatie <strong>one-to-one</strong> care a fost implementata prin Date_copil.Id_copil ca primary key si Taxa.Id_copil ca foreign key </li>
  <li> Tabelul <strong>Antrenori</strong> este conectat cu tabelul <strong>Date_copii</strong> printr-o relatie <strong>one-to-many</strong> care a fost implementata prin Antrenori.ID ca primary key si Date_copii.ID_antrenor ca foreign key.</li>
</ul><br>

<strong>2. Queriuri</li><br></strong>


  <strong> 2.1 DDL (Data Definition Language)</strong>


  Urmatoarele instructiuni au fost scrise pentru a crea baza de date si tabelele (<strong>INSTRUCTIUNI DE CREARE</strong>)
  
* <em>create database Club_de_fotbal;</em>

* <em>create table Date_copii(
ID int unsigned auto_increment primary key,
Nume varchar(20) not null,
Prenume varchar(20) not null,
Data_nasterii date not null
);</em>

* <em>create table Date_parinti(ID int primary key not null,Nume varchar(20) not null,Prenume varchar(20) not null,Numar_telefon varchar(10),
ID_copil int not null);

* create table Echipamente
(ID int primary key not null,
Marime varchar(10),
Nume_inscriptionat varchar(10),
Numar_inscriptionat int,
ID_copil int not null,
foreign key (ID_copil) references Date_copii(ID_copil));

* create table Taxa
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

* create table Antrenori
(ID int primary key not null auto_increment,
Nume_antrenor varchar(10),
Prenume_antrenor varchar(10),
Numar_telefon varchar(13));</em>

  Dupa ce am creat baza de date si tabelele, cateva insctructiuni <strong>ALTER</strong> au fost scrise pentru a schimba structura bazei de date asa cum sunt descrise mai jos:

* <em>alter table Date_copii add column ID_antrenor int not null;
* alter table Date_copii add foreign key (ID_antrenor) references Antrenor(ID);
* alter table Date_parinti add foreign key (ID_copil) references Date_copii(ID_copil);
* alter table Taxa rename Taxa_copii;
* alter table Echipamente modify Marime varchar(20);</em>

  
  <strong> 2.2 DML (Data Manipulation Language)</strong>

  Pentru a putea utiliza baza de date am inserat in tabelele diverse date necesare pentru a efectua interogări și a manipula datele. 
  În procesul de testare, aceste date necesare sunt identificate în faza de proiectare a testului și create în faza de implementare a testului. 

  Mai jos puteti gasi toate instructiunile de <strong>inserare </strong> a datelor care au fost create in acest proiect:
  
 * <em> insert into Date_copii (Nume,Prenume,Data_nasterii) values ('Craciun','Sebastian','2019-01-19');
 * insert into Date_copii (Nume,Prenume,Data_nasterii) values 
  ('Badea','Filip','2019-01-17'),
  ('Pruteanu','Andrei','2019-01-18'),
  ('Gache','Razvan','2019-01-18'),
  ('Neagu','Teodor','2019-02-25'),
  ('Mihai','Gabi','2019-03-12'),
  ('Bucatariu','David','2019-10-10'),
  ('Muresan','Patrick','2019-10-14'),
  ('Babos','Patrick','2019-12-12');
* insert into Date_parinti values
(1,'Craciun','Ioana','0773974717',1),
(2,'Badea','Lucian','0751127286',2),
(3,'Bucatariu','Madalina','0747222111',7),
(4,'Neagu','Razvan','0778555111',5),
(5,'Mihai','Razvan','0747555444',6),
(6,'Craciun','Adrian','0777125286',1);
* insert into Echipamente
 values(1,'s','Sebi',19,1),
 (2,'XS','Andrei',12,3),
 (3,'M','David',11,7),
 (4,'s','Gabi',15,6),
 (5,'s','Patrick',10,8),
 (6,'xs','Teo',1,5);
* insert into Taxa 
values(1,1,'Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(2,2,'Achitat','Achitat','Achitat','Achitat','Achitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(3,5,'Achitat','Achitat','Achitat','Neachitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(4,4,'Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat'),
(5,9,'Neachitat','Neachitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat','Achitat');
* insert into Antrenori (Nume_antrenor,Prenume_antrenor,Numar_telefon) 
values ('Ciocan','Cristian','0741222545'),
('Darstar','Liviu','0751124356'),
('Marin','Gheorghe','0789254631');</em>

  După inserare, pentru a pregăti datele pentru a fi mai potrivite pentru procesul de testare, am actualizat(<strong> UPDATE </strong>)câteva date în felul următor:

* <em>update Date_copii set ID_antrenor='1' where(ID_copil=1) or (ID_copil=3) or (ID_copil=6) or (ID_copil=5);
* update Date_copii set ID_antrenor='3' where (ID_copil=2) or (ID_copil=4) or (ID_copil=7) or (ID_copil=8);
* update Date_copii set ID_antrenor='2' where ID_copil=9;</em>

  <strong>2.3 DQL (Data Query Language)</strong>

După procesul de testare, am <strong>șters</strong> datele care nu mai erau relevante pentru a păstra baza de date curată: 

* <em>delete from Taxa where id=5;
* drop table Taxa;
* drop table Echipamente;
* drop table Meciuri;</em>

Pentru a simula diverse scenarii care s-ar putea întâmpla în viața reală, am creat următoarele <strong>interogări </strong> care ar acoperi mai multe situații potențiale din viața reală:

* <em>select * from Date_copii;
* select * from Date_parinti;
* select * from Echipamente;
* select * from Taxa;
* select * from Antrenori;
* select * from Date_copii cross join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil;
* select * from Date_copii inner join Echipamente on Date_copii.ID_copil=Echipamente.ID_copil;
* select * from Date_copii left join Date_parinti on Date_copii.ID_copil=Date_parinti.ID_copil where Date_parinti.Nume='Craciun';
* select Nume,Prenume from Date_copii order by Nume;
* select * from Date_copii order by Date_copii.data_nasterii;
* select Nume,prenume,ID_antrenor from Date_copii where id_antrenor=2;
* select Nume_antrenor,Prenume_antrenor from Antrenori where Nume_antrenor like '%an';
* select  Nume,Prenume from  Date_copii where id_antrenor=3 having prenume='Filip';
* select Nume,Prenume,id_antrenor from Date_copii where id_antrenor=1 or Id_antrenor=3;
* select * from Date_copii where Nume= 'Craciun'and Prenume= 'Sebastian';
* select * from Echipamente group by id;</em>
    

</ol>
