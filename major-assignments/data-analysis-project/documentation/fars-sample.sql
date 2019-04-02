# Getting Started with FARS

SELECT *
FROM fars.accident;

SELECT a.st_case_year, a.DAY_WEEK, d.code, d.day
FROM fars.accident a LEFT JOIN fars.lkp_day_of_week d ON a.DAY_WEEK = d.code;