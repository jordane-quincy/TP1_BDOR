--pre-creation type enseignant
create type Enseignant_Type;
/

--create type Professionnel
create type Professionnel_Type as object (
  Num_P number,
  Nom_P varchar2(20),
  Prenom_P varchar2(20),
  Entreprise varchar2(50),
  Domaine varchar2(50),
  Contact REF Enseignant_Type
);
/

create type Intervenant_REF_Type as object (
  Filiere varchar2(20),
  Enseig REF Enseignant_Type,
  Pro REF Professionnel_Type
);
/

create type Intervenant_REF_TI_Type as table of Intervenant_REF_Type;
/

create type Evenement_Type as object (
  Num_E number,
  Nom_E varchar2(20),
  Date_E Date,
  Lieu varchar2(20),
  Public_Cible varchar2(20),
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
  Nom_Ens varchar2(20),
  Adress_Ens varchar2(20),
  Filiere varchar2(20),
  Evenements Evenement_REF_TI_Type
);
/
