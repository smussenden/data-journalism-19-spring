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
/*Submit to ELMS https://umd.instructure.com/courses/1251920/assignments/4741756 */

SET SQL_MODE='only_full_group_by';

# 1.  Using the WOUND field, do a summary query that shows the number of times each body part was the site of a wound in this table, ordered from most common to least common. What was the most common body part to be injured? How many different body parts were listed in the wound column?
SELECT wound, COUNT(*) as total_number
FROM exercises.deer
GROUP BY wound
ORDER BY total_number desc;

# 2. Write a query that returns a table that shows all the cases where someone was injured at their ankle -- or below -- ordered alphabetically by wound type.  Hint: do not include injuries categorized as "leg" in this total.  How many such cases were there?

SELECT *
FROM exercises.deer
WHERE wound IN("foot","toe","ankle")
ORDER BY wound;

# 3. Write a query that shows all records for self-inflicted accidents (si under type) by shooters who are 50 years old or older, ordered by shooter age from oldest to youngest.  How many are there?
# A: 9
SELECT *
FROM exercises.deer
WHERE type = "si" AND sage >= 50
ORDER BY sage desc;

# 4. Write a query that allows you to easily determine the oldest victim in Jackson County? Describe the incident in as much detail as possible from the records.
# A: This person was a 62-year-old with 41 years of expereince, shot by an 18 year old with one year of experience, using a 20 guage shotgun. The victim was out of sight of the shooter, and sustained a minor injury to the thigh.
SELECT *
FROM exercises.deer
WHERE county = "Jackson"
ORDER BY vage desc;

#5. Which county had the most accidents? How many?
#A: Marathon
SELECT county, COUNT(*) as number_records
FROM exercises.deer
GROUP BY county
ORDER by number_records desc;

#6. What was the most frequent cause of hunting accidents listed in the database? How many accidents appear with that cause?
# A: Victim in line of fire, 48
# Is that truly the most common cause? Why might that answer be problematic?
# A: For many listed causes, there is a top-level category (i.e. careless handling), followed by a more specific sub category (i.e. careless handling - tree involved). There is also inconsistent spelling of some terms (like ricochet v ricohchet) that could cause problems.
# How might you get a better answer?
# A: Before loading in your data, you could clean up your table in SQL to limit the number of top-level categories, and create some sub-categories.  Or, if you wanted to do it after you load in your table, you could do some CASE when statements.

SELECT cause, COUNT(*) as number_records
FROM exercises.deer
GROUP BY cause
ORDER by number_records desc;

# 7.  A. Write a query that gives you a count of accidents for each brand of gun, ordered from most to least.
# A:
SELECT gunbrnd, COUNT(*) as number_records
FROM exercises.deer
GROUP BY gunbrnd
ORDER by number_records desc;
# B. In this table, which brand of gun is involved in the most hunting accidents? How many accidents are there with that brand? Does that make it the most dangerous brand? Explain why or why not.
#A: Remington, 79. Just going by this table, it has the most accidents. and even if you add all the nulls to Winchester, still won't have as many as Remington.  But dangerous is a dangerous word.  Any reasonable accounting of danger would account for the number of total guns in use, and adjust for that.  It could be there are more accidents with Remington because it's by far the most popular gun.
# C. Would you feel comfortable listing the number of accidents for Winchester as 39? How about Ithaca as 6?  Or Coast to Cost as 2? Explain your reasoning for each.
# A: Winchester: maybe.  There aren't any other names similar to this.  But the high number of nulls makes it hard to say for sure there aren't more Winchesters in the data.  Ithaca: no, because there's another gun listed as Ithica. Coast to Cos: no, because there are two other guns with similar names.

# 8 What is the average age of shooters? What is the average age of victims? Write one query total to determine both. Do you see any issues with the data that would lead you to doubt these conclusions? Include the queries you used to determine these issues;
#A: Shooters: 28.23, Victim: 30.88. High number of null records creates doubt about accuracy.


SELECT AVG(sage) as average_shooter_age, AVG(vage) as average_victim_age
FROM exercises.deer;

SELECT sage, COUNT(*) as number_records
FROM exercises.deer
GROUP BY sage
ORDER BY number_records desc;

# 9. Who tends to have a higher average age – the shooters in cases with minor, major or fatal injuries (coded in the INJURY field)?
# A: Shooters in cases with fatal injuries tend to be older 28.73, vs 28.69 for major and 26.47 for minor.
SELECT injury, AVG(sage) as average_shooter_age
FROM exercises.deer
GROUP BY injury
ORDER BY average_shooter_age desc;

#10  Did more accidents occur on days with bad weather than clear skies? Is that enough to say whether weather is a factor in accidents? Why?
# A: It's 125 on clear days and 124 on bad weather days (cloudy and partly cloudy) with four unknown and 2 nulls.  So hard to say with certainty, but it's pretty close to even. It's probably not enough to say weather is a factor or not a factor, since there are two other columns to consider -- precipitation and temperature. And even then, hard to say with certainty that they were a cause, just that this trend was observed.  You'd need to do more follow-up reporting to determine this.

SELECT weather, COUNT(*) as number_records
FROM exercises.deer
GROUP BY weather
ORDER BY number_records desc;

# 11. What was the most common wound in fatal accidents?
# A: Chest, with 12, followed by 11 for head.
SELECT wound, COUNT(*) as number_records
FROM exercises.deer
WHERE injury = "fatal"
GROUP BY wound
ORDER BY number_records desc;

#12. Were most fatal wounds inflicted by the shooter or a second person? How useful are the answers you get?
#A: Most fatal wounds were from a second person, not self-inflicted.  But be circumspect about reporting specific numbers, with so many nulls. You could say that there were more second person shootings than self inflicted, becuase even if all the nulls were self-inflicted, you'd have 11 si and 16 sp.
SELECT type, COUNT(*) as number_records
FROM exercises.deer
WHERE injury = "fatal"
GROUP BY type
ORDER BY number_records desc;

#13. Do a count of accidents by date. Do you see any patterns suggestive of a story?
# A: Though this is only a slice of the data, it's largely indicative of a larger pattern.  The most accidents seem to occur on the first date listed for each year in the data set, typically the first day of hunting season.
SELECT date, COUNT(*) as number_records
FROM exercises.deer
GROUP BY date
ORDER BY number_records desc;
