SELECT Date, Evalutaion
FROM RATING
WHERE RATING.SSN = '$ssn' AND RATING.CodC = $codC
ORDER BY Date;

START TRANSACTION;
INSERT INTO USERS(SSN, Name, Surname, YearOfBirth)
VALUES ('$ssn','$name', '$surname', $year);
COMMIT;

START TRANSACTION;
INSERT INTO RATING (SSN, CodC, Date, Evalutaion)
VALUES ('$ssn',$codC,'$date',$evaluation);
COMMIT;