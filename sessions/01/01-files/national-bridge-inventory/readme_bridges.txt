Bridges Readme
March 2016

This is the bridges database from the U.S. Department of Transportation’s Federal Highway Administration. This table lists structural evaluations and codes for all bridges in the U.S. The most recent data (2015) was originally downloaded by NICAR in Feb 2016. 

For questions about particular fields in this database, you can look them up on the Recording and Coding Guide (MTGUIDE) and revised errata sheet (errata), which are included. The record layout (NICAR_reclay.xlsx) is also provided, but the most detailed explanations of the fields in this database can be found in the Recording and Coding Guide. The record layout includes element numbers and page numbers to find codes for a field in the database. If you are working with National Bridge Inventory data from 1994, 1996-1999 please note that some of the fields currently in the database are not included in older years.

For the most recent year available, 2015, there are 723,302 records. The inspections did not necessarily occur in 2015. Check the information about the inspection date and you'll see that the inspection might have occurred in an earlier year. It is especially important to note that the bridge might have been inspected after the data was reported to the federal agency by a state agency. Indeed, the bridge might have been repaired or even replaced since the inspection in the database occurred. While overall statistics are one thing, it is always advisable to check further on any specific bridge you intend to highlight in your reporting.

The main file (bridge15.csv) is comma-delimited with a double-quote text qualifier; this can be imported into database managers. Check the file "import guide.txt" for help importing into various programs.

**************************************
About location information
**************************************

In 2003, the agency refused to provide latitude and longitude information for the bridges, citing national security interests. In 2007, the Federal Highway Administration again released that information. Since the original data is formatted as degrees, minutes and seconds, NICAR translated those fields into decimal degrees for ease of use. Our fields are called LATMAP and LONGMAP.

PLEASE USE CAUTION WHEN USING THE LATITUDE AND LONGITUDE INFORMATION IN THIS DATABASE. During the integrity checks NICAR performed while processing the National Bridge Inventory data, we found that the coordinates entered in the LATMAP and LONGMAP fields often do not necessarily correspond with the information entered in the location and features fields. For the coordinates of the records that NICAR tested, if they did not correspond exactly with their provided feature and location information, they were at least in the general area of the rest of the information. But differences were significant and frequent enough that before publication it is necessary to manually check geographic locations for your area. In 2011 NICAR contacted sources at the departments of transportation in Arkansas, Alabama, Missouri, Texas and Virginia to inquire about possible discrepancies. The departments' say that although they check the accuracy of the data before submitting it to the U.S. Department of Transporation, it is possible that the coordinates provided do not correspond exactly with  bridges' locations. There is the possibility of human error when entering data, and some counties and cities use maps instead of GIS devices to determine the coordinate information they submit to the state departments. Please contact your state with questions on the validity of the latitude and longitude provided.

Also, please note that some states have entered values that calculate to the coordinates 64.16667, -21.95000 (a point that is located in Iceland) in the latitude and longtude fields for numerous locations. FOr the 2012 update, 3,117 records have this coordinate. They are found in: ND (3,096); DC (1); KY (9); ME (7); NJ (1); UT (2); VA (1).

In 2010, NICAR contacted the Department of Transportation in Virginia, which with 1,239 records had the most such entries for the 2010 update. The department said that this is the latitude and longitude that their program uses as a placeholder, which was confirmed by the New Jersey Department of Transportation. The Virginia department said that it was going back with a GIS to get accurate coordinate locations and that the missing information should be fixed by the 2011 update. In this update, NICAR left the placeholder number in the latitude and longtude field but has replaced the number with a cordinate of 0,0 in the NICAR-created latmap and longmap fields. For the 2011 update, only 100 records had this latitude and longitude. THey can be found in 80 records for DC, 11 for KY, seven for ME and two for NJ.


**************************************
Files included
**************************************

bridge15.csv -- most current data
LEGAL.txt -- you consent to these legal terms if you use the data
NICAR_reclay.xls -- NICAR record layout

Inside the folder Government Documents:
mtguide.pdf -- The official Recording and Coding Guide from the FHWA. See the NICAR-created reclay.xls to show how this document connects to the data files.
errata.pdf -- Changes noted by the FHWA. Also referenced in reclay.xls.
NBI_layout_2015.xls -- record layout from the FHWA.

