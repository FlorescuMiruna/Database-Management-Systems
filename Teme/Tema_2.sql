

7. a. Câte exemplare au statusul eronat?
--3 EXEMPLARE AU STATUSUL ERONAT
b. Seta?i statusul corect pentru toate exemplarele care au statusul eronat. Salva?i actualiz?rile
realizate.
Obs. Pentru rezolvare crea?i tabela title_copy_***, preluând structura ?i datele din tabela
title_copy.

SELECT *
FROM RENTAL;
SELECT TITLE,COPY_ID, NULLIF(STATUS , CASE WHEN ( T.TITLE_ID , COPY_ID) NOT IN
        (SELECT TITLE_ID, COPY_ID FROM RENTAL WHERE ACT_RET_DATE IS NULL)
    THEN 'AVAILABLE'
    ELSE ' RENTED'
    END) STATUS_CORECT
FROM TITLE T JOIN TITLE_COPY TC ON ( T.TITLE_ID = TC.TITLE_ID)
WHERE   NULLIF(STATUS , CASE WHEN ( T.TITLE_ID , COPY_ID) NOT IN
        (SELECT TITLE_ID, COPY_ID FROM RENTAL WHERE ACT_RET_DATE IS NULL)
    THEN 'AVAILABLE'
    ELSE ' RENTED'
    END)  IS NOT NULL;

SELECT *
FROM TITLE_COPY;

SELECT *
FROM TITLE;

SELECT *
FROM TITLE;

CREATE TABLE TITLE_COPY_FLR AS SELECT * FROM TITLE_COPY;


ALTER TABLE TITLE_COPY_FLR
ADD CONSTRAINT PK_TITILE_COPY_FLRPRIMARY KEY(TITLE_ID);


DROP TABLE TITILE_COPY_FLR;
8. Toate filmele rezervate au fost împrumutate la data rezerv?rii? Afi?a?i textul “Da” sau ”Nu” în
func?ie de situa?ie.

SELECT *
FROM RENTAL;
SELECT *
FROM RESERVATION;

SELECT  RES.MEMBER_ID,RES.TITLE_ID,RES.RES_DATE,BOOK_DATE, DECODE(RES.RES_DATE,BOOK_DATE,'Da','Nu') TEXT
FROM RESERVATION RES, RENTAL R
WHERE RES.TITLE_ID = R.TITLE_ID
AND RES.MEMBER_ID = R.MEMBER_ID;


9. De câte ori a împrumutat un membru (nume ?i prenume) fiecare film (titlu)?

SELECT *
FROM RENTAL;
SELECT M.MEMBER_ID, M.FIRST_NAME , M.LAST_NAME,COUNT(R.TITLE_ID) Numar_total_imprumuturi
FROM RENTAL R,MEMBER M 
WHERE R.MEMBER_ID = M.MEMBER_ID
GROUP BY  M.MEMBER_ID, M.FIRST_NAME , M.LAST_NAME;


10. De câte ori a împrumutat un membru (nume ?i prenume) fiecare exemplar (cod) al unui film (titlu)? 


SELECT M.MEMBER_ID, M.FIRST_NAME , M.LAST_NAME,COUNT(R.TITLE_ID) Numar_total_imprumuturi
FROM RENTAL R,MEMBER M 
WHERE R.MEMBER_ID = M.MEMBER_ID
GROUP BY  M.MEMBER_ID, M.FIRST_NAME , M.LAST_NAME;


