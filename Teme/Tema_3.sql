
--Exercitiul 1

--a) Valoarea variabilei numar în subbloc este: 2
--b) Valoarea variabilei mesaj1 în subbloc este: text 2
--c) Valoarea variabilei mesaj2 în subbloc este: text 3 adaugat in sub-bloc
--d) Valoarea variabilei numar în bloc este: 101 
--e) Valoarea variabilei mesaj1 în bloc este: text 1 adaugat un blocul principal
--f) Valoarea variabilei mesaj2 în bloc este: text 2 adaugat in blocul principal

DECLARE
numar number(3):=100;
mesaj1 varchar2(255):='text 1';
mesaj2 varchar2(255):='text 2';
BEGIN
 DECLARE
 numar number(3):=1;
 mesaj1 varchar2(255):='text 2';
 mesaj2 varchar2(255):='text 3';
  BEGIN
 numar:=numar+1;
 mesaj2:=mesaj2||' adaugat in sub-bloc';
 DBMS_OUTPUT.PUT_LINE(numar);
 DBMS_OUTPUT.PUT_LINE(mesaj1);
 DBMS_OUTPUT.PUT_LINE(mesaj2);
END;
 numar:=numar+1;
 mesaj1:=mesaj1||' adaugat un blocul principal';
 mesaj2:=mesaj2||' adaugat in blocul principal';
 
 DBMS_OUTPUT.PUT_LINE(numar);
 DBMS_OUTPUT.PUT_LINE(mesaj1);
 DBMS_OUTPUT.PUT_LINE(mesaj2);
END;



--Exercitiul 2


SELECT SUBSTR(BOOK_DATE,1,2) ZI,COUNT(*) "NUMAR IMPRUMUTURI"
FROM RENTAL
WHERE SUBSTR(BOOK_DATE,4,3) = 'OCT'
GROUP BY SUBSTR(BOOK_DATE,1,2);


--Exercitiul 3
DECLARE

 v_nume member.first_name%TYPE:='&p_nume';
 v_numar_filme NUMBER(8);

BEGIN
  DBMS_OUTPUT.PUT_LINE(v_nume);
  SELECT COUNT(M.MEMBER_ID) INTO v_numar_filme
  FROM MEMBER M, RENTAL R
  WHERE M.MEMBER_ID = R.MEMBER_ID
  AND M.FIRST_NAME = v_nume
  GROUP BY M.MEMBER_ID,M.FIRST_NAME,M.LAST_NAME;
  DBMS_OUTPUT.PUT_LINE(v_numar_filme);
END;