SELECT E1.Edition, EditionName, HighestAuthor
FROM EDITIONS_OF_CONFERENCES E1,(SELECT Edition,Conference, AuthorCode
                                FROM AUTHOR_PRESENTS_ARTICLE E
                                GROUP BY Edition,confernece, AuthorCode
                                HAVING COUNT(ArticleCode)  = (SELECT MAX(X)
                                                            FROM (SELECT Count(*) AS X     
                                                                FROM AUTHOR_PRESENTS_ARTICLE E2
                                                                WHERE E1.Edition = E2.Edition
                                                                GROUP BY AuthorCode) AS TF)
WHERE TF.Edition = E1.Edition  AND TF.Conference = E1.Conference
        AND Conference IN (SELECT Conference
                            FROM EDITIONS_OF_CONFERENCE E
                            GROUP BY Conference
                            HAVING COUNT(*) >=10)
GROUP BY E1.Edition,  EditionName;