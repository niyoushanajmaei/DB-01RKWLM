SET storage_engine = InnoDB;
SET FOREIGN_KEY_CHECKS = 1;
use GYM;

INSERT INTO TRAINER (SSN, Name, Surname, DateOfBirth, Email)
		VALUES ('SSN1','Paul','Smith',Str_to_date('01/01/2020', '%d/%m/%y'),'p.smith@gym.it');
INSERT INTO TRAINER (SSN, Name, Surname, DateOfBirth, Email, PhoneNo)
		VALUES ('SSN2','John','Johnson',Str_to_date('01/01/2020', '%d/%m/%y'),'j.johnson@gym.it','pn');
INSERT INTO TRAINER (SSN, Name, Surname, DateOfBirth, Email, PhoneNo)
		VALUES ('SSN3','Paul','Johnson',Str_to_date('01/01/2020', '%d/%m/%y'),'p.johnson@gym.it','pn');

INSERT INTO COURSE (CId,Name, Type, Level)
	VALUES ('CID1','Spinning','Spinning',1);
INSERT INTO COURSE (CId,Name, Type,Level)
	VALUES ('CID2','Fit','Music activity',2);
INSERT INTO COURSE (CId,Name, Type,Level)
	VALUES ('CID3','Advanced Spinning','Spinning',4);

INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SSN1",'Monday',"10:00",45,"CID1",'R1');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SSN1",'Tuesday',"11:00",45,"CID1",'R1');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SSN1",'Tuesday',"15:00",45,"CID1",'R2');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SSN2",'Monday',"10:00",30,"CID2",'R2');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SSN2",'Monday',"11:30",30,"CID3",'R2');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SSN2",'Wednesday',"10:00",60,"CID3",'R1');

