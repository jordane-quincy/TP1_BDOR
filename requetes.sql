--req1
select p.Contact.Nom_Ens
from Professionnel p
where Nom_P = 'Dupont'
and Prenom_P = 'Jean';

--req2
select p.contact.filiere, count(*)
from Professionnel p
where p.Domaine = 'Domaine 1'
group by p.contact.filiere;

-- req3 - Quels sont les evenements (nom et lieu) auxquels participe l’enseignant n°4
select t.Evenement.nom_e, t.Evenement.lieu
from table (select e.Evenements
            from ENSEIGNANT e
            where e.Num_Ens=3
            ) t;

--req4
select distinct t.Filiere
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;


--req5 - Quels sont les intervenants de la filiere informatique au forum DEM2O ?
select t.Enseig.Nom_Ens, t.Pro.Nom_P
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;

--req6
select t.Pro.Nom_P, t.Pro.Prenom_P, t.Pro.Contact.Nom_Ens
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;

--req7 - Quel est le nombre de filieres representees pour le salon de l'etudiant de Lille ?
select count (distinct (t.Filiere))
from table (select ev.Intervenants
            from Evenement ev
            where lieu = 'Lieu 2'
            ) t;

--req8
select t.Enseig.Nom_Ens, t.Pro.Nom_P, t.Pro.Entreprise
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;

--req9
select p.Contact.Filiere as "Filiere", count(*) as "Nbr de pro"
from Professionnel p
group by p.Contact.Filiere
having count(*) >= 3;

--req10
select ev.Nom_E, cursor (select count(*)
              from table (ev.Intervenants) t
              ) as "Nbr de filieres representees"
from Evenement ev
where ev.Public_Cible = 'Public 2';
