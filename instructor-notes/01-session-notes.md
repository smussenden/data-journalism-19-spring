# Session 01 Instructor Notes

### Paper to bring to class

1. Session 01 Instructor Notes
2. Printout of roster and pictures from UMEG
3. Printout of syllabus.

### Electronic files and links to have up
1. Course Canvas Page
2. Course GitHub Page
3. Various links and files for bridges discussion. Go through session.
4. Download GitHub Folder to Desktop.

### Openers
1. Make sure everyone is here for JOUR472/772, Introduction to Data Journalism.

2. Introduce myself.
* Journalist for two decades, most of that time specializing in data journalism, working at the intersection of code, data and investigative reporting.  
* Capital News Service's data editor for almost 10 years. Taught hundreds of students like you to do the kind of work we're doing in here, mostly in small groups.  This is second I've taught this course, and I'm in the middle of overhauling it, so will be looking for feedback from you.  I may, at mid-semester, switch us from SQL to R
* My teaching style is very hands-on, prioritizing learning-by-doing.  There won't be a lot of lectures in this course. There will be a lot of hands on work, because this work prioritizes repetition.
* This is my promise to you: if you are struggling with the work we do in here, and you ask me for help, I will make time to help you. My office hours are Mondays and Thursdays or by important.      

3. Student Introductions.
* Read off names and take attendance.
* Why are you interested in learning more about data journalism?
* How do you think this course will help you in your career -- and what do you want to do when you graduate?   

### Lecture/Discussion Content

By the end of the class today we will have a look at the syllabus, talk about what we'll learn in this course and the mindset I want you to leave it with.

But first, I want to start with a bridge.

**Q: Does anyone know the significance of this bridge?**

*Bring up Google maps and hone in on Minneapolis. Show I-35W bridge.*
https://www.google.com/maps/@44.978527,-93.2457265,407m/data=!3m1!1e3

*Wait for answers, then show these video*
https://www.youtube.com/watch?v=osocGiofdvc

Here's some details on what happened:

* It’s August 1, 2007, rush hour – 6:05 pm
* I-35W bridge over the Mississippi River in the center of Minneapolis
* 456 feet of bridge span collapsed
* It was a fall of 108 feet to the river, which was 15 feet deep
* 110 vehicles were on the span
* 17 of these fell into the water
* Well north of 100 people (145, by one estimate) were injured
* 13 people died

Here's a look at some of the images from that day.

*Show these photos*
https://www.mprnews.org/story/2017/08/01/looking-back-photos-of-the-bridge-collapse

**Q: A Thought Experiment. Let’s say that you are the managing editor at the Minneapolis Star Tribune or the news director of a local TV station. In other words, you have a local news organization at your command.You see a Tweet from a driver with a video showing the collapse.**  

**How would you cover this story? What would you do? What kinds of stories? What kinds of reporting? What has your previous experience taught you about how to cover this? Think of all the ways you might do this**

Possible answers:

* Send someone to the scene.  (Yes. definitely.  In fact, this story is so big, entire newsroom would be working on this, an "all hands on deck" situation, like a terrorist attack, or a hurricane, or the space shuttle blowing up.)
* Live tweet latest updates, continually update a story with latest information.  Go live at the scene.  
* Write stories about what it's like at the scene.  The survivors, who they were (obituaries essentially). The rescue personnel. Write a tick-tock of the day?
* A history of the bridge? Previous problems on the bridge?   
* Why did this bridge collapse? Try and find out what happened to the bridge that caused it to collapse.  (Good question: where do you start? What government agency is responsible for maintaining it? Was it properly maintained? What happens if you go to a government agency and you ask them if was well maintained? What if they tell you that it was, do you take their word for it?  You could request documents of inspections, emails about problems?  
* A note: the NTSB, an agency set up to investigate transportation accidents, would eventually find a design flaw to start with – the way various struts supporting the bridge were anchored a joints, called  “gusset plates” (there is a link to this, but it is not necessary to show] exacerbated by two major roadway repair projects over time that added to the weight of the roadway being carried by the bridge]. But that wouldn't come for months!
* They may get to this question: what about other bridges in the state or the area? Are others at risk?  If so, let's put that on pause.   

