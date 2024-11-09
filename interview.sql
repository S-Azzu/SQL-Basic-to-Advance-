CREATE DATABASE INTERVIEW;
USE INTERVIEW;

CREATE TABLE QUESTIONS(ID INT PRIMARY KEY,
                       NAME VARCHAR(50),
                       SURNAME VARCHAR(30),
                       MARKS INT,
                       DATE_OF_BIRTH DATE);
INSERT INTO QUESTIONS(ID,NAME,SURNAME,MARKS,DATE_OF_BIRTH,AGE) VALUES(1,"AZZU","SHAIK",80,"2002-01-03"),
																     (2,"BHANU","YADAV",88,"2003-07-21"),
																     (3,"SRUTHI","KAMMARI",90,"2002-03-24"),
																	 (4,"ASMA","SHAIK",90,"2002-04-25"),
																	 (5,"NEHA","SHAIK",88,"2002-05-27");
CREATE TABLE HR(ID INT  PRIMARY KEY,
                 NAME VARCHAR(50),
                 YEARS_EXP INT,
                 SALARY INT);
                 
INSERT INTO HR(ID,NAME,YEARS_EXP,SALARY)VALUES(1,"ROE",5,50000),
                                              (2,"JOE",10,30000),
                                              (3,"MARK",3,35000),
                                              (4,"RIO",4,60000),
                                              (5,"ZUCKENBERG",4,80000);
                                              
-- BASIC QUESTIONS FOR SQL


SELECT * FROM  QUESTIONS; 

 -- 1. DROP DATABASE IF EXISTS
 
 DROP DATABASE IF EXISTS INTERVIEW; 
 
 -- 2.DROP TABLE IF EXISTS
 
 DROP TABLE IF EXISTS questions;
 
 -- 3.DELETE TABLE 
 
 DELETE FROM QUESTIONS;
 
 -- 4.DELETE TABLE BASED ON WHERE CONDITION
 
 DELETE FROM QUESTIONS 
 WHERE NAME ="AZZU";
 
 -- 5.TRUNCATE TABLE
 
 TRUNCATE TABLE QUESTIONS;
                       
-- 6.ALTER BASED QUESTIONS

ALTER TABLE QUESTIONS
ADD  AGE VARCHAR(20) ;

-- 6(A) MODIFY COLUMN BASED ON ALTER

ALTER TABLE QUESTIONS
MODIFY COLUMN AGE VARCHAR(30) ;

-- 6(C) RENAME TABLE/CHANGE TABLE BASED ON ALTER

ALTER TABLE QUESTIONS 
RENAME QUESTION;

ALTER TABLE QUESTION
CHANGE NAME NAMES VARCHAR(50);

-- 7.UPDATE TABLE QUESTIONS

UPDATE  QUESTIONS
SET MARKS =82
WHERE MARKS =80;

-- 8.TO DISABLE SAFE MODE IN MANUPALTING DATA

SET SQL_SAFE_UPDATES = 0;

-- 9.TO DISABLE SAFE MODE IN MANUPALTING DATA

SET SQL_SAFE_UPDATES =1;

-- 10.AGGREGATE FUNCTIONS USING MYSQL

SELECT AVG(MARKS) FROM QUESTIONS;

SELECT ID,NAME,MARKS
FROM QUESTIONS 
WHERE MARKS=(
SELECT MAX(MARKS)
FROM QUESTIONS
WHERE MARKS>80);

SELECT MAX(DISTINCT SALARY)
FROM HR
LIMIT 1;

-- 11.WHERE AND HAVING CLAUSE

SELECT ID,NAME,SALARY
FROM HR
WHERE SALARY=(
SELECT MAX(SALARY)
FROM HR
WHERE SALARY>30000);

-- 12.JOINS IN MYSQL

SELECT Q.ID,H.SALARY
FROM QUESTIONS Q
RIGHT JOIN HR H
ON Q.ID=H.ID;

-- 13.SUBQUERY BASED QUESTIONS

SELECT ID,NAME,MARKS 
FROM QUESTIONS
WHERE  MARKS=(SELECT MAX(MARKS) FROM QUESTIONS WHERE MARKS>80);

-- 14. WINDOW FUNCTIONS

SELECT ID,NAME,
ROW_NUMBER() OVER(ORDER BY ID) AS "ROW_NUMBER",
RANK() OVER(ORDER BY ID)AS "RANK",
DENSE_RANK() OVER(ORDER BY ID) AS "DENSE_RANK"
FROM QUESTIONS;

SELECT ID,NAME,MAX(MARKS) OVER(ORDER BY ID) AS MAX_MARKS
FROM QUESTIONS;



-- 15.CASE FUNCTIONS:

SELECT ID,NAME,MARKS,
  CASE
    WHEN MARKS>=90 THEN 'MERIT'
    WHEN MARKS>=80 THEN 'AVG'
ELSE 'BETTER IMPROVEMENT'
END AS RESULT
FROM QUESTIONS;

-- 16.CTES QUESTIONS

WITH CTE_ROP AS
(
SELECT ID,NAME,MARKS
FROM QUESTIONS 
WHERE MARKS>80
),
CTE_ROP1 AS (
SELECT ID,NAME,AGE
FROM QUESTIONS
WHERE AGE>22
)

SELECT AGE FROM CTE_ROP1;  

-- 17.STORED PROCEDURE

CREATE PROCEDURE DATA()

SELECT ID,NAME,MARKS
FROM QUESTIONS
WHERE MARKS>75
ORDER BY MARKS DESC;

-- PROCEDURE WITH MORE SYNTAX

DELIMITER $$
CREATE PROCEDURE DATA1()
BEGIN
SELECT ID,NAME,MARKS
FROM QUESTIONS
WHERE MARKS>75
ORDER BY MARKS DESC;

SELECT ID,NAME,SALARY
FROM HR 
WHERE SALARY>70000
ORDER BY SALARY DESC;

END $$

DELIMITER ;

CALL  DATA1(1);


 






 