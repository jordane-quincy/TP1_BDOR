/* Question 2 - Insertion */

INSERT INTO Professionnel values (1, 'nom Professionnel 1', 'prenom Professionnel 1', 'Entreprise 1', 'Domaine 1', Enseignant_Type() );
INSERT INTO Professionnel values (2, 'nom Professionnel 2', 'prenom Professionnel 2', 'Entreprise 2', 'Domaine 2', Enseignant_Type() );
INSERT INTO Professionnel values (3, 'nom Professionnel 3', 'prenom Professionnel 3', 'Entreprise 3', 'Domaine 3', Enseignant_Type() );


INSERT INTO Enseignant values (1, 'nom Enseignant 1', 'adresse Enseignant 1', 'Filiere 1',  Evenement_REF_TI_TYPE() /* on va avoir un tableau de ref*/);
INSERT INTO Enseignant values (2, 'nom Enseignant 2', 'adresse Enseignant 2', 'Filiere 2',  Evenement_REF_TI_TYPE() /* on va avoir un tableau de ref*/);
INSERT INTO Enseignant values (3, 'nom Enseignant 3', 'adresse Enseignant 3', 'Filiere 3',  Evenement_REF_TI_TYPE() /* on va avoir un tableau de ref*/);

INSERT INTO Evenement values (
	1, 'Evenement 1', sysdate - 2, 'Lieu 1', 'Public 1', Intervenant_REF_TI_TYPE()
);
INSERT INTO TABLE (select e.Intervenants from Evenement e where e.num_e=1)
(
  select 'Filiere Evenement 1', ref(e), ref(t)
  from Enseignant e, Professionnel p
  where e.num_e=1 and p.num_p=1
);
