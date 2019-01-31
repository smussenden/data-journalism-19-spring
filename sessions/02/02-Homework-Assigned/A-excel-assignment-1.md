# Class 2 Homework Assignment
## Excel Assignment 1   

## Objective

This assignment is designed to build on today's in-class lab, and will cover the same materials: using Excel, sorting and writing formulas. We will work with three data sets for this assignment.  Details of each data set, and a link to documentation, are included.

## Turning it in

Copy the questions into a text file (.txt) or markdown file (.md), and put your answers below the questions.

You will also be uploading all of the edited spreadsheets.   

## Analyzing Vehicle Death Rates

For this part of the assignment, download the spreadsheet [vehicle_deaths.xlsx](data/vehicle_deaths.xlsx).

The Insurance Institute for Highway Safety, a nonprofit organization backed by insurance companies, routinely publishes a data set that details the rate of fatal accidents by different makes and models of automobiles.  Data on vehicles from their most recent data release, from May 2017, is included in vehicle_deaths.xlsx and covers vehicles in model years 2011-2014. Not every make and model of car is included in the data release. The rates are estimates, typically near the mean of the 95th percentile confidence bounds.  Subcategories may not always add up to totals, because of rounding and other factors.  

Use the following data dictionary when working with this data:

* Type - The broad class of automobile (2-door, 4-door, sports, etc...).
* Size - Ranges from mini to very large.
* Make - The automobile's maker
* Make_Model - The automobile's maker plus specific model.
* Overall - This is the rate of fatal crashes for a specific make and model.  More specifically, it is the number of drivers killed in fatal crashes per million "registered vehicle years" for each make and model, adjusted to account for age and gender skews of certain makes and models. Note: MV and SV may not add to equal overall because of rounding.
* MV - The number of drivers killed in fatal multiple-vehicle crashes per million "registered vehicle years" for each make and model, adjusted to account for age and gender skews of certain makes and models.
* SV - The number of drivers killed in fatal single-vehicle crashes per million "registered vehicle years" for each make and model, adjusted to account for age and gender skews of certain makes and models.
* SV_Roll - The number of drivers killed in fatal single-vehicle rollover crashes per million "registered vehicle years" for each make and model, adjusted to account for age and gender skews of certain makes and models. Note: this is a subset of SV.
More detail here in the [IIHS Status Report](http://www.iihs.org/externaldata/srdata/docs/sr5203.pdf)
* Model_Years - Model years for the vehicles. "These rates are for 2014 models, but results are included for earlier model years as far back as 2011 if the vehicle wasn’t substantially redesigned during that time."
* Exposure - "Exposure is the number of registered vehicle years. A registered
vehicle year is one vehicle registered for one year."

### Setup Vehicle Death Rates Spreadsheet

Set up the spreadsheet as instructed in today's lab.

1. Save a new copy to preserve the original data.
2. On the far left of the sheet, add a sequence column of consecutive numbers to allow you to return to the original sort order.
3. Freeze panes to make the column header row "sticky" as you scroll down.
4. Add a "source" tab, and link to the original source of the data. [IIHS Status Report](http://www.iihs.org/externaldata/srdata/docs/sr5203.pdf)


### Vehicle Death Rates Spreadsheet Questions

1.  Sort the spreadsheet in descending order to determine which vehicle had the highest "overall" death rate.  What is the make and model of the vehicle?  What is the rate?
2.  Sort the spreadsheet in ascending order to determine which vehicle had the lowest "overall" death rate.  What is the make and model of the vehicle?  What is the rate?
3.  Create a new column called SV_NO_ROLL.  Write a formula to compute the rate of non-rollover single-vehicle crashes.  Then sort the sheet on that column in descending order to determine which vehicle had the highest rate of non-rollover single-vehicle crashes.  What is the make and model? What is the rate?
4.  Create a new column called Overall_Rank. Write a formula to compute the rank of the values in the Overall column.  What is the make and model of the 5th ranked automobile (with the top ranked automobile having the highest overall crash rate, not the lowest)?    
5.  At the bottom of the spreadsheet, in row 211, add a row with the label "TOTALS" in the leftmost column.  Write a formula in the appropriate column to calculate the total number of registered vehicle years for all the vehicles in the dataset.  What is the total?
6.  Imagine you are writing a lede from your analysis for a national news organization. What would it say?

## State Population Change

For this part of the assignment, download the spreadsheet [states2016.xlsx](data/states2016.xlsx).

This dataset contains the total population of each U.S. state, plus Washington, D.C., in 2016, 2010, and 2000.  
Set up the spreadsheet as instructed in today's lab.

### Setup Population Change Spreadsheet

1. Save a new copy to preserve the original data.
2. On the far left of the sheet, add a sequence column of consecutive numbers to allow you to return to the original sort order.
3. Freeze panes to make the column header row "sticky" as you scroll down.
4. Add a "source" tab, and link to the original source of the data. [American FactFinder](https://factfinder.census.gov/faces/nav/jsf/pages/index.xhtml)

### Population Change Spreadsheet Questions

1. At the bottom of the sheet, in row 53, add a row for totals.  Calculate the U.S. population totals for each year.
2. Add a column for “change 2010 – 2016” and calculate the total population change (number of people) for each state between those years. Sort the sheet to determine the state that had the greatest increase in number of people, and the state with the largest decrease.  List the states and the number change here.
3. Add a column for “pct change 2010 – 2016” and calculate the percent change between those years. What state had the greatest percentage increase in population? What state had the greatest percentage decrease in population? List the states and the values here.
4. Add a column for “share of total 2016” and calculate each state’s share of the U.S. total for 2016.  What state had the third greatest share of the U.S. Total? What was that share amount?
5. Imagine you are writing a lede for a national news organization the day this data is released? What would it say?  
6. Imagine you are writing a lede for the Baltimore Sun? What would it say?

### Health Insurance Coverage

For this part of the assignment, download the spreadsheet [health_insurance.xlsx](data/health_insurance.xlsx).

This table details 2016 health insurance coverage sources for people in each state in the U.S., including a total number of uninsured in each state. It is tabulated by the Kaiser Family Foundation.  The documentation for this sheet is available [here](https://www.kff.org/other/state-indicator/total-population/?dataView=1&currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D), at the bottom of the page.   

### Setup Health Insurance Coverage Spreadsheet

Set up the spreadsheet as instructed in today's lab.

1. Save a new copy to preserve the original data.
2. On the far left of the sheet, add a sequence column of consecutive numbers to allow you to return to the original sort order.
3. Freeze panes to make the column header row "sticky" as you scroll down.
4. Add a "source" tab, and link to the original source of the data. [KFF Health Insurance Coverage Report](https://www.kff.org/other/state-indicator/total-population/?dataView=1&currentTimeframe=0&sortModel=%7B%22colId%22:%22Location%22,%22sort%22:%22asc%22%7D)

### Health Insurance Coverage Spreadsheet Questions

To do this analysis, add new columns or rows as needed to derive the correct answers.

1.  Which state has the second highest percentage of people covered by Medicare?  What's your best educated guess for why this might be?
2.  Which state has the highest percentage of uninsured people? What's your best educated guess for why this state has the highest percentage? Where does Maryland rank?
3.  How many people in the United States have insurance from any source?  How many are not covered at all?
4.  How many people in the United States have "Other Public" insurance?  There are several states that have "N/A" as a value under "Other Public." Explain the significance of these N/A values, and say how you think they will affect your ability to create totals from this column.  
5.  Create a column with a formula for each state to add up all of the original columns except for "Total", and then subtract the Total. In a perfect world, each of these values should be 0. How many states add up to something other than 0?  What's your best educated guess for why some don't result in 0, especially those that are much, much larger than 0. Is there a pattern you can see?
6.  What percentage of people in the U.S. are not covered by insurance?   
7.  It's February 2017.  This data set detailing insurance coverage sources by state in 2016 was just released, and you are a reporter for the New York Times, writing a story about national trends in health insurance coverage.  What's the most interesting lede you can write that is supported by your analysis?  Feel free to do additional analysis beyond the questions listed above if you like.
8.  Now imagine the same scenario, but you are a reporter for the Baltimore Sun, writing a similar story for an audience of Marylanders. What's the most interesting lede you can write?

## You're done!

Upload your text or markdown file to the [ELMS page for this assignment](https://umd.instructure.com/courses/1251920/assignments/4695640), along with all of your edited spreadsheets.
