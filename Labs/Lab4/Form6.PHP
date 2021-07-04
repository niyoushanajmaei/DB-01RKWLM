
<HTML>
<head><title> Result 6 </title></head>
<body>
    <?php

        function check_if_schedule_present($ssn,$day,$start){
            global $con;
            $query2 = "SELECT *
                        FROM Schedule
                        WHERE SSN='$ssn'  AND WeekDay='$day'
                            AND StartTime='$start' ";
            $result2 = mysqli_query($con,$query2);
            if(!$result2){
                die("Error in query2.<br/>".mysqli_error($con));
            }else if(mysqli_num_rows($result2)>0){
                die("Schedule already present in the database.");
            }
        }

        function check_if_room_free($day,$start,$duration,$room){
            global $con;
            $query3 = "SELECT *
                        FROM Schedule 
                        WHERE GymRoom = '$room' AND WeekDay ='$day' AND 
                        (str_to_date(StartTime,'%h:%i:%s') > sec_to_time(time_to_sec(str_to_date('$start','%h:%i')) + 
                        time_to_sec(str_to_date('$duration','%i'))) || sec_to_time(time_to_sec(str_to_date(StartTime,'%h:%i:%s')) 
                        + time_to_sec(str_to_date(Duration,'%i'))) < str_to_date('$start','%h:%i'))";
            $result3 = mysqli_query($con,$query3);
            if(!$result3){
                die("Error in query3.<br/>".mysqli_error($con));
            }else if(mysqli_num_rows($result3)>0){
                die("Gym Room busy during that time. ");
            }
        }

        function check_if_trainer_free($ssn,$day,$start,$duration){
            global $con;
            $query4 = "SELECT *
                        FROM Schedule 
                        WHERE SSN = '$ssn' AND WeekDay ='$day' AND 
                        (str_to_date(StartTime,'%h:%i:%s') > sec_to_time(time_to_sec(str_to_date('$start','%h:%i')) + 
                        time_to_sec(str_to_date('$duration','%i'))) || sec_to_time(time_to_sec(str_to_date(StartTime,'%h:%i:%s')) 
                        + time_to_sec(str_to_date(Duration,'%i'))) < str_to_date('$start','%h:%i'))";
            $result4 = mysqli_query($con,$query4);
            if(!$result4){
                die("Error in query4. <br/>".mysqli_error($con));
            }else if(mysqli_num_rows($result4)>0){
                die("Trainer busy during that time.");
            }
        }

        $ssn = $_GET["ssn"];
        $cid = $_GET["cid"];
        $day = $_GET["day"];
        $start = $_GET["start"];
        $duration = $_GET["duration"];
        $room = $_GET["room"];
        
        if(!$start || !$duration || !$room){
            die("Need to select an option.");
        }
        
        $duration = (int)$duration;

        if(!is_string($room) || $duration <= 0){
            die ("Error in input types");
        }

        if(!strtotime($start)){
            die("Error in input type of start time.");
        }

        $con = mysqli_connect('localhost','root','','gym');
        if(mysqli_connect_errno()){
            die("Error connecting to the database ".mysqli_connect_err());
        }

        check_if_schedule_present($ssn,$day,$start);
        check_if_room_free($day,$start,$duration,$room);
        check_if_trainer_free($ssn,$day,$start,$duration);

        $query1 = "INSERT INTO Schedule(SSN,CId,WeekDay,StartTime,Duration,GymRoom)
                    VALUES('$ssn','$cid','$day','$start','$duration','$room')";

        $result1 = mysqli_query($con,$query1);

        if(!$result1){
            die("Error in sql query".mysqli_error($con));
        }else if($result1==false){
            echo "Error in insertion query.";
        }else{
            echo "Insertion successful.";
        }

        mysqli_close($con);

    ?>
</body>
</HTML>