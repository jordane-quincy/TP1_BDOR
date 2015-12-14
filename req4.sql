select distinct t.Filiere
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;
