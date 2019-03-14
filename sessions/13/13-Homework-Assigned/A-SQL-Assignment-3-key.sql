/* Mysql Homework No. 3 (12-Homework)*/
/* Connect to JOURDATA in MySQL Workbench, Then open this file in MySQL Workbench. Rename it Firstname-Lastname-12-SQL-Assignment-12.sql. Work in this file to answer the questions. */
/* Underneath each question below, create a new comment with the correct answer.  Underneath the answer -- NOT in a comment -- put the SQL query you used to derive the answer.*/
/* Use the accidents and deaths tables in the BARD database.
/*Execute this function first: SET SQL_MODE='only_full_group_by';*/
/* Use the documentation in the 12-In-Class-Lab folder*/

# 1. Write a query to return a table that lists one record per death where alcohol or drug use was listed as a cause of the accident. How many such deaths were there?

SELECT *
FROM bard.accidents a JOIN bard.deaths d on a.bardid = d.bardid
WHERE a.AccidentCause1 LIKE '%alcohol%' OR a.AccidentCause1 LIKE '%drug%' OR a.AccidentCause2 LIKE '%alcohol%' OR a.AccidentCause2 LIKE '%drug%' OR a.AccidentCause3 LIKE '%alcohol%' OR a.AccidentCause3 LIKE '%drug%';

# 2. What day of the week has the lowest average age of people killed in accidents?
# A: Sunday

SELECT a.DayofWeek, AVG(d.DeceasedAge) as Average_Age
FROM bard.accidents a JOIN bard.deaths d on a.bardid = d.bardid
GROUP BY a.DayofWeek
ORDER BY Average_Age asc;

# 3: What percentage of people killed on the Potomac River were wearing life jackets?
SELECT d.DeceasedPFDWorn, COUNT(*) as number_records
FROM bard.accidents a JOIN bard.deaths d on a.bardid = d.bardid
WHERE a.NameOfBodyOfWater LIKE '%Pot%'
GROUP BY d.DeceasedPFDWorn;

# 4: You're writing a story about the role alcohol plays in boating accidents and are looking for a detail for a story. A Coast Guard source tells you he remembered an accident that caused thousands of dollars in damage after the occupants downed more than a dozen small tubs of beer (an average one of these containers holds about 6 bottles of beer) at a bar before hitting the water some time in the last decade.  You try to find it in the data. How many of these tubs did they pay for?
SELECT RedactedNarrative
FROM bard.accidents
WHERE RedactedNarrative LIKE "%buckets%";

#5: How many accidents were there where at least one person who wasn't the operator of a boat (an occupant) died?
SELECT a.bardid, COUNT(*) as count
FROM bard.accidents a JOIN bard.deaths d on a.bardid = d.bardid
WHERE d.DeceasedRole LIKE "%Occupant%"
GROUP BY a.bardid;

#6 - #8 Think of three interesting questions to ask and answer of the data.  At least two of them should join accidents to the death table.
