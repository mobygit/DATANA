-- This exercise script is created by 
-- Nino Narido for any computer science related topics


-- Delete the Database "ccdb"
DROP Database ccdb;

-- Create a "ccdb" or call center database
CREATE DATABASE ccdb;

-- Truncate / purge the data in "ccdb" database 
TRUNCATE ccdb;

-- Display Databases
SHOW DATABASES;

-- Set to use the "ccdb" Database
USE ccdb;

-- Truncate / purge the data in "ccdb" database 
TRUNCATE table agent;

-- Create an "agent" table in "ccdb" 
create table `agent`
(
`callid` varchar(15) not null primary key,
`date` datetime not null,
`agent` varchar(64),
`dept` varchar(64),
`answrd` enum('Y','N'),
`rsolvd` enum('Y','N'),
`speedansr` int,
`avgtlkdur` time not null,
`satisrate` varchar(64),
`column1` varchar(64)
)
; 


-- Show description of the "agent" table
DESCRIBE agent;


-- Create a csv file as "ccdb.csv" with the information below 1,2,3 without the comment
/*
ID0001,01/01/2016 9:12,Diane,Washing Machine,Y,Y,109,0:02:23,3,FALSE
ID0002,01/01/2016 9:12,Becky,Air Conditioner,Y,N,70,0:04:02,3,FALSE
*/

-- Load script a data from an "employee.csv" file
LOAD DATA 
INFILE 'C:/Users/ninonarido/Documents/ccdb.csv' 
IGNORE INTO TABLE agent 
FIELDS terminated by ',' OPTIONALLY ENCLOSED BY '"' 
LINES terminated by '\r\n'
IGNORE 1 LINES
(callid, date, agent, dept, answrd, rsolvd, speedansr, avgtlkdur, satisrate, column1) 
SET date = STR_TO_DATE(date,'%d-%b-%y %H:%i:%s');


-- Display the records in agent table
--select * from agent;
  

-- Display the count records in agent table
select distinct count(*) from agent;
