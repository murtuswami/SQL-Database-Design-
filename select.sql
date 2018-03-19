 -- Part 2.3 select.sql
--
-- Submitted by: <Harsha Ramachandran>, <1734072>


-- 1. Average Female Salary
-- returns the average salary of all the female participants 
SELECT AVG(dailySalary)
FROM PARTICIPANT 
WHERE gender = 'F';


-- 2. Coaching Report.
-- Lists for each coach the total number of contenders they are coaching
-- Includes information on Coaches who coach no contenders
SELECT c.fname,c.surname,c.idCoach,COUNT(ct.idContender) AS numberCoaches
FROM coach AS c
LEFT JOIN contender AS ct ON ct.idCoach = c.idCoach 
GROUP BY c.idCoach;


-- 3. Coach Monthly Attendance Report 
-- Returns the amount of shows attended by each coach in a given month 
SELECT X.fname,X.surname,X.idCoach,showsInMarch,ShowsInApril
 FROM(SELECT c.fname,c.surname,c.idCoach,COUNT(ci.idShow) AS showsInMarch
      FROM coach AS c, coachinshow AS ci, tvshow AS tv
      WHERE c.idCoach = ci.idCoach AND ci.idShow = tv.idShow AND tv.datewhen LIKE '_____03___'
      GROUP BY c.idCoach)AS X,
      (SELECT c.fname,c.surname,c.idCoach,COUNT(ci.idShow) AS showsInApril
       FROM coach AS c, coachinshow AS ci, tvshow AS tv
        WHERE c.idCoach = ci.idCoach AND ci.idShow = tv.idShow AND tv.datewhen LIKE '_____04___'
        GROUP BY c.idCoach)AS Y
WHERE X.idCoach = y.idCoach;



-- 4. Most Expensive Contender
-- Returns the name of the contender with the highest total salary 
SELECT Y.stagename, Y.sumtotal
FROM(
		SELECT SUM(p.dailySalary) AS sumtotal,c.idcontender,c.stagename
		FROM contender AS c, participant AS p
        WHERE c.idContender = p.idContender 
		GROUP BY c.stagename
     ) AS Y
Inner Join
(
    Select Max(sum) As maxSum
    FROM(
		SELECT SUM(p.dailySalary) AS sum,c.idcontender
		FROM contender AS c, participant AS p
        WHERE c.idContender = p.idContender 
		GROUP BY c.stagename
     ) AS minsumcontenders) AS X
ON Y.sumtotal = X.maxsum;



-- 5. March Payment Report
--  Displays for each coach the number of shows attended in March their total salary for March along with identifying features
SELECT c.fname,c.surname,c.idCoach,c.dailySalary, COUNT(ci.idShow) AS showsInMarch, (COUNT(ci.idShow)* c.dailySalary) AS totalSalMarch
FROM coach AS c, coachinshow AS ci, tvshow AS tv
WHERE c.idCoach = ci.idCoach AND ci.idShow = tv.idShow AND tv.datewhen LIKE '_____03___'
GROUP BY c.idCoach;



--  Displays for each coach the number of shows attended in March their total salary for March along with identifying features
SELECT p.fname,p.surname,p.idParticipant,p.dailySalary, COUNT(ci.idShow) AS showsInMarch, (COUNT(ci.idShow)* p.dailySalary) AS totalSalMarch
FROM participant AS p, contenderinshow AS ci, tvshow AS tv
WHERE ci.idContender = p.idContender AND ci.idShow = tv.idShow AND tv.datewhen LIKE '_____03___'
GROUP BY p.idParticipant;


-- Displays the total money spent in march 
SELECT SUM(sumMarch)
FROM(
SELECT SUM(totalSalMarch) AS sumMarch
FROM(
SELECT c.fname,c.surname,c.idCoach,c.dailySalary, COUNT(ci.idShow) AS showsInMarch, (COUNT(ci.idShow)* c.dailySalary) AS totalSalMarch
          FROM coach AS c, coachinshow AS ci, tvshow AS tv
          WHERE c.idCoach = ci.idCoach AND ci.idShow = tv.idShow AND tv.datewhen LIKE '_____03___'
          GROUP BY c.idCoach) AS X
UNION
SELECT SUM(totalSalMarch) AS sumMarch
FROM(
SELECT p.fname,p.surname,p.idParticipant,p.dailySalary, COUNT(ci.idShow) AS showsInMarch, (COUNT(ci.idShow)* p.dailySalary) AS totalSalMarch
          FROM participant AS p, contenderinshow AS ci, tvshow AS tv
         WHERE ci.idContender = p.idContender AND ci.idShow = tv.idShow AND tv.datewhen LIKE '_____03___'
         GROUP BY p.idParticipant) AS Y
) AS Z;


-- 6. Well Formed Groups!
-- Returns False if their exists contenders where the category is 'Group' and there is only one participant in the contender
SELECT IF(COUNT(*) >0,'False','True') AS WellFormed
FROM contender AS c
Where category = 'Group' AND
		(SELECT COUNT(*)
		 FROM participant AS p
         Where p.idContender=c.idContender) <= 1;



