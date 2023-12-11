##############################
###### Training Dataset ######
##############################

-- create database to store timeseries training and testing datasets
Create DATABASE dervico;


-- table storing training data
create table dervico.training_raw (
		EventTime timestamp primary key,
        Measure int, 
        Class varchar(50)
        );
ALTER TABLE dervico.training_raw ADD UNIQUE (EventTime); -- Handling of potential null values

describe dervico.training_raw;

-- Importing testing data into testing raw
LOAD DATA INFILE '/ProgramData/MySQL/MySQL Server 8.0/Uploads/training.csv' #<path>
INTO TABLE dervico.training_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1, Measure, Class) -- Handling timestamp csv formatting noise
SET EventTime = STR_TO_DATE(CONCAT(@var1, ':00'), '%m/%d/%Y %H:%i:%s');

##############################
###### Training Dataset ######
##############################

-- Testing dataset Table Creation
create table dervico.testing_raw (
		EventTime timestamp primary key,
        Measure int, 
        Class varchar(50)
        );
ALTER TABLE dervico.testing_raw ADD UNIQUE (EventTime); -- Handling potential null values

describe dervico.testing_raw;	

-- Importing testing dataset
LOAD DATA INFILE '/ProgramData/MySQL/MySQL Server 8.0/Uploads/testing.csv'
INTO TABLE dervico.testing_raw
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(@var1, @varMeasure, @varClass)
SET 
    EventTime = IF(@var1 = '', NULL, STR_TO_DATE(@var1, '%Y-%m-%d %H:%i:%s')),
    Measure = COALESCE(NULLIF(@varMeasure, ''), 0),
    Class = COALESCE(NULLIF(@varClass, ''), NULL); -- Addressing csv format nuances to ensure data quality




