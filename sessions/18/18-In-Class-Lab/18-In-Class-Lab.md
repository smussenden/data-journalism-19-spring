# Class 18 In Class Lab
## Analysis Project Lab + Advanced SQL

### Goal of Today's Lab

The goal of today's lab is to allow you to continue working on you data analysis assignment in advance of your submission of your first memo, which is due at the start of class 19.  We'll also review two new concepts in SQL - multiple joins and temporary tables.   

### Instructions and Submitting

Create a new SQL script file. Execute the queries described in this lab and [upload to the assignment on ELMS](https://umd.instructure.com/courses/1259604/assignments/4812000).

### Multiple Table Joins

So far, we've reviewed several different types of joins in SQL - inner, left, right and full.  This will serve as a brief introduction to the process for joining more than one table at a time.  

First, let's load up our FARS database accident table.

```sql
SELECT * FROM fars.accident;
```

The second column, STATE, has numeric codes for each state.  That's okay to work with if you know what each code is.  But it would be better to be able to work with the text name of each state.  Fortunately, we have a lookup table.

```sql
SELECT * FROM fars.lkp_state;
```

This table has two columns. The first is a code for each state, which matches what we have in our accident table.  The second is the name of each state. Now let's write a join query that connects the two tables, delivering us the text name of each state (from lkp_state) and the accident unique identifier (from accident).

```sql
SELECT *
FROM fars.accident a
JOIN fars.lkp_state b ON a.STATE = b.code;
```

The name of the state has now been appended in the rightmost column.

Scroll to the middle columns of the table, and look for "HARM_EV".  These are numeric codes that provide some detail about the "first harmful event" that caused the crash. We could refer back to the codebook for information on these, but that's a cumbersome workflow.  

Fortunately, there's a lookup table for this too.  

```sql
SELECT * FROM fars.lkp_harmevent;
```

The values in the "code" field in lkp_harmevent match the values in our "HARM_EV" field in accidents.

Let's do the same thing with this lookup table that we just did with state.  But instead of writing a brand new query, let's just add to our existing join.

```sql
SELECT *
FROM fars.accident a
JOIN fars.lkp_state b ON a.STATE = b.code
JOIN fars.lkp_harmevent c ON a.HARM_EV = c.code;
```

Scroll all the way to the right.  In addition to the state information from our accident table, we now have the harm event information from our harm event table.  

### Temporary Tables

It can sometimes be useful to store the results of a given query as an independent table of its own.  

This is particularly true if you write a query that takes a long time to execute.  Each time you work with it in a given session, it might be time consuming to run it over and over.

Or, you may want to write a summary query on a table, and then use that to return a set of records on the original table that meet certain conditions.   

Fortunately, SQL gives us a way to store the results of a query as "temporary table" or psuedo-table.    

This table doesn't really exist as a permanent part of a database.  When you close down Workbench it will essentially cease to exist, meaning you'll have to recreate the table at the beginning of each session.

Let's practice creating some.

Write a USE statement to use the fars database

```sql
USE fars;
```

In the query below, we're going to create a temporary table of the first 100 records from our Accident table and call it accident_100.


```sql
CREATE TEMPORARY TABLE accident_100
SELECT * FROM fars.accident
LIMIT 100;
```
Now that this new table has been created, we can query it like any other table.

``` sql
SELECT *
FROM accident_100;
```

Now let's say, from our accident table, we wanted to create a summary query to count the number of accidents for each type of harm event. Here's the code.

``` sql
SELECT b.event_desc, b.code, count(*) as num_rec
FROM fars.accident a
JOIN fars.lkp_harmevent b ON a.HARM_EV = b.code
GROUP BY b.event_desc
ORDER BY num_rec desc;
```

And now, let's add a HAVING clause to limit it to only the most common harm event types.

``` sql
SELECT b.event_desc, b.code, count(*) as num_rec
FROM fars.accident a
JOIN fars.lkp_harmevent b ON a.HARM_EV = b.code
GROUP BY b.event_desc
HAVING num_rec > 100
ORDER BY num_rec desc;
```

We can store this as a temporary table.  

``` sql
CREATE TEMPORARY TABLE common_harm_events
SELECT b.event_desc, b.code, count(*) as num_rec
FROM fars.accident a
JOIN fars.lkp_harmevent b ON a.HARM_EV = b.code
GROUP BY b.event_desc
HAVING num_rec > 100
ORDER BY num_rec desc;
```
Let's take a look at it.

```sql
SELECT *
FROM common_harm_events;
```

Okay, so now, let's suppose we wanted to create a set of all records from our accident table, but only include those that have the harm event that's on our list of most common harm events.  We can join our temporary table to our accidents table, like so.

``` sql
SELECT *
FROM fars.accident a
JOIN common_harm_events b ON a.HARM_EV = b.code;
```

This will return every single field from our accident table, but only those records where the harm event appeared in the temporary table we made of most common accidents.  Note that there are about 1,000 fewer records in this table.
