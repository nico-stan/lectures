DROP DATABASE IF EXISTS school;
CREATE DATABASE school;
USE school;

-- this is a comment

CREATE TABLE teacher(
teacher_id INT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
language_1 VARCHAR(3) NOT NULL,
language_2 VARCHAR(3) NOT NULL,
dob DATE,
tax_id INT UNIQUE,
phone_no VARCHAR(20)
);

CREATE TABLE `client`(
client_id INT PRIMARY KEY,
client_name VARCHAR(20) NOT NULL,
address VARCHAR(40) NOT NULL,
industry VARCHAR(40)
);

CREATE TABLE participant(
participant_id INT PRIMARY KEY,
first_name VARCHAR(40) NOT NULL,
last_name VARCHAR(40) NOT NULL,
phone_no VARCHAR(20),
client INT
);

CREATE TABLE IF NOT EXISTS course (
course_id INT PRIMARY KEY,
course_name VARCHAR(20) NOT NULL,
language CHAR(3) NOT NULL,
level VARCHAR(2) NOT NULL,
course_length_weeks INT,
start_date DATE,
in_school BOOLEAN,
teacher INT,
client INT
);

###################################
#      CREATE THE RELATIONHIPS    #
###################################
ALTER TABLE participant
ADD FOREIGN KEY(client)
REFERENCES client(client_id)
ON DELETE SET NULL; 

ALTER TABLE course
ADD FOREIGN KEY (teacher) -- current table
REFERENCES teacher(teacher_id) -- parent one
ON DELETE CASCADE;

ALTER TABLE course
ADD FOREIGN KEY (client) -- current table
REFERENCES client(client_id) -- parent one
ON DELETE SET NULL;

CREATE TABLE takes_course(
participant_id INT ,
course_id INT,
PRIMARY KEY(participant_id, course_id),
FOREIGN KEY(participant_id)REFERENCES participant(participant_id) ON DELETE CASCADE,
FOREIGN KEY(course_id)REFERENCES course(course_id) ON DELETE CASCADE
);

###################################
#      POPULATE THE TABLES        #
###################################

-- Full insert of the whole row
INSERT INTO teacher VALUES
(1, 'James', 'ENG', 'DEU', '1985-04-04', 12345, '+49123456');


-- Partial insert
INSERT INTO teacher (teacher_id, first_name, language_1, language_2) VALUES
(2, 'Pau', 'ENG', 'CAT');


-- Edgard: what happens if I try to use the same PK: 2. Error, duplicate key
-- INSERT INTO teacher (teacher_id, first_name, language_1, language_2) VALUES
-- (2, 'dssdsdsd', 'sd', 'ss');


DELETE FROM teacher WHERE teacher_id = 2;

INSERT INTO teacher (teacher_id, first_name, language_1, language_2) VALUES
(2, 'Pau', 'ENG', 'CAT');

UPDATE teacher
SET first_name = "Jonasssss"
WHERE teacher_id = 1;


INSERT INTO teacher VALUES
(20, 'sd', 'ENG', 'DEU', '1985-04-04', 12345111, '+49123456'),
(21, 'Jamdes', 'ENG', 'DEU', '1985-04-04', 123456, '+49123456'),
(22, 'Jamsses', 'ENG', 'DEU', '1985-04-04', 123457, '+49123456'),
(23, 'ss', 'ENG', 'DEU', '1985-04-04', 123458, '+49123456'),
(24, 'James', 'ENG', 'DEU', '1985-04-04', 123459, '+49123456'),
(25, 'SS', 'ENG', 'DEU', '1985-04-04', 1234510, '+49123456'),
(26, 'df', 'ENG', 'DEU', '1985-04-04', 1234511, '+49123456');


SELECT * FROM teacher