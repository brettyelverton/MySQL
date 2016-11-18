/* CY355 AY17-1 Database Project Shell*/
/* C.	CDT An, Beomjin B-1 2019. Showed me how to use the group by command as well as the CONCAT command allowing me to complete 
my assignment. Additionally I also made use of the W3Schools information on MySQL to figure out syntax and commands to use for the project */
show tables;
/* Part I - Build Queries for the Current Database: */
SELECT `company`.`id`,
    `company`.`barracks`
FROM `cy355_project`.`company`;

SELECT `computer_language`.`id`,
    `computer_language`.`lang_name`
FROM `cy355_project`.`computer_language`;

SELECT `major`.`id`,
    `major`.`title`,
    `major`.`department`,
    `major`.`is_abet`
FROM `cy355_project`.`major`;

SELECT `member`.`email`,
    `member`.`last_name`,
    `member`.`first_name`,
    `member`.`sex`,
    `member`.`date_of_birth`,
    `member`.`grad_year`,
    `member`.`major_id`,
    `member`.`company_id`
FROM `cy355_project`.`member`;

SELECT `member_knows_computer_language`.`member_email`,
    `member_knows_computer_language`.`computer_language_id`,
    `member_knows_computer_language`.`proficiency`
FROM `cy355_project`.`member_knows_computer_language`;

SELECT `program_competition`.`member_email`,
    `program_competition`.`team_name`,
    `program_competition`.`score`
FROM `cy355_project`.`program_competition`;
desc member_knows_computer_language;
desc member;
desc computer_language;
desc major;
desc company;
desc program_competition;
/* A.	Write a query that returns the names of the female members of the club and their 
graduation year in two columns.  In the first column named “female_members”, format the output 
to be <last_name>, <first_name>.  The second column will have the graduation year.  Sort the 
output by graduation year (seniors first) then by last name and first name.*/
SELECT CONCAT(last_name,", ",first_name) 
AS female_members, grad_year
FROM member
WHERE sex = "Female"
ORDER BY grad_year, female_members ASC;

				


/* B.	Write a query that returns the majors and departments represented by cadets in the club 
and the count of cadets belonging to each major named "num_students".  Sort the output the largest 
represented major then by the name of the major, alphabetically.*/
SELECT title, department, count(major_id) 
as num_students
from major
INNER JOIN member
ON major.id = member.major_id
group by title
ORDER BY num_students, title ASC;

/* C.	Write a query that returns the barracks name in the first column and the members’ names 
in the second column in the format of <last_name>, <first_name> and named "members".  Sort the output 
by barracks name, last name, and then first name.  */
SELECT barracks, CONCAT(member.last_name,", ",member.first_name) 
AS mem
FROM company
INNER JOIN member
ON company.id = member.company_id 
ORDER BY barracks, mem ASC;

/* D.	Write a query that returns the member’s last name and company and computer language for all members
 that have a computer language proficiency of “Expert”.  Sort the output by computer language name, 
 then member last name.    */
 SELECT member.last_name, company.id, computer_language.lang_name
 FROM company
 INNER JOIN member
 ON company.id = member.company_id
 INNER JOIN member_knows_computer_language
 ON member.email = member_knows_computer_language.member_email
 INNER JOIN computer_language
 ON computer_language.id = member_knows_computer_language.computer_language_id
 WHERE member_knows_computer_language.proficiency = "Expert"
 ORDER BY computer_language.lang_name,member.last_name ASC;
 
/* E.	Write a query that returns the companies that do not have any club members. */
 SELECT id,
 
 
/* F.	Write a query that returns team names and overall team score (i.e. sum of the individual member's score) 
named "team_score" from the programming competition.  Limit the result to only show the top three teams 
(i.e. with greatest cumulative scores).  */

SELECT team_name, score 
AS team_score
FROM program_competition
group by team_name
order by team_score DESC
LIMIT 3;

