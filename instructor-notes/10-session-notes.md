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
* Preferences > Fonts > Boost ALL four to 18.
* connect to college server with my user and pass.

## Class Intro - 5 minutes
* Reminder: on contact logs, please give access to smussenden@gmail.com
* Reminder: if you are struggling, set up time to come see me.  I want to leave no one behind. Office hours - Monday and Thursday from 3-430.
* Review class schedule for today.

## Data Acquisition Project Discussion - 20 minutes
### NOTE FOR NEXT YEAR. Need to knock this down to 15 minutes.  Went on too long, cut into lab time.
* The reporting is ongoing.  You did a lot of great reporting leading up to the publication of this post, some more than others. It does not stop here. We're working up to writing a good request in a few weeks. **If you have not talked to someone on phone yet, move heaven and earth to get someone on the phone ASAP**
* If you emailed and got no response, call. If you called and got no response, call again. If the person you get isn't the write person to talk about, find out who is.
* **Who is having a problem they could use the class's help on?**
* You can learn a lot by looking at what your classmates write. It's not required, but definitely worth diving in. Read the posts. Discussion of findings in forum posts. Each year, write down specific things to talk about.
    * Dan. EXEMPLARY WORK. Seeking Baltimore Housing Department inspection records.  And they have a website, where you can go search by neighborhood, and pull up these PDF of code violations.  Which is not particularly useful for analysis. Dan followed my instructions to a tee to figure out the "life cycle of information" inside the department.  He found out that "He then went on to explain the process. "Inspectors write up either citations or violations after either a 311 complaint (he said they get 60,000-70,000 of these per year), a routine inspection, or by inspectors doing daily rounds in neighborhoods looking for rule breakers. Any citation or violation is entered into the department’s Computerized Housing Inspection Program (CHIP), which as Hessler said manages the department’s enforcement efforts. Inspectors don’t actually write the violations themselves, but enter the violation into the CHIP system from a dropdown menu, which in turn generates the PDF. The PDF is then sent by mail to either the tenant or the owner of the deed, depending on the kind of violation. He said it’s very important to get the violation into the hands of someone as soon as possible so that the problem is fixed. **What's important here is Dan knows the name of the database! CHIP. He can request it. What should Dan do before submitting a request? Is there a record layout? Is there a data dictionary? What fields are in the database?**
    * Colleen. "The MVA and MDE jointly manage VEIP. The MVA keeps several datasets that are available upon request including customer service surveys, license renewals, registrations dating back to 1951, car sales within the state and organ donor reports. VEIP data is submitted to the MDE from the MVA. (I don't fully understand this process and need to learn more before I make a PIA request)." **This is good news! You may be able to work to get it from BOTH agencies!** Other point: "I need to choose a manageable subset of the VEIP data to work with for the purpose of this class." **Manigable can mean ALL of the data**.
    * Ian. GREAT WORK. Discovered there's a database of landfill information that is used to generate reports on that appear in PDFs of state website. Ian got David Mrgich, the chief on the phone. **How did you do that?**  **Question: the person told him to request a certain set of years. How should Ian figure out how many years to request?** Answer: what's necessary for a story.  And what is gettable.  If older records stored in older database or in old format, could be expensive. If it's not necessary, tailor the request.
    * Horus. Got some data from the city of Annapolis, requesting parking tickets. And she sent him data! Pull up spreadsheet.  **Is horus done?**  No.  This is only a piece.  What other information might be on a parking ticket that is useful for analysis? VIN #? License Plate? What else? Parking officer? **How could he figure what else is out there?** get a copy of a parking ticket.
    * Elliott. Nosy public information officers. Wants from Maryland State police data of officer involved incidents? "He asked me about the timeframe for my story, what the story was about and why I was interested in the police incident angle. I did my best to respond in a respectful way without giving away too much. I regrettably told him that I’m a graduate student, which hopefully doesn’t put me at a disadvantage moving forward." **What's the best way to respond?**

## Introduction to relational databases and SQL - 10 minutes
### Note for next year.  Speed this up.  Really stick to 10 minutes.  Need to leave PLENTY of TIME for lab.
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
