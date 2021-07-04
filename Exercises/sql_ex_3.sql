SELECT S.StudentID,Surname,COUNT(ACode) AS TotalAssignments, 
        AVG(Score) AS AverageScore, COUNT (DISTINCT TeacherID) AS TotalTeachers
FROM STUDENT S, EVALUTAION_OF_DELIVERED_ASSIGNMENT E
WHERE S.StudentID = E.StudentID AND S.StudentID IN (SELECT StudentID
                                                    FROM EVALUTAION_OF_DELIVERED_ASSIGNMENT E
                                                    WHERE Score > 4
                                                    GROUP BY StudentID,Surname
                                                    HAVING COUNT(*)  >=3)
group by S.StudentId;
