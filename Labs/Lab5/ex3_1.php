
<HTML>
<head>
    <title> Result 3-1 </title>
    <style type="text/css">
        #greenHeader{text-align:center;color:White;font-size:24 ; background-color:Green }
        #redHeader{text-align:center;color:White;font-size:24 ; background-color:Red}
    </style>
</head>
<body>
    <?php
    
        $cid = $_GET["CId"];
        $name = $_GET["Name"];
        $ctype = $_GET["Type"];
        $clevel = $_GET["Level"];
        
        if(!$name || !$cid || !$ctype || !$clevel){
            die("Need to select an option.");
        }
        
        $clevel = (int)$clevel;

        if(!is_string($cid) || !is_string($name) || !is_string($ctype) || $clevel <= 0){
            die ("Error in input types");
        }

        $con = mysqli_connect('localhost','root','','gym');
        if(mysqli_connect_errno()){
            die("Error connecting to the database ".mysqli_connect_err());
        }

        $query1 = "SELECT CId
                    FROM Course
                    WHERE CId = '$cid'";

        $result1 = mysqli_query($con,$query1);

        if(!$result1){
            die("Error in sql query".mysqli_error($con));
        }else if(mysqli_num_rows($result1)>0){
            echo "<h id='redHeader'> Error! <br/> </h> ";
            echo "<p id='redPara'> insertion of course $cid not successful. Course already present in the database.</p>";
        }else{
            $query2 = "INSERT INTO Course(CId,Name,Type,Level)
                        VALUES('$cid','$name','$ctype',$clevel)";

            $result2 = mysqli_query($con,$query2);

            if(!$result2){
                die("Error in sql query".mysqli_error($con));
            }else if($result2 == false){
                echo "Error in insertion query.";
            }else{
                echo "<h id='greenHeader'> Congragulations! <br/> </h>";
                echo "<p id='greenPara'> Insertion of course $cid was successful. </p>";
            }
        }

        mysqli_close($con);

    ?>
</body>
</HTML>