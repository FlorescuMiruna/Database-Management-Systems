--16. Afi?a?i numele tuturor tabelelor personale create (nume_tabel_***).
--Indica?ie: Folosi?i vizualizarea user_tables.

SELECT *
FROM USER_TABLES
WHERE TABLE_NAME LIKE '%FLR%';

--22. F?r? s? rula?i scriptul creat da?i exemplu de un caz în care execu?ia acestui script va determina erori.
--Indica?i o metod? de rezolvare a acestui caz.

SPOOL myspool.txt CREATE;

--23. Folosind tabelul departments genera?i automat script-ul SQL de inserare a înregistr?rilor în acest tabel.

CREATE TABLE DEPARTMENTS_flm AS SELECT * FROM DEPARTMENTS;


ALTER TABLE DEPARTMENTS_FLR
ADD CONSTRAINT PK_DEPARTMENTS_FLS PRIMARY KEY(DEPARTMENT_ID);


ACCEPT COD PROMPT "Introduceti ID-ul";
ACCEPT NUME PROMPT "Introduceti numele departamentului";
ACCEPT MANAGER PROMPT "Introduceti managerul";
ACCEPT LOCATIE PROMPT "Introduceti locatia";

INSERT INTO DEPARTMENTS_FLR( DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID,LOCATION_ID )
VALUES (&COD, '&NUME',&MANAGER, '&LOCATIE');

UNDEFINE COD;
UNDEFINE NUME;
UNDEFINE MANAGER;
UNDEFINE LOCATIE;