**Q: OK, great answers.  Now suppose you are a national editor at The Washington Post or The New York Times or CNN  – i.e. a national news organization – and you have covered the story on the first day with breaking news, photos, interviews, diagrams of the bridge, and so forth. Is it a story for you after the first day? Is there a natural, national follow we can do here? What questions do we want to know the answer to?**

Possible answers:

* How safe are bridges in the U.S.? Are there other lurking disasters out there?  Is this a widespread problem? How might we know this? Could we go to state and federal agencies and ask for documentation on tens of thousands of bridges in the U.S.?  Could that be done quickly (probably not)?    

* Is there a database that could help us do this faster? Yes. And with a bit of work, we can interview it the same way we interview human sources.  

*Show the NICAR data library.  Explain what it is.*
https://www.ire.org/nicar/database-library/

*Show the DOT FHA, National Bridge Inventory. Structural evaluations for all bridges in the U.S. through 2015. A detailed breakdown of bridge quality.*
https://ire.org/nicar/database-library/databases/national-bridge-inventory/

*Pull up the Excel sample. Might as well be Greek. This is a slice of it, but real one has hundreds of thousands of bridges. Each record is a bridge, and record of its last inspection.*
bridge_sample.xlsx

**Q: How do we make sense of this data? What fields do we want to pay attention to?**

Eventually someone will ask if there is a guide.

*Pull up the Record Layout. Excel file. Still a bit complicated.*
reclay_1_1.xls

**Q: Can we take a few minutes and try and figure out what fields we want to pay close attention to.**
Some may hazard a guess. Here's a hint...SUFFRATE and STAT. Refer back to the sample layout, scroll to that column and show values. What do those values mean? Anyone have a guess? Where can we go to find that out?

*Pull up the DOT HSA guide. Explain this is the data dictionary.*
mtguide.pdf

*Go to page 124 and show what the codes for status mean.*
-	1 = structurally deficient (the minnesota bridge was this)
-	2 = functionally obsolete
-	0 = not deficient
-	N = not applicable

What about SUFFRATE?

*Go to page 92 and scroll through that long discourse about sufficiency rating*

**Q: How can we understand how to make sense of sufficiency rating?**
What do we do now? Reach out to experts who have used it.   
Sometimes this could be government officials. Or advocates. Or other journalists. Pull up the NICAR reporting guide. This is key. Data reporting does not mean you NEVER talk to people.  You need people to help you understand how stuff works and how to interpret correctly.
*Pull up the readme from NICAR and the Reporting Guide to the NBI*
readme_bridges_1.txt
ReportingGuidetotheNationalBridgeInventory.pdf
-- SUFFRATE – 0800 (80%) or less – bridge needs some rehab; 0500 (50%) or less, bridge may need to be replaced …
-- ALSO: RECTYPE = 1 = bridge carrying a roadway (as opposed to running over a roadway)

Let's look at some story examples that resulted from this kind of analysis.
* Pull up NBC News Story *
http://www.nbcnews.com/id/20998261/ns/us_news-bridge_inspections/t/late-inspections-bridges-put-travelers-risk/#.W4LWwJNKjVo

"After 13 people died in August when a freeway bridge fell into the Mississippi River in Minneapolis, governors across the nation rushed to calm fears. Using almost identical language, states assured the public that bridges are safe, because federal regulations require inspection of "every bridge at least once every two years. In fact, at least 17,000 bridges in the U.S. went more than two years between safety inspections, according to federal records analyzed by msnbc.com. These newly released records from the National Bridge Inventory include inspections through 2006. Although Congress in 1971 ordered rigorous standards for inspecting bridges every 24 months, the records reveal a system in which the buck is passed down from federal to state to local governments, without penalty for those that fail to protect the public."

**THOUGHT EXPERIMENT**OK, great answers.  Now suppose you are a reporter at a regional news organization, like The Baltimore Sun or the Philadelphia Inquirer? What story could you do?**

