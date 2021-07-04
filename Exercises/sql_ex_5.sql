SELECT SCode
FROM SEMINAR-CALENDAR
WHERE S-SSN IN (SELECT S-SSN
                FROM EXPERTISE
                GROUP BY S-SSN
                HAVING COUNT(*) = (SELECT MAX(X)
                                    FROM (SELECT COUNT(*)
                                        FROM EXPERTISE
                                        GROUP BY S-SSN) as T));