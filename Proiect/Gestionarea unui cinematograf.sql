
SET SERVEROUTPUT  ON;
--select 'drop table ', table_name, 'cascade constraints;' from user_tables;

-- CERINTA 4 
-- Definirea tabelelor

--CINEMA

--DROP TABLE CINEMA;

CREATE TABLE CINEMA(
    ID_CINEMA NUMBER(10) NOT NULL PRIMARY KEY,
    DENUMIRE VARCHAR2(50),
    NR_LOCURI NUMBER(10),
    ORAS VARCHAR2(50)
);
 

--DISTRIBUITOR

--DROP TABLE DISTRIBUITOR;

CREATE TABLE DISTRIBUITOR(
    ID_DISTRIBUITOR NUMBER(10) NOT NULL PRIMARY KEY,
    DENUMIRE VARCHAR2(50),
    COTA FLOAT(10) --Cota de piata 
);


--FILM

--DROP TABLE FILM;

CREATE TABLE FILM(

    ID_FILM NUMBER(10) NOT NULL PRIMARY KEY,
    DENUMIRE VARCHAR2(50),
    NOTA_IMDB FLOAT(10),
    NUME_REGIZOR VARCHAR(100),
    DATA_LANSARE DATE,
    ID_DISTRIBUITOR NUMBER(10),
    
    CONSTRAINT FK_FILM_DISTRIBUITOR FOREIGN KEY (ID_DISTRIBUITOR) REFERENCES DISTRIBUITOR(ID_DISTRIBUITOR) ON DELETE CASCADE
);



--DIFUZARE
-- Tabela asociativa

--DROP TABLE DIFUZARE;

CREATE TABLE DIFUZARE(
    ID_CINEMA NUMBER(10) NOT NULL,
    ID_FILM NUMBER(10) NOT NULL,     
    DATA_DIFUZARE DATE DEFAULT SYSDATE,
    CONSTRAINT FK_DIF_FILM FOREIGN KEY(ID_FILM) REFERENCES FILM(ID_FILM) ON DELETE CASCADE,
    CONSTRAINT FK_DIF_CINEMA FOREIGN KEY (ID_CINEMA) REFERENCES CINEMA(ID_CINEMA) ON DELETE CASCADE,
    PRIMARY KEY(ID_FILM,ID_CINEMA) 
);



--CLIENT

--DROP TABLE CLIENT;

CREATE TABLE CLIENT (
    ID_CLIENT NUMBER(10) NOT NULL PRIMARY KEY,
    NUME VARCHAR2(20),
    PRENUME VARCHAR2(20),
    NR_TELEFON NUMBER(10)
);



-- BILET

--DROP TABLE BILET;

CREATE TABLE BILET(

    ID_BILET NUMBER(10) NOT NULL PRIMARY KEY,
    ID_FILM NUMBER(10),
    ID_CLIENT NUMBER(10),
    NR_LOC INT,
    PRET  NUMBER(10),
    CONSTRAINT FK_BILET_FILM FOREIGN KEY (ID_FILM) REFERENCES FILM (ID_FILM) ON DELETE CASCADE,
    CONSTRAINT FK_BILET_CLIENT FOREIGN KEY (ID_CLIENT) REFERENCES CLIENT (ID_CLIENT) ON DELETE CASCADE
);




--ANGAJAT

--DROP TABLE ANGAJAT;

CREATE TABLE ANGAJAT(
    ID_ANGAJAT NUMBER(10) NOT NULL PRIMARY KEY,
    NUME VARCHAR2(20),
    PRENUME VARCHAR2(20),
    EMAIL VARCHAR2(50),
    SALARIU NUMBER(10),
    VECHIME NUMBER(10), -- Numarul de luni de cand este angajat
    ID_CINEMA,
    CONSTRAINT FK_ANGAJAT_CINEMA FOREIGN KEY (ID_CINEMA) REFERENCES CINEMA(ID_CINEMA) ON DELETE CASCADE
);


--CASIER

--DROP TABLE CASIER;

CREATE TABLE CASIER(
    ID_ANGAJAT NUMBER(10) NOT NULL PRIMARY KEY,
    PREGATIRE INT ,  --Nivelul de pregatire in domeniu
    CONSTRAINT FK_ANGAJAT_CASIER FOREIGN KEY(ID_ANGAJAT) REFERENCES ANGAJAT(ID_ANGAJAT) ON DELETE CASCADE

);



