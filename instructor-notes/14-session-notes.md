# SESSION 14 OUTLINE

## To read and do
* Move key from SQL Assignment 3 into Session 13 folder. (after midnight)
* Move Session 14 folder into package.    

## To publish on ELMS
* Module 14
* SQL Lab 4
* SQL Assignment 4

## Print before class
* this outline.
* class session 14 guide
* sql assignment 3 key
* sql lab 4
* sql assignment 4
* College SQL Server Credentials

## Bring up before class
* open sql Workbench
* Preferences > Fonts > Boost ALL four to 18.
* connect to college server with my user and pass.
* Paste blank SQL assignment 1 in desktop.
* GitHub desktop and login.

## Draw on the board.

Two tables, A - Students, B - SAT Scores

Student_ID | Student_First_Name | Student_Last_Name
A1 | Sean | Mussenden
A2 | Adrianne | Flynn
A3 | Chris | Harvey
A4 | Sandy | Banisky

Student_ID | SAT_Math | SAT_Verbal
A1 | 750 | 725
A2 | 600 | 750
A3 | 675 | 775
A5 | 500 | 600




## Class Intro - 5 minutes
* Reminder: if you are struggling, set up time to come see me.  I want to leave no one behind. Office hours - Monday and Thursday from 3-430.
* Review class schedule for today.

## PIA Letters - 5 minutes
* Reminder: send your letters today, if you haven't, on letterhead.  
* Follow up today (if you've already sent) or tomorrow (if you're sending today) to make sure they got it and find out if they have any questions!
* Follow up next week to inquire about status. Ask if they have questions.

## SQL Assignment 3 Review - 20 minutes
* This data: kind of a mess, yeah.  
  * How is it flawed, what did we notice?
  * Why might this be the case?
* Go over key, bring people up.
* Go around the room and ask people to whip off what questions they asked, and why that might be newsworthy?

## Different Types of SQL joins - 10 minutes

* There are several different types of joins. We're learning inner joins here. For a breakdown of joins, visit [this W3Schools Page](https://www.w3schools.com/sql/sql_join.asp) or watch the video for this lab.
* SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
* (INNER) JOIN: Returns records that have matching values in both tables
* LEFT JOIN: Return all records from the left table, and the matched records from the right table
* RIGHT JOIN: Return all records from the right table, and the matched records from the left table
* FULL OUTER JOIN: Return all records when there is a match in either left or right table

* Then add another record to SAT table, with duplicate student ID show how the double join works. "Let's say we have someone who took SAT twice", Chris Harvey.
A3 | 700 | 750.
* Then add another record to Student table with duplicate student ID, show how the quadruple join works. A3 | Christine | Harvey.  They screwed up, added her under a duplicate record number.  

## SQL Lab 4 - Rest of class
* Go over it

## SQL Assignment 4 - Homework
* Due by Thursday.