Inside the Lookups folder:
fipsst --  Unlike the normal FIPS (Federal Information Processing Standards), which has two digits in a state code, the bridge database has three -- the last one is a regional code. As a result, we include this file to include both the two and three codes.
fipscnty -- This table includes state and county codes. See the field in the main data files called CNTY. Note: county codes are *not* unique. You will need to use both state and county to correctly to identify a county if you are working with the entire U.S.
fipsplce -- This table includes state and place codes. See the field in the main data files called PLACE. Note: place codes are *not* unique. You will need to use both state and place to correctly to identify a place if you are working with the entire U.S.
recordcount2013.xls - This spreadsheet lists the number of records for each state.

Inside the Tables2004_2013 folder:
bridge04.csv
bridge05.csv
bridge06.csv
bridge07.csv
bridge08.csv
bridge10.csv
bridge11.csv
bridge12.csv
bridge13.csv
bridge14.csv 

**************************************
Investigating bridge status
**************************************

The two fields in this database that can be used for an overall indication of a bridge’s quality are SUFFRATE and STAT. These two fields are not discussed in the Recording and Coding Guide, but they are briefly mentioned in the record layout provided by the DOT:

1) SUFFRTNO is a NICAR-formed field that has the SUFFRATE field converted into a decimal number. SUFFRATE refers to the overall sufficiency rating derived from the formula explained in Appendix B of the Recording and Coding Guide.

Straight from the FHWA Web site: "The National Bridge Inventory will be used for preparing the selection list of bridges both on and off of Federal-aid highways. Highway bridges considered structurally deficient or functionally obsolete and with a sufficiency rating of 80 or less will be used for the selection list. Those bridges appearing on the list with a sufficiency rating of less than 50.0 will be eligible for replacement or rehabilitation while those with a sufficiency rating of 80.0 or less will be eligible for rehabilitation. To be considered for the classification of deficient bridge, a structure must be of bridge length, and had not been constructed or had major reconstruction within the past 10 years." (http://www.fhwa.dot.gov/legsregs/directives/fapg/0650dsup.htm) 


2) In the STAT field: 	
		1= structurally deficient bridge 
		2= functionally obsolete bridge
		0= bridge not deficient
		N= bridge not applicable.

Remember, the scoring procedure is complicated, and although the formula for arriving at 
the SUFFRATE is uniform, the people and the agencies applying the formula are not.  
SUFFRATE and STAT are good starting points for evaluating bridges, but do not tell the 
whole story.

From the Web page http://www.fhwa.dot.gov/bridge/0650dsup.cfm --

	a. General Qualifications: In order to be considered for either the structurally deficient or functionally obsolete classification a highway bridge must meet the following:

                Structurally Deficient -
               1. A condition rating of 4 or less for
                      * Item 58 - Deck; or
                      * Item 59 - Superstructures; or
                      * Item 60 - Substructures; or
                      * Item 62 - Culvert and Retaining Walls.(1) or
               2. An appraisal rating of 2 or less for
                      * Item 67 - Structural Condition; or
                      * Item 71 - Waterway Adequacy.(2)

                Functionally Obsolete -
               1. An appraisal rating of 3 or less for
                      * Item 68 - Deck Geometry; or
                      * Item 69 - Underclearances;(3) or
                      * Item 72 - Approach Roadway Alignment. or
               2. An appraisal rating of 3 for
                      * Item 67 - Structural Condition; or
                      * Item 71 - Waterway Adequacy.(2)

         b. Any bridge classified as structurally deficient is excluded from the functionally obsolete category.

1. Item 62 applies only if the last digit of Item 43 is coded 19.
2. Item 71 applies only if the last digit of Item 42 is coded 0, 5, 6, 7, 8 or 9.
3. Item 69 applies only if the last digit of Item 42 is coded 0, 1, 2, 4, 6, 7 or 8. 

Other fields to look at are the DECK, SUBSTRUCTURE and SUPERSTRUCTURE 
ratings to find greater details about a bridge. 

1) DECK refers to the overall condition rating of the top surface of a bridge. Codes for 
DECK, SUPERSTRUCTURE and SUBSTRUCTURE range from 0 (failed) to 9 
(excellent) or N for not applicable

