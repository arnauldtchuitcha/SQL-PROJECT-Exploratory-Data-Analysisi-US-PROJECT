SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

SELECT * 
FROM us_household_income u
INNER JOIN us_project.ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0;

SELECT u.State_Name,County,Type, `Primary`, Mean, Median 
FROM us_household_income u
INNER JOIN us_project.ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0;

SELECT u.State_Name,ROUND(AVG(Mean),1), ROUND(AVG(Median),1) 
FROM us_household_income u
INNER JOIN us_project.ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0
GROUP BY u.State_Name
ORDER BY 2 DESC;

SELECT Type,COUNT(TYPE),ROUND(AVG(Mean),1), ROUND(AVG(Median),1) 
FROM us_household_income u
INNER JOIN us_project.ushouseholdincome_statistics us
ON u.id=us.id
WHERE Mean<>0
GROUP BY 1
HAVING COUNT(TYPE)>100
ORDER BY 3 DESC
LIMIT 20;

SELECT *
FROM us_project.ushouseholdincome_statistics;
