SELECT S.StudentID,Surname,DegreeProgramme
FROM STUDENT S 
WHERE StudentID NOT IN (SELECT StudentID
                        FROM EVALUTAION_OF_DELIVERED_ASSIGNMENT E , 
                            ASSIGNMENT_TO_BE_DELIVERED A
                        WHERE E.Acode = A.ACode AND DeliveryDate > ScheduledExpirationDate)
        AND NOT EXISTS (SELECT *
                        FROM EVALUATION_OF_DELIVERED_ASSIGNMENT E
                        WHERE  E.StudentID = S.StudentID 
                            AND EXISTS (SELECT *
                                        FROM EVALUATION_OF_DELIVERED_ASSIGNMENT E2
                                        WHERE E1.StudentID <> E2.StudentID 
                                            AND E1.ACode = E2.ACode AND E2.Score > E1.Score));