*Pull up this Philly story*
http://www.philly.com/philly/infographics/412035365.html

**Key Takeaways**

* Even in breaking news situations, the best reporters are thinking beyond just "what happened"?  They're thinking about why something happened, figuring out how to put it in context. They're producing stories of impact that, through sunshine, could help prevent future tragedies, and thinking about the next story.
* Using data, they're moving beyond the story everyone has -- what happened -- to a more exclusive story -- how widespread the problem is -- that only they have because they knew how to find a database, understand what's in it (through documentation and interviews), the technical skill and news sense to analyze it, and build a story around it.
* That's what this class is about. If you master this process -- what we'll define as the basics of data journalism, and used to be called computer assisted reporting -- and you will get lots of great stories.  And it will set you up for more advanced data journalism work in future courses. You will learn through your analysis things that, quite possibly, no one else knows.  Exclusive information.
* Data journalism doesn't just mean data analysis.  There's a lot of human reporting involved.
* And lot of people can find some data online, analyze it quickly and post a story.  Sometimes data journalism is really that easy.  But the best application of this work takes time and effort.  That's what we'll learn in this class.

### Syllabus Review

Hand out the syllabus and point out the highlights.

**Contacting Me**
I am here to help you.  I will do my best to respond within 24 hours.  You can text, just say your name.  You can email.  

It is especially important that anyone who falls into one of the following two categories come see me very early in the semester:
•	If you are finding this too difficult
•	If you are finding it too easy and the classes are a drag for you – we will have to brainstorm a solution, or I might ask you to serve during class sessions as a desk-mate / coach / helper to someone else in class who is struggling.

**Objective**
"This is a practical, hands-on, skill-based course in the basics of data journalism, computer-assisted reporting and analysis. It is not a class in software. It is a journalism class that teaches students how to use tools and techniques to unearth key facts, patterns and proof in the service of storytelling."

* Critical thinking
* Technical skills
* News judgment
* Reporting
* Analysis
* Descriptive Statistics
* Problem solving
* Transparency
* Accuracy
* Radical Empiricism, Precision Journalism, Learning Things No One Has Known Before - a devotion to facts, the application of social science methodology to journalism, moving beyond he said, she said.

**Learning Outcomes**

The idea here is to teach you the pipeline from initial reporting, data discovery, acquisition, cleaning and verification, analysis, follow-up reporting, fact-checking.

Go over specific outcomes.

Note: We're just scratching the surface. here's what's not covered in this class, which is becoming a growing part of data journalism.  Machine learning. Web scraping. Working with unstructured data sets, like large bodies of unstructured text. Working with extremely large Big Data sets requiring special database tools. Social network analysis and graph databases.  Pulling data from APIs. R and Python, two other big languages. The application of advanced statistical analysis. They may be discussed in future classes. If you're interested in those things, I'm happy to recommend online courses or courses at the university.

**Required Texts and Materials**

Two notes:

-- Need the book by Wednesday, if possible, for a weekend assignment.
-- Readings will be on ELMS.
-- Most of the assignments will be submitted on ELMS, but will generally be posted on course GitHub page.
-- Go over GitHub layout.  For each session, where to find information.

**Grading and attendance**
--Go over that.
--Lateness.
--Cell phones.

**Review Assignments** through **Students in Need**

-- Go over that.

**Calendar**

-- Go over that.

### Go over homework for next class



### Additional Stories

--Pedestrians (Jake and Lindsay)
--Asthma hot spots (Daniel and Helen and Naema) https://www.washingtonpost.com/national/health-science/hospitals-find-asthma-hot-spots-more-profitable-to-neglect-than-fix/2017/12/01/0d804ce2-b806-11e7-be94-fabb0f1e9ffb_story.html?utm_term=.2860d80c97c7
--More than a Mascot (A bunch of people)
--Guilty Pleas http://cnsmaryland.org/interactives/spring-2018/plea-bargain/baltimore.html
