--5. Quels sont les intervenants de la filiere informatique au forum DEM2O ?
select t.Enseig.Nom_Ens, t.Pro.Nom_P
from table (select ev.Intervenants
            from Evenement ev
            where Nom_E = 'Evenement 1'
            ) t;