SELECT UserType, AVG(Evaluation)
FROM USER U, MOVIE M, EVALUATION E
WHERE U.SSN = E.SSN AND M.CodM = E.CodM AND MovieStudio = "Marvel"
GROUP BY UserType;

SELECT DISTINCT NameU, SurnameU, MAX(ItalianEvaluation)
FROM USER U, Evaluation E, MOVIE M, 
	(SELECT U.SSN, evaluation AS ItalianEvaluation
                          	FROM USER U, EVALUATION E, MOVIE M
                          WHERE M.language = "Italian" AND U.SSN = E.SSN AND M.CodM = E.CodM) AS IE
WHERE IE.SSN = U.SSN AND M.CodM = E.CodM AND E.SSN = U.SSN AND UserType = "Expert" 
    AND U.SSN NOT IN(SELECT SSN
                    FROM EVALUATION E, MOVIE M
                    WHERE Genre = "Horror" AND E.CodM = M.CodM)
    AND U.SSN IN(SELECT SSN
                FROM EVALUATION E, MOVIE M
                WHERE Genre = "Comedy" AND E.CodM = M.CodM
                GROUP BY SSN
                HAVING COUNT(*)>=3);
