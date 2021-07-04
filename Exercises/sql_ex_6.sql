SELECT C.TCode, HighestAverageCourse
FROM COURSE C, (SELECT TCode , MAX (AVGNumberStudent)
                FROM  (SELECT L1.CCode, TCode, AVG(AttendingStudent#) AS AVGNumberStudent
                        FROM COURSE C, LECTURE L
                        WHERE C.CCode = L.CCode
                        GROUP BY  L.CCode,TCode) as T) AS TF)
WHERE C.TCode = TF.TCode 
        AND T.TCode NOT IN (SELECT TCode
                            FROM COURSE
                            WHERE Topic <> 'Database');