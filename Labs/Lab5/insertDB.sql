SET storage_engine = InnoDB;
SET FOREIGN_KEY_CHECKS = 1;
use GYM;

INSERT INTO TRAINER (SSN, Name, Surname, DateOfBirth, Email)
		VALUES ('SMTPLA80N31B791Z','Paul','Smith',Str_to_date('31/12/1980', '%d/%m/%y'),'p.smith@gym.it');
INSERT INTO TRAINER (SSN, Name, Surname, DateOfBirth, Email, PhoneNo)
		VALUES ('KHNJHN81E30C455Y','John','Johnson',Str_to_date('30/5/1981 ', '%d/%m/%y'),'j.johnson@gym.it','+2300110303444');
INSERT INTO TRAINER (SSN, Name, Surname, DateOfBirth, Email, PhoneNo)
		VALUES ('AAAGGG83E30C445A','Paul','Johnson',Str_to_date('30/5/1981', '%d/%m/%y'),'p.johnson@gym.it','+2300110303444');

INSERT INTO COURSE (CId,Name, Type, Level)
	VALUES ('CT100',' Spinning for beginners','Spinning',1);
INSERT INTO COURSE (CId,Name, Type,Level)
	VALUES ('CT101','Fitdancing','Music',2);
INSERT INTO COURSE (CId,Name, Type,Level)
	VALUES ('CT104','Advanced Spinning','Spinning',4);

INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SMTPLA80N31B791Z ",'Monday',"10:00",45,"CT100",'R1');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SMTPLA80N31B791Z ",'Tuesday',"11:00",45,"CT100",'R1');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("SMTPLA80N31B791Z ",'Tuesday',"15:00",45,"CT100",'R2');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("KHNJHN81E30C455Y",'Monday',"10:00",30,"CT101",'R2');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("KHNJHN81E30C455Y",'Monday',"11:30",30,"CT104",'R2');
INSERT INTO SCHEDULE(SSN,Day,StartTime,Duration,CId,GymRoom)
	VALUES("KHNJHN81E30C455Y",'Wednesday',"9:00",60,"CT104",'R1');

