create table Enseignant2 (
  Num_Ens number,
  Nom_Ens varchar2(50),
  Adress_Ens varchar2(50),
  Filiere varchar2(50),
  primary key (Num_Ens)
);

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
