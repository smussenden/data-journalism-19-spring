# Class 7 Homework Assignment
## Excel Assignment 5 | Exam Review   

## Objective

This assignment is designed to review the core concepts introduced in the first part of this course.  This includes:

* Calculating sums (and other summary statistics, like averages), change, percent change, share of total, and rank in Excel;
* Using Pivot Tables, filters and IF functions in Excel;
* Analyzing data using a set of questions provided to you;
* Developing your own questions to ask and hypotheses to test and performing analysis;
* Identifying flaws in data that could affect your analysis;
* Identifying newsworthy information in your analysis and writing up the findings;
* Reviewing documentation to get a sense of what data does and does not show;
* Using open data and data sets constructed by news organizations;         
* Using public records laws to get information from a government agency;
* Finding markers of government databases using information on the web;

## Turning it in

Upload a text file with the answers and your edited spreadsheets to the [ELMS page](https://github.com/smussenden/intro-to-data-journalism-public/blob/master/sessions/07/07-Homework-Assigned/A-Excel-Assignment-5.md) for this assignment.

## Part 1 - SNAP benefits analysis

Use the spreadsheet [snap-benefits.xlsx](data/snap-benefits.xlsx). It contains information about state-by-state spending on the [Supplemental Nutrition Assistance Program (SNAP)](https://www.fns.usda.gov/snap/supplemental-nutrition-assistance-program-snap), which is often referred to as food stamps, for each year between 2010 and 2015 (the most recent available data). It also has total population data for each state for each year between 2010 and 2015.  

The SNAP data has been compiled by the Kaiser Family Foundation [here](https://www.kff.org/other/state-indicator/total-snap-program-benefits/?activeTab=graph&currentTimeframe=1&startTimeframe=14&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D). The population data is from the U.S. Census bureau.    

First, set up the spreadsheet as you have been instructed in previous assignments.

Then, answer the following questions, editing the spreadsheet as needed.

1. What was the total amount of spending on SNAP benefits for the entire U.S. in FY 2015? (SUM)
2. Which state had the largest total decrease in SNAP benefit spending between FY 2010 and FY 2015? What was the decrease? (CHANGE, SORTING)
3. Which state had the largest percentage increase in SNAP benefit spending between FY 2010 and FY 2015? What was the percentage point increase? (PERCENT CHANGE, SORTING)
4. Which state had the highest per person spending on SNAP benefits in FY 2015? (PER PERSON CALCULATION, SORTING)
5. What was the national average for per person spending on SNAP benefits in FY 2015? (AVERAGE CALCULATION)
6. Using the function specifically designed to calculate rank, which state was the 36th ranked in per person spending on SNAP benefits in FY 2015 (with 1st being the lowest per person spending, and 51st being the highest)? (RANK FUNCTION, SORTING)
7. Using the "if" function, create a new column to classify whether a state's per person spending on SNAP benefits in FY 2015 was above or below the national average. Filter out just the ones above the national average. How many states are there above the national average? (IF, SORTING, FILTERS) (Could also use a Pivot Table to do the counting)
8. Of all 51 states, which state accounted for the largest share of the total national spending on SNAP benefits in FY 2015? (SHARE OF TOTAL, SORTING)
9. Develop one question you would like to ask of this dataset, then answer it by editing the spreadsheet.  Write the question and answer below, and briefly describe how you answered it.       
10. New SNAP figures for FY2015 were just released, and you are a reporter for a national news publication who has been assigned to write a story off of the release.  Determine the most interesting newsworthy thing you can find, then write the first three paragraphs of a news story.  In a few more sentences, explain who you would want to talk to in order to develop the story.


## Part 2 - government salary analysis

Use the spreadsheet [md-salary-2017.xlsx](data/md-salary-2017.xlsx). It is spreadsheet of salaries for Maryland state employees. It was obtained by the [Baltimore Sun](https://salaries.news.baltimoresun.com/) via a public records request, and released to the public. The version provided you here has been cleaned up a bit.

Use the following documentation:

* annual_salary - the amount the employee is expected to earn in a calendar year without taking into account overtime or other earnings. This amount may differ from regular_earnings for a variety of reasons. Rounded to the nearest thousand.
* regular_earnings - this reflects the actual amount an employee is paid for regular work. Rounded to the nearest thousand.
* overtime - this reflects the amount an employee is paid for working overtime. Rounded to the nearest thousand.
* other_earnings - this includes bonuses and other forms of extra income. Rounded to the nearest thousand.
* ytd_gross_earnings - the total amount an employee was paid in the calendar year (a sum of regular earnings, overtime and other earnings. If you sum those columns on your own, it may differ slightly from this column, because of rounding).

First, set up the spreadsheet as you have been instructed in previous assignments.

Then, answer the following questions, editing the spreadsheet as needed.

1.  Who is the highest paid person at the Department of Education, as measured by year-to-date gross earnings? What is the amount? What job does that person have? (FILTER, SORT)
2.  Who earned more money in overtime pay than anyone else in the state? Where do they work? (SORT)
3.  Which department had the most employees who earned more money in overtime than they did in regular earnings?  How many employees in that department fell into that category? (IF, FILTER, PIVOT, SORT)
4.  What department had the highest percentage of its employees earning $100,000 (year-to-date-gross earnings) or more? (IF, PIVOT, FILTER, SORT, PERCENTAGE)
5.  What department or office had the highest average annual salary? (PIVOT)
6. Develop one question you would like to ask of this dataset, then answer it by editing the spreadsheet.  Write the question and answer below, and briefly describe how you answered it.       
7.  Imagine that new salary figures were just released for the year, and your editor at the Baltimore Sun assigns you to write the best story you can find from the data.  Determine the most interesting newsworthy thing you can find, then write the first three paragraphs of a news story.

## Part 3 (Public Records)

Please refer to the [Maryland Public Information Act Manual](http://www.marylandattorneygeneral.gov/OpenGov%20Documents/PIA_manual_printable.pdf) for this section.

You are a reporter at a small newspaper in Montgomery County, and you're tired of relying on the Baltimore Sun to get the state salary data used above, so you decide to request it yourself from the State Comptroller's Office.  

1.  They tell you they have the data available, but they're really busy, and they'll get it to you in six months.  What do you say to them in response in an attempt to get it now?  On what page (or pages) of the Maryland Public Information Act Manual did you find support for your response?      

2.  They tell you they're going to give you the data, but as a printout of a spreadsheet.  What do you say to them in response to get it in a searchable format?  On what page (or pages) of the Maryland Public Information Act Manual did you find support for your response?   

## Part 4 (Finding Data)

You have been told by a source that the Maryland Department of Public Safety and Correctional Services maintains a database of registered sex offenders.

1.  Provide a link to a page on the agency's website that provides evidence that such a database exists.

2.  Describe in a few sentences why you think the page you've linked to suggests there's a database.  
