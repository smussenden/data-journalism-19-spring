## Introduction
* Introduction to relational databases
* Today's the first time we're going to be use SQL to write code to analyze data.
* This takes us beyond the spreadsheet and beyond Excel.
* A lot of what we're doing will at first seem really similar to what we've done in Excel.
* Looking at records, sorting, filtering.  Soon, we'll even get to writing code that are essentially the same thing as pivot tables.
* And compared to Excel, at first, it's going to seem a lot less intuitive, because it's writing code, as opposed to using a GUI.
* But this is a superior method.  
* It lets you work with larger data sets.  
* It lets you easily mashup two different data sets, which gives you the power to do better stories -- bus drivers with criminal records; police vehicles with toll records; health outcomes and income levels.  
* SQL is a great, easy way in to data programming, which will open the door for you to do more complicated things in other programming languages later on.
* It's part of the holy triumvirate of SQL, Python and R, commonly used together by data journalists and data scientists.

## Install Party
* Let's get this on your local machine.

## Lab
* Follow along with videos


# SESSION 10 OUTLINE

## To read and do
* The Data Acquisition Memo 2 Forum posts, and make notes.
* Exam 1 grades.
* Memo 1 grades.
* Remove exam 1 from Git Repo   

## To publish
* Module 10
* SQL Lab 1
* SQL Assignment 1
* Exam Excel files (2x) on ELMS
* Exam key on ELMS
* College SQL Server info

## Print before class
* this outline.
* class session 10 guide
* sql lab 1.
* sql assignment 1
* College SQL Server Credentials

## Bring up before class
* open sql Workbench
* connect to college server with my user and pass. 

## Class Intro - 5 minutes
* Reminder: if you are struggling, set up time to come see me.  I want to leave no one behind. Office hours - Monday and Thursday from 3-430.
* Review class schedule for today.

## Data Acquisition Project Discussion - 15 minutes
* Discussion of findings in forum posts. Write down specific things to talk about.
  * What is your present problem with figuring out how to get information?
    * Horus - parking tickets, show his data.
    * Others?

## Introduction to relational databases and SQL - 10 minutes
* Today, we head down a new path with our data analysis.
* We're going to learn a data programming language -- SQL -- and write code to do what we've previously done in Excel.
* We're also going to work with databases today.
  * Previously, we've worked with spreadsheets.
  * Typically, a database is a collection of spreadsheets that is linked together in some way, a common field in each spreadsheet.
  * Sometimes, it's just a single table. That's what we'll start with, single table databases, before working up to multi-table databases.   
* A lot of what we're doing will at first seem really similar to what we've done in Excel.
* Pull up SQL workbench, which I've already logged in.
  * Tell them: you don't need to follow me.  This is just to give you a sense of what we're talking about. There will be so many tutorials about this.
  * Show the GUI.  
  * Show the list of databases on the left.
  * Show the BARD database, a multi-table database.
  * Accidents and Deaths.   
* Show md_gov_race. This is a database of campaign contributions to Larry Hogan and Ben Jealous.
  * Examine records SELECT * FROM exercises.md_gov_race; 55K records. One record per donation.  Show some of the rows.
  * Sorting from highest to lowest. SELECT * FROM exercises.md_gov_race ORDER BY contribution_amount desc;
  * Filtering for Hogan records SELECT * FROM exercises.md_gov_race WHERE receiving_committee like '%Hogan%' ORDER BY contribution_amount desc;
  * Summarizing in a way very similar to pivot tables. SELECT receiving_committee, count(* ) as count, sum(contribution_amount) as totals FROM exercises.md_gov_race GROUP BY receiving_committee;
* Compared to Excel, it's going to seem a lot less intuitive, because it's writing code. But this is a superior method for several reasons.   
  * It lets you work with larger data sets than Excel can handle.
  * It allows you to write much more complex queries than Excel can handle.
  * The script files you create while making this data is transparent and reproducable, which means it's easier to fact-check.
  * It sets you up for learning the other two programming languages most often used by data scientists and data journalists - R and Python. SQL, R and Python are the three key languages.
  * It lets you combine data sets much more easily with JOINS. Bus drivers with criminal records; police vehicles with toll records; How asthma rates are connected to neighborhood temperature.

## In-Class Lab
* Rest of class
