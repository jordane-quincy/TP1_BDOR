--7. Quel est le nombre de filieres representees pour le salon de l'etudiant de Lille ?
select count (distinct (t.Filiere))
from table (select ev.Intervenants
            from Evenement ev
            where lieu = 'Lieu 2'
            ) t;