2) SUPER refers to the physical conditions of all structural members.

3) SUBSTRUC codes the physical condition of all piers, abutments, footings and 
other components.

Often, critical fields are not filled in when record types (RECTYPE) are not a "1." The database has two kinds of records: "on" and "under." If it designates the "on" record, the code should be 1. Otherwise, it's 2, or A through Z, designating it's a record where a route "goes under the structure," according to the heavy document called MTGUIDE.pdf. "When this item is coded 2 or A through Z, only the following items must be coded:  Items 1, 3-13, 16, 17, 19, 20, 26-30, 42, 43, 47-49, 100-104, 109 and 110.  All other items may remain blank." For a complete list of the numbered items, refer to MTGUIDE.pdf. So the database can include multiple records for the same bridge.

Here is a list of other NICAR-formed fields. In most instances, the new fields are simply 
a conversion from character to numeric data type. Brief descriptions are used, but for 
detailed descriptions of the corresponding character fields, refer to the Recording and 
Coding Guide:

--ST_ABBV, the two-character abbreviation for the bridge state
--SUFFRTNO, which is the sufficiency rating, as found in the SUFFRATE field
--BRDGEIMPNO in the numeric cost of improving the bridge, as found in 
BRIDGEIMPRO
--ROADIMPNO is the numeric cost of improving the road, as found in ROADIMPROV
--TOTCOSTNO is the numeric total cost for bridge and road improvements, as found in 
TOTALCOST
--NICARID is a compilation of the first 19 characters, which provide the unique 
identifier according to the U.S. Department of Transportation. There are 43 records in 
which the NICARID is not unique. According to Ann Shemaka of the DOT's Bridge 
Division (202-366-1575), this happens for one of two reasons.  In a small number of 
cases, the federal agency inspecting a federal bridge ended up using the state's coding 
system, resulting in the same unique identifier.  In this year's data, there is no field to 
distinguish a federal bridge from a state one. 
--KMPT is the numeric conversion from the MILEPT (milepoint) field to a kilometer 
point
--STRLNGNO is the structure length of STRLENGT
--AVDAYNO is the average daily traffic for AVGDAY
--APPRDNO is the numeric width of the approaching roadway in APPROW
--VRTCLNO is the navigation vertical clearance for VERTCLR
--HORCLNO is the navigation horizontal clearance for HORCLEAR
--MAINSPNO is the numeric conversion for number of main spans in NUMSPAN
--APPNO is the number of approach spans in NUMAPP
--TOTHORNO is the total horizontal clearance for TOTHORCL
--MAXSPLGT is the maximum span length of a highway as represented in MAXSPAN
--LFTWLKNO is the numeric width of the left sidewalk in LEFTWALK
--RTWALKNO is the numeric width of the right sidewalk in RITEWALK	
--RDWIDNO is the numeric width of the bridge’s roadway width in ROADWID
--DCKWDNO is the numeric width of the bridge’s deck in DECKWID
--MVCONO is the minimum vertical clearance over a bridge’s roadway in MINVERTO 
--MVCUNO is the minimum vertical clearance under a bridge in MINVERTU
--MLCURNO is the minimum lateral underclearance on the right in MINLATU
--MLCULNO is the minimum lateral underclearance on left in MINLATL
--OPRATNO is the numeric operating rating in OPGROSS
--INVRATNO is the inventory rating found in INVGROSS
--LENGNO is the length of structure improvement in LENGTH
--INSPMNTH and INSPYEAR are date conversion fields where the month and year have 
been separated into separate fields from INSPDATE
--INSPFRNO tells how often the bridge is to be inspected (in months) as listed in 
INSPFREQ
--AVTRAFNO represents the percentage of daily truck traffic as compared to the entire 
amount of average daily traffic (AVGDAY). AVTRAFNO is a numeric conversion of 
AVTRAFF 
--FUTDLYNO represents the future average daily traffic as found in FUTDAILY
--MINNAVNO is the minimum navigational vertical clearance of the bridge as found in 
MINNAV

**************************************
IRE Resources
**************************************

