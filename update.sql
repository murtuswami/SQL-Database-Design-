-- Part 2.4 update.sql
--
-- Submitted by: <Harsha Ramachandran>, <1734072>
-- 

-- update the daily salary of the coaches so that they reflect hourly payment 
UPDATE coach
SET dailySalary = dailySalary/4;
-- Change name of dailySalary column to hourlySalary
ALTER TABLE coach
CHANGE `dailySalary` `hourlySalary` int;

-- update the daily salary of the participants so that they reflect hourly payment 
UPDATE participant
SET dailySalary = dailySalary/4;

-- Change name of dailySalary column to hourlySalary
ALTER TABLE participant 
CHANGE `dailySalary` `hourlySalary` int;

-- add a time arrived and Time left column to the coachinshow relation
ALTER TABLE coachinshow
ADD timeArrived Time;
ALTER TABLE coachinshow
ADD timeLeft Time;

-- Update the time arrived column with a value one hour less than the start time 
UPDATE coachinshow as ci, tvshow as tv, coach as c
SET ci.timeArrived = ADDTIME(tv.startTime,'-1:0:0')
WHERE ci.idCoach = c.idCoach AND ci.idShow = tv.idShow;
-- Update the time left  column with a value one hour greater than the start time 
UPDATE coachinshow as ci, tvshow as tv, coach as c
SET ci.timeLeft = ADDTIME(tv.endTime,'1:0:0')
WHERE ci.idCoach = c.idCoach AND ci.idShow = tv.idShow;

-- add a time arrived and Time left column to the contenderinshow relation
ALTER TABLE contenderinshow
ADD timeArrived Time;
ALTER TABLE contenderinshow
ADD timeLeft time;

-- Update the time arrived column with a value one hour less than the start time 
UPDATE contenderinshow as ci, tvshow as tv, contender as c
SET ci.timeArrived = ADDTIME(tv.startTime,'-1:0:0')
WHERE ci.idContender = c.idContender AND ci.idShow = tv.idShow;
-- Update the time left  column with a value one hour greater than the start time 
UPDATE contenderinshow as ci, tvshow as tv, contender as c
SET ci.timeLeft = ADDTIME(tv.startTime,'1:0:0')
WHERE ci.idContender = c.idContender AND ci.idShow = tv.idShow;




