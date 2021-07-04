CREATE OR REPLACE TRIGGER AcceptApplication
AFTER INSERT ON GRANT_APPLICATION
FOR EACH ROW
DECLARE
    S Number, N Number, T Number;
BEGIN

    SELECT COUNT(*) AS N
    FROM STUENT_RANKING
    WHERE STUDENT_RANKING.RegNum = :NEW.RegNum;

    --When an error is occured the rest of the body is not executed
    IF(N<>0)
        RAISE_APPLICATION_ERROR(-20500,'The Applicaiton cannot be executed');
    END IF;
    
    SELECT SUM(Credits) AS S
    FROM EXAM_REGISTREATION, COURSE
    WHERE S :NEW.RegNum = EXAM_REGISTRATION.RegNum
        AND COURSE.CourseCode = EXAM_REGISTRATION.CourseCode AND Score > 17;
    
    --Rollback
    IF(S<120)
        RAISE_APPLICATION_ERROR(-20500,'The Application Is Rejected');
    END IF;

    SELECT AVG(Score)/(YEAR(SYSDATE)-YearFirstEnrolement) AS T
    FROM EXAM_REGISTRATION,STUDENT
    WHERE EXAM_REGISTRATION.RegNum = STUDENT.RegNum AND STUDENT.RegNum = :NEW.RegNum;

    --We already managed the rejections
    INSERT INTO STUDENT_RANKING(RegNum, TotalPoints)
    VALUES(:NEW.RegNum,T);
    
END;

CREATE OR REPLACE TRIGGER AssignGrant
AFTER INSERT ON GRANT_AVAILABILITY
FOR EACH ROW
DECLARE
    RN Number,T Number, C Number, N Number;
BEGIN 

    SELECT Student.RegNum AS RN, MAX(TotalPoints) AS MaxTotalPoints
    FROM STUDENT_RANKING 
    GROUPING BY RN
    HAVING TotalPoints = MaxTotalPoints;

    SELECT SUM(TeachingHour)  AS T
    FROM GRANT_ASSIGNMENT
    WHERE RegNum = RN;

    SELECT COUNT(*) AS N
    FROM EXAM_REGISTRATION
    WHERE Score >=18 AND CourseCode = :NEW.CourseCode AND RegNum = RN 
            AND T + :NEW.TeachingHours <= 150;

    SELECT MAX(NOT#) AS C
    FROM NOTIFICATION;

    --Important
    IF(C IS NULL)
        C = 0;
    END IF;

    IF(N==0)
        INSERT INTO NOTIFICATION(Not#, Grant#, RegNum, Message)
        VALUES(C+1, :NEW.Grant#, NULL, "No Appropriate Applicant");
    END IF;

    IF(N<>0)
        INSERT INTO NOTIFICATION(Not#, Grant#, RegNum, Message)
        VALUES(C+1, :NEW.Grant#, RN, "Grant Was Assigned");
    END IF;

END;
