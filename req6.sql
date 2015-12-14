select t.Pro.Nom_P, t.Pro.Prenom_P, t.Pro.Contact.Nom_Ens
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;
