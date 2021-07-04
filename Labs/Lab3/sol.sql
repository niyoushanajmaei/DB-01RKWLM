SELECT DELIVERERID
FROM PENALTIES
GROUP BY DELIVERERID
HAVING COUNT(*) = (SELECT MAX(COUNT(*))
                    FROM PENALTIES
                    GROUP BY DELIVERERID);
                    
SELECT DISTINCT DELIVERERID
FROM COMPANYDEL 
WHERE DELIVERERID <> 57 AND DELIVERERID NOT IN (SELECT DELIVERERID
                                                FROM COMPANYDEL 
                                                WHERE COMPANYID NOT IN 
                                                (SELECT COMPANYID
                                                    FROM COMPANYDEL
                                                    WHERE DELIVERERID = 57));
                                                    
                                                                    
SELECT DISTINCT DELIVERERID
FROM COMPANYDEL 
WHERE DELIVERERID <> 57 AND DELIVERERID NOT IN (SELECT DELIVERERID
                                                FROM COMPANYDEL 
                                                WHERE COMPANYID NOT IN 
                                                (SELECT COMPANYID
                                                    FROM COMPANYDEL
                                                    WHERE DELIVERERID = 57))
GROUP BY COMPANYID, DELIVERERID
HAVING COUNT(*) = (SELECT COUNT(*)
                    FROM COMPANYDEL
                    WHERE DELIVERERID = 57);
                            
    
SELECT DISTINCT DELIVERERID, MIN(DATA), MAX(DATA)
FROM PENALTIES
GROUP BY DELIVERERID
HAVING COUNT(*)>=2;

SELECT DELIVERERID, DATA, AMOUNT
FROM PENALTIES P1
WHERE DATA = (SELECT MAX(DATA)
                FROM PENALTIES P2
                WHERE P1.DELIVERERID = P2.DELIVERERID);
                
SELECT DISTINCT COMPANYID
FROM COMPANYDEL
GROUP BY COMPANYID
HAVING COUNT(*) > (SELECT 0.3 * COUNT(*)
                        FROM DELIVERERS);

                