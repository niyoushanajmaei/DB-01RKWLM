
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
        $codC = $_GET["codC"];
        $date = $_GET["date"];
        $evaluation = $_GET["evaluation"];
        
        if(!$ssn || !$codC || !$date || !$evaluation){
            die("Need to select an option.");
        }
        
        $evaluation = (int)$evaluation;
        $codC = (int)$codC;

        if (!preg_match("^[0-9]{4}-[0-1][0-9]-[0-3][0-9]^",$date)){
            die("Error in Date Format");
        }

        if(!is_string($ssn) || !is_string($date) || $evaluation <= 0 || $evaluation >= 11 || $codC <=0){
            die ("Error in input types");
        }

        $con = mysqli_connect('localhost','root','','multimedia');
        if(mysqli_connect_errno()){
            die("Error connecting to the database ".mysqli_connect_err());
        }

        $query1 = "SELECT SSN
                    FROM RATING
                    WHERE SSN = '$ssn' && CodC = $codC && Date = '$date'";

        $result1 = mysqli_query($con,$query1);

        if(!$result1){
            die("Error in sql query".mysqli_error($con));
        }else if(mysqli_num_rows($result1)>0){
            echo "<h id='redHeader'> Error! <br/> </h> ";
            echo "<p id='redPara'> insertion of the rating not successful. A rating already present for that (SSN,CodC,Date) in the database.</p>";
        }else{
            $query2 = "INSERT INTO RATING(SSN,CodC,Date,Evalutaion)
                        VALUES('$ssn','$codC','$date',$evaluation)";

            $result2 = mysqli_query($con,$query2);

            if(!$result2){
                die("Error in sql query".mysqli_error($con));
            }else if($result2 == false){
                echo "Error in insertion query.";
            }else{
                echo "<h id='greenHeader'> Congragulations! <br/> </h>";
                echo "<p id='greenPara'> Insertion of the rating was successful. </p>";
            }
        }

        mysqli_close($con);

    ?>
</body>
</HTML>