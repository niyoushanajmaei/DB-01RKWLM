
<HTML>
<head><title> Result 2 </title></head>
<body>
    <?php
        
        function print_result_table($result){
            echo "<table width='500' border='1'>";
            print_result_header($result);
            print_result_data($result);
            echo "</table>";
        }

        function print_result_header($result){
            echo "<tr>";
            for($i=0;$i<mysqli_num_fields($result);$i++){
                echo "<td>";
                $title = mysqli_fetch_field($result); 
                echo $title->name;
                echo "</td>";
            }
            echo "</tr>";
        }
        
        function print_result_data($result){
            while($row = mysqli_fetch_row($result)){
                echo "<tr>";
                foreach($row as $cell){
                    echo "<td>". $cell ."</td>";
                }
                echo "</tr>";
            }
        }
        

        //checking input
        if(!is_string($_GET["courseCode"])){
            die("Invalid input");
        }

        $courseCode = $_GET["courseCode"];

        
        $con = mysqli_connect('localhost','root','','gym');
        if(mysqli_connect_errno()){
            die("Error connecting to the database ".mysqli_connect_err());
        }

        $query = "SELECT *
                    FROM course
                    WHERE CId='$courseCode'";

        $result = mysqli_query($con,$query);

        if(!$result){
            die ("Error in sql query ".mysqli_error($con));
        }
        
        if(mysqli_num_rows($result)>0){
            print_result_table($result);
        }else{
            echo "No such Course found.";
        }
        

        mysqli_close($con);
    ?>
</body>
</HTML>