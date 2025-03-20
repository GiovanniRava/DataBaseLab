-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Thu Mar 20 10:03:38 2025 
-- * LUN file: C:\Users\giovannimaria.rava\Desktop\quartoProgetto.lun 
-- * Schema: 1000 e 1 pagina/Logico 
-- ********************************************* 


-- Database Section
-- ________________ 

create database 1000 e 1 pagina;
use 1000 e 1 pagina;


-- Tables Section
-- _____________ 

create table LIBRO (
     codiceLibro char(1) not null,
     Titolo char(1) not null,
     DataPubblicazione char(1) not null,
     Prezzo char(1) not null,
     NumeroCopieVendute char(1) not null,
     codiceEditore char(1) not null,
     constraint IDLIBRO_ID primary key (codiceLibro));

create table EDITORE (
     codiceEditore char(1) not null,
     Nome char(1) not null,
     Ind_Via -- Compound attribute -- not null,
     Ind_Numero char(1) not null,
     Ind_Città char(1) not null,
     constraint IDEDITORE primary key (codiceEditore));

create table NEGOZIO (
     codNegozio char(1) not null,
     Nome char(1) not null,
     Ind_Via -- Compound attribute -- not null,
     Ind_Numero char(1) not null,
     Ind_Città char(1) not null,
     constraint IDNEGOZIO primary key (codNegozio));

create table AUTORE (
     codiceAutore char(1) not null,
     Cognome char(1) not null,
     Nome char(1) not null,
     constraint IDAUTORE primary key (codiceAutore));

create table VENDITA (
     codice char(1) not null,
     codNegozio char(1) not null,
     Data char(1) not null,
     Quantità char(1) not null,
     constraint IDVENDITA primary key (codNegozio, codice, Data));

create table Scrittura (
     codiceLibro char(1) not null,
     codiceAutore char(1) not null,
     constraint IDScrittura primary key (codiceAutore, codiceLibro));


-- Constraints Section
-- ___________________ 

-- Not implemented
-- alter table LIBRO add constraint IDLIBRO_CHK
--     check(exists(select * from Scrittura
--                  where Scrittura.codiceLibro = codiceLibro)); 

alter table LIBRO add constraint FKPubblicazione
     foreign key (codiceEditore)
     references EDITORE (codiceEditore);

alter table VENDITA add constraint FKRegistrazione
     foreign key (codNegozio)
     references NEGOZIO (codNegozio);

alter table VENDITA add constraint FKRichiesta
     foreign key (codice)
     references LIBRO (codiceLibro);

alter table Scrittura add constraint FKScr_AUT
     foreign key (codiceAutore)
     references AUTORE (codiceAutore);

alter table Scrittura add constraint FKScr_LIB
     foreign key (codiceLibro)
     references LIBRO (codiceLibro);


-- Index Section
-- _____________ 

