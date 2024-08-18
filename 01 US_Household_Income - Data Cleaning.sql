USE us_household_project;

# change column name 
ALTER TABLE us_household_income_statistics RENAME COLUMN `ï»¿id` TO `id` ;

SELECT *
FROM us_household_income;
 
SELECT *
FROM us_household_income_statistics;

# Finding duplicates
SELECT *
FROM (
	SELECT row_id,
	id,
	ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
	FROM us_household_income
) AS duplicates
WHERE row_num > 1;

# Deleting duplicates
DELETE FROM us_household_income
WHERE row_id IN(
	SELECT row_id
	FROM (
		SELECT row_id,
		id,
		ROW_NUMBER() OVER(PARTITION BY id ORDER BY id) row_num
		FROM us_household_income
	) AS duplicates
	WHERE row_num > 1);
    

UPDATE us_household_income
SET State_Name = 'Georgia'
WHERE State_Name = 'georia';

UPDATE us_household_income
SET State_Name = 'Alabama'
WHERE State_Name = 'alabama';

UPDATE us_household_income
SET Place = 'Autaugaville'
WHERE County = 'Autauga County'
AND City = 'Vinemont';

SELECT *
FROM us_household_income;
 
SELECT *
FROM us_household_income_statistics;






