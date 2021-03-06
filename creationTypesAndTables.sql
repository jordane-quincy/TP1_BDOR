drop table Evenement;
drop table Professionnel;
drop table Enseignant;
drop type Enseignant_Type force;
drop type Professionnel_Type force;
drop type Intervenant_REF_Type force;
drop type Intervenant_REF_TI_Type force;
drop type Evenement_Type force;
drop type Evenement_REF_Type force;
drop type Evenement_REF_TI_Type force;

--pre-creation type enseignant
create type Enseignant_Type;
/

--create type Professionnel
create type Professionnel_Type as object (
  Num_P number,
  Nom_P varchar2(50),
  Prenom_P varchar2(50),
  Entreprise varchar2(50),
  Domaine varchar2(50),
  Contact REF Enseignant_Type
);
/

create type Intervenant_REF_Type as object (
  Filiere varchar2(50),
  Enseig REF Enseignant_Type,
  Pro REF Professionnel_Type
);
/

create type Intervenant_REF_TI_Type as table of Intervenant_REF_Type;
/

create type Evenement_Type as object (
  Num_E number,
  Nom_E varchar2(50),
  Date_E Date,
  Lieu varchar2(50),
  Public_Cible varchar2(50),
  Intervenants Intervenant_REF_TI_Type
);
/

create type Evenement_REF_Type as object (
  Evenement REF Evenement_Type
);
/

create type Evenement_REF_TI_Type as table of Evenement_REF_Type;
/

create or replace type Enseignant_Type as object (
  Num_Ens number,
  Nom_Ens varchar2(50),
  Adress_Ens varchar2(50),
  Filiere varchar2(50),
  Evenements Evenement_REF_TI_Type
);
/
/* Question 1 - Creation des tables */
CREATE TABLE Professionnel OF Professionnel_Type (primary key(Num_P));

CREATE TABLE Enseignant OF Enseignant_Type (primary key(Num_Ens))
NESTED TABLE Evenements STORE AS tabl_Evenements;

CREATE TABLE Evenement OF Evenement_Type (primary key(Num_E))
NESTED TABLE Intervenants STORE AS tabl_Intervenants;