Here is a list of stories available from the IRE Resource Center 
(www.ire.org/resourcecenter/) that have used the bridges database for a story. If you have 
further questions, you can call the Resource Center at (573) 882-3364. The file # is 
provided for each story so that you can request that specific one.


File #23980
After 13 people died in August 2007 when a freeway bridge fell into the Mississippi River in Minneapolis, governors across the nation rushed to calm fears. Using almost identical language, states assured the public that bridges are safe, because federal regulations require inspection of "every bridge at least once every two years." In fact, at lest 17,000 bridges in the U.S. went more than two years between safety inspections, according to federal records obtained by msnbc.com. Obtaining new records from the National Bridge Inventory under the Freedom of Information Act, bill Dedman of msnbc.com gave the public a look at inspection records through 2006. The series of articles documented several lapses in state and federal oversight bridge inspections. The interactive staff at msnbc.com created the Bridge Tracker, an interactive map of bridges, allowing readers to look at the inspection information for bridges they cross. The map shows the condition and inspection dates for more than 100,000 bridges with traffic of at least 10,000 vehicles a day. 

File # 23307
An examination of roadway bridge ratings by the Philadelphia Inquirer revealed nearly 60
	heavily traveled bridges in the Philadelphia region are in disrepair
	and rated as bad as, or worse than, the condition of the Minnesota bridge
	that collapsed Aug. 1, according to state and federal data. (2007)

File # 23304
KNXV-Phoenix discovered 107 structurally deficient bridges in the state of Arizona,
	with inspection reports showing the need for significant repairs. (2007)


File # 21886
One third of Ventura county's bridges were built before 1965 and 28 of them have 
	been designated as "structurally deficient." But the county is still waiting 
	forthe funds to fix or replace them. California's winter floods in 2005 washed 
	away one bridge and left others even more weakened. Dodge examines the 
	Federal Highway Administration's Inventory and discusses funding problems 
	as well as the potentially fatal consequences of continuing neglect.
	(2005)


File # 16374
KOMU's "computer-assisted investigation revealed that
           mid-Missouri's bridges are deteriorating and placing drivers into
           possibly dangerous situations every day... bridges dropping large
           pieces of concrete into traffic lanes on Interstate 70 ... the state
           had no plans to fix this problem anytime within the next five
           years... one in three bridges in mid-Missouri is structurally
           deficient.... it would take 49 years to fix the problems that
           current bridges have with current funding even though
           transportation officials say that an average bridge has a lifespan
           of 50 years...." (1999)

File # 12972
The Post-Bulletin examines an analysis which shows that
           Minnesota's deteriorating bridges aren't being repaired and
           replaced fast enough, forcing some counties to restrict or close
           bridges while they wait for money needed to repair. It would take
           $184 million to bring deficient bridges up to the highest standards.
           (November 12, 1994)

File # 15293
Mike Klahr was supposed to inspect the most dangerous bridges
           in middle Tennessee. But during WSMV-TV's surveillance, this
           Department of Transportation employee never went near a
           bridge. Instead, he ran a private painting business on state time,
           watered his lawn on state time, and often worked as little as one
           hour a day. One in four bridges is structurally deficient, and 29
           bridges are so dangerous that people shouldn't be driving over
           them - yet they are open to the public.

File # 10372
Asbury Park Press does a computer-assisted analysis of the
           state of disrepair of New Jersey bridges; finds that one out of six
           bridges in New Jersey is in critical condition, it will cost billions to
           fix them and New Jersey is one of the worst states in the nation
           at maintaining its bridges, Feb. 13, 1994.

File # 10571
The Post Standard conducts a computer-assisted investigation on
           the safety of bridges and New York's bridge inspection program.
           The series finds that railroad bridge inspections are not regulated
           by the state. May 26, 1994.

Journalists with questions about the National Bridge Inventory are asked to contact the agency's Office of Public Affairs at 202-366-0660. More information is also available online at www.fhwa.dot.gov/bridge. The website http://www.fhwa.dot.gov/bridge/br-engrs.htm contains a list of Department of Transportation employees that can likely be contacted to answer questions regarding specific interpretation of the data.  For questions regarding the database in general and NICAR-formed fields you can reach NICAR at www.nicar.org or by calling (573) 884-7332 or (573) 884-7711.


