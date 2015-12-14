select p.contact.filiere, count(*)
from Professionnel p
where p.Domaine = 'Domaine 1'
group by p.contact.filiere;
