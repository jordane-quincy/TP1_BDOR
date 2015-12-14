--Drop pour les reset
drop table Professionnel2;
drop table Enseignant2;
drop table Enseignant2Relat;
drop type Enseignant2_t force;
drop type ProfessionnelView_Or_t force;
drop view Enseignant2View;


--Creaiton des tables relationnelles
create table Enseignant2 (
  Num_Ens number,
  Nom_Ens varchar2(50),
  Adress_Ens varchar2(50),
  Filiere varchar2(50),
  primary key (Num_Ens)
);

insert into Enseignant2 values (1, 'Ens1', 'adre1', 'filiere 1');

create table Professionnel2 (
  Num_P number,
  Nom_P varchar2(50),
  Prenom_P varchar2(50),
  Entreprise varchar2(50),
  Domaine varchar2(50),
  Num_Ens number,
  primary key (Num_P),
  foreign key (Num_Ens) references Enseignant2(Num_Ens)
);

insert into Professionnel2 values (1, 'NomPro1', 'PrenomPro1', 'Entre1', 'Domaine1', 1);


--Creation des types et views
create type Enseignant2_t as object (
  Num_Ens number,
  Nom_Ens varchar2(50),
  Adress_Ens varchar2(50),
  Filiere varchar2(50)
);
/

create view Enseignant2View of Enseignant2_t
with object oid(Num_Ens) as
select Num_Ens, Nom_Ens, Adress_Ens, filiere
from Enseignant2;

create type ProfessionnelView_Or_t as object (
  Num_P number,
  Nom_P varchar2(50),
  Prenom_P varchar2(50),
  Entreprise varchar2(50),
  Domaine varchar2(50),
  Num_Ens REF Enseignant2_t
);
/

create or replace view ProfessionnelView_Or of ProfessionnelView_Or_t
with object oid(Num_P) as (
  select P.num_P, P.Nom_P, P.Prenom_P, P.Entreprise, P.Domaine, make_ref(Enseignant2View, E.Num_Ens)
  from Enseignant2 E, Professionnel2 P
  where E.Num_Ens = P.Num_Ens
);

--Requête pour tester (on récupère bien le nom de l'enseignant qui était rataché au pro)
select p.Num_Ens.Nom_Ens
from ProfessionnelView_Or p;

insert into Enseignant2 values (2, 'Ens2', 'adre2', 'filiere 2');

select p.Num_Ens.Nom_Ens from ProfessionnelView_Or p;
