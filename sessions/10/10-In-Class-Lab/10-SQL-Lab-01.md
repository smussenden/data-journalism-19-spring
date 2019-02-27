# Class 10 In Class Lab
## Intro to SQL

### Goal of Today's Lab

Today's lab is designed to get you comfortable working with relational databases, teach you the basics of a computer language to ask questions of those databases (SQL) and to begin learning a common database management software tool (MySQL Workbench).  

You should read through the lab and follow along with the videos.  Have questions? Ask me or your neighbor.

### How to submit

As you follow along with this lab and watch the videos, you'll write queries in a .sql file.  Save the file as intro.sql and upload it to the [ELMS assignment](https://umd.instructure.com/courses/1259604/assignments/4811987).

### Key Terms

* **Database** - In this class, a database is a structured collection of information usually stored in one or more "tables".  Usually -- but not always -- information in one table is connected to information in at least one other table.  There are other, more complex kinds of databases that don't store information in tables, but we won't be working with those.     
* **Database Server** - A specially formatted computer that hosts a database.  In our case, we're using a server hosted by the college.  
* **SQL** - Stands for "Structured Query Language." This is a computer language that allows you to ask questions of databases in very specific ways. It is widely used by data journalists.
* **MySQL Workbench** - Database management software that allows you to connect to databases and write SQL to analyze those databases. This tool is free and open source, and one of dozens of popular database management tools.  You can download it on your own machine or work with the versions on the class computers.
* **Tables** - A collection of structured data, organized into rows (also called records or observations) and columns (also called fields or variables), which are the core of a database. These are similar to single spreadsheets. Some databases have only one table. Others may have multiple tables, including very complex versions with thousands of tables.  Generally, one or more tables will share common fields that allow them to be linked together.   


### Step 1: Opening MySQL Workbench and connecting to database server

In this video, you'll launch MySQL Workbench and set up the connection to the Merrill database server, which hosts the databases we'll be using for the next several weeks.

To follow along with this video, you'll need the password for the database server.  You can find it on [this ELMS page](https://umd.instructure.com/courses/1259604/pages/10-college-sql-server-information).  

