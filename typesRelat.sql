create type Enseignant2_t as object (
  Num_Ens number,
  Nom_Ens varchar2(50),
  Adress_Ens varchar2(50),
  Filiere varchar2(50)
);
/
create table Enseignant2Relat of Enseignant2_t(primary key (Num_Ens));

create view Enseignant2View of Enseignant2_t
with object oid(Num_Ens) as
select Num_Ens, Nom_Ens, Adress_Ens, filiere
from Enseignant2Relat;

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
