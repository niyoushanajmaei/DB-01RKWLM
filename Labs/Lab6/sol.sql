CREATE OR REPLACE TRIGGER UpdateSalaries
AFTER UPDATE OF DNAME ON DIP
FOR EACH ROW
WHEN (OLD.DNAME = 'ACCOUNTING' AND NEW.DNAME = 'SALES')
BEGIN 
    UPDATE IMP 
    SET SAL = SAL+100
    WHERE DEPTNO = :OLD.DEPTNO;
END;

CREATE OR REPLACE TRIGGER InsertOnINF
AFTER INSERT ON IMP
FOR EACH ROW 
DECLARE
    N Number;
    M Number;
BEGIN 

    SELECT COUNT(*) AS N
    FROM SUMMARY
    
    IF N=0 THEN 
        INSERT INTO SUMMARY(JOB, NUM)
        VALUES(:NEW.JOB,1);
    ELSE
        SELECT NUM AS M
        FROM SUMMARY
        WHERE JOB = :NEW.JOB;

        UPDATE SUMMARY
        SET NUM = M+1;
        WHERE JOB = :NEW.JOB;
    END IF;
END;

CREATE OR REPLACE TRIGGER UpdateOfINF
AFTER INSERT ON IMP
FOR EACH ROW
DECLARE 
    N Number;
    M Number;
BEGIN   
    SELECT COUNT(*) AS N
    FROM SUMMARY
    WHERE JOB = :NEW.JOB;
    
    IF N=0 THEN 
        INSERT INTO SUMMARY(JOB,NUM)
        VALUES(:NEW.JOB,1);
    ELSE
        UPDATE SUMMARY
        SET NUM = NUM+1
        WHERE JOB = :NEW.JOB;
    END IF;

    SELECT COUNT(*) AS M
    FROM SUMMARY;
    WHERE WHERE JOB= OLD.JOB;

    IF N=1 THEN 
        DELETE FROM SUMMARY
        WHERE JOB = :OLD.JOB;
    ELSE 
        UPDATE SUMMARY
        SET NUM = NUM-1
        WHERE JOB = :OLD.JOB
    END IF;

END;