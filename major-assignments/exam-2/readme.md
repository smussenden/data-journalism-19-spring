# Class 16 | Exam 2 (Take Home)
## Exam 2 (MySQL and Databases)  

## Objective

This exam is designed to test your mastery of the core concepts introduced since the first exam.

## Turning it in

Upload your completed SQL file to [the ELMS page for the exam](https://umd.instructure.com/courses/1259604/assignments/4811997?module_item_id=9445307).  That means writing the answers below the question along with query(s) you wrote to answer the question.

## Resource Materials

The only thing you *cannot* do during this exam is communicate in any way with anyone else -- including your classmates -- except for me.  That includes, but is not limited to posting questions on web forums, texting your friends or calling someone. If, for some reason, you come across the actual answers to this exam anywhere online, you are expressly forbidden from using that material.   

You can use any published or unpublished material you like. This includes notes, information you find on the web, your previous assignments, my answer keys from previous assignments, study guides, et cetera.  Seriously, anything.

The database tables you will need to answer the questions in Parts 1 and 2 are on the course mysql server that we have been using in class.

##  Part 1 (8 questions, 5 points each, 40 points) + 5 points extra credit

You are a reporter at the Washington Post, and your editor has assigned you to report a story about the role outside groups -- like PACs (Political Action Committees) -- played in the 2016 election through independent expenditures.  You obtain from the Federal Election Commission a dataset detailing spending by these groups. It is called outside1, in the exercises database.   

From the FEC: "An independent expenditure is an expenditure for a communication that expressly advocates the election or defeat of a clearly identified candidate and which is not made in coordination with any candidate or his or her campaign or political party. 100.16, 109.21 and 109.37. Independent expenditures are not subject to any limits but may be subject to reporting requirements."

* date - date reported
* cand_name - name of candidate involved
* spender_id - Alphanumeric id of spender (PAC, other outside group)
* spender_nam -Name of spender (PAC, other outside group)
* district_state - location of election to be affected by expenditure (blank, 00, US, DC mean national spending)
* cand_party - party of candidate affected
* expend_amt - amount of expenditure
* expend_date - date of expenditure
* sup_opp - designates whether spending was in support or opposition to candidate
* purpose - purpose of spending
* tra_id -  FEC report that included this expenditure

1. How many of the expenditures in the table are in support of a candidate, and how many were in opposition to a candidate?  How much money in total was in support of a candidate and how much money in total was in opposition?  Write a single query that gives you all four answers.  Paste it, and the answers below. Ignore null values.

2. What candidate had the most money spent against them? What candidate had the most money spent supporting them? Ignore null values.

3. In what month of what year was the most money spent?  How much was spent in that month? Use the date field, not expend_date.

4. In the month/year combo identified in question 3, how much was spent in support and how much was spent in opposition? Use the date field, not expend_date.

5. The district_state field shows the location where the spending was intended to influence voters. If the field is blank, or 00 or US or DC, then it is national-level spending. Other values pertain to specific states.   Create a new column that combines the blank, 00, US and DC values into ‘national’ and leaves the rest of the state values unchanged, then shows the total spending opposed to Hillary Clinton.   What individual state had the most money spent opposed to Clinton? How much was it?

6.  How many different values for purpose are listed in the table? If you wanted to draw conclusions about the purpose of the money outside groups are spending, why would that be challenging?

7. How much was total money was spent in support and in opposition by the committee with ‘Priorities’ in its name? Use a rollup query to show the support and oppose amount for that committee and overall total of spending for that committee. Below, List the name of the committee, the support and oppose amount and overall total for that committee.

8. In spending for which the purpose included the name of a social network (for example, Facebook, YouTube, Snapchat, Instagram) or the word "social", which candidate had the most spent in support and which candidate had the most total expenditures spent in opposition? How much was it?

9. EXTRA CREDIT. Create a new column to lump together all spending in favor of Trump or opposed to Clinton as “for Trump.” Lump together all spending in favor of Clinton or opposed to Trump as “for Clinton.” Categorize any other spending as “other.”  List the total for the three groups. Which is greater, spending "for Clinton" or "for Trump?"

##  Part 2 (40 points, 5 points each)

You are a reporter at the Baltimore Sun and your editor has assigned you to report a story about the role people in Maryland played funding the 2016 presidential election. The table md_contrib lists campaign contributions for president from individuals in Maryland during the election. The table md_cand lists information about each candidate. The tables join on the ‘cmte_id’ field. The documentation is at the end of this test.  You MUST do a join in every query.

### Candidate - md_cand
* CAND_NAME - 2016 presidential candidate name
* party - candidate party affiliation
* cmte_id - candidate campaign committee ID
* city - candidate city
* state - candidate state
* zip - candidate zip or zip+4

### Contributions - md_contrib
* CMTE_ID - candidate campaign committee ID
* RPT_TP - reporting period
* NAME - contributor name
* CITY - contributor city
* STATE - contributor state
* ZIP_CODE - contributor zip code
* EMPLOYER - contributor employer
* OCCUPATION - contributor occupation
* amount - contributor amount
* MEMO_TEXT - notes about contribution
* date - date of contribution

1. Which candidate got a contribution from a donor who listed their occupation as a the owner of a food truck?

2. What city in Maryland contributed the most money to Donald Trump? How much?

3. How many contributions were given to Hillary Clinton by people who had the word attorney or lawyer included in their occupation?  Don't include abbreviations of these words in the count of contributions.

4. Which candidate got the second most money from people who had the word attorney or lawyer included in their contribution. Don't include abbreviations of these words in the count. How much did they get?

5. How many donors gave a combined total of $20,000 or more to all of the Republican presidential candidates? Write a single query that returns a table with only those donors and no other donors.

6. Contributions for a negative amount represent refunds or "redesignations" of the contribution to another contributor (i.e. re-assigning the contribution to a spouse, so you can give more money). How many such contributions are in the data for Ted Cruz?

7. Which two presidential candidates received the most money from contributors in Maryland?  Write a single query that returns the total amount of money contributed for only those two candidates.

8. If you remove contributions of 0 or less, how many candidates have an average contribution amount less than Bernard Sanders?
