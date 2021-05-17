--Exercitiul 3

CREATE OR REPLACE FUNCTION NUMAR_ANGAJATI_FLR
( v_oras LOCATIONS.CITY%TYPE DEFAULT 'Seattle')
RETURN NUMBER IS
   numar_angajati NUMBER(4);
   BEGIN
    SELECT COUNT(*) INTO numar_angajati
    FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
    WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID 
    AND D.LOCATION_ID = L.LOCATION_ID
    AND EMPLOYEE_ID IN ( SELECT EMPLOYEE_ID
                         FROM JOB_HISTORY
                         GROUP BY EMPLOYEE_ID
                         HAVING COUNT(EMPLOYEE_ID) >= 2)
    AND L.CITY = v_oras
    HAVING COUNT(*) >0;
    
    
    RETURN numar_angajati;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Orasul dat ca parametru nu exista sau in orasul dat nu lucreaza niciun angajat.');
    
END NUMAR_ANGAJATI_FLR;
   

BEGIN
 DBMS_OUTPUT.PUT_LINE('Numarul de angajati este: '|| NUMAR_ANGAJATI_FLR);
END;

BEGIN
 DBMS_OUTPUT.PUT_LINE('Numarul de angajati este: '|| NUMAR_ANGAJATI_FLR('Oxford'));
END;

BEGIN
 DBMS_OUTPUT.PUT_LINE('Numarul de angajati este: '|| NUMAR_ANGAJATI_FLR('Oxfordd'));
END;

BEGIN
 DBMS_OUTPUT.PUT_LINE('Numarul de angajati este: '|| NUMAR_ANGAJATI_FLR('Roma'));
END;