SELECT A.AuthorCode, Surname,Univertsity, TotalNumArticles,Edition,Conference
FROM AUTHOR A, (SELECT AuthorCode,Edition,Conference COUNT (ArticleCode) AS TotalNumArticles
                FROM AUTHORS_PRESENTS_ARTICLE
                GROUPING BY AuthorCode,Edition,Conference) AS TF
WHERE TF.AuthorCode = A.AuthorCode 
    AND A.AuthorCode NOT IN(SELECT AuthorCode
                            FROM AUTHORS_OF_ARTICLE AA, ARTICLE ART
                            WHERE ART.ArticleCode = AA.ArticleCode
                                     AND Title <> 'Data Mining');