SELECT T.SSN, Name, Surname
From TRAINER T, GROUP_LESSON G
WHERE T.SSN = G.SSN AND G.CodG IN (SELECT CodG
                    FROM GYM
                    WHERE City = 'Turin')
GROUP BY T.SSN, Name,Surname
HAVING COUNT(DISTINCT CodG)>=3 ;

SELECT G1.CodG, SUM(ParticipantsNumber)
FROM GYM G1, GROUP_LESSON GL1
WHERE G1.CodG = GL1.CodG AND G1.CodG IN (SELECT CodG
                                        FROM GROUP_LESSON GL2, SPECIALTY S
                                        WHERE NameS = "Karate" AND S.CodS = GL2.CodS
                                        GROUP BY CodG
                                        HAVING COUNT(*)>10)
GROUP BY SSN,G1.CodG;


SELECT Name, Surname, NumberOfSpecialities
FROM TRAINER T1, GYM G1 ,(SELECT T.SSN, COUNT(DISTINCT CodS) AS NumberOfSpecialities
                             FROM trainer T, group_lesson GL
                            WHERE T.SSN = GL.SSN
                         GROUP BY T.SSN) AS NS
WHERE NS.SSN = T1.SSN AND T1.City = G1.City
GROUP BY T1.SSN, Name, Surname
HAVING COUNT(G1.CodG) = (SELECT COUNT(DISTINCT G2.CodG)
                           FROM TRAINER T2, GYM G2, group_lesson GL
                           WHERE T2.SSN = T1.SSN AND T2.SSN = GL.SSN AND G2.CodG = GL.CodG
                                  AND G2.City = T2.City );
SELECT Name, Surname
FROM TRAINER T1, GYM G1 
WHERE T1.City = G1.City
GROUP BY T1.SSN, Name, Surname
HAVING COUNT(G1.CodG) = (SELECT COUNT(DISTINCT G2.CodG)
                           FROM TRAINER T2, GYM G2, group_lesson GL
                           WHERE T2.SSN = T1.SSN AND T2.SSN = GL.SSN AND G2.CodG = GL.CodG
                                  AND G2.City = T2.City );
