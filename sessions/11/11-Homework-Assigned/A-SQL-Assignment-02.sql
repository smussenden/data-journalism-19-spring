/* Mysql Assignment No. 2 (11-SQL Assignment 2)*/
/* Connect to JOURDATA in MySQL Workbench, Then open this file in MySQL Workbench. Rename it Firstname-Lastname-11-SQL-Assignment-2.sql. Work in this file to answer the questions. */
/* Underneath each question below, create a new comment with the correct answer.  Underneath the answer -- NOT in a comment -- put the SQL query you used to derive the answer.*/
/* Use the deer table in the exercises database.  This is a single-table database of hunting accidents in Wisconsin in 1993.*/
/*Execute this function first: SET SQL_MODE='only_full_group_by';*/
/* Use this documentation */
/* CASE - case number
DATE - date of accident
TIME - time of accident
COUNTY - Wisconsin county
AREA - region of state
WOUND - body part of shooting
INJURY - minor, major or fatal
TYPE - si (self-inflicted wound) or sp (person in same party)
CAUSE - description of cause of accident
SAGE - shooter age
VAGE - victim age
FIREARM - firearm type (shotgun, rifle, pistol, etc)
FACTION - firearm action type (slide, auto, bolt, lever, etc...)
ALCOHOL - was alcohol involved in accident
ALCOLEV - if alcohol invoved, what was bac
WEATHER - weather conditions
TOPOGRO - terrain type (rolling, level, steep, etc...)
SEXPER - shooter years of expereince
VEXPER - victim years of experience
SGRADUATE - shooter graduate of hunting safety course
VGRADUATE - victim graduate of hunting safety course
SSEX - shooter gender
VSEX - victim gender
GUNBRND - brand of gun
GUNGUAGE - gauge of gun
TEMP - outside temperature
MUZDIS - distance from shooter to victim in feet
LAND - ownership of land (private, public, etc...)
VORANGE - number of article of clothing that are orange worn by victim
GUNSIGHT - gun sight type
VACTIVTY - victim activity at time of shooting
LOCATION - location type of shoting
PRECIP - preciptating or not */
/*Submit to ELMS https://umd.instructure.com/courses/1259604/assignments/4811988 */



SET SQL_MODE='only_full_group_by';

# 1.  Using the WOUND field, do a summary query that shows the number of times each body part was the site of a wound in this table, ordered from most common to least common. What was the most common body part to be injured? How many different body parts were listed in the wound column?

# 2. Write a query that returns a table that shows all the cases where someone was injured at their ankle -- or below -- ordered alphabetically by wound type.  Hint: do not include injuries categorized as "leg" in this total.  How many such cases were there?

# 3. Write a query that shows all records for self-inflicted accidents by shooters who are 50 years old or older, ordered by shooter age from oldest to youngest.  How many are there?

# 4. Write a query that allows you to easily determine the oldest victim in Jackson County? Describe the incident in as much detail as possible from the records.

# 5. Which county had the most accidents? How many?

# 6. What was the most frequent cause of hunting accidents listed in the database? How many accidents appear with that cause?

# 7.  Write a query that gives you a count of accidents for each brand of gun, ordered from most to least.
# 7A.  In this table, which brand of gun is involved in the most hunting accidents? How many accidents are there with that brand? Does that make it the most dangerous brand? Explain why or why not.
# 7B. Would you feel comfortable listing the number of accidents for Winchester as 39? How about Ithaca as 6?  Or Coast to Cost as 2? Explain your reasoning for each.

# 8. What is the average age of shooters? What is the average age of victims? Write one query to build a summary table that determines both. Do you see any issues with the data that would lead you to doubt these conclusions? Include the queries you used to determine these issues.

# 9. What has a higher average age – the shooters in cases with minor, major or fatal injuries (coded in the INJURY field)?

# 10.  Did more accidents occur on days with bad weather than days clear skies? Is that enough to say whether weather is a factor in accidents? Why?

# 11. What was the most common wound in fatal accidents?

# 12. Were most fatal wounds inflicted by the shooter or a second person? How useful are the answers you get?

# 13. Do a count of accidents by date. Do you see any patterns suggestive of a story?
