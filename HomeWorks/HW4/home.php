<?php
    if($_GET["action"] == "insert_user"){
        Header ("Location: insert_user.html");
        exit();
    }else if($_GET["action"] == "insert_rating"){
        Header ("Location: insert_rating.html");
        exit();
    }else if($_GET["action"] == "query"){
        Header ("Location: query.php");
        exit();
    }
?>