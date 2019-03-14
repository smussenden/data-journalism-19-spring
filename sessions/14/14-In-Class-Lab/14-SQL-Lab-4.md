# Class 14 In Class Lab
## SQL Lesson 4 | Making output more useful, IF functions

### Goal of Today's Lab

In our previous MySQL labs -- and MySQL homework assignments -- you have learned basic techniques for working with data. You've learned to join tables.  You've also grouped records and generated summary statistics for those grouped records. And you've learned to filter records.     

In today's lab, we'll learn how to do more advanced things with our output -- the summary tables we generate -- to make them more useful. And we'll also learn how to do IF functions, something we did previously with Excel.   

In this lab we'll be using the single-table database of campaign contributions to Republican Larry Hogan and Democrat Ben Jealous in the 2018 Maryland governor's race from January 2014 through June 2018, just before the primary election in June.

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

### Submitting

Follow along with this lab, which will direct you to create an sql script file.  Upload it to this [ELMS assignment](https://umd.instructure.com/courses/1259604/assignments/4811994).

### Step 1: Setup.  

* Open MySQL Workbench and connect to the jourdata server.
* In Workbench, create a new SQL file called 14-in-class-lab-FIRSTNAME-LASTNAME.sql.
* At the top of the file, put a comment with Your name and the date.
* Just below that, type this command and run it: SET SQL_MODE='only_full_group_by'; Plan to do this for all future SQL work. This will ensure grouping (described below) works as expected.
* Follow the instructions in the video. At the end of the lab, you'll submit this assignment.

[Video Link](http://www.youtube.com/watch?v=uwY0e8UE7-Y)

[![14-1-SQL-HAVING-ROLLUP-IF](http://img.youtube.com/vi/uwY0e8UE7-Y/0.jpg)](http://www.youtube.com/watch?v=uwY0e8UE7-Y "13-1-SQL-HAVING-ROLLUP-IF")


### Step 2: Filtering after Summarizing with HAVING.

In previous labs, we learned how to calculate summary statistics using GROUP BY and summary functions (average, sum, min, max, count).

For example, this query groups all contributions by "contributor type", and then tells us the total contribution amount, average contribution amount, smallest and largest contributions and number of contributions for all years for which we have data (2014 to 2018), ordered by contribution total from highest to lowest.   

```sql
SELECT contributor_type, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
GROUP BY contributor_type
ORDER BY contribution_total desc;  
```

And if we wanted to examine those same summary statistics, but only examine 2018 contributions, we could add a WHERE clause to filter.

```sql
SELECT contributor_type, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
WHERE YEAR(contribution_date) = "2018"
GROUP BY contributor_type
ORDER BY contribution_total desc;  
```

We get 12 records -- from $2.65 million in individual contributions to $250 in "Unregistered Out-of-State Non-Federal Committee". Let's suppose this table is too big for us, and we want a smaller table that only shows a contributor type if it has more than $10,000 in total contributions.

That's where we can use a new kind of filter -- HAVING -- which limits records returned in summary tables.  Let's try it now.

```sql
SELECT contributor_type, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
WHERE YEAR(contribution_date) = "2018"
GROUP BY contributor_type
HAVING Contribution_Total > 10000
ORDER BY contribution_total desc;  
```

Now we only get 8 records, none with a contribution total under $10,000.  

This query has two types of filters.  

The WHERE clause filters out any contribution before 2018, and it does this before the summary table is created.  

The HAVING clause executes after the summary table is created, and it removes rows from the summary table where the contribution total is less than 10,000.

Order matters here. The WHERE filter must be placed before GROUP BY.  The HAVING filter must be placed after the GROUP BY.  

Just as with WHERE, you can use multiple filters with HAVING. And you can use it filter out non-computed columns.  For example, this query is the same as above, but we're also filtering only for contributor types with committee in their name.  

```sql
SELECT contributor_type, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
WHERE YEAR(contribution_date) = "2018"
GROUP BY contributor_type
HAVING Contribution_Total > 10000 AND contributor_type LIKE '%committee%'
ORDER BY contribution_total desc;  
```

# STEP 3: Creating subtotals for groups using WITH ROLLUP

Now let's suppose we want to examine how the money coming from different contributor types -- Individual, PACs, businesses --  differs for each candidate.  We could create a nice summary table with the following query:

```sql
SELECT receiving_committee, contributor_type, SUM(contribution_amount) as total_contribution_amount, count(*) as number_records
FROM exercises.md_gov_race
GROUP BY receiving_committee, contributor_type
ORDER BY receiving_committee, total_contribution_amount desc;
```  

That's great, but suppose we wanted to benchmark the results in our table against the overall totals for each candidate?

We could run a similar query as above, but remove the statements that break it down by contributor type, like so:

```sql
SELECT receiving_committee, SUM(contribution_amount) as total_contribution_amount, count(*) as number_records
FROM exercises.md_gov_race
GROUP BY receiving_committee
ORDER BY receiving_committee, total_contribution_amount desc;
```

And if we wanted to further benchmark the contributions against total contributions (to both candidates), we'd have to do another query like this:      

```sql
SELECT SUM(contribution_amount) as total_contribution_amount, count(*) as number_records
FROM exercises.md_gov_race;
```

That's a lot of queries.  But what if I told you there was a way to automatically calculate all of the subtotals by adding just two words to our original query? That's the magic of using WITH ROLLUP.  

Let's run our original query again, just so we can compare the results of the queries that follow.  

```sql
SELECT receiving_committee, contributor_type, SUM(contribution_amount) as total_contribution_amount, count(*) as number_records
FROM exercises.md_gov_race
GROUP BY receiving_committee, contributor_type
ORDER BY receiving_committee, total_contribution_amount desc;
```  

We get 18 records, nine for Hogan and nine for Jealous.

The query below is the same as our first query, but I've added WITH ROLLUP at the end of the GROUP BY statement.

```sql
SELECT receiving_committee, contributor_type, SUM(contribution_amount) as total_contribution_amount, count(*) as number_records
FROM exercises.md_gov_race
GROUP BY receiving_committee, contributor_type WITH ROLLUP
ORDER BY receiving_committee, total_contribution_amount desc;
```  

What happened?  You got an error, right?  "Error Code: 1221. Incorrect usage of CUBE/ROLLUP and ORDER BY".  Unfortunately, you can't use ORDER BY and WITH ROLLUP in the same query.  So let's remove that line and run again.

```sql
SELECT receiving_committee, contributor_type, SUM(contribution_amount) as total_contribution_amount, count(*) as number_records
FROM exercises.md_gov_race
GROUP BY receiving_committee, contributor_type WITH ROLLUP;
```

Now we get 21 records.  We have the original nine for Hogan and for Jealous.  But now there's an additional one for Hogan with a null value in contributor_type, and an additional one for Jealous with a null value in contributor_type.  These lines represent the total of all contributions -- regardless of contributor_type -- to each candidate. For Jealous, $2.26 million, 19689 contributions. For Hogan, $14.12 million, 35638 contributions.  

And at the very bottom, there's a new one with a null value for both the receiving_committee and the contributor_type.  This is the total of all contributions, regardless of candidate or contributor_type -- $16.39 million, 55,327.

One other note of caution using WITH ROLLUP -- be careful of mixing it with having.  To see this in action, let's rerun our last query, but add a HAVING statement to only include contribution types with the total contribution amount above $50,000.

```sql
SELECT receiving_committee, contributor_type, SUM(contribution_amount) as total_contribution_amount, count(*) as number_records
FROM exercises.md_gov_race
GROUP BY receiving_committee, contributor_type WITH ROLLUP
HAVING total_contribution_amount > 50000;
```

Because we added the HAVING clause, there are only six contribution types for Hogan and three for Jealous.  But look closely at the subtotals for Hogan, Jealous and the overall total.  Those haven't changed from our original query.  

That's because the ROLLUP subtotals are calculated from the entire dataset before the HAVING clause executes.  So, be careful interpreting the results you get when combining HAVING and ROLLUP.     

# STEP 4: IF FUNCTIONS

In programming, a function is thing that takes an input, does something to it, and spits something out.  

For example, a function that calculates the square of a number would take in the number 2, process it, and spit out 4.  A function that calculates the mean of a number would take in the numbers 1, 2 and 3 and spit out 2.

We've used several functions in MySQL:
* COUNT() - takes a column or a table and tells you how many records are in it.
* SUM() - takes a list of numbers and adds them up.
* MIN() - takes a list of numbers, and spits out the lowest value.
* MAX() - takes a list of numbers, and spits out the highest value.
* YEAR() - takes a full date and spits out the year.

Here are some new ones to try out on your own:
* MONTH() - takes a full date and spits out the month.
* WEEKDAY() - takes a full date and spits out the day of the week.
* TRUNCATE() - reduces a number to a set number of decimal places.

And here's a full list. You'll find several dozen useful functions for modifying text, doing math, and more. https://www.w3schools.com/sql/sql_ref_mysql.asp

The IF() function is one of the most useful in SQL, and works similarly to the IF() function in Excel. It takes three pieces of information or "arguments":
* A logical test.  For example: contribution_amount > 5000.
* A value if the test is true. "large contribution".
* A value if the test is false. "small contribution".

The above example is structured like this:

```sql
IF(contribution_amount > 5000, "large contribution", "small contribution")
```

Used in conjunction with a complete SQL query, this would classify and contribution above $5,000 as a large contribution, and everything else as small. The following query create a new column called contribution size to classify each contribution according to the criteria set out above.

```sql
SELECT *, contribution_amount, IF(contribution_amount > 5000, "large contribution", "small contribution") as contribution_size
FROM exercises.md_gov_race;
```

We can that create summary totals by grouping on the new contribution_size column.

```sql
SELECT IF(contribution_amount > 5000, "large contribution", "small contribution") as contribution_size, count(*) as number_records, sum(contribution_amount) as total_contribution_amount
FROM exercises.md_gov_race
GROUP BY contribution_size;
```

We can also nest IF statements, just like in Excel.  This query creates a third category, tiny contribution, for contributions under 1000.  Anything over 5000 is a large contribution.  Everything else is a small contribution.

```sql
SELECT IF(contribution_amount > 5000, "large contribution", IF(contribution_amount >= 1000, "small contribution","tiny contribution")) as contribution_size, count(*) as number_records, sum(contribution_amount) as total_contribution_amount
FROM exercises.md_gov_race
GROUP BY contribution_size;
```

Okay, that's the end of the lab.  Submit your sql file on ELMS.
