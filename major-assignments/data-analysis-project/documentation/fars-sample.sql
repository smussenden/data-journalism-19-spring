# Count accidents by year
SELECT year, count(*)
FROM fars.accident
GROUP BY Year;

# Use lookup table to get day of week

SELECT *
FROM fars.accident;

SELECT *
FROM fars.lkp_day_of_week;

SELECT a.st_case_year, a.DAY_WEEK, d.code, d.day
FROM fars.accident a LEFT JOIN fars.lkp_day_of_week d ON a.DAY_WEEK = d.code;

# Get all the people involved in a particular accident.

SELECT *
FROM fars.accident a LEFT JOIN fars.person p ON a.st_case_year = p.st_case_year
WHERE a.st_case_year = "100001_2013";
