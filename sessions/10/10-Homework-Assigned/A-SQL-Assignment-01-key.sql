/* MySQL Assignment 1
Connect to JOURDATA in MySQL Workbench, Then open this file in MySQL Workbench. Rename it Firstname-Lastname-10-homework.sql. Work in this file to answer the questions.
Underneath each question below, create a new comment with the correct answer.  Underneath the answer -- NOT in a comment -- put the SQL query you used to derive the answer.
Use the table md_gov_race in the exercises database.  This is a single-table database of all campaign contributions to Republican Larry Hogan and Democrat Ben Jealous in the 2018 Maryland governor's race from January 2014 through June 2018, just before the primary election in June.
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

# 1. How many records are in the table?
# Answer 1: 55,327
# Query for Question 1
SELECT *
FROM exercises.md_gov_race;

#2. What is the dollar amount of the largest dollar contribution from any source?  Who was it from, and who did it go to? What does the contribution type mean (link to a page or file on elections.maryland.gov where you find support for your answer)?
# Answer 2: $68,133 to Larry Hogan from the Republican State Central Committee. This is a coordinated in-kind contribution, meaning the party spent money on behalf of Hogan, in coordination with his campaign. https://elections.maryland.gov/campaign_finance/documents/Guidance_Coordination%20and%20Cooperation.pdf
SELECT *
FROM exercises.md_gov_race
ORDER BY contribution_amount DESC;

#2. What was the largest dollar contribution amount to Ben Jealous? Who made it, and what type of contribution was it?
# Answer 2: A $50,000 loan was made by Ben Jealous to his own campaign.

SELECT *
FROM exercises.md_gov_race
ORDER BY contribution_amount DESC;

#OR

SELECT *
FROM exercises.md_gov_race
WHERE receiving_committee LIKE "%Jealous%"
ORDER BY contribution_amount DESC

#OR
SELECT *
FROM exercises.md_gov_race
WHERE receiving_committee = "Jealous Ben Friends of"
ORDER BY contribution_amount DESC;

#3. Did Larry Hogan make any loans to his own campaign? Explain why you think this might be.
# Answer 3: No. A lot of reasons, but probably the main one is that as the incumbent, Hogan would have little problem raising money.  Wheras Jealous had to get through a crowded field of Democrats to win the primary, so loaning himself money might have been a key jumpstart for his campaign.

SELECT *
FROM exercises.md_gov_race
WHERE receiving_committee LIKE "%Hogan%"
AND contribution_type LIKE "%Loan%"
ORDER BY contribution_amount DESC;

# 4. With the exception of a $9,004 contribution to Ben Jealous (which is possibly an error in the data), what is the dollar amount of the largest contribution from an individual donor.  Note: there are more than 200 individual contributions at this amount. For extra credit, do some quick Internet research and offer your best guess as to why this amount is the largest contribution.
# Answer 4: $6,000.
# Extra Credit 2:  It's the maximum individual contribution in Maryland.

SELECT *
FROM exercises.md_gov_race
WHERE contributor_type = "Individual"
ORDER BY contribution_amount DESC;
;

#5. How many contributions are from Maryland?  How many contributions are from outside of Maryland, including other U.S. states and terrorities, foreign countries or contributions with no state listed?
#5 Answer: 37,685 Maryland contributions; 17,524 contributions from outside of Maryland.
SELECT *
FROM exercises.md_gov_race
WHERE state = "MD";

SELECT *
FROM exercises.md_gov_race
WHERE state != "MD";

#6. How many contributions for Larry Hogan came from outside of Maryland, and how many came from Maryland?  How many contributions for Ben Jealous came from outside of Maryland and how many came from Maryland?  Write four queries in total, each of which should use LIKE and wildcards to find contributions to Jealous or Hogan.  Then, using Excel or a calculator, calculate the percentage of each candidate's contributions that came from out of state.
#6. For Hogan, 1584 from out of state, 34,012 out of state -- 35596 total, 4.4 percent out of state. For Jealous, 15940 out of state, 3,673 in state. 19613 total, 81.2 percnet out of state.

SELECT *
FROM exercises.md_gov_race
WHERE state != "MD" AND receiving_committee LIKE "%Hogan%";

SELECT *
FROM exercises.md_gov_race
WHERE state = "MD" AND receiving_committee LIKE "%Hogan%";

SELECT *
FROM exercises.md_gov_race
WHERE state != "MD" AND receiving_committee LIKE "%Jealous%";

SELECT *
FROM exercises.md_gov_race
WHERE state = "MD" AND receiving_committee LIKE "%Jealous%";

# 8 The actress Jada Pinkett Smith gave money to one of the candidates.  List the candidate she gave to, her address, how much she gave, what she listed as her employer and the date.  Then list some of the clues in the data that tell you that the person described in the database as "Jada Pinkett Smith" is actually the actress and not just some random person with the same name, and how you would verify your hunch with web research.

#7 Answer: Ben Jealous, $3,000, 9-28-2017.  Clues are the address (her foundation) and the name of the employer, her and Will Smith's media company.
SELECT *
FROM exercises.md_gov_race
WHERE contributor_name LIKE "%Jada%";

#8 How many contributions were made to Larry Hogan in calendar year 2018?
#8 Answer: 7584
SELECT *
FROM exercises.md_gov_race
WHERE receiving_committee LIKE "%Hogan%" AND year(contribution_date) = 2018;

#8 How many contributions were made to Ben Jealous on March 1, 2018 or later? How many were made on exactly March 2, 2018?
#8 6,492.  35.
SELECT *
FROM exercises.md_gov_race
WHERE receiving_committee LIKE "%Jealous%" AND contribution_date >= "2018-03-01"
ORDER BY contribution_date;

SELECT *
FROM exercises.md_gov_race
WHERE receiving_committee LIKE "%Jealous%" AND contribution_date = "2018-03-02"
ORDER BY contribution_date;

#9.  How many total contributions have a null value for employer_occupation?  How many total contributions have a non-null value for employer contribution?  What percentage of total contributions have a null value (use Excel or a calculator)?  Write a sentence describing your level of confidence in using the information in this database to describe, in aggregate, the occupations of people contributing to the campaign.
#9 Is null = 32995. Not null = 22332.  Total = 55327. 59.6% are null.  High percentage of nulls makes it hard to draw difinitive conclusions.
SELECT *
FROM exercises.md_gov_race
WHERE employer_occupation IS NULL;

SELECT *
FROM exercises.md_gov_race
WHERE employer_occupation IS NOT NULL;

SELECT *
FROM exercises.md_gov_race;

#10 A University of Maryland professor gave Ben Jealous a total of $6,000 in 15 separate contributions between September 2017 and June 2018, between $50 and $1000.  What is the name of the professor? What department does he teach in (you may need to do some internet research to find this out)? Please list the date and contribution amount for each contribution, along with all queries used to arrive at this information.

SELECT *
FROM exercises.md_gov_race
WHERE employer_name LIKE "%University of Maryland%";

SELECT *
FROM exercises.md_gov_race
WHERE contributor_name LIKE "%Hornstein%";

SELECT SUM(contribution_amount)
FROM exercises.md_gov_race
WHERE contributor_name LIKE "%Hornstein%"
GROUP BY contributor_name;

# How many contributions came from 21012 or 21401? Write a single query
# 1307
SELECT *
FROM exercises.md_gov_race
WHERE zip_code = 21012 OR zip_code = 21401;

#Return a table of with contributions from people who listed their employer name as being retired or retired at least part of the time? Do not include contributions from people who work at communities  or homes for people who are retired. And do not use the employer occupation field in this query.  Also list the number of records.
# A 6773

SELECT *
FROM exercises.md_gov_race
WHERE employer_name  LIKE "%retire%" AND employer_name NOT LIKE "%retirement%";
