-- Part 2.5 delete.sql
--
-- Submitted by: <Harsha Ramachandran>, <1734072>
-- 
DELETE FROM contender
WHERE stagename IN (SELECT Y.stagename
FROM(
		SELECT SUM(p.dailySalary) AS sumtotal,c.idcontender,c.stagename
		FROM contender AS c, participant AS p
        WHERE c.idContender = p.idContender 
		GROUP BY c.stagename
     ) AS Y
Inner Join
(
    Select Min(sum) As minSum
    FROM(
		SELECT SUM(p.dailySalary) AS sum,c.idcontender
		FROM contender AS c, participant AS p
        WHERE c.idContender = p.idContender 
		GROUP BY c.stagename
     ) AS minsumcontenders) AS X
ON Y.sumtotal = X.minsum);




