drop table Evenement;
drop table Professionnel;
drop table Enseignant;
/* Question 1 - Creation des tables */
CREATE TABLE Professionnel OF Professionnel_Type (primary key(Num_P));

CREATE TABLE Enseignant OF Enseignant_Type (primary key(Num_Ens))
NESTED TABLE Evenements STORE AS tabl_Evenements;

CREATE TABLE Evenement OF Evenement_Type (primary key(Num_E))
NESTED TABLE Intervenants STORE AS tabl_Intervenants;
