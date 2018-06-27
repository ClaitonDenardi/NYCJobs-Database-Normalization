USE NYCJobs;
 
LOAD DATA LOCAL INFILE '/home/claiton/Documents/NYC_Jobs.csv'
INTO TABLE JobsDesnormalizado 
CHARACTER SET utf8      
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'	
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(  
	JobID,
	Agency,
	Posting_type,
	Positions,
	Business_title,
	Civil_service_title,
	Title_Code_No,
	Job_level,
	Job_Category,
	Full_Part_time_indicator,
	Salary_range_from,
	Salary_range_to,
	Salary_frequency,
	Work_location,
	Division,
	Job_description,
	Minimum_requirements,
	Preferred_skills,
	Aditional_information,
	To_apply,
	Hours_shift,
	Recruitment_contact,
	Residency_requirement,
	Post_date,
	Post_until,
	Posting_update,
	Process_date
)