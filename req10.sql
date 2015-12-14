select ev.Nom_E, cursor (select count(*)
              from table (ev.Intervenants) t
              ) as "Nbr de filieres representees"
from Evenement ev
where ev.Public_Cible = 'Public 2';
