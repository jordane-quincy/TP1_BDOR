select t.Enseig.Nom_Ens, t.Pro.Nom_P, t.Pro.Entreprise
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;
