DROP DATABASE IF EXISTS NYCJobs;
CREATE DATABASE IF NOT EXISTS NYCJobs DEFAULT CHARACTER SET = utf8;
USE NYCJobs;

CREATE TABLE IF NOT EXISTS JobsDesnormalizado (
	id                          INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,	
	JobID                       INT           NOT NULL,
	Agency                      VARCHAR(100)  NOT NULL,
	Posting_type                VARCHAR(20),
	Positions                   INT           NOT NULL,
	Business_title              VARCHAR(200)  NOT NULL,
	Civil_service_title         VARCHAR(100)  NOT NULL,
	Title_Code_No               VARCHAR(10)   NOT NULL,
	Job_level                   VARCHAR(5)    NOT NULL,
	Job_Category                VARCHAR(200),
	Full_Part_time_indicator    CHARACTER,
	Salary_range_from           VARCHAR(15)   NOT NULL,
	Salary_range_to             VARCHAR(15)   NOT NULL,
	Salary_frequency            VARCHAR(20)   NOT NULL,
	Work_location               TEXT          NOT NULL,
	Division                    VARCHAR(200)   NOT NULL,
	Job_description             TEXT NOT NULL,
	Minimum_requirements        TEXT NOT NULL,
	Preferred_skills            TEXT NOT NULL,
	Aditional_information       TEXT NOT NULL,
	To_apply                    TEXT NOT NULL,
	Hours_shift                 TEXT,
	Recruitment_contact         TEXT,
	Residency_requirement       TEXT, 
	Post_date                   TEXT, 
	Post_until                  TEXT,
	Posting_update              TEXT NOT NULL,
    Process_date                TEXT NOT NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;
