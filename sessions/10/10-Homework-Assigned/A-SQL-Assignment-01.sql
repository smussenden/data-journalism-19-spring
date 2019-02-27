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

/* To submit: Rename the file firstname-lastname-SQL-Assignment-01.sql and upload to ELMS here: https://umd.instructure.com/courses/1259604/assignments/4811986 */

# 1. How many records are in the table?

# 2. What is the dollar amount of the largest dollar contribution from any source?  Who was it from, and who did it go to? What does the contribution type mean (link to a page or file on elections.maryland.gov where you find support for your answer)?

# 3. What was the largest dollar contribution amount to Ben Jealous? Who made it, and what type of contribution was it?

# 4. Did Larry Hogan make any loans to his own campaign? Explain why you think this might be.

# 5. With the exception of a $9,004 contribution to Ben Jealous (which is possibly an error in the data), what is the dollar amount of the largest contribution from an individual donor.  Note: there are more than 200 individual contributions at this amount. For extra credit, do some quick Internet research and offer your best guess as to why this amount is the largest contribution.

# 6. How many contributions are from Maryland?  How many contributions are from outside of Maryland, including other U.S. states and terrorities, foreign countries or contributions with no state listed?

# 7. How many contributions for Larry Hogan came from outside of Maryland, and how many came from Maryland?  How many contributions for Ben Jealous came from outside of Maryland and how many came from Maryland?  Write four queries in total, each of which should use LIKE and wildcards to find contributions to Jealous or Hogan.  Then, using Excel or a calculator, calculate the percentage of each candidate's contributions that came from out of state.

# 8 The actress Jada Pinkett Smith gave money to one of the candidates.  List the candidate she gave to, her address, how much she gave, what she listed as her employer and the date.  Then list some of the clues in the data that tell you that the person described in the database as "Jada Pinkett Smith" is actually the actress and not just some random person with the same name, and how you would verify your hunch with web research.

# 9. How many contributions were made to Larry Hogan in calendar year 2018?

# 10. How many contributions were made to Ben Jealous on March 1, 2018 or later? How many were made on exactly March 2, 2018?

# 11.  How many total contributions have a null value for employer_occupation?  How many total contributions have a non-null value for employer contribution?  What percentage of total contributions have a null value (use Excel or a calculator)?  Write a sentence describing your level of confidence in using the information in this database to describe, in aggregate, the occupations of people contributing to the campaign.

# 12. A University of Maryland professor gave Ben Jealous a total of $6,000 in 15 separate contributions between September 2017 and June 2018, between $50 and $1000.  What is the name of the professor? What department does he teach in (you may need to do some internet research to find this out)? Please list the date and contribution amount for each contribution, along with all queries used to arrive at this information.

# 13. How many contributions came from 21012 or 21401? Write a single query to do this.

# 14. Write a query that will return a table with contributions from people who listed their employer name as being retired or retired at least part of the time? Do not include contributions from people who work at communities or homes for people who are retired. And do not use the employer occupation field in this query.  List the number of records in the table here.
