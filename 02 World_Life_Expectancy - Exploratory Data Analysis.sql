SELECT *
FROM world_life_expectancy;

# working with LIFE EXPECTANCY 
SELECT Country,
MAX(`Life expectancy`) AS Max_Life_Expectancy,
MIN(`Life expectancy`) AS Min_Life_Expectancy,
ROUND((MAX(`Life expectancy`) - MIN(`Life expectancy`)),1) AS Life_Increase_15_Years
FROM world_life_expectancy
GROUP BY Country 
HAVING Min_Life_Expectancy <> 0
AND Max_Life_Expectancy <> 0
ORDER BY Life_Increase_15_Years DESC
;

SELECT Year, Round(AVG(`Life expectancy`), 2)
FROM world_life_expectancy
GROUP BY Year
ORDER BY Year;

SELECT Country, ROUND(AVG(`Life expectancy`),1) AS Life_Exp, ROUND(AVG(GDP),1) AS GDP
FROM world_life_expectancy
GROUP BY Country
HAVING Life_Exp > 0
AND GDP > 0
ORDER BY GDP ;

SELECT 
SUM(CASE WHEN GDP >= 1500 THEN 1 ELSE 0 END) High_GDP_Count,
AVG(CASE WHEN GDP >= 1500 THEN `Life expectancy` ELSE NULL END) High_GDP_Life_Expectancy,
SUM(CASE WHEN GDP <= 1500 THEN 1 ELSE 0 END) Low_GDP_Count,
AVG(CASE WHEN GDP <= 1500 THEN `Life expectancy` ELSE NULL END) Low_GDP_Life_Expectancy
FROM world_life_expectancy;

SELECT Status, COUNT(DISTINCT Country), ROUND(AVG(`Life expectancy`),1)
FROM world_life_expectancy
GROUP BY Status ;

SELECT Country,
Year,
`Life expectancy`,
`Adult Mortality`,
SUM(`Adult Mortality`) OVER (PARTITION BY Country ORDER BY Year) AS Rolling_Total
FROM world_life_expectancy
WHERE Country LIKE "%united%";

