/* 1 */
SELECT * FROM deliverers;

/* 2 */
SELECT DISTINCT COMPANYID 
FROM companydel; 

/* 3 */
SELECT NAME,DELIVERERID
FROM DELIVERERS
WHERE NAME LIKE 'B%';

/* 4 */
SELECT name, sex, delivererid
FROM deliverers
WHERE Phoneno <> 8467 OR phoneno IS NULL;

/* 5 */
SELECT DISTINCT name, town
FROM deliverers d, penalties p
WHERE p.delivererid = d.delivererid;

/* 6 */
SELECT DISTINCT name,initials
FROM penalties P, deliverers d, companies C
WHERE c.delivererid = d.delivererid AND p.delivererid = d.delivererid AND 
    p.data > TO_DATE('31/12/1980','DD/MM/YYYY') 
ORDER BY name;

/* 7 */ 
SELECT cd.delivererid,companyid
FROM companydel CD, DEliverers D
WHERE numdeliveries >=1 AND numcollections >= 2 AND town = 'Stratford' 
    AND cd.delivererid = d.delivererid;

/* 8 */
SELECT d.delivererid
FROM deliverers D, companydel CD
WHERE D.YEAR_OF_BIRTH > 1962 AND D.delivererid = CD.delivererid 
    AND  EXISTS (SELECT * 
                FROM companies C
                WHERE C.companyid = cd.companyid AND mandate = 'first')
ORDER BY D.delivererid DESC;

/* 9 */
SELECT DISTINCT name
FROM deliverers D, companydel CD
WHERE d.delivererid = cd.delivererid 
    AND (town = 'Inglewood' OR town = 'Stratford')
GROUP BY cd.delivererid, name  /* shouldn't forget name here */
HAVING COUNT(*) >= 2;

/* 10 */
SELECT p.delivererid, SUM(AMOUNT)
FROM deliverers d,penalties p
WHERE d.delivererid = p.delivererid AND town = 'Inglewood' 
GROUP BY p.delivererid
HAVING COUNT(*)>=2;

/* 11 */
SELECT DISTINCT name, MIN(AMOUNT)
FROM deliverers d, penalties p
WHERE d.delivererid = p.delivererid 
GROUP BY p.delivererid, name
HAVING COUNT(*) >= 2 AND COUNT(*) <= 4;

/* 12 */
SELECT SUM(numdeliveries), SUM(numcollections)
FROM deliverers d, companydel cd
WHERE d.delivererid = cd.delivererid AND town <> 'Stratford' AND name LIKE 'B%'

