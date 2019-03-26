/* Mysql Homework No. 4 (13-Homework)*/
/* Connect to JOURDATA in MySQL Workbench, Then open this file in MySQL Workbench. Rename it Firstname-Lastname-13-SQL-Assignment-13.sql. Work in this file to answer the questions. */
/* Underneath each question below, create a new comment with the correct answer.  Underneath the answer -- NOT in a comment -- put the SQL query you used to derive the answer.*/
/* Use the table md_gov_race in the exercises database.  This is a single-table database of all campaign contributions to Republican Larry Hogan and Democrat Ben Jealous in the 2018 Maryland governor's race from January 2014 through June 2018, just before the primary election in June.
The data was downloaded from here https://campaignfinancemd.us/Public/ViewReceipts and cleaned.
Use the following documentation:
* unique_id: each record has a unique number to identify it. This is the table's "primary key". Each record represents one contribution.
* receiving_committee: each candidate has a "committee" set up to receive contributions.
* filing_period: the political cycles are broken up into different "periods", demarked by the time when candidates must report contributions to the state.
* contribution_date: the date on which a particular contribution was made.
* contributor_name, contributor_address, zip_code, state: details about the person who made the contribution.
* contributor_type: includes individuals, businesses, party committees and other types.
* contribution_type: includes credit cards, checks, loans, and more.
* contribution_amount: in dollars.
* employer_name: self-reported name of contributor's employer.  A lot of these values are blank.
* employer_occupation: self-reported occupation of contributor.  A lot of these values are blank.
*/

/* To submit: Rename the file firstname-lastname-SQL-Assignment-04.sql and upload to ELMS*/

SELECT *
FROM exercises.md_gov_race;

SELECT contributor_type, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
GROUP BY contributor_type
ORDER BY contribution_total desc;

#1. Write a query that returns a table that lists the top 10 zip codes -- no more, no less, exactly 10 -- that gave the most money to Larry Hogan, with three columns -- one for the zip code, one for the state, and one for total dollar value of contributions. Ignore contributions with a null zip code. Where is the top zip code? How many of the top 10 were in Maryland?
# 21401, all 10 in MD
SELECT zip_code, state, SUM(contribution_amount) as total_contributions
FROM exercises.md_gov_race
WHERE receiving_committee LIKE '%Hogan%' AND zip_code IS NOT NULL
GROUP BY zip_code, state
HAVING total_contributions > 150000
ORDER BY total_contributions desc;

#2. Write a query that returns a table that lists the top 10 zip codes -- no more, no less, exactly 10 -- that gave the most money to Ben Jealous, with three columns -- one for the zip code, one for the state, and one for total dollar value of contributions? Ignore contributions with a null zip code.  Where is the top zip code? How many of the top 10 were in Maryland?

# 20907. Only 2 of 10
SELECT zip_code, state, SUM(contribution_amount) as total_contributions
FROM exercises.md_gov_race
WHERE receiving_committee LIKE '%Jealous%' AND zip_code IS NOT NULL
GROUP BY zip_code
HAVING total_contributions > 24594
ORDER BY total_contributions desc;

# 3. Write a query that creates a new column that indicates whether a contribution came from "in-state" or "out-of-state".  Then create a single table that calculates summary stats (count, highest and lowest contribution, average contribution, and total sum) for in-state and out-of-state contributions to Hogan and to Jealous.  This table should have seven rows, and include summary stats for all contribtions to Hogan, all contributions to Jealous, and overall totals.

SELECT receiving_committee, IF(state = "MD", "in-state", "out-of-state") as in_out_state,  SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
GROUP BY receiving_committee, in_out_state WITH ROLLUP;

#4 Write a query that counts the number of contributions to Larry Hogan in 2017 by date, and return a table that lists days with more than 400.  More than half of them are in the early part of what month? Can you explain why this might be?
# January. Right before legislative session starts, and there's a rule against contributing during session.

SELECT contribution_date, count(*) as count
FROM exercises.md_gov_race
WHERE receiving_committee like "%hogan%" AND year(contribution_date) = "2017"
GROUP BY contribution_date
HAVING count > 400
ORDER BY count desc;

#5 Do a similar analysis for Ben Jealous as you did for Hogan in question 4. Can you explain the top two dates on the list?
# 6/9 was day after he campaigned with Dave Chappelle. Unclear on other date. https://www.npr.org/2018/06/08/618233035/all-jokes-aside-dave-chappelle-stumps-for-democratic-maryland-governors-candidat

SELECT contribution_date, count(*) as count
FROM exercises.md_gov_race
WHERE receiving_committee like "%jealous%"
GROUP BY contribution_date
HAVING count > 400
ORDER BY count desc;

SELECT *
FROM exercises.md_gov_race
WHERE receiving_committee like "%jealous%" AND contribution_date = "2017-09-23";

#6 There are a lot of null values for employer for individual contributions to both candidates.  Do your best to figure out why.  Are there any patterns with certain candidates, certain contribution types? Which of the two candidates is doing a worse job collecting this kind of information?
# Jealous is doing a terrible job collecting this kind of info. He's especially bad when people pay with credit card.

SELECT receiving_committee, IF(employer_name is null, "no_employer", "employer") as employer, contribution_type, count(*) as rec_num
FROM exercises.md_gov_race
WHERE contributor_type = "individual"
GROUP BY receiving_committee, employer, contribution_type WITH ROLLUP;

#7-9 Think of three questions to ask of this data. Write the question, query and answer below.
