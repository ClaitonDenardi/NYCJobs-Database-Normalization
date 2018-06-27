USE NYCJobs;

-- Agency
INSERT INTO     Agency (Agency, Recruitment_contact) 
SELECT DISTINCT Agency, Recruitment_contact
FROM            JobsDesnormalizado;

-- Posts
INSERT INTO     Posts (Post_date, Post_until,Posting_update,Process_date)
SELECT DISTINCT Post_date, Post_until,Posting_update,Process_date
FROM            JobsDesnormalizado;

-- Requirements
INSERT INTO     Requirements (Minimum_requirements, Preferred_skills, Residency_requirement)
SELECT DISTINCT Minimum_requirements, Preferred_skills, Residency_requirement
FROM            JobsDesnormalizado;

-- Salary
INSERT INTO     Salary (Salary_range_from, Salary_range_to, Salary_frequency)
SELECT DISTINCT Salary_range_from, Salary_range_to, Salary_frequency
FROM            JobsDesnormalizado;

-- Jobs
INSERT INTO Jobs (JobID, Agency, Posting_type, Positions, Business_title, Civil_service_title, Title_Code_No, Job_level,
Job_Category, Full_Part_time_indicator, Work_location, Division, Job_description, Minimum_requirements, Aditional_information,
To_apply, Hours_shift, Post_date, Salary_range_from, agency_id, post_id, requirement_id, salary_id)

SELECT DISTINCT JobID, Agency, Posting_type, Positions, Business_title, Civil_service_title, Title_Code_No, Job_level,
Job_Category, Full_Part_time_indicator, Work_location, Division, Job_description, Minimum_requirements, Aditional_information,
To_apply, Hours_shift, Post_date, Salary_range_from, agency_id, post_id, requirement_id, salary_id

FROM JobsDesnormalizado
NATURAL JOIN Salary NATURAL JOIN Requirements NATURAL JOIN Agency  NATURAL JOIN Posts 