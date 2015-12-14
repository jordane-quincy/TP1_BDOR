/* Question 2 - Insertion */

INSERT INTO Enseignant values (1, 'nom Enseignant 1', 'adresse Enseignant 1', 'Filiere 1',  Evenement_REF_TI_TYPE() /* on va avoir un tableau de ref*/);
INSERT INTO Enseignant values (2, 'nom Enseignant 2', 'adresse Enseignant 2', 'Filiere 2',  Evenement_REF_TI_TYPE() /* on va avoir un tableau de ref*/);
INSERT INTO Enseignant values (3, 'nom Enseignant 3', 'adresse Enseignant 3', 'Filiere 3',  Evenement_REF_TI_TYPE() /* on va avoir un tableau de ref*/);


INSERT INTO Professionnel
(
  select 1, 'nom Professionnel 1', 'prenom Professionnel 1', 'Entreprise 1', 'Domaine 1', ref(e)
  from Enseignant e
  where e.NUM_ENS=1
);

INSERT INTO Professionnel
(
  select 2, 'nom Professionnel 2', 'prenom Professionnel 2', 'Entreprise 2', 'Domaine 1', ref(e)
  from Enseignant e
  where e.NUM_ENS=2
);

INSERT INTO Professionnel
(
  select 3, 'nom Professionnel 3', 'prenom Professionnel 3', 'Entreprise 3', 'Domaine 3', ref(e)
  from Enseignant e
  where e.NUM_ENS=3
);

INSERT INTO Professionnel
(
  select 4, 'Dupont', 'Jean', 'Entreprise 4', 'Domaine 1', ref(e)
  from Enseignant e
  where e.NUM_ENS=1
);




INSERT INTO Evenement values (
	1, 'Evenement 1', sysdate - 2, 'Lieu 1', 'Public 1', Intervenant_REF_TI_TYPE()
);
INSERT INTO TABLE (select e.Intervenants from Evenement e where e.num_e=1)
(
  select 'Filiere Evenement 1', ref(e), ref(p)
  from Enseignant e, Professionnel p
  where e.num_ens=1 and p.num_p=1
);

INSERT INTO Evenement values (
	2, 'Evenement 2', sysdate + 6, 'Lieu 2', 'Public 2', Intervenant_REF_TI_TYPE()
);
INSERT INTO TABLE (select e.Intervenants from Evenement e where e.num_e=2)
(
  select 'Filiere Evenement 2', ref(e), ref(p)
  from Enseignant e, Professionnel p
  where e.num_ens=2 and p.num_p=2
);

INSERT INTO Evenement values (
	3, 'Evenement 3', sysdate - 14 , 'Lieu 3', 'Public 3', Intervenant_REF_TI_TYPE()
);
INSERT INTO TABLE (select e.Intervenants from Evenement e where e.num_e=3)
(
  select 'Filiere Evenement 3', ref(e), ref(p)
  from Enseignant e, Professionnel p
  where e.num_ens=3 and p.num_p=3
);


INSERT INTO TABLE (select e.Evenements from Enseignant e where e.num_ens=1)
(
  select ref(e)
  from Evenement e
  where e.num_e=1
);
INSERT INTO TABLE (select e.Evenements from Enseignant e where e.num_ens=2)
(
  select ref(e)
  from Evenement e
  where e.num_e=2
);
INSERT INTO TABLE (select e.Evenements from Enseignant e where e.num_ens=3)
(
  select ref(e)
  from Evenement e
  where e.num_e=3
);


INSERT INTO Evenement values (
	4, 'Evenement 4', sysdate - 44 , 'Lieu 4', 'Public 4', Intervenant_REF_TI_TYPE()
);
INSERT INTO TABLE (select e.Intervenants from Evenement e where e.num_e=4)
(
  select 'Filiere Evenement 4', ref(e), null
  from Enseignant e
  where e.num_ens=3
);
INSERT INTO TABLE (select e.Evenements from Enseignant e where e.num_ens=3)
(
  select ref(e)
  from Evenement e
  where e.num_e=4
);
