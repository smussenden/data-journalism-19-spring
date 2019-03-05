# Class 11 In Class Lab
## SQL Lesson 2 | Summary Stats, Grouping

### Goal of Today's Lab

Today's lab will continue teaching you to use SQL and MySQL Workbench.  We'll do more with selecting, sorting, filtering and wildcards.  But today we'll also learn to group similar records and generate summary totals.

As with last night's homework, we'll be using the database of contributions to 2018 Maryland gubernatorial candidates Larry Hogan and Ben Jealous.  

You should read through the lab and follow along with the videos.  Have questions? Ask me or your neighbor.

### Submitting

Follow along with this lab, which will direct you to create an sql script file.  Upload it to this [ELMS assignment](https://umd.instructure.com/courses/1259604/assignments/4811989).

### Step 1: Setup.  

* Open MySQL Workbench and connect to the jourdata server.
* In Workbench, create a new SQL file called 11-in-class-lab-FIRSTNAME-LASTNAME.sql.
* At the top of the file, put a comment with Your name and the date.
* Just below that, type this command and run it: SET SQL_MODE='only_full_group_by'; Plan to do this for all future SQL work. This will ensure grouping (described below) works as expected.
* Follow the instructions in the video. At the end of the lab, you'll submit this assignment.

[Video Link](https://www.youtube.com/watch?v=9zJFLc4FnCU)

[![11-1-SQL-total-groupby](http://img.youtube.com/vi/9zJFLc4FnCU/0.jpg)](http://www.youtube.com/watch?v=9zJFLc4FnCU "11-1-SQL-total-groupby")


### Step 2: Calculating totals (Sum, Max, Min, Average and Count) with SQL

First, let's reacquaint ourselves with the data set of campaign contributions.

```sql
SELECT *
FROM exercises.md_gov_race;
```
SQL has several functions for generating summary totals from a group of records.

* SUM() - returns the total sum of a numeric column.
* AVG() - returns the average (mean) of a numeric column.
* MIN() - returns the minimum value in a numeric column.
* MAX() - returns the maximum value in a numeric column.
* COUNT() - returns the total number of rows with a non-null value in a given field -- i.e. COUNT(contributor_name). When used with the \*, it returns the number of rows -- i.e. COUNT(\*).


This query will output a table with one record and column called "SUM(contribution_amount)", giving you the the total amount of all contributions to the two candidates.

```sql
SELECT SUM(contribution_amount)
FROM exercises.md_gov_race;
```

Having a column named "SUM(contribution_amount)" is a little clunky.  We can rename it using a new bit of SQL: **AS**.

The following query is exactly the same as the one above, except for it renames the column in the table that's returned from "SUM(contribution_amount)" to "Contribution_Total".

```sql
SELECT SUM(contribution_amount) as Contribution_Total
FROM exercises.md_gov_race;
```

The other summary functions work the same way.  The following queries, run independently, will return the average contribution, the smallest contribution, the largest contribution and the number of contributions.
```sql
SELECT AVG(contribution_amount) as Average_Contribution
FROM exercises.md_gov_race;

SELECT MIN(contribution_amount) as Smallest_Contribution
FROM exercises.md_gov_race;

SELECT MAX(contribution_amount) as Largest_Contribution
FROM exercises.md_gov_race;

SELECT COUNT(*) as Number_Contributions
FROM exercises.md_gov_race;
```
One special note about COUNT().  If you use it in conjunction with the name of a single field, it will count the number of records for which there is a non-null value.  For example, suppose our contribution table had only 10 records, and in four of those records the contribution_amount field had a null value.  Using Count(contribution_amount) will give us a result of six.  Using COUNT(\*) will count the number of records, regardless of null values.  There are cases where both ways can be useful, just be clear on what each does.

We can also combine these into a single query to create a nice little summary table, separating each summary function with a comma.  

```sql
SELECT SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race;
```

The previous queries calculated totals on every record in the database.  It's possible to calculate totals on a subset of records, using **WHERE**, **LIKE** and other operators to filter.

For example, this returns a summary table like the one above, but only for contributions to Larry Hogan.

```sql
SELECT SUM(contribution_amount) as Contribution_Total_Hogan, AVG(contribution_amount) as Average_Contribution_Hogan, MIN(contribution_amount) as Smallest_Contribution_Hogan, MAX(contribution_amount) as Largest_Contribution_Hogan, COUNT(*) as Number_Contributions_Hogan
FROM exercises.md_gov_race
WHERE receiving_committee LIKE "%Hogan%";
```

### Step 3: Grouping records

With SQL, as with Pivot Tables in Excel, it's easy to group records of a certain type together and calculate totals using **GROUP BY**. For example, suppose we wanted to generate a summary totals table like the one above, but with one line for contributions to Larry Hogan, and one for Jealous.

```sql
SELECT receiving_committee, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
GROUP BY receiving_committee;
```

When grouping, we always need to have matching fields in the SELECT and GROUP BY lines, otherwise the query won't work properly. In the query above, note that receiving_committee appears in both lines. Without matching fields, MySQL will guess about which values to give you and may generate unreliable results.

We can also combine **GROUP BY** with a filter, using **WHERE**.  This query calculates totals for each candidate, but limits it to only 2018 contributions.

```sql
SELECT receiving_committee, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
WHERE year(contribution_date) = 2018
GROUP BY receiving_committee;
```

Note that **GROUP BY** comes after the **WHERE** statement.  We can also sort on one of the columns using **ORDER BY**.  This allows us to answer a question like "which candidate had the highest average contribution in 2018?".  

```sql
SELECT receiving_committee, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
WHERE year(contribution_date) = 2018
GROUP BY receiving_committee
ORDER BY Average_Contribution desc;
```

You can also group by multiple fields.  Let's say we wanted to create a summary table for each candidate, but we wanted to examine totals for each candidate for each year.  We can amend our query to group by both candidate AND the year of the contribution. Note that we've added "year(contribution_date) as Contribution_Year" to our SELECT statement and "Contribution_Year" to our GROUP BY statement.

```sql
SELECT receiving_committee, year(contribution_date) as Contribution_Year, SUM(contribution_amount) as Contribution_Total, AVG(contribution_amount) as Average_Contribution, MIN(contribution_amount) as Smallest_Contribution, MAX(contribution_amount) as Largest_Contribution, COUNT(*) as Number_Contributions
FROM exercises.md_gov_race
GROUP BY receiving_committee, Contribution_Year
ORDER BY Average_Contribution desc;
```

# Step 4: Come up with four queries.

Now it's your turn.  Think of some questions you can ask of the data and write four queries that include the following. All four should include:
* A SELECT statement with a summary table like the above queries.
* An ORDER BY statement.
* A GROUP BY statement grouping on one or more fields.

Two of the four should include:
* A WHERE clause with one more filters, one of which includes a wildcard.
* A GROUP BY statement that groups on two or more fields.

For each one, you MUST write a comment saying what your question is and how the query answers it.
