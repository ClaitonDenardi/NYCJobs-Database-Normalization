CREATE DATABASE IF NOT EXISTS NYCJobs DEFAULT CHARACTER SET = utf8;
USE NYCJobs;

DROP TABLE IF EXISTS Jobs;
DROP TABLE IF EXISTS Agency;
DROP TABLE IF EXISTS Posts;
DROP TABLE IF EXISTS Requirements;
DROP TABLE IF EXISTS Salary;

CREATE TABLE IF NOT EXISTS Agency (
    agency_id 					INT 		  NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Agency    					VARCHAR(100)  NOT NULL,
    Recruitment_contact         TEXT
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;


CREATE TABLE IF NOT EXISTS Posts (
    post_id 					INT 		  NOT NULL PRIMARY KEY AUTO_INCREMENT, 
	Post_date                   TEXT, 
	Post_until                  TEXT,
	Posting_update              TEXT NOT NULL,
    Process_date                TEXT NOT NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Requirements (
    requirement_id              INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Minimum_requirements        TEXT          NOT NULL,
	Preferred_skills            TEXT          NOT NULL,
	Residency_requirement       TEXT 
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Salary (
    salary_id                   INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,
    Salary_range_from           VARCHAR(30)   NOT NULL,
	Salary_range_to             VARCHAR(30)   NOT NULL,
	Salary_frequency            VARCHAR(10)   NOT NULL
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS Jobs (
	id                          INT           NOT NULL PRIMARY KEY AUTO_INCREMENT,
	JobID                       INT,
	Posting_type                VARCHAR(20),
	Positions                   INT           NOT NULL,
	Business_title              VARCHAR(200)  NOT NULL,
	Civil_service_title         VARCHAR(100)  NOT NULL,
	Title_Code_No               VARCHAR(10)   NOT NULL,
	Job_level                   VARCHAR(5)    NOT NULL,
	Job_Category                VARCHAR(200),
	Full_Part_time_indicator    CHARACTER,
	Work_location               VARCHAR(70)   NOT NULL,
	Division                    VARCHAR(50)   NOT NULL,
	Job_description             TEXT NOT NULL,
	Aditional_information       TEXT NOT NULL,
	To_apply                    TEXT NOT NULL,
	Hours_shift                 TEXT,
    -- obs{
    Agency						varchar(100),
    Post_date                   text,
    Salary_range_from           varchar(30)   not null,
    Minimum_requirements        text          not null,
    -- }
    -- obs2{
	agency_id         			INT,   
	post_id             		INT,
	requirement_id  			INT,	
	salary_id 					INT,
    -- }
    FOREIGN KEY (agency_id)      REFERENCES Agency(agency_id),
    FOREIGN KEY (post_id)        REFERENCES Posts(post_id),
    FOREIGN KEY (requirement_id) REFERENCES Requirements(requirement_id),
    FOREIGN KEY (salary_id)      REFERENCES Salary(salary_id)
    
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8;

-- OBS: Os quatro atributos entre as chaves acima são atributos mantidos apenas para fazer a ligação
-- entre tabelas via NATURAL JOIN, no arquivo "NYCJobs_Normalizado_dml2" as mesmas serão excluidas da
-- tabela para não impactar negativamente na normalização previamente realizada!

-- OBS2: Quatro chaves estrangeiras destinadas a realizar o conexão entre a tabela Jobs e as demais
-- as mesmas referenciam as chaves primárias das demais tabelas!
