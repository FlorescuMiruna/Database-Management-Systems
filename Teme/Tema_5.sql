
--Exercitiul 1

DECLARE
 
TYPE tablou_indexat_ID IS TABLE OF  EMP_FLR.EMPLOYEE_ID%TYPE;
TYPE tablou_indexat_salariu IS TABLE OF EMP_FLR.SALARY%TYPE;

coduri tablou_indexat_ID;
salarii tablou_indexat_salariu;

BEGIN

       
   SELECT EMPLOYEE_ID, SALARY BULK COLLECT INTO coduri,salarii
        FROM (SELECT *
              FROM EMP_FLR
              WHERE COMMISSION_PCT IS NULL
              ORDER BY SALARY)
      WHERE ROWNUM <= 5;
      
    DBMS_OUTPUT.PUT_LINE('Tabloul are ' || coduri.COUNT ||' elemente.');
    

 FORALL i IN coduri.FIRST..coduri.LAST
    UPDATE EMP_FLR SET SALARY = SALARY * 1.05
 WHERE employee_id = coduri (i);

  FOR i IN salarii.FIRST..salarii.LAST LOOP
    DBMS_OUTPUT.PUT_LINE('Salariu: codurialoarea codurieche: ' || salarii(i) || ' codurialoarea noua: ' || salarii(i)*1.05);
  END LOOP;
 
END;

rollback;

--Exercitiul 2
CREATE OR REPLACE TYPE TIP_ORASE_FLR AS VARRAY(10) OF VARCHAR(20);

CREATE TABLE EXCURSIE_FLR (COD_EXCURSIE NUMBER(4),
DENUMIRE VARCHAR2(20),
 ORASE TIP_ORASE_FLR);

DECLARE
 v_orase1  TIP_ORASE_FLR:= TIP_ORASE_FLR('Bucuresti','Cluj','Timisoara');
 v_orase2  TIP_ORASE_FLR:= TIP_ORASE_FLR('Galati','Iasi','Bacau');
 v_lista EXCURSIE_FLR.orase%TYPE;
BEGIN

-- cerinta a
 INSERT INTO EXCURSIE_FLR
 VALUES (1, 'Excursie1', v_orase1);

 
  INSERT INTO EXCURSIE_FLR
 VALUES (2, 'Excursie2', v_orase2);
 
   INSERT INTO EXCURSIE_FLR
 VALUES (3, 'Excursie3', null);
 
    INSERT INTO EXCURSIE_FLR
 VALUES (4, 'Excursie4', null);

 
 INSERT INTO EXCURSIE_FLR
 VALUES (5, 'Excursie5', TIP_ORASE_FLR('Targu Jiu','Craiova','Valcea'));

--cerinta b
/*
UPDATE EXCURSIE_FLR
SET TIP_ORASE_FLR =  TIP_ORASE_FLR('Targu Jiu','Craiova','Valcea')
WHERE COD_EXCURSIE = 1;
*/

SELECT 
END;

DROP TABLE EXCURSIE_FLR;
FROM EXCURSIE_FLR;