--PLASATOR 

--DROP TABLE PLASATOR;

CREATE TABLE PLASATOR(
    ID_ANGAJAT NUMBER(10) NOT NULL PRIMARY KEY,
    CONSTRAINT FK_ANGAJAT_PLASATOR FOREIGN KEY(ID_ANGAJAT) REFERENCES ANGAJAT(ID_ANGAJAT) ON DELETE CASCADE,
    TURA VARCHAR2(20) --Retinem daca lucreaza in tura de zi sau de noapte
);



--VANZATOR POPCORN

--DROP TABLE VANZATOR_POPCORN;

CREATE TABLE VANZATOR_POPCORN(
    ID_ANGAJAT NUMBER(10) NOT NULL PRIMARY KEY,
    CONSTRAINT FK_ANGAJAT_VANZATOR FOREIGN KEY(ID_ANGAJAT) REFERENCES ANGAJAT(ID_ANGAJAT) ON DELETE CASCADE,
    NR_ORE VARCHAR2(20) --Numarul de ore lucrate pe saptamana
);



-- CERINTA 5
-- Adaugarea informatiilor in tabele

-- CINEMA

INSERT INTO CINEMA VALUES(1,'Cinema City',260,'Targu Jiu');
INSERT INTO CINEMA VALUES(2,'Cityplex',100,'Cluj');
INSERT INTO CINEMA VALUES(3,'Movieplex City',200,'Timisoara');
INSERT INTO CINEMA VALUES(4,'Hollywood Multiplex Operations',300,'Bucuresti');
INSERT INTO CINEMA VALUES(5,'Grand Cinema',400,'Iasi');

SELECT *
FROM CINEMA;

-- DISTRIBUITOR

INSERT INTO DISTRIBUITOR VALUES(1,'Intercom Film',11.1);
INSERT INTO DISTRIBUITOR VALUES(2,'Forum Film',17.9);
INSERT INTO DISTRIBUITOR VALUES(3,'Ro-Image 200',17.9);
INSERT INTO DISTRIBUITOR VALUES(4,'MediaPro Distribution',24.5);
INSERT INTO DISTRIBUITOR VALUES(5,'Odeon Cineplex',16.1);

SELECT *
FROM DISTRIBUITOR;

-- FILM

INSERT INTO FILM VALUES(1,'Interstellar',8.7,'Christopher Nolan',TO_DATE('7-11-2014','DD-MM-YYYY'),1);
INSERT INTO FILM VALUES(2,'Inception',8.8,'Christopher Nolan',TO_DATE('30-7-2010','DD-MM-YYYY'),2);
INSERT INTO FILM VALUES(3,'Edward Scissorhands',7.9,'Tim Burton',TO_DATE('14-12-1990','DD-MM-YYYY'),1);
INSERT INTO FILM VALUES(4,'Final Destination',6.7,'James Wong',TO_DATE('14-3-2000','DD-MM-YYYY'),3);
INSERT INTO FILM VALUES(5,'La vita e bella',8.6,'Roberto Benigni',TO_DATE('10-10-1997','DD-MM-YYYY'),3);

SELECT *
FROM FILM;

-- DIFUZARE

