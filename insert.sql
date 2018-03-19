-- Part 2.2 insert.sql
--
-- Submitted by: <Harsha Ramachandran>, <1734072>
-- 

-- Insert celebrities coaches into the database
INSERT INTO COACH
VALUES 	('0001','Kurt','Cobain',DATE'1866-04-13','12345678901',1000,'M'),
		('0002','Amy','Winehouse',DATE'1866-04-13','12345678901',1200,'F'),
		('0003','Micheal','Jackson',DATE'1866-04-13','12345678901',3000,'M');
 INSERT INTO CONTENDER
VALUES	('1001','The luntduckers','Group',(SELECT idCoach from COACH WHERE fname ='Kurt')),
		('2002','Wham Bam','Induvidual',(SELECT idCoach from COACH WHERE fname ='Kurt')),
		('3003','Big bad slam','Induvidual',(SELECT idCoach from COACH WHERE fname ='Kurt')),
		('4004','The Kings men','Induvidual',(SELECT idCoach from COACH WHERE fname ='Amy')),
		('5005','The Jig','Induvidual',(SELECT idCoach from COACH WHERE fname ='Amy'));
     
 -- Insert participant tuples into the database
 INSERT INTO PARTICIPANT
VALUES	('1000','George','Hamlock',DATE '1996-04-14','12345678901',100,'M','1001'),
		('2000','Dunbar','Loch',DATE '1996-04-14','12345678901',100,'M','1001'),
		('3000','Sierra','Hennington',DATE '1996-04-14','12345678901',100,'F','2002'),
		('4000','Helen','Turncraig',DATE '1996-04-14','12345678901',50,'F','3003'),
		('5000','Holo','Flakton',DATE '1996-04-14','12345678901',100,'M','4004'),
		('6000','Lilly','Lutbicker',DATE '1996-04-14','12345678901',100,'F','5005'),
		('7000','Jansen','Amy',DATE '1996-04-14','12345678901',100,'F',null),
		('8000','Globo','Teff',DATE '1996-04-14','12345678901',100,'M',null),
		('9000','Rogain','Patata',DATE '1996-04-14','12345678901',100,'F',null),
		('1100','Bogan','Beloshi',DATE '1996-04-14','12345678901',100,'M',null);
 -- Create Contenders and add them to the database 







INSERT INTO TVSHOW
VALUES	('0100',DATE'2017-03-04',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0200',DATE'2017-03-05',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0300',DATE'2017-03-11',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0400',DATE'2017-03-12',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0500',DATE'2017-03-18',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0600',DATE'2017-03-19',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0700',DATE'2017-03-25',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0800',DATE'2017-03-26',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0900',DATE'2017-04-01',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0101',DATE'2017-04-02',TIME'11:00:00',TIME'13:00:00','Studio'),
		('0110',DATE'2017-04-08',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0120',DATE'2017-04-09',TIME'08:00:00',TIME'10:00:00','Studio'),
		('0130',DATE'2017-04-15',TIME'10:00:00',TIME'12:00:00','Studio'),
		('0140',DATE'2017-04-16',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0150',DATE'2017-04-22',TIME'09:00:00',TIME'11:00:00','Studio'),
		('0160',DATE'2017-04-23',TIME'13:00:00',TIME'15:00:00','Studio'),
		('0170',DATE'2017-04-29',TIME'16:00:00',TIME'18:00:00','Studio'),
		('0180',DATE'2017-04-30',TIME'17:30:00',TIME'19:30:00','Studio');




-- add contenders for show
INSERT INTO CONTENDERINSHOW
VALUES	('1001','0100'),
		('2002','0100'),
		('3003','0100'),
		('2002','0200'),
		('3003','0200'),
		('4004','0200'),
		('4004','0300'),
		('5005','0300'),
		('1001','0300'),
		('5005','0400'),
		('3003','0400'),
		('2002','0400'),
		('1001','0500'),
		('3003','0500'),
		('4004','0500'),
		('1001','0600'),
		('3003','0600'),
		('5005','0600'),
		('3003','0700'),
		('4004','0700'),
		('2002','0700'),
		('1001','0900'),
		('2002','0900'),
		('4004','0900'),
		('2002','0800'),
		('3003','0800'),
		('4004','0800'),
		('4004','0101'),
		('3003','0101'),
		('5005','0101'),
		('5005','0110'),
		('4004','0110'),
		('1001','0110'),
		('5005','0120'),
		('2002','0120'),
		('3003','0120'),
		('1001','0130'),
		('4004','0130'),
		('5005','0130'),
		('2002','0140'),
		('4004','0140'),
		('5005','0140'),
		('3003','0150'),
		('2002','0150'),
		('5005','0150'),
		('2002','0160'),
		('4004','0160'),
		('1001','0160'),
		('3003','0170'),
		('4004','0170'),
		('1001','0170');


-- add coaches to show
INSERT INTO COACHINSHOW(idCoach,idShow)
VALUES	('0001','0100'),
		('0002','0100'),
		('0003','0200'),
		('0001','0200'),
		('0001','0300'),
		('0003','0300'),
		('0001','0400'),
		('0002','0400'),
		('0002','0500'),
		('0003','0500'),
		('0001','0600'),
		('0003','0600'),
		('0002','0700'),
		('0001','0700'),
		('0001','0800'),
		('0003','0800'),
		('0002','0900'),
		('0003','0900'),
		('0001','0101'),
		('0003','0101'),
		('0003','0110'),
		('0002','0110'),
		('0001','0120'),
		('0002','0120'),
		('0001','0130'),
		('0003','0130'),
		('0003','0140'),
		('0002','0140'),
		('0001','0150'),
		('0003','0150'),
		('0002','0150'),
		('0001','0160'),
		('0002','0160'),
		('0003','0160'),
		('0001','0170'),
		('0002','0170'),
		('0003','0170');




