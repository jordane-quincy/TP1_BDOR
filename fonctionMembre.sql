ALTER TYPE Professionnel_Type ADD MEMBER FUNCTION getDomaine return varchar2 cascade;

CREATE OR REPLACE TYPE BODY Professionnel_Type AS
MEMBER FUNCTION getDomaine RETURN varchar2 IS domaineDuPro varchar2(50);
BEGIN
  SELECT p.domaine INTO domaineDuPro
  FROM Professionnel p
  WHERE p.num_p = self.num_p;
  RETURN domaineDuPro;
END;
END;

/*
--test fonction membre
select p.*, p.getDomaine()
from PROFESSIONNEL p
where p.nom_p='nom Professionnel 2'
*/