CREATE TABLE Personal_Detail(
  Aadhar_number VARCHAR(12) PRIMARY KEY,
  First_name VARCHAR(40),
  Last_name VARCHAR(40),
  DOB DATE,
  Sex VARCHAR(1),
  City VARCHAR(10),
  Locality VARCHAR(40),
  Phone VARCHAR(10),
  Email_ID VARCHAR(40)
);

INSERT INTO Personal_Detail VALUES("450503833533", "Gaurav","Kumawat",'1985-11-22',"M", "Alwar","Shanti Kunj", "7976829181","gauravkumawat@gmail.com" );
INSERT INTO Personal_Detail VALUES("890505836538", "Rahul","Kumar","1987-01-02","M", "Alwar","Manu Marg", "9352561922","RahulKumar@gmail.com" );
INSERT INTO Personal_Detail VALUES("945625552275", "Muskan","Sharma","2002-10-18","F", "Alwar","Kala Kaun", "8695242525","Muskansharma@gmail.com" );
INSERT INTO Personal_Detail VALUES("948582864845", "Aditya","Kumar","2010-12-28","M","Alwar","Kala Kuan", "8982989199","adityakumar@gmail.com");
INSERT INTO Personal_Detail VALUES("456891234566", "Priyanshu","Jain","2001-04-08","M","Alwar", "Shanti Kunj","5235452697","priyanshujain@gmail.com");
INSERT INTO Personal_Detail VALUES("625652145142", "Abhay","Khandelwal","2001-06-15","M","Alwar","Manu Marg","7989498199","abhaykandelwal@gmail.com");
INSERT INTO Personal_Detail VALUES("654582225265", "Seeta","Meena","1995-09-08","F","Alwar","Shivaji Park","9642564548","seetameena@gmail.com");                                              
INSERT INTO Personal_Detail VALUES("357586952569","Disha","Sharma","1996-12-09","F","Alwar","Shivaji Park","9562561255","dishasharma@gmail.com");
INSERT INTO Personal_Detail VALUES("665584896584","Jatin","Garg","1999-04-25","M","Alwar","Shivaji Park","69659655865","jatingarg@gmail.com");
INSERT INTO Personal_Deatil VALUES("565265695695", "Dhruv" ,"Mishra","1991-06-21","M","Alwar","Manu-Marg","6362562565","dhruvmishra@gmail.com");
INSERT INTO Personal_Detail VALUES("565256526565","Pragya","Sharma","2011-08-06","F","Alwar","Shanti Kunj","9656565676","pragysharma@gmail.com");

---------------------------------------------

CREATE TABLE Hospital (
    Hospital_ID INT PRIMARY KEY,
    Hospital_Name VARCHAR(40),
    Av_ICU_Beds INT,
    Av_Normal_Beds INT,
    Av_Oxygen_Cylinder INT,
    Hospital_City VARCHAR(40),
    Hospital_Locality VARCHAR(40),
    Hospital_Type VARCHAR(10),
    Phone VARCHAR(10)
);

INSERT INTO Hospital VALUES(10001,"Sethi Hospital",10,50,10,"Alwar", "Manu Marg","Child","123456789");
INSERT INTO Hospital VALUES(10002,"Solanki Hospital",20,100,20,"Alwar", "Shanti Kunj","General","9462624588");
INSERT INTO Hospital VALUES(10003,"Sania Hospital",5,20,10,"Alwar", "Shivaji Park","Female","89498288298");
INSERT INTO Hospital VALUES(10004,"Solanki Hospital",10,20,80,"Alwar", "Kala Kaun","General","9235635252");
INSERT INTO Hospital VALUES(10005,"Mittal Hospital",5,15,65,"Alwar","Shivaji Park","General","9829281878");
----------------------------------------------------------

CREATE TABLE Patient_Details (
    Patient_ID INT PRIMARY KEY,
    Aadhar_number VARCHAR(12),
    Hospital_ID INT,
    FOREIGN KEY(Aadhar_number) REFERENCES Personal_Detail(Aadhar_number) ON DELETE CASCADE,
    FOREIGN KEY(Hospital_ID) REFERENCES Hospital(Hospital_ID) ON DELETE CASCADE,
    Disease_Name VARCHAR(40),
    D_Status VARCHAR(20),
    Regitration_Date DATE
);

