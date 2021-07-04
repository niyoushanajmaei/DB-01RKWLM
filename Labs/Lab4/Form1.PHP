<HTML>
<head> <title> Result 1</title> </head>
<body>
    <?php 
        //checking inputs
        if (!is_string($_GET["name"]) || !is_string($_GET["surname"])){
            die("inputs are not strings")
        }

        $name = $_GET["name"]
        $surname = $_GET["surname"]

        $con = mysqli_connect('localhost','new','new','gym');
        if (mysqli_connect_errorno()){
            die ("Error connecting to the database ". mysqli_connect_error())
        }
        
        $query = "SELECT SSN
                    FROM Trainer
                    WHERE Name = '$name' AND Surname = '$surname' "

        $result = mysqli_query($con,$query)
        if(!$result){
            die("Error in the query" . mysqli_error($con))
        }

        if (mysqli_num_rows >0){
            echo "$name $surname is a trainer"
        }
        
        mysqli_close($con)
    ?>
</body>
</HTML>