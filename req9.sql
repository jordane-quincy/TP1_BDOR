select p.Contact.Filiere as "Filiere", count(*) as "Nbr de pro"
from Professionnel p
group by p.Contact.Filiere
having count(*) >= 3;
