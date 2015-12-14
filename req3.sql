-- Quels sont les evenements (nom et lieu) auxquels participe l’enseignant n°4
select e.NUM_ENS, cursor(select ev.Evenement.Nom_E, ev.Evenement.lieu from table(e.Evenements) ev)
from ENSEIGNANT e
where e.num_ens=3;