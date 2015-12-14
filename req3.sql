-- Quels sont les evenements (nom et lieu) auxquels participe l’enseignant n°4
select t.Evenement.nom_e, t.Evenement.lieu
from table (select e.Evenements
            from ENSEIGNANT e
            where e.Num_Ens=3
            ) t;