/* G.	Write a query that returns the member’s last name, team name, and member’s score from the programming competition.  
Limit the result to only show the top five scores.  */

SELECT last_name,program_competition.team_name,program_competition.score
FROM member
INNER JOIN program_competition
ON member.email = program_competition.member_email
ORDER BY program_competition.score DESC
LIMIT 5;

/* Part II - Extend the Database: */

/* A.	Create a table named smart_phone with four columns: an auto incrementing id, the make of the smart phone 
(e.g. Apple, Samsung, HTC, etc.), the model of the smart phone (e.g. iPhone 6, iPhone 6 Plus, Galaxy S7, etc.), 
and the operating system of the smart phone (e.g. iOS, Android, and Windows).  Establish the appropriate relationship 
between smart_phone and member that multiple members can have the same make/model of smartphone.  
Submit the SQL code to create smart_phone and/or alter member. */
CREATE TABLE smart_phone (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
make VARCHAR(30),
model VARCHAR(30),
OS VARCHAR(20), 
last_name VARCHAR(20)
);
DROP TABLE smart_phone;
/* B.	Write and submit the SQL code to insert a MINIMUM of 5 records into smart_phone.  Write a query to demonstrate 
that returns the member’s name and the make/model of their smart phone. HINT: You will need to have one instance where 
two members have the same make/model of smart phone to prove that your relationship works. */
INSERT INTO smart_phone (make, model, OS, last_name)
VALUES ('Apple','iPhone 6', 'iOS', 'Wease');

INSERT INTO smart_phone (make, model, OS, last_name)
VALUES ('Samsung','Galaxy S6', 'Android', 'Fairfax');

INSERT INTO smart_phone (make, model, OS, last_name)
VALUES ('Samsung','Galaxy S6', 'Android', 'Loaiza');

INSERT INTO smart_phone (make, model, OS, last_name)
VALUES ('Apple','iPhone 7', 'iOS', 'Veselka');

INSERT INTO smart_phone (make, model, OS, last_name)
VALUES ('Apple','iPhone 4s', 'iOS', 'Amon');

SELECT CONCAT(member.last_name,", ",first_name) AS full_names, smart_phone.make, smart_phone.model
FROM member
INNER JOIN smart_phone
ON smart_phone.last_name = member.last_name
GROUP BY member.last_name
LIMIT 5;

SELECT *
FROM smart_phone;


/* C.	Create a table named computing_interest with two columns: an auto incrementing id and the name of the interest.  
Import the names of the interests from the file computing_interest.csv.  Establish the appropriate relationship between 
computing_interest and member that one member can have multiple interests (e.g. Networking and Databases) and that 
one interest can have multiple members (e.g. three members are interested in Cyber Security). */
INSERT INTO computing_interest(topic,last_name)
VALUES ('Algorithms','Wease');

INSERT INTO computing_interest(topic,last_name)
VALUES ('Robotics & Algorithms','Fairfax');

INSERT INTO computing_interest(topic,last_name)
VALUES ('Graphics','Loaiza');

INSERT INTO computing_interest(topic,last_name)
VALUES ('Networking','Veselka');

INSERT INTO computing_interest(topic,last_name)
VALUES ('Robotics','Amon');


CREATE TABLE computing_interest (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
topic VARCHAR(30),
last_name VARCHAR(30)
);
DROP TABLE computing_interest;
SELECT *
FROM computing_interest;
/* D.	Write and submit the SQL Code to insert a MINIMUM of 5 records into relationship table between computing_interest 
and member.  Write a query that returns the member’s name and computing interest.  HINT: You will need to insert the 
appropriate records to show that multiple members can have the same interest and that one member can have multiple interests. */

SELECT CONCAT(member.last_name,", ",first_name) AS full_names, computing_interest.topic
FROM member
INNER JOIN computing_interest
ON computing_interest.last_name = member.last_name
GROUP BY member.last_name
LIMIT 5;