Insert into Patient_Details values(20001,"890505836538",10004,"COVID-19","Active",now());
Insert into Patient_Details values(20002,"450503833533",10002,"COVID-19","Active",'2021-09-25');
Insert into Patient_Details values(20003,"948582864845",10001,"COVID-19","Discharge","2020-09-25");
Insert into Patient_Details values(20004,"945625552275",10003,"COVID-19","Active","2021-08-22");
Insert into Patient_Details values(20005,"456891234566",10005,"COVID-19","Active","2021-05-16");

------------------------------------------------------

CREATE TABLE Vaccination_Center (
    Center_ID INT PRIMARY KEY,
    Center_Name VARCHAR(40),
    V_City VARCHAR(40),
    V_Locality VARCHAR(40),
    Phone VARCHAR(10)
);

insert into Vaccination_Center values(30001,"Maa Bhawani","Alwar", "Shivaji Park","456789123");

insert into Vaccination_Center values(30002,"Jai Durga","Alwar", "Manu-Marg","789456123");

insert into Vaccination_Center values(10001,"Sethi Hospital","Alwar","Manu Marg",
"123456789");
insert into Vaccination_Center values(10002,"Solanki Hospital","Alwar", "Shanti Kunj","9462624588");
----------------------------------------------------------------
Create table Vaccine(
    Vaccine_ID INT PRIMARY KEY,
    Vaccine_Name VARCHAR(40),
    Disease_Targetting VARCHAR(40),
    Required_Doses INT,
    Interval_btw_dose_days INT
);

insert into Vaccine values(40001,"COVAXIN","COVID-19",2,56);
insert into Vaccine values(40002,"COVO-SHIELD","COVID-19",2,84);
insert into Vaccine values(40003,"CORO-NIL","COVID-19",3,28); 
insert into Vaccine values(40004,"Pfizer-BioNTech","COVID-19",4,15);
insert into Vaccine values(40005,"Moderna","COVID-19",2,28);

--------------------------------------------------------------------

CREATE TABLE Center_Vaccine_reln(
    Relation_no int PRIMARY key,
    Center_ID INT,
    FOREIGN KEY(Center_ID) REFERENCES Vaccination_Center(Center_ID) ON DELETE CASCADE,
    Vaccine_ID INT,
    FOREIGN KEY(Vaccine_ID) REFERENCES Vaccine(Vaccine_ID) ON DELETE CASCADE,
    Quantity INT,
    Which_Dose INT
);

insert into Center_Vaccine_reln values(50001,30001,40001,100,1);
insert into Center_Vaccine_reln values(50002,30001,40001,100,2);

insert into Center_Vaccine_reln values(50003,30001,40002,100,1);
insert into Center_Vaccine_reln values(50004,30001,40002,100,2);

insert into Center_Vaccine_reln values(50005,30002,40003,50,1);
insert into Center_Vaccine_reln values(50006,30002,40003,50,2);
insert into Center_Vaccine_reln values(50007,30002,40003,50,3);

insert into Center_Vaccine_reln values(50007,10001,40005,25,1);
insert into Center_Vaccine_reln values(50007,10001,40005,25,2);


------------------------------------------------------------
CREATE TABLE Vaccine_Consumer(
    Customer_ID INT PRIMARY KEY,
    Aadhar_number VARCHAR(12),
    FOREIGN KEY(Aadhar_number) REFERENCES Personal_Detail(Aadhar_number) ON DELETE CASCADE,
    Vaccine_choosen INT,
    FOREIGN KEY(Vaccine_choosen) REFERENCES Vaccine(Vaccine_ID) ON DELETE CASCADE,
    Dose_taken INT,
    Dose_taken_Date Date
);

insert into Customer values(60001,"565256526565",40001,1,now());
insert into Customer values(60002,"565265695695",40003,0,now());
insert into Customer values(60003,"665584896584",40002,1,now());
insert into Customer values(60004,"357586952569",40003,1,now());
insert into Customer values(60005,"654582225265",40001,1,now());
insert into Customer values(60006,"625652145142",40003,3,now());


