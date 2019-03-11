# Class 13 In Class Lab
## SQL Lesson 3 | Joins

### Goal of Today's Lab

In our previous MySQL labs -- and MySQL homework assignments -- you have learned two basic techniques for working with data. Searching for individual records (selecting and filtering) and grouping records to generate summary information.  

In today's lab, we'll learn how to link two separate tables together to write more advanced queries. This is an extremely useful skill that will take your analysis skills to the next level!  

In this lab we'll be using a multi-table database of boating accidents collected by the Coast Guard. Documentation is [bard_record_layout.xlsx](bard_record_layout.xlsx)

### Submitting

Follow along with this lab, which will direct you to create an sql script file.  Upload it to this [ELMS assignment](https://umd.instructure.com/courses/1259604/assignments/4811991).

### Step 1: Setup.  

* Open MySQL Workbench and connect to the jourdata server.
* In Workbench, create a new SQL file called 12-in-class-lab-FIRSTNAME-LASTNAME.sql.
* At the top of the file, put a comment with Your name and the date.
* Just below that, type this command and run it: SET SQL_MODE='only_full_group_by'; Plan to do this for all future SQL work. This will ensure grouping (described below) works as expected.
* Follow the instructions in the video. At the end of the lab, you'll submit this assignment.

[Video Link](http://img.youtube.com/vi/urN8JudBKnw/0.jpg)

[![12-1-SQL-JOINS](http://img.youtube.com/vi/urN8JudBKnw/0.jpg)](http://www.youtube.com/watch?v=urN8JudBKnw "12-1-SQL-JOINS")


### Step 2: Exploring the Data.

Before we get into joins, let's take a minute to review the two tables we'll be using for today's lab.

The U.S. Coast Guard collects reports on boat crashes where a person dies, a person disappears, a person is seriously injured or a boat is damaged or lost. Documentation here. Record Layout is here.  

Data sets we've worked with previously had all of the information in a single table.  This is different.  The data is broken up into multiple tables.  And we can link them together by a field the tables share in common.

This data set has four tables: accidents, deaths, injuries and vessels.  We're going to work with two of them today: accidents and deaths.  Let's write a select query and look at each of them in turn.

```sql
SELECT *
FROM bard.accidents;
```
In this table, there is one record per accident, a total of 2,076 rows. Each accident has unique identifier, bardid. There's a narrative of what happened in the accident (RedactedNarrative).  It has information on when and where it occurred, what caused the accident, the number of people killed, weather conditions and more. See the documentation for more details.  

We can confirm that there is, in fact, only one record per unique accident identifier with the following group by query.

```sql
SELECT bardid, count(*) as count
FROM bard.accidents
GROUP BY bardid
ORDER BY count desc;
```
Now let's look at the deaths table.

```sql
SELECT *
FROM bard.deaths;
```

In this table, there is one record per death, a total of 179 rows.  Each person has a unique person id (DeceasedID).  There's lots of other information in here, including demographic information (gender, age), whether they were wearing a life jacket and more.  Notice that there's also, for each death, a bardid, which is the same record name we have in our accidents table that uniquely identifies each accident. Do these bardid values repeat in this table?  Or, like the accident table, do they only appear once?  Let's find out.

```sql
SELECT bardid, count(*) as count
FROM bard.deaths
GROUP BY bardid
ORDER BY count desc;
```

There are several cases where the bardid -- the unique record identifier for each accident -- repeats three or two times.  Why is this? Because more than one person died in that accident.

Let's take a look at one of these accidents.

``` sql
SELECT * FROM bard.deaths
WHERE bardid = "MD-2016-0161";
```

There are three records.  We learn that three people died in this accident, all men right around age 50, who were wearing life jackets.  Two of them were found, both drowned.  The other disappeared.  All were from Delaware.

Now let's go look up that accident in our accidents table.

``` sql
SELECT * FROM bard.accidents
WHERE bardid = "MD-2016-0161";
```

We get a lot more information here. The accident happened in late November 2016, when the water temperature was in the mid-50s. Three people died, one was injured.  It happened in hazardous water, on the Potomac, just offshore of St. Mary's County, at around 9 p.m.

This is a good process, but it's annoying to have to write two queries to get the information, when we can get it all in one.  

### Step 3: Doing Joins

Our goal with this first join is to return information about each of the three deaths in our deaths table from crash MD-2016-0161. But instead of just getting information from the deaths table, we want to also bring in information from our accidents table and mash them together. Let's run this query.

``` sql
SELECT *
FROM bard.accidents JOIN bard.deaths on bard.accidents.bardid = bard.deaths.bardid
WHERE bard.accidents.bardid = "MD-2016-0161";
```

Let's review what we get in the table.  We get three records, one per death in MD-2016-0161.  The leftmost columns in the table are all of the records from the accidents table about the accident -- where and when it happened, how many people died, what caused it, et cetera.  They values are all identical.

As we scroll to the right, we see the fields from the deaths table for this particular crash.  The values are different here, because they describe different people who died in the crash.

Let's break the query down.  

The SELECT statement says select all fields from BOTH tables.

The FROM and JOIN statements say to find the records in the accidents table and find the records in the deaths table and, for those that share the same bardid, put them together.

Lastly, the WHERE statement says to limit it just to the records from that one accident, which is why we get three records back.

Let's take a closer look at how joins work. First, select the entire accidents table.

``` sql
SELECT *
FROM bard.accidents;
```

We get 2,076 records.  Now let's select the entire deaths table.

``` sql
SELECT *
FROM bard.deaths;
```

We get 179 records.  Now let's join the two tables together.

``` sql
SELECT *
FROM bard.accidents JOIN bard.deaths on bard.accidents.bardid = bard.deaths.bardid;
```

We get 179 records.  On the left, we have columns from bard.accidents.  On the right, we have the columns from bard.deaths.

We can also do the join in the other direction, by changing the order in our FROM statement.  

``` sql
SELECT *
FROM bard.deaths JOIN bard.accidents on bard.deaths.bardid = bard.accidents.bardid;
```
We still get 179 records.  But this time, we get the columns from the deaths table on the left, and the columns from the deaths table on the right.  

Because we're working with multiple table names when we do joins, our queries become especially verbose. We can shorten them by giving each of our tables a nickname. In this case, we're going to shorten bard.deaths to "d" and bard.accidents to "a", like we do when we rename columns that create summary statistics.  Try this query, which is the same as above.

``` sql
SELECT *
FROM bard.deaths AS d JOIN bard.accidents AS a on d.bardid = a.bardid;
```  

And, in fact, we don't have to use the AS, and it still works.

``` sql
SELECT *
FROM bard.deaths d JOIN bard.accidents a on d.bardid = a.bardid;
```  

### Step 4: Combining Joins with Other Statements

That's the basic structure of a join. Everything you've previously learned about types of queries will work with joins.  You can filter, sort, select only certain columns, group, calculate summary statistics and more.  Let's look at a few examples.

This query is the same as the previous query, but we're only selecting the bardid, cause of death and the role of the deceased person from the deaths table, and the year from the accidents table. Notice that I'm using the table nicknames a and d to select columns.

``` sql
SELECT d.bardid, d.CauseofDeath, d.DeceasedRole, a.Year
FROM bard.deaths d JOIN bard.accidents a on d.bardid = a.bardid;
```  

We can filter.  This query gives us all records from deaths and accidents, where the person who died was under 18 (from the deaths table) in 2016 (from accidents)

``` sql
SELECT *
FROM bard.deaths d JOIN bard.accidents a on d.bardid = a.bardid
WHERE d.DeceasedAge < 18 AND a.YEAR = '2016';
```  

We can calculate summary statistics, like this query, where we're calculating the total number of each cause of death (from deaths) in each year (from accidents).

``` sql
SELECT a.year, d.CauseofDeath, COUNT(*) as count
FROM bard.deaths d JOIN bard.accidents a on d.bardid = a.bardid
GROUP BY a.year, d.CauseofDeath
ORDER BY a.year, d.CauseofDeath;
```

### Step 5: Discussion of Join Issues

There are a few key things to pay attention to when joining.

1.  Make sure you're joining on fields with shared values.  The join will not work otherwise. The field names don't need to be the same name, but they do need to contain shared values.

2. With the kinds of joins we have learned so far -- called inner joins -- you're only going to get a record back if there's a shared value in the join field in both tables. And if a value in a join field repeats more than once in both tables, you may get duplicate records. So be sure to count the number of records you get back.     

### Step 6: Discussion of Different Types of SQL joins

There are several different types of joins. We're learning inner joins here. For a breakdown of joins, visit [this W3Schools Page](https://www.w3schools.com/sql/sql_join.asp) or watch the video for this lab.

* (INNER) JOIN: Returns records that have matching values in both tables
* LEFT (OUTER) JOIN: Return all records from the left table, and the matched records from the right table
* RIGHT (OUTER) JOIN: Return all records from the right table, and the matched records from the left table
* FULL (OUTER) JOIN: Return all records when there is a match in either left or right table

### Step 7: Discussion of why we use joins

There are lots of reasons to do joins.  To answer this question, it's good to acknowledge why people who make databases put information in separate tables, which require us to do joins.

1.  When building a database, it's best practice to avoid repeating information.  If the designers of the boating database were to create a single table combining accident information and death information in a single table -- instead of splitting them into two tables -- they'd have to repeat the accident information several times in cases where there were multiple deaths.
2.  When building a database, it's best practice to use a little space as possible when storing information.  That's why in our boating database, for example, gender is stored not as "male" or "female", but as -1 or 0.  To create more readable tables, we'd want to join to a "lookup table" that included the names of variables.

There are other reasons we do joins, too.

1. Sometimes, we want to create a summary table, and then join it back with an existing table to return certain records. We'll look at this process later in the semester.
2. Lastly, we can join tables from different datasets -- bus drivers with bad driving records, for example.  This sort of matching – referred to as an “enterprise” join – can also be used to provide context. One might link a database of school test results to a database of demographic information at the neighborhood level.

### Step 8: Joins on Your Own

Now it's your turn to think of some questions and write out three queries that use joins with other SQL statements.

When you're submit to ELMS in the link at the top of the page.
