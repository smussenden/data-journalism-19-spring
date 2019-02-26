# Class 09 | Exam
## Exam 1 (Analysis, Excel, Public Records Acquisition)  

## Objective

This exam is designed to test your mastery of the core concepts introduced in the first part of this course.

This includes:

* Calculating sums (and other summary statistics, like averages), change, percent change, share of total, and rank in Excel;
* Using Pivot Tables, filters and IF functions in Excel;
* Analyzing data using a set of questions provided to you;
* Developing your own questions to ask and hypotheses to test and performing analysis;
* Identifying flaws in data that could affect your analysis;
* Reviewing documentation to get a sense of what data does and does not show;
* Using open data and data sets constructed by news organizations.         
* Developing newsworthy information from your analysis and writing up those findings;
* Using public records laws to get information from a government agency;
* Finding markers of government databases using information on the web.

## Turning it in

You have until the end of class to complete the exam.

Upload a text file with the answers and your edited spreadsheets to the [ELMS assignment](https://umd.instructure.com/courses/1259604/assignments/4812010).  

**Make sure the spreadsheets you upload show your work. I would advise re-downloading them after you've uploaded, just to confirm you've uploaded the correct thing.**

## Resource Materials

The only thing you *cannot* do during this exam is communicate in any way with anyone else -- including your classmates -- except for me.  That includes texting your friends or calling someone.    

You can use any published or unpublished material you like. This includes notes, information you find on the web, your previous assignments, my answer keys from previous assignments, study guides, et cetera.  Seriously, anything.

## Part 1 - U.S. Refugee Flow Analysis | 35 points + 5 points optional extra credit

You are a reporter at the Washington Post, and your editor has assigned you to report a story about how the flow of refugees into the U.S. has changed over the last several years.  

"Refugee" is the government's term for a foreign national who seeks asylum in the U.S. after fleeing their home because of a fear of persecution or violence because of race, religion, political affiliation or other reasons.

### The data

The Refugee Processing Center, an arm of the State Department, keeps data on refugee admissions by country of origin, continent, year, state of arrival and other information [here](http://www.wrapsnet.org/admissions-and-arrivals/).

Use the spreadsheet [data/refugee.xlsx](data/refugees.xlsx) for this part of the exam.  It shows the number of refugees admitted to the U.S. from each continent or continent group from Fiscal Year 2004 to Fiscal Year 2018.

A note about U.S. government fiscal years, which are different from calendar years. They start on Oct. 1 and end on Sept. 30.  For example, FY 2018 started on Oct. 1, 2017 and ends on Sept. 30, 2018. FY 2017 started on Oct. 1, 2016 and ended on Sept. 30, 2017.

In the provided spreadsheet, FY 2018 data is current through Aug. 31, 2018.

### Tasks and Questions

1. Set up the spreadsheet as you have been instructed in previous assignments and labs. (5 points)

Then answer the following questions:

2. How many total refugees -- from all continents -- were admitted to the U.S. from Oct. 1, 2004 to Aug. 31, 2018? Note: there were no refugees from Antarctica or North America. (5 points)

3. From which continent (or continent group) were the largest number of refugees admitted to the U.S. between Oct. 1, 2016 and Aug. 31, 2018? How many were there? (5 points)

4.  Between FY 2016 and FY 2017, what was the percentage change in total refugees admitted to the U.S.? (5 points)

5.  Which continents (or continent groups) saw a percentage increase in total refugees between FY 2016 and FY 2017, and which saw a percentage decrease during that same period? (5 points)  

6.  Write a sentence explaining why you should be cautious about calculating change between FY 2017 and FY 2018. If you did such comparison, what would you need to disclose to the reader? (5 points)

7.  In FY2017, what percentage of all refugees admitted to the U.S. came from Europe? In FY2018, what percentage of all refugees admitted to the U.S. came from Europe? (5 points)

8.  **Extra Credit**: What happened between 2016 and 2018 that might explain the change in the number of refugees? Feel free to do web research. (5 points)

## Part 2 - School Shooting Data | 30 points + 10 points optional extra credit

Because the federal government does not track school shootings, reporters at the Washington Post set out to quantify the toll taken on the nation's school kids by exposure to gun violence.

In addition to producing [graphics and text stories](https://www.washingtonpost.com/graphics/2018/local/school-shootings-database/?utm_term=.ea8ffc9a2b5c) on trends uncovered by their data analysis, the team publishes their data for use by others in [this GitHub repo](https://github.com/washingtonpost/data-school-shootings). **For this assignment, DO NOT USE their data.**  Use the data linked below.  

### The data

According to the Post, the data represents an attempt to "identify every act of gunfire at a primary or secondary school during school hours since the Columbine High massacre on April 20, 1999. Using Nexis, news articles, open-source databases, law enforcement reports, information from school websites and calls to schools and police departments, The Post reviewed more than 1,000 alleged incidents but counted only those that happened on campuses immediately before, during or just after classes. Shootings at after-hours events, accidental discharges that caused no injuries to anyone other than the person handling the gun, and suicides that occurred privately or posed no threat to other children were excluded. Gunfire at colleges and universities, which affects young adults rather than kids, also was not counted."

The Post data includes 221 shooting incidents since Columbine, with one record per incident.   

For this assignment, use [school-shootings.xlsx](data/school-shootings.xlsx), a version of the Post data with some fields removed. A data dictionary that explains the fields in the spreadsheet in the tab "documentation".

### Tasks and Questions

1. Set up the spreadsheet as you have been instructed in previous assignments and labs. (5 points)

Then answer the following questions:

2.  What is the name of the private school with the highest number of people killed in a single shooting incident? How many people were killed in the shooting incident (excluding the shooter)? (5 points)

2.  Create a new column to indicate whether or not the shooter in each incident was an adult (18 or over), a minor (17 or under) or unknown (null or missing value). What percentage of the 221 shooters were adults? (5 points)

3.  Which state had the most school shooting incidents in which there was at least one casualty? Do not include the shooter in any tabulation of casualties. How many of those shooting incidents were there in that state? (5 points)

4.  Rank the states by total number of school shooting incidents, with the 1st having the highest number of school shootings.  Which state is ranked 9th? (5 points)

5.  How many schools have had more than one school shooting incident? Name the school(s), the state in which they're located, and the total number of shooting incidents at that school. (5 points)

6.  In what percentage of shootings did the shooter die during the shooting? In what percentage of cases did something else happen (the shooter lived, the shooter status was unknown or a blank/missing value)? (5 points)

7. *Extra credit:* Develop a question that you think might lead to a newsworthy finding and answer it by editing the spreadsheet. Provide the question, the answer and explain the method you used to answer it in Excel. (5 points)

8. *Extra credit:* create a new column to indicate if the shooter was either a student, not a student, or unknown. In what percentage of incidents was the shooter a student? (5 points)

For the purpose of this question, the following descriptions identify non-students:

* boyfriend of student
* brother of student
* dating mother of student
* ex-boyfriend of student
* father of football player
* father of student
* fired teacher
* former boyfriend of student
* former student
* former student (expelled)
* friend of student
* janitor
* multiple officers
* non-student
* none
* none; worked in community
* not a student but often hung around the school
* parent of student
* police officer
* resource officer
* security guard
* spouse of teacher
* SWAT officer
* teacher

The following descriptions identify students

* student
* student (suspended)
* student at neighboring school, rode bus with some victims
* student at rival school
* student in summer school
* suspended student from different campus

## Part 3 - Public Records and Data | 10 points

Please refer to the [Maryland Public Information Act Manual](http://www.marylandattorneygeneral.gov/OpenGov%20Documents/PIA_manual_printable.pdf) for this portion of the exam.

You request an electronic spreadsheet of Maryland state employee salaries from the Office of the Maryland Comptroller. They tell you they have the records you are asking for in an Excel spreadsheet.  They tell you that, under the terms of Maryland's Public Information Act, they recognize that employee salary data is a public record.  

But they tell you that the Excel spreadsheet contains a field with employee social security numbers, a form of personally identifiable information that you agree is generally exempt from disclosure.  You ask them to redact that field before providing the spreadsheet to you.  

### Questions

1. They respond that they aren't obligated to do that, because redacting the field is essentially forcing them to create a new record, something they aren't obligated to do under the act. Are they correct in their reading of the law? How do you respond? Cite the page in the MPIA manual that backs up your response. (5 points)         

2. They accept your response to question 1 above.  Before giving the data to you, they tell you they will need you to pay $7,000 in order for their staff to delete one column from an Excel spreadsheet, a task that will take one person less than one minute to complete.  How do you respond? Cite the page in the MPIA manual that backs up your response. (5 points)       

## Part 4 - Public Record Identification and Acquisition | 5 points

You have been told by a colleague that the Maryland Department of Public Safety and Correctional Services maintains a database of inmates at state prisons.

### Task

1.  Provide a link to a page on the agency's website that provides evidence that such a database exists. (5 points)
