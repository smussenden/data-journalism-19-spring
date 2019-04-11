# Session 20 OUTLINE

## To read and do
* Move Session 20 folder into package.  
* Read rest of people's data analysis assignments, make notes and prepare to talk to them.
* Read data cleaning forum posts and prepare to talk about bad data guide

## To publish on ELMS
* Module 20
  20-Data-Import-Lab

## Print before class
* this guide.
* session outline.
* Data import lab guide
* Forum posts
* Bad data guide
* Bad data guide assignment

## Bring up before class
* sql workbench.

## Class Intro - 5 minutes
* Will come around and talk about data analysis assignment. HIT PEOPLE I MISSED LAST WEEK.
* Will come around and talk about your PIA requests.  If you need something from me, flag me down.
* Reminder: if you are struggling, set up time to come see me.  I want to leave no one behind. Office hours - Monday and Thursday from 3-430.

## Discuss data flaws
* These are checks you should be doing whenever you have a new data set.
* You should expect to find some of these problems in pretty much every data set you use.
* How you resolve them are critical.  Leaving them unresolved can lead you to draw inaccurate conclusions.
* Don't make assumptions.  When in doubt, go to the documentation.  Or call someone.
* Sometimes, you cannot resolve these problems, and you will be forced to limit the questions you can ask. This is okay and good.  Be conservative.  

## In Class Lab - Data Import
* how to pull data into sql. Kind of a messy process. 

# SOLUTION
At the end of class, show them solution, which is to modify the csv with any comma inside a quote as \ in front of it

drop table lkpnearcity;
use bard;

create temporary table lkpnearcity (
 dirtyname varchar(40),
 cleanname varchar(40),
 record_count int
 );

 select * from lkpnearcity;

LOAD DATA LOCAL INFILE  '~/Desktop/nearcity.csv'
INTO TABLE lkpnearcity
FIELDS TERMINATED BY ',' escaped by '\\'
LINES TERMINATED BY '\r';

 select * from lkpnearcity;  