**[Video Link](http://www.youtube.com/watch?v=OwqqwL4uj9g)**

[![10-01-intro-to-my-sql-workbench-server-connect](http://img.youtube.com/vi/OwqqwL4uj9g/0.jpg)](http://www.youtube.com/watch?v=OwqqwL4uj9g "10-01-intro-to-my-sql-workbench-server-connect")

#### Step 2: Learning The MySQL Workbench interface, tables overview.

This video is designed to introduce you to the MySQL workbench interface.

**[Video Link](http://www.youtube.com/watch?v=xYDtBidTPj0)**

[![10-02-intro-to-my-sql-workbench-interface-tour](http://img.youtube.com/vi/xYDtBidTPj0/0.jpg)](http://www.youtube.com/watch?v=xYDtBidTPj0 "10-02-intro-to-my-sql-workbench-interface-tour")


#### Step 3: Basic Queries with USE, SELECT, FROM, ORDER BY

This video is designed to teach you basic SQL queries, while working with a small example slice of a database frequently used by data journalists and investigative reporters, the National Inventory of Dams, which has information on the safety status of thousands of dams across the country.

If you wish to learn more about this data and how it's used by journalists, peruse these links before moving on: [NICAR documentation, record layout, other info](https://ire.org/nicar/database-library/databases/national-inventory-of-dams/).

**[Video Link](http://www.youtube.com/watch?v=ObPWBNkh72M)**

[![10-03-intro-to-my-sql-workbench-basic-queries](http://img.youtube.com/vi/ObPWBNkh72M/0.jpg)](http://www.youtube.com/watch?v=ObPWBNkh72M "10-03-intro-to-my-sql-workbench-basic-queries")

Here are some key components of basic SQL statements:

**USE** - This tells the database that you want to query from a particular database in subsequent queries. Here's an example, which says to pull from a table in the "exercises" database.
```sql
USE exercises;
```
**SELECT** with **FROM** - This allows you to return a set of record from a given table (or tables). Here's an example, which says to return the name of each dam listed in the table "dams1".

```sql
SELECT dam_name
FROM dams1;
```

If we hadn't specified that we were using the exercises database with USE, we'd have to do this.  

```sql
SELECT dam_name
FROM exercises.dams1;
```

We can also SELECT multiple fields at once.  Here's an example that returns the name, state, county and inspection date of each dam listed in the table "dams1".

```sql
SELECT dam_name, state_name, county, insp_date
FROM exercises.dams1;
```

And we can select every field in a given table using "\*". Here's an example that returns every field for every dam listed in the table "dams1"

```sql
SELECT *
FROM exercises.dams1;
```
**ORDER BY** - This allows you to sort a set of records you have selected. By default it sorts "ascending" or "asc" (smallest to largest), but it can also be sorted "descending" or "desc" (largest to smallest).

For example, this query returns a list of every field in the table "dams1", sorted alphabetically from Z to A by the name of the dam.

```sql
SELECT *
FROM exercises.dams1
ORDER BY dam_name desc;
```   

And this is the same query, sorted from A to Z. Note that there's no need to put "asc", because it sorts ascending by default.

```sql
SELECT *
FROM exercises.dams1
ORDER BY dam_name;
```

#### Step 3: Basic Filtering Queries with WHERE, LIKE

This video is designed to teach you to use filter records using WHERE.

**[Video Link](http://www.youtube.com/watch?v=ZryeL1Up51A)**

[![10-04-intro-to-my-sql-workbench-filter-a](http://img.youtube.com/vi/ZryeL1Up51A/0.jpg)](http://www.youtube.com/watch?v=ZryeL1Up51A "10-04-intro-to-my-sql-workbench-filter-a")


**WHERE and text and number filtering** - This allows us to select only those rows or records that meet certain criteria, a form of filtering. For example, this returns every field in the table "dams1", sorted alphabetically from A to Z by the name of the dam -- but only dams located in Ashland County, Ohio. Note that when filtering for text, the text must be wrapped in quotes.

```sql
SELECT *
FROM exercises.dams1
WHERE COUNTY = "ASHLAND"
ORDER BY dam_name;
```

Number fields do not require quotes, as in this example.  This returns every field in the table "dams1", sorted alphabetically from A to Z by the name of the dam -- but only dams built in 1969.

```sql
SELECT *
FROM exercises.dams1
WHERE year_compl = 1969
ORDER BY dam_name;
```

Besides equal signs, we can use other comparison and logical operators:

* Less than: WHERE year < 1969
* Greater than: WHERE year > 1969
* Less than or equal to: WHERE year_compl <= 1969
* Greater than or equal to: WHERE year_compl >= 1969
* Not equal to: WHERE year_compl <> 1969
* Between two numbers: WHERE year_compl BETWEEN 1969 AND 1972
* In a list of options: WHERE year_compl IN (1970, 1983, 1962)  

For example, this returns every field in the table "dams1", sorted alphabetically from A to Z by the name of the dam -- but only dams built before 1969.

```sql
SELECT *
FROM exercises.dams1
WHERE YEAR_COMPL < 1969
ORDER BY YEAR_COMPL;
```

Another example: this returns every field in the table "dams1", sorted alphabetically from A to Z by the name of the dam -- but only dams built in Ashland, Medina and Perry counties.

```sql
SELECT *
FROM exercises.dams1
WHERE county IN ("ASHLAND","MEDINA","PERRY")
ORDER BY dam_name;
```

This video is designed to teach you additional filtering techniques.

**[Video Link](http://www.youtube.com/watch?v=UoV9KMgWzz0)**

[![https://www.youtube.com/watch?v=UoV9KMgWzz0](http://img.youtube.com/vi/UoV9KMgWzz0/0.jpg)](http://www.youtube.com/watch?v=UoV9KMgWzz0 "https://www.youtube.com/watch?v=UoV9KMgWzz0")

**WHERE and text and number filtering** -- Because the values in our the inspection date field are stored as the  datetime data type (i.e. "1995-02-23 00:00:00"), we have more freedom to filter.  

For example, this returns every field in the table "dams1", sorted alphabetically from A to Z by the name of the dam -- but only dams inspected on February 23, 1995.

```sql
SELECT *
FROM exercises.dams1
WHERE insp_date = "1995-02-23"
ORDER BY dam_name;
```

And this is the same query, but it returns all dams inspected in 1995, not just on February 23, 1995.

```sql
SELECT *
FROM exercises.dams1
WHERE year(insp_date) = 1995
ORDER BY dam_name;
```

**WHERE and multiple filters** -- You can also combine multiple filters using the AND and OR operators. This is the same query as above, but it returns only those dams inspected in 1995 and in Fulton County.  

```sql
SELECT *
FROM exercises.dams1
WHERE year(insp_date) = 1995 AND county = "FULTON"
ORDER BY dam_name;
```

And this return a list of all dams inspected in 1995 (regardless of county) OR located in Fulton County (regardless of inspection year)

```sql
SELECT *
FROM exercises.dams1
WHERE year(insp_date) = 1992 OR year(insp_date) = 1993
ORDER BY dam_name;
```

This video is designed to teach you additional filtering techniques by using wildcards.

**[Video Link](http://www.youtube.com/watch?v=8HsDzlHAdjU)**

[![10-06-intro-to-my-sql-workbench-01-filter-c](http://img.youtube.com/vi/8HsDzlHAdjU/0.jpg)](http://www.youtube.com/watch?v=8HsDzlHAdjU "10-06-intro-to-my-sql-workbench-01-filter-c")

**LIKE** -- For even more flexibility when filtering, we can also use the LIKE operator and use wildcards to match text.

For example, this query uses the percent symbol to give us all records from dams1 where the name of the nearest city starts with "NEW".

```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY LIKE "NEW%"
ORDER BY dam_name;
```

This is the same query, but it finds only cities that end with "BURGH".
```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY LIKE "%BURGH"
ORDER BY dam_name;
```

You can also put wildcards on both ends.  Note that this returns a larger set of records than "NEW%" alone.  In addition to finding records that start with "NEW" -- like "NEW HAVEN" -- it also finds records that end with "NEW" or have "NEW" in the middle of the name -- like "SOUTH NEWBURY".

```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY LIKE "%NEW%"
ORDER BY dam_name;
```

You can also put the wildcard character in the middle.  This query will find only cities that start with "NEW" and end with "TOWN". Note that it returns records for both "NEWTOWN" and "NEWCOMERSTOWN."

```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY LIKE "NEW%TOWN"
ORDER BY dam_name;
```

There are two main wildcard characters.

* **%** The percent sign can be used to find any number of missing characters, including zero.  That's why it found both "NEWTOWN", which had zero characters between "NEW" and "TOWN" and "NEWCOMERSTOWN", with six missing characters
* **\_** The underscore character.  It looks for exactly one missing character.  If you'd use it in place of the percent sign in the last query, it will return no records.  Try it out.  

```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY LIKE "NEW_TOWN"
ORDER BY dam_name;
```

**NOT LIKE** -- You can also use the NOT operator in conjunction with LIKE and other operators to get back records that do note meet the criteria you set out.

For example, this query will return every record except those that start with "NEW".

```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY NOT LIKE "NEW%"
ORDER BY dam_name;
```

Even if you don't use NOT in conjunction with LIKE, you can also use it to exclude certain records. For example, this query returns all records except those with NEAR_CITY equal to "NEWTOWN" or "NEWCOMERSTOWN".

```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY NOT IN ("NEWTOWN", "NEWCOMERSTOWN")
ORDER BY dam_name;
```

For single values, you can also use the "not equal to" operator, <>.

```sql
SELECT *
FROM exercises.dams1
WHERE NEAR_CITY <> "NEWTOWN"
ORDER BY dam_name;
```

**IS NULL and IS NOT NULL** -- These allow you to find records with missing -- or null -- values or exclude them.  For example, this excludes all values without a YEAR_COMPL value.

```sql
SELECT *
FROM exercises.dams1
WHERE YEAR_COMPL IS NOT NULL
ORDER BY dam_name;
```

And this query returns all records where YEAR_COMPL is missing a value.

```sql
SELECT *
FROM exercises.dams1
WHERE YEAR_COMPL IS NULL
ORDER BY dam_name;
```

-30-