INSERT INTO DIFUZARE VALUES(1,2,TO_DATE('17-4-2019','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(1,1,TO_DATE('17-4-2019','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(3,2,TO_DATE('16-1-2019','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(2,2,TO_DATE('17-12-2018','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(5,1,TO_DATE('7-7-2009','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(1,5,TO_DATE('16-8-2018','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(5,3,TO_DATE('4-9-2019','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(3,3,TO_DATE('5-11-2022','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(4,3,TO_DATE('9-3-2017','DD-MM-YYYY'));
INSERT INTO DIFUZARE VALUES(1,3,TO_DATE('23-12-2022','DD-MM-YYYY'));

SELECT *
FROM DIFUZARE;

-- CLIENT

INSERT INTO CLIENT VALUES(1,'Ciobanu','Marius',0737485509);
INSERT INTO CLIENT VALUES(2,'Popescu','Flavius',0733685509);
INSERT INTO CLIENT VALUES(3,'Dragu','Daniel',0737000899);
INSERT INTO CLIENT VALUES(4,'Boltasu','Andreea',0787485009);
INSERT INTO CLIENT VALUES(5,'Lungu','Laurentiu',0735679509);
INSERT INTO CLIENT VALUES(6,'Lungu','Marian',0745469509);

SELECT *
FROM CLIENT;

-- BILET

INSERT INTO BILET VALUES(1,2,1,104,20);
INSERT INTO BILET VALUES(2,1,1,200,25);
INSERT INTO BILET VALUES(3,1,6,10,25);
INSERT INTO BILET VALUES(4,1,5,34,25);
INSERT INTO BILET VALUES(5,5,4,275,30);

SELECT *
FROM BILET;

-- ANGAJAT

INSERT INTO ANGAJAT VALUES(1,'Munteanu','Teodor','munteanu_teodor@gmail.com',4000,24,1);
INSERT INTO ANGAJAT VALUES(2,'Neamtu','Iulia','neamtu.iulia20@yahoo.com',2000,12,3);
INSERT INTO ANGAJAT VALUES(3,'Florea','Mariana','florea_mariana@yahoo.com',3000,13,5);
INSERT INTO ANGAJAT VALUES(4,'Badea','Liliana','badea.liliana3000@gmail.com',2000,6,4);
INSERT INTO ANGAJAT VALUES(5,'Stefanescu','Ion','stefanescu_ion@yahoo.com',2000,3,1);

SELECT *
FROM ANGAJAT;

-- CASIER

INSERT INTO CASIER VALUES(1,1);
INSERT INTO CASIER VALUES(2,2);
INSERT INTO CASIER VALUES(3,3);
INSERT INTO CASIER VALUES(4,1);
INSERT INTO CASIER VALUES(5,2);

SELECT *
FROM CASIER;

-- PLASATOR

INSERT INTO PLASATOR VALUES(1,'Zi');
INSERT INTO PLASATOR VALUES(2,'Noapte');
INSERT INTO PLASATOR VALUES(3,'Zi');
INSERT INTO PLASATOR VALUES(4,'Noapte');
INSERT INTO PLASATOR VALUES(5,'Noapte');

SELECT *
FROM PLASATOR;

INSERT INTO VANZATOR_POPCORN VALUES(1,40);
INSERT INTO VANZATOR_POPCORN VALUES(2,35);
INSERT INTO VANZATOR_POPCORN VALUES(3,38);
INSERT INTO VANZATOR_POPCORN VALUES(4,40);
INSERT INTO VANZATOR_POPCORN VALUES(5,30);

SELECT *
FROM VANZATOR_POPCORN;

-- CERINTA 6
--6.Definiti un subprogram stocat care sa utilizeze un tip de colectie studiat. Apelati subprogramul
--Definiti un subprogram stocat care primeste ca parametru numele unui regizor si afiseaza toate filmele
-- din baza de date regizate de acesta.Apelati subprogramul.

CREATE OR REPLACE PROCEDURE PROCEDURA_EX_6 (V_REGIZOR FILM.NUME_REGIZOR%TYPE)
    IS TYPE LISTA_FILM IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
    LISTA_FILME LISTA_FILM;
BEGIN
    SELECT DENUMIRE
    BULK COLLECT INTO LISTA_FILME
    FROM FILM
    WHERE NUME_REGIZOR=V_REGIZOR;
    
    FOR i IN LISTA_FILME.FIRST..LISTA_FILME.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('Filmul '||LISTA_FILME(i) || ' a fost regizat de ' || V_REGIZOR);
    END LOOP;
        
END PROCEDURA_EX_6;
/
BEGIN
    PROCEDURA_EX_6('Christopher Nolan');
END;
/

BEGIN
    PROCEDURA_EX_6('Tim Burton');
END;
/

-- CERINTA 7 
--7. Definiti un subprogram stocat care sa utilizeze un tip de cursor studiat. Apelati subprogramul.
-- Definiti un subprogram stocat care primeste ca parametru numele unui cinema si afiseaza numele, prenumele si salariul tuturor angajatilor sai.Apelati subprogramul.

CREATE OR REPLACE PROCEDURE PROCEDURA_EX_7 (V_DENUMIRE CINEMA.DENUMIRE%TYPE)
    IS 
    CURSOR c IS
    SELECT A.NUME,A.PRENUME, A.SALARIU
    FROM ANGAJAT A, CINEMA C
    WHERE A.ID_CINEMA = C.ID_CINEMA
    AND C.DENUMIRE = V_DENUMIRE;
BEGIN
    FOR i IN c LOOP
        DBMS_OUTPUT.PUT_LINE('In Cinema-ul '||V_DENUMIRE ||' este angajat '||INITCAP(i.NUME) || ' ' || INITCAP(i.PRENUME) || ' , care are salariul de ' || i.SALARIU || ' de lei' );
    END LOOP;
END PROCEDURA_EX_7;
/
BEGIN
    PROCEDURA_EX_7('Cinema City');
END;
/


--CERINTA 8
--8. Definiti un subprogram stocat de tip functie care sa utilizeze 3 dintre tabelele definite. Tratati toate 
--exceptiile care pot aparea. Apelati subprogramul astfel încât sa evidentiati toate cazurile tratate.

--Definiti un subprogram care primeste ca parametru numele unui client si intoarce filmul cu nota mai mare de 8 pe IMDB
--la care acesta si-a luat bilet.

CREATE OR REPLACE FUNCTION FUNCTIE_EX_8
( V_NUME CLIENT.NUME%TYPE )
RETURN VARCHAR IS
   V_NUME_FILM film.denumire%TYPE;
BEGIN

    SELECT F.DENUMIRE INTO V_NUME_FILM
    FROM CLIENT C, BILET B, FILM F 
    WHERE C.ID_CLIENT = B.ID_CLIENT
    AND B.ID_FILM = F.ID_FILM
    AND UPPER(C.NUME) = UPPER(V_NUME)
    AND F.NOTA_IMDB > 8;

    RETURN V_NUME_FILM;
    
    EXCEPTION
     WHEN NO_DATA_FOUND THEN
     RAISE_APPLICATION_ERROR(-20000,'Nu exista niciun client cu acest nume care a vizionat filme cu nota peste 8 pe IMDB!');
     WHEN TOO_MANY_ROWS THEN
     RAISE_APPLICATION_ERROR(-20001,'Exista mai multi clienti cu acest nume sau un client care a vizionat mai multe filme cu nota peste 8 pe IMDB!');
     WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
        
END FUNCTIE_EX_8;
/
BEGIN
 DBMS_OUTPUT.PUT_LINE('Filmul cu nota peste 8 pe IMDB vizionat de client este: ' || FUNCTIE_EX_8('Ciobanu'));
END;
/
BEGIN
 DBMS_OUTPUT.PUT_LINE('Filmul cu nota peste 8 pe IMDB vizionat de client este: ' || FUNCTIE_EX_8('Boltasu'));
END;
/
BEGIN
 DBMS_OUTPUT.PUT_LINE('Filmul cu nota peste 8 pe IMDB vizionat de client este: ' || FUNCTIE_EX_8('Ionescu'));
END;
/
BEGIN
 DBMS_OUTPUT.PUT_LINE('Filmul cu nota peste 8 pe IMDB vizionat de client este: ' || FUNCTIE_EX_8('Lungu'));
END;
/


-- CERINTA 9
--9. Definiti un subprogram stocat de tip procedura care sa utilizeze 5 dintre tabelele definite. Tratati toate 
--exceptiile care pot aparea. Apelati subprogramul astfel încât sa evidentiati toate cazurile tratate
-- Definiti un subprogram stocat de tip procedura care primeste ca parametru denumirea unui cinematograf si o data 
-- si afiseaza orasul in care se afla cinema-ul, denumirea filmului difuzat in acea data, distribuitorul acestuia si pretul biletului



CREATE OR REPLACE PROCEDURE PROCEDURA_EX_9 (V_DENUMIRE_CINEMA CINEMA.DENUMIRE%TYPE, V_DATA DIFUZARE.DATA_DIFUZARE%TYPE)
 IS 
 V_ORAS CINEMA.ORAS%TYPE;
 V_DENUMIRE_FILM FILM.DENUMIRE%TYPE;
 V_NUME_DISTRIBUITOR DISTRIBUITOR.DENUMIRE%TYPE;
 V_PRET BILET.PRET%TYPE;
BEGIN
    SELECT DISTINCT C.ORAS, F.DENUMIRE, DS.DENUMIRE,B.PRET  INTO V_ORAS,V_DENUMIRE_FILM,V_NUME_DISTRIBUITOR,V_PRET-- Folosim DISTINCT pentru ca putem avea mai multe bilete la acelasi film pe locuri diferite
    FROM FILM F, DIFUZARE D, CINEMA C, DISTRIBUITOR DS, BILET B
    WHERE F.ID_FILM = D.ID_FILM
    AND D.ID_CINEMA = C.ID_CINEMA
    AND DS.ID_DISTRIBUITOR = F.ID_DISTRIBUITOR
    AND B.ID_FILM = F.ID_FILM
    AND C.DENUMIRE = V_DENUMIRE_CINEMA
    AND D.DATA_DIFUZARE = V_DATA;
    
    DBMS_OUTPUT.PUT_LINE('In orasul ' || V_ORAS|| ' se difuzeaza filmul '||  V_DENUMIRE_FILM || ', distribuit de ' || V_NUME_DISTRIBUITOR || ' si are pretul biletului de ' || V_PRET ||' lei.' );
EXCEPTION
 WHEN NO_DATA_FOUND THEN 
 RAISE_APPLICATION_ERROR(-20001,'La aceasta data nu se difuzeaza niciun film la acest cinema');
 WHEN TOO_MANY_ROWS THEN
 RAISE_APPLICATION_ERROR(-20002,'La aceasta data la cinema se difuzeaza mai multe filme in acelasi timp!');
 WHEN OTHERS THEN
 RAISE_APPLICATION_ERROR(-20003,'Alta eroare!');
END PROCEDURA_EX_9;
/
BEGIN
 PROCEDURA_EX_9('Cinema City','16-AUG-18');
END;  
/
BEGIN
 PROCEDURA_EX_9('Cinema City','17-APR-19');
END;   
/

BEGIN
 PROCEDURA_EX_9('Cinema City','20-MAY-19');
END;   
/


-- CERINTA 10
--10. Definiti un trigger de tip LMD la nivel de comanda. Declan?ati trigger-ul.
--Definiti un trigger care sa nu permita inserarea unui film în tabela DIFUZARE in perioada 14.03.2020 - 20-06-2021, cinematografele fiind inchise din cauza pademiei.



CREATE OR REPLACE TRIGGER TRIGGER_EX_10
BEFORE INSERT ON DIFUZARE
BEGIN
    IF SYSDATE BETWEEN TO_DATE('14-03-2020','DD-MM-YYYY') AND TO_DATE('20-06-2021','DD-MM-YYYY') 
    THEN RAISE_APPLICATION_ERROR(-20001,'Cinematografele sunt inchise si nu pot fi difuzate filme!');
    END IF;
END;
/
INSERT INTO DIFUZARE VALUES(2,4,TO_DATE(SYSDATE));
/
DROP TRIGGER TRIGGER_EX_10;
/
--CERINTA 11
--11.Definiti un trigger de tip LMD la nivel de linie. Declansati trigger-ul.
-- Definiti un trigger de tip LMD la nivel de linie care sa nu permita marirea salariului cu 
--mai mult de 30% pentru angajatii cu vechime cel putin un an , respectiv 15% pentru angajatii 
--cu vechime mai mica de un an.

CREATE OR REPLACE TRIGGER TRIGGER_EX_11
 BEFORE UPDATE OF SALARIU ON ANGAJAT
 FOR EACH ROW
BEGIN
 IF  (:OLD.VECHIME < 12 AND :NEW.SALARIU>1.15 * :OLD.SALARIU) THEN
 RAISE_APPLICATION_ERROR(-20001,'Nu se poate mari salariul angajatului cu mai mult de 15%!');
 END IF;
 IF  (:OLD.VECHIME >= 12 AND :NEW.SALARIU>1.3 * :OLD.SALARIU) THEN
 RAISE_APPLICATION_ERROR(-20002,'Nu se poate mari salariul angajatului cu mai mult de 30%!');
 END IF;
END;
/
UPDATE ANGAJAT
SET SALARIU = SALARIU *1.17
WHERE VECHIME < 12;
/
UPDATE ANGAJAT
SET SALARIU = SALARIU * 3.1
WHERE VECHIME > = 12;
/

--CERINTA 12
--12. Definiti un trigger de tip LDD. Declansati trigger-ul.
-- Definiti un trigger de tip LDD care nu va permite stergerea tabelei DIFUZARE daca in tabela sunt inregistrate
-- 10 sau mai multe difuzari ale filmelor. Declansati trigger-ul!


CREATE OR REPLACE TRIGGER TRIGGER_EX_12
 BEFORE DROP ON SCHEMA
DECLARE 
NR_DIFUZARI NUMBER(10);
BEGIN
IF(SYS.DICTIONARY_OBJ_NAME='DIFUZARE') THEN

 SELECT COUNT(*) INTO NR_DIFUZARI
 FROM DIFUZARE;
 
 IF (NR_DIFUZARI)>=10 THEN
 RAISE_APPLICATION_ERROR(-20001,'Nu puteti efectua aceasta comanda pentru ca prea multe date ar fi pierdute!');
 END IF;
 
END IF;
END;
/

DROP TABLE DIFUZARE;
/
--CERINTA 13
--13. Definiti un pachet care sa contina toate obiectele definite în cadrul proiectului.


SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE PACHET_EX_13 AS

 PROCEDURE PROCEDURA_EX_6 (V_REGIZOR FILM.NUME_REGIZOR%TYPE);
 PROCEDURE PROCEDURA_EX_7 (V_DENUMIRE CINEMA.DENUMIRE%TYPE);
 FUNCTION FUNCTIE_EX_8( V_NUME CLIENT.NUME%TYPE ) RETURN VARCHAR;
 PROCEDURE PROCEDURA_EX_9 (V_DENUMIRE_CINEMA CINEMA.DENUMIRE%TYPE, V_DATA DIFUZARE.DATA_DIFUZARE%TYPE);
END PACHET_EX_13;
/
CREATE OR REPLACE PACKAGE BODY PACHET_EX_13 AS

     PROCEDURE PROCEDURA_EX_6 (V_REGIZOR FILM.NUME_REGIZOR%TYPE)
        IS TYPE LISTA_FILM IS TABLE OF VARCHAR2(50) INDEX BY PLS_INTEGER;
        LISTA_FILME LISTA_FILM;
    BEGIN
        SELECT DENUMIRE
        BULK COLLECT INTO LISTA_FILME
        FROM FILM
        WHERE NUME_REGIZOR=V_REGIZOR;
        
        FOR i IN LISTA_FILME.FIRST..LISTA_FILME.LAST LOOP
            DBMS_OUTPUT.PUT_LINE('Filmul '||LISTA_FILME(i) || ' a fost regizat de ' || V_REGIZOR);
        END LOOP;
            
    END PROCEDURA_EX_6;

    PROCEDURE PROCEDURA_EX_7 (V_DENUMIRE CINEMA.DENUMIRE%TYPE)
        IS 
        CURSOR c IS
        SELECT A.NUME,A.PRENUME, A.SALARIU
        FROM ANGAJAT A, CINEMA C
        WHERE A.ID_CINEMA = C.ID_CINEMA
        AND C.DENUMIRE = V_DENUMIRE;
    BEGIN
        FOR i IN c LOOP
            DBMS_OUTPUT.PUT_LINE('In Cinema-ul '||V_DENUMIRE ||' este angajat '||INITCAP(i.NUME) || ' ' || INITCAP(i.PRENUME) || ' , care are salariul de ' || i.SALARIU || ' de lei' );
        END LOOP;
    END PROCEDURA_EX_7;

     FUNCTION FUNCTIE_EX_8( V_NUME CLIENT.NUME%TYPE )
    RETURN VARCHAR IS
       V_NUME_FILM film.denumire%TYPE;
    BEGIN
    
        SELECT F.DENUMIRE INTO V_NUME_FILM
        FROM CLIENT C, BILET B, FILM F 
        WHERE C.ID_CLIENT = B.ID_CLIENT
        AND B.ID_FILM = F.ID_FILM
        AND UPPER(C.NUME) = UPPER(V_NUME)
        AND F.NOTA_IMDB > 8;
    
        RETURN V_NUME_FILM;
        
        EXCEPTION
         WHEN NO_DATA_FOUND THEN
         RAISE_APPLICATION_ERROR(-20000,'Nu exista niciun client cu acest nume care a vizionat filme cu nota peste 8 pe IMDB!');
         WHEN TOO_MANY_ROWS THEN
         RAISE_APPLICATION_ERROR(-20001,'Exista mai multi clienti cu acest nume sau un client care a vizionat mai multe filme cu nota peste 8 pe IMDB!');
         WHEN OTHERS THEN RAISE_APPLICATION_ERROR(-20002,'Alta eroare!');
            
    END FUNCTIE_EX_8;

     PROCEDURE PROCEDURA_EX_9 (V_DENUMIRE_CINEMA CINEMA.DENUMIRE%TYPE, V_DATA DIFUZARE.DATA_DIFUZARE%TYPE)
     IS 
     V_ORAS CINEMA.ORAS%TYPE;
     V_DENUMIRE_FILM FILM.DENUMIRE%TYPE;
     V_NUME_DISTRIBUITOR DISTRIBUITOR.DENUMIRE%TYPE;
     V_PRET BILET.PRET%TYPE;
    BEGIN
        SELECT DISTINCT C.ORAS, F.DENUMIRE, DS.DENUMIRE,B.PRET  INTO V_ORAS,V_DENUMIRE_FILM,V_NUME_DISTRIBUITOR,V_PRET-- Folosim DISTINCT pentru ca putem avea mai multe bilete la acelasi film pe locuri diferite
        FROM FILM F, DIFUZARE D, CINEMA C, DISTRIBUITOR DS, BILET B
        WHERE F.ID_FILM = D.ID_FILM
        AND D.ID_CINEMA = C.ID_CINEMA
        AND DS.ID_DISTRIBUITOR = F.ID_DISTRIBUITOR
        AND B.ID_FILM = F.ID_FILM
        AND C.DENUMIRE = V_DENUMIRE_CINEMA
        AND D.DATA_DIFUZARE = V_DATA;
        
        DBMS_OUTPUT.PUT_LINE('In orasul ' || V_ORAS|| ' se difuzeaza filmul '||  V_DENUMIRE_FILM || ', distribuit de ' || V_NUME_DISTRIBUITOR || ' si are pretul biletului de ' || V_PRET ||' lei.' );
    EXCEPTION
     WHEN NO_DATA_FOUND THEN 
     RAISE_APPLICATION_ERROR(-20001,'La aceasta data nu se difuzeaza niciun film la acest cinema');
     WHEN TOO_MANY_ROWS THEN
     RAISE_APPLICATION_ERROR(-20002,'La aceasta data la cinema se difuzeaza mai multe filme in acelasi timp!');
     WHEN OTHERS THEN
     RAISE_APPLICATION_ERROR(-20003,'Alta eroare!');
    END PROCEDURA_EX_9;

END PACHET_EX_13;
/
BEGIN
     PACHET_EX_13.PROCEDURA_EX_6('Christopher Nolan');
     
     PACHET_EX_13.PROCEDURA_EX_7('Cinema City');
     PACHET_EX_13.PROCEDURA_EX_7('Grand Cinema');
     
     PACHET13.PROCEDURA_EX_9('Cinema City','16-AUG-18');
     --PACHET_EX_13.PROCEDURA_EX_9('Cinema City','17-APR-19');
     --PACHET_EX_13.PROCEDURA_EX_9('Cinema City','20-MAY-19');
     
     DBMS_OUTPUT.PUT_LINE('Filmul cu nota peste 8 pe IMDB vizionat de client este: ' || PACHET_EX_13.FUNCTIE_EX_8('Boltasu'));
    -- DBMS_OUTPUT.PUT_LINE('Filmul cu nota peste 8 pe IMDB vizionat de client este: ' || PACHET_EX_13.FUNCTIE_EX_8('Ciobanu'));
    -- DBMS_OUTPUT.PUT_LINE('Filmul cu nota peste 8 pe IMDB vizionat de client este: ' || PACHET_EX_13.FUNCTIE_EX_8('Ionescu'));
          
END;
/

-- CERINTA 14

--14. Definiti un pachet care sa includa tipuri de date complexe si obiecte necesare pentru 
--actiuni integrate. 

-- Definiti un pachet care sa contina un vector de filme, un vector de distribuitori si o 
--procedura care primeste ca parametru denumirea unui film si afi?eaza data lansarii,
--distribuitorul si cota de piata a acestuia cu ajutorul vectorilor!



CREATE OR REPLACE PACKAGE PACHET_EX_14 AS

 TYPE FILM_TYPE IS RECORD(
 ID FILM.ID_FILM%TYPE,
 NUME FILM.DENUMIRE%TYPE,
 DATA FILM.DATA_LANSARE%TYPE
 );

FILM_OBJ FILM_TYPE;

TYPE DISTRIBUITOR_TYPE IS RECORD(
 ID DISTRIBUITOR.ID_DISTRIBUITOR%TYPE,
 NUME DISTRIBUITOR.DENUMIRE%TYPE,
  COTA_PIATA DISTRIBUITOR.COTA%TYPE );
 
DISTRIBUITOR_OBJ DISTRIBUITOR_TYPE;

NR_FILME NUMBER(10);
NR_DISTRIBUITORI NUMBER(10);

TYPE VECTOR_FILME IS VARRAY(100) OF FILM_TYPE;
VECTOR1 VECTOR_FILME:= VECTOR_FILME();

TYPE VECTOR_DISTRIBUITORI IS VARRAY(100) OF DISTRIBUITOR_TYPE;
VECTOR2 VECTOR_DISTRIBUITORI:= VECTOR_DISTRIBUITORI();

PROCEDURE PROCEDURA(V_DENUMIRE FILM.DENUMIRE%TYPE);
END PACHET_EX_14;
/



CREATE OR REPLACE PACKAGE BODY PACHET_EX_14 AS

    PROCEDURE PROCEDURA(V_DENUMIRE FILM.DENUMIRE%TYPE)
     IS 
     ID_FILM_OBJ FILM.ID_FILM%TYPE;
     ID_DISTRIBUITOR_OBJ DISTRIBUITOR.ID_DISTRIBUITOR%TYPE;

     
     BEGIN
         SELECT COUNT(*) INTO NR_FILME FROM FILM;
         
         FOR i IN 1..NR_FILME LOOP
         
             SELECT ID_FILM,DENUMIRE,DATA_LANSARE
             INTO FILM_OBJ
             FROM FILM
             WHERE ID_FILM=i;
             VECTOR1.EXTEND;
             VECTOR1(i):=FILM_OBJ;
         END LOOP;
    
    
            
                 
    SELECT COUNT(*) INTO NR_DISTRIBUITORI FROM DISTRIBUITOR;
    
         FOR i IN 1..NR_DISTRIBUITORI LOOP
             SELECT ID_DISTRIBUITOR,DENUMIRE,COTA
             INTO DISTRIBUITOR_OBJ
             FROM DISTRIBUITOR
             WHERE ID_DISTRIBUITOR=i;
             VECTOR2.EXTEND;
             VECTOR2(i):=DISTRIBUITOR_OBJ;
         END LOOP;
        
         SELECT ID_FILM,ID_DISTRIBUITOR
         INTO ID_FILM_OBJ,ID_DISTRIBUITOR_OBJ
         FROM FILM
         WHERE DENUMIRE=V_DENUMIRE;
         
         FOR i IN 1..NR_FILME LOOP
             IF(VECTOR1(i).ID=ID_FILM_OBJ) THEN
                DBMS_OUTPUT.PUT_LINE('Filmul '||V_DENUMIRE||' are data de lansare: '||VECTOR1(i).DATA || '.');
             END IF;
         END LOOP;
                 
         FOR i IN 1..NR_DISTRIBUITORI LOOP
             IF(VECTOR2(i).ID=ID_DISTRIBUITOR_OBJ) THEN
                DBMS_OUTPUT.PUT_LINE('Filmul '||V_DENUMIRE||' este distribuit de catre '|| INITCAP(VECTOR2(i).NUME) || ' , care are cota de piata ' || VECTOR2(i).COTA_PIATA ||'.');
             END IF;
         END LOOP;

 
     END PROCEDURA;
        
END PACHET_EX_14;
/
BEGIN
 PACHET_EX_14.PROCEDURA('Edward Scissorhands');
END;


