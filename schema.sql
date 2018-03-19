-- Part 2.1 schema.sql
--
-- Submitted by: <Harsha Ramachandran>, <1734072>
-- 

CREATE TABLE COACH
( 
idCoach		CHAR(4)			NOT NULL CHECK(CHAR_LENGTH(idCoach) = 4),
fname		VARCHAR(15)		NOT NULL,
surname		VARCHAR(15)		NOT NULL,
DoB			DATE,
phone		CHAR(11)		CHECK(CHAR_LENGTH(phone) = 11),
dailySalary	INT,			
gender		CHAR(1)			CHECK(gender = 'M' OR gender ='F'),	
PRIMARY KEY (idCoach)	
);
CREATE TABLE CONTENDER
(
idContender CHAR(4)			NOT NULL CHECK(CHAR_LENGTH(idContender) = 4),
stageName	VARCHAR(20)		NOT NULL,
category	VARCHAR(10)		NOT NULL CHECK(category = 'Group' OR category = 'Induvidual'),
idCoach 	CHAR(4)			CHECK(CHAR_LENGTH(idCoach) = 4),
PRIMARY KEY (idContender),
FOREIGN KEY (idCoach) REFERENCES COACH(idCoach)	
						 ON DELETE SET NULL	ON UPDATE CASCADE
);

CREATE TABLE PARTICIPANT
( 
idParticipant 	CHAR(4)		NOT NULL CHECK(CHAR_LENGTH(idParticipant) = 4),
fname			VARCHAR(15) NOT NULL,
surname			VARCHAR(15) NOT NULL,
DoB				DATE,
phone			CHAR(11)	CHECK(CHAR_LENGTH(phone) = 11),
dailySalary		INT,
gender			CHAR(1)		CHECK(gender = 'M' OR gender ='F'),
idContender		CHAR(4)	,
PRIMARY KEY (idParticipant),
FOREIGN KEY (idContender) REFERENCES CONTENDER(idContender)
						ON DELETE CASCADE	ON UPDATE CASCADE
);
CREATE TABLE TVSHOW
(
idShow			CHAR(4)		NOT NULL CHECK(CHAR_LENGTH(idShow) = 4),
datewhen		DATE		NOT NULL,
startTime		TIME		NOT NULL,
endTime			TIME		NOT NULL,
location		BLOB,		
PRIMARY KEY(idShow)
);
CREATE TABLE COACHINSHOW
(
idCoach			CHAR(4)		NOT NULL CHECK(CHAR_LENGTH(idCoach) = 4),		
idShow			CHAR(4)		NOT NULL CHECK(CHAR_LENGTH(idShow) = 4),
PRIMARY KEY(idCoach,idShow),
FOREIGN KEY(idCoach) REFERENCES COACH(idCoach)
					ON DELETE CASCADE	ON UPDATE CASCADE,
FOREIGN KEY(idShow) REFERENCES TVSHOW(idShow)
);
CREATE TABLE CONTENDERINSHOW
(
idContender		CHAR(4)		NOT NULL CHECK(CHAR_LENGTH(idContender) = 4),
idShow			CHAR(4)		NOT NULL CHECK(CHAR_LENGTH(idShow) = 4),
PRIMARY KEY(idContender,idShow),
FOREIGN KEY(idContender) REFERENCES CONTENDER(idContender)
					ON DELETE CASCADE	ON UPDATE CASCADE,
FOREIGN KEY(idShow) REFERENCES TVSHOW(idShow)
);
-- Constraints that were not implemented in the Schema
-- "Each contender should have atleast one participant"
-- The relational schema is defined in such a way that the contender ID is stored
-- in the participant. Thus there is no way to ensure that every contender has 
-- atleast one participant since there is no information on the participants stores
-- in the contender table. 

-- If A coach decides to leave the program their contenders need to be assigned a replacement coach
-- There is no way to acheive this within the current schema, hence we set the contender's coach to Null if 
-- their coach is deleted. The assumption here is that a relevant external party will decide on the
-- contender's new coach and manually update the value in the database.