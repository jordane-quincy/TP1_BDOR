
select e.Enseig.Num_Ens
from table (
  select ev.Intervenants
  from EVENEMENT ev
  where ev.num_e=1
) e

select ev.num_e, cursor(select count(*) from table(ev.intervenants) )
from EVENEMENT ev;


select ev.Evenement.Num_E
from table (
  select e.Evenements
  from ENSEIGNANT e
  where e.num_ens=1
) ev
