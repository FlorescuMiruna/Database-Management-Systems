
--Exercitiul 1

-- cursoare clasice
/*
DECLARE
    v_nume JOBS.JOB_TITLE%TYPE;
  CURSOR C IS
  SELECT JOB_TITLE
  FROM JOBS;
BEGIN
  OPEN C;
  LOOP 
    FETCH C INTO V_NUME
    EXIT WHEN C%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('JOB: ' || V_NUME);
  END LOOP;
  CLOSE C;
END;
*/    


-- Cursoare cu subcereri
BEGIN
  FOR V_JOB IN ( SELECT JOB_ID, JOB_TITLE
                 FROM JOBS)               
  LOOP 
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    DBMS_OUTPUT.PUT_LINE ('JOB: '||V_JOB.JOB_TITLE);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    

   FOR V_EMP IN (SELECT LAST_NAME,SALARY
                 FROM EMPLOYEES
                 WHERE JOB_ID(+) = V_JOB.JOB_ID)
   LOOP
  /* IF V_EMP.SALARY IS NULL
   THEN 
    DBMS_OUTPUT.PUT_LINE ('Pe acest job nu lucreaza nimeni');
   ELSE */
    DBMS_OUTPUT.PUT_LINE (V_EMP.LAST_NAME || ' ' || V_EMP.SALARY);
   END LOOP;
          
  END LOOP;
END;

 
--Exercitiul 2


DECLARE
 NUMAR_ANGAJATI NUMBER(5):= 0; 
 SALARIU_MAXIM NUMBER(5) := 0;
BEGIN
  FOR V_JOB IN ( SELECT JOB_ID, JOB_TITLE
                 FROM JOBS)
                 
  LOOP 
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    DBMS_OUTPUT.PUT_LINE ('JOB: '||V_JOB.JOB_TITLE);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    
      NUMAR_ANGAJATI := 0;
      SALARIU_MAXIM := 0;
      
      
  
   FOR V_EMP IN (SELECT LAST_NAME,SALARY
                 FROM EMPLOYEES
                 WHERE JOB_ID(+) = V_JOB.JOB_ID)
   LOOP
    
    DBMS_OUTPUT.PUT_LINE (V_EMP.LAST_NAME || ' ' || V_EMP.SALARY);
    NUMAR_ANGAJATI := NUMAR_ANGAJATI + 1;
    
    IF  ( V_EMP.SALARY > SALARIU_MAXIM) 
    THEN SALARIU_MAXIM = V_EMP.SALARY;
    END IF;

   END LOOP;


    DBMS_OUTPUT.PUT_LINE ('NUMARUL ANGAJATILOR:' || NUMAR_ANGAJATI);

          
  END LOOP;
END;


--Exercitiul 4

DECLARE
 NUMAR_ANGAJATI NUMBER(5):= 0; 
 SALARIU_MAXIM NUMBER(5) := 0;
BEGIN
  FOR V_JOB IN ( SELECT JOB_ID, JOB_TITLE
                 FROM JOBS)
     
                 
  LOOP 
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    DBMS_OUTPUT.PUT_LINE ('JOB: '||V_JOB.JOB_TITLE);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    
      NUMAR_ANGAJATI := 0; 
   FOR V_EMP IN (SELECT *
                FROM(SELECT LAST_NAME,SALARY
                 FROM EMPLOYEES
                 WHERE JOB_ID(+) = V_JOB.JOB_ID
                 ORDER BY SALARY DESC
                 )
                WHERE ROWNUM <=5)
   LOOP

    DBMS_OUTPUT.PUT_LINE (V_EMP.LAST_NAME || ' ' || V_EMP.SALARY);
    NUMAR_ANGAJATI := NUMAR_ANGAJATI + 1;
    
   END LOOP;
   IF (NUMAR_ANGAJATI <5) THEN
      DBMS_OUTPUT.PUT_LINE('Acest Job are mai putin de 5 angajati');
    END IF;
          
  END LOOP;
END;

--Exercitiul 3

DECLARE
 
  SUMA_TOTALA NUMBER(5):= 0;
BEGIN


----------------

  FOR V_JOB IN ( SELECT JOB_ID, JOB_TITLE
                 FROM JOBS)
                              
  LOOP 
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    DBMS_OUTPUT.PUT_LINE ('JOB: '||V_JOB.JOB_TITLE);
    DBMS_OUTPUT.PUT_LINE('-------------------------------------');
    
   SUMA_TOTALA := 0;
   FOR V_EMP IN (SELECT LAST_NAME,SALARY
                 FROM EMPLOYEES
                 WHERE JOB_ID(+) = V_JOB.JOB_ID)
   LOOP
    SUMA_TOTALA := SUMA_TOTALA + V_EMP.SALARY;
    DBMS_OUTPUT.PUT_LINE (V_EMP.LAST_NAME || ' ' || V_EMP.SALARY);

   END LOOP;
          DBMS_OUTPUT.PUT_LINE ('Suma totala: ' || SUMA_TOTALA);
  END LOOP;
END;



