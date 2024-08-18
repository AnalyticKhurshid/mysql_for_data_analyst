USE us_household_project;

SELECT *
FROM us_household_income;

SELECT *
FROM us_household_income_statistics;

-- SUM of ALand and AWater for each State_Name --
SELECT State_Name, SUM(ALand), SUM(AWater)
FROM us_household_income
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 10;

-- Joining tables and filtering Mean doesn't equal 0 --
SELECT ui.State_Name, County, Type, `Primary`, Mean, Median
FROM us_household_income ui
JOIN us_household_income_statistics uis
	ON ui.id = uis.id
WHERE Mean <> 0;

-- Average of Mean and Median for each State_Name top5 minimum result --
SELECT ui.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income ui
JOIN us_household_income_statistics uis
	ON ui.id = uis.id
WHERE Mean <> 0
GROUP BY State_Name
ORDER BY 2
LIMIT 5;

-- Average of Mean and Median for each State_Name top5 maximum result --
SELECT ui.State_Name, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income ui
JOIN us_household_income_statistics uis
	ON ui.id = uis.id
WHERE Mean <> 0
GROUP BY State_Name
ORDER BY 2 DESC
LIMIT 5;

-- minimum 100 different types of avg(mean) and avg(median) --
SELECT Type,COUNT(Type), ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income ui
JOIN us_household_income_statistics uis
	ON ui.id = uis.id
WHERE Mean <> 0
GROUP BY 1
HAVING COUNT(Type) > 100
ORDER BY 4 DESC
LIMIT 20;


SELECT ui.State_Name, City, ROUND(AVG(Mean),1), ROUND(AVG(Median),1)
FROM us_household_income ui
JOIN us_household_income_statistics uis
	ON ui.id = uis.id
GROUP BY ui.State_Name, City
ORDER BY ROUND(AVG(Mean),1) DESC;



