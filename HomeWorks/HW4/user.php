
<HTML>
<head>
    <title> Insert User Result </title>
    <style type="text/css">
        #greenHeader{text-align:center;color:White;font-size:24 ; background-color:Green }
        #redHeader{text-align:center;color:White;font-size:24 ; background-color:Red}
        #greenPara{text-align:center;color:White;font-size:16;background:Green}
        #redPara{text-align:center;color:White;font-size:16;background:Red}    
    </style>
</head>
<body>
    <?php
    
        $ssn = $_GET["ssn"];
        $name = $_GET["name"];
        $surname = $_GET["surname"];
        $year = $_GET["year"];
        
        if(!$ssn || !$name || !$surname || !$year){
            die("Need to select an option.");
        }
        
        $year = (int)$year;

        if(!is_string($ssn) || !is_string($name) || !is_string($surname) || $year <= 0){
            die ("Error in input types");
        }

        $con = mysqli_connect('localhost','root','','multimedia');
        if(mysqli_connect_errno()){
            die("Error connecting to the database ".mysqli_connect_err());
        }

        $query1 = "SELECT SSN
                    FROM USERS
                    WHERE SSN = '$ssn'";

        $result1 = mysqli_query($con,$query1);

        if(!$result1){
            die("Error in sql query".mysqli_error($con));
        }else if(mysqli_num_rows($result1)>0){
            echo "<h id='redHeader'> Error! <br/> </h> ";
            echo "<p id='redPara'> insertion of course $ssn not successful. User already present in the database.</p>";
        }else{
            $query2 = "INSERT INTO Users(SSN,Name,Surname,YearOfBirth)
                        VALUES('$ssn','$name','$surname',$year)";

            $result2 = mysqli_query($con,$query2);

            if(!$result2){
                die("Error in sql query".mysqli_error($con));
            }else if($result2 == false){
                echo "Error in insertion query.";
            }else{
                echo "<h id='greenHeader'> Congragulations! <br/> </h>";
                echo "<p id='greenPara'> Insertion of course $ssn was successful. </p>";
            }
        }

        mysqli_close($con);

    ?>
</body>
</HTML>