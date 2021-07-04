SELECT C.Name, CType, StartTime, (StartTime + Duration) AS EndTime,
          WeekDay, Clevel
FROM COURSE C, TRAINER T, SCHEDULE S
WHERE T.SSN = S.SSN AND S.CId = C.CId AND T.Name = '$name'
        AND WeekDay = '$day';