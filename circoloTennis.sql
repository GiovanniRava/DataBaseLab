-- *********************************************
-- * SQL MySQL generation                      
-- *--------------------------------------------
-- * DB-MAIN version: 11.0.2              
-- * Generator date: Sep 14 2021              
-- * Generation date: Fri May  2 15:29:02 2025 
-- * LUN file: C:\Users\Giovanni Maria\Desktop\UNI\DataBase\DataBaseLab\circoloTennis.lun 
-- * Schema: circoloTennis/concettuale 
-- ********************************************* 


-- Database Section
-- ________________ 

create database circoloTennis;
use circoloTennis;


-- Tables Section
-- _____________ 

create table MAESTRO (
     idMaestro char(1) not null,
     constraint IDMAESTRO unique (idMaestro));

create table GIOCATORE (
     classifica char(1) not null,
     numTessera char(1) not null,
     constraint IDGIOCATORE primary key (numTessera));

create table CORSO (
     oraInizio char(1) not null,
     oraFine char(1) not null,
     NumeroGiocatori char(1) not null,
     idCorso char(1) not null,
     constraint IDCORSO primary key (idCorso));

create table SAT (
);

create table CORSO_SERALE (
);

create table AGONISTICA (
);

create table CAMPO (
     numCampo char(1) not null,
     tipoSuperficie char(1) not null,
     coperto char not null,
     illuminato char not null,
     constraint IDCAMPO primary key (numCampo));

create table LEZIONE_PRIVATA (
     oraInizio char(1) not null,
     oraFine char(1) not null);

create table GIOCATORE_SOCIO (
     InizioAffiliazione char(1) not null,
     FineAffiliazione char(1) not null);

create table GIOCATORE_NONSOCIO (
);

create table PERSONA (
     codFiscale char(1) not null,
     DataNascita char(1) not null,
     Genere char(1) not null,
     Nome char(1) not null,
     Cognome char(1) not null,
     constraint IDPERSONA primary key (codFiscale));

create table TORNEO (
     idTorneo char(1) not null,
     nome char(1) not null,
     dataInizio char(1) not null,
     dataFine char(1) not null,
     livello char(1) not null);

create table QUOTA_ASSOCIATIVA (
     idQuota char(1) not null,
     importo char(1) not null,
     dataPagamento char(1) not null,
     constraint IDQUOTA_ASSOCIATIVA primary key (idQuota));

create table ISCRIZIONE (
     dataIscrizione char(1) not null);

create table CATEGORIA_TORNEO (
     idCategoria char(1) not null,
     tipo char(1) not null,
     genere char(1) not null,
     etàMin char(1) not null,
     etàMax char(1) not null);

create table ISCRIZIONE_TORNEO (
     idIscrizione char(1) not null,
     dataIscrizione char(1) not null,
     id_giocatore1 char(1) not null,
     id_giocatore2 char(1) not null);

create table PARTITA_TORNEO (
     idPartita char(1) not null,
     turno char(1) not null,
     data char(1) not null,
     oraInizio char(1) not null);

create table STAFF (
     idStaff char(1) not null,
     ruolo char(1) not null,
     constraint IDSTAFF unique (idStaff));

create table PRENOTAZIONE (
     stato char(1) not null,
     idPrenotazione char(1) not null,
     data char(1) not null,
     oraInizio char(1) not null,
     oraFine char(1) not null);


-- Constraints Section
-- ___________________ 


-- Index Section
-- _____________ 

