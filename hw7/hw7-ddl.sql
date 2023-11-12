# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int not null,
    name varchar(255) not null,
    description varchar(255) not null,
    tag varchar(255) not null,
    url varchar(255),
    time_commitment int,
    primary key (id)
);



# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment) VALUES
(1, 'Cooking', 'Cooking meals that are edible', 'Skills 1', 'https://cookingexample.com', 200),
(2, 'Math', 'Be able to do high level math problems', 'Skills 2', 'https://mathexample.com', 300),
(3, 'Writing', 'Write stories that are readable', 'Skills 3', 'https://writingexample.com', 150),
(4, 'Flying', 'Have both feet be off the ground at the same time', 'Skills 4', 'https://flyingexample.com', 120),
(5, 'Running', 'Be able to run at a fast speed', 'Skills 5', 'https://runningexample.com', 100),
(6, 'Eating', 'Be able to eat as much as possible and still be hungry', 'Skills 6', 'https://eatingexample.com', 50),
(7, 'Talking', 'Be a smooth talker and engage with anyone', 'Skills 7', 'https://talkingexample.com', 75),
(8, 'Laughing', 'Have a laugh so good other people around you start laughing', 'Skills 8', 'https://laughingexample.com', 60);



# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int not null,
    people_first_name varchar(255),
    people_last_name varchar(255) NOT NULL,
    email varchar(255),
    linkedin_url varchar(255),
    headshot_url varchar(255),
    discord_handle varchar(255),
    brief_bio varchar(255),
    date_joined DATE not null,
    PRIMARY KEY (people_id)
);


# Section 5
# Populate people with ten people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (people_id, people_first_name, people_last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined) VALUES
(1, 'Alex', 'Kem', 'alex.person1@example.com', 'https://linkedin.com/in/alexkem', 'https://example.com/headshots/alex.jpg', 'AlexK#1234', 'Experienced Chef', '2002-04-23'),
(2, 'John', 'Smith', 'john.person2@example.com', 'https://linkedin.com/in/johnsmith', 'https://example.com/headshots/john.jpg', 'JohnS#1234', 'Software Engineer', '2012-12-12'),
(3, 'Leonard', 'Bones', 'professor.person3@example.com', 'https://linkedin.com/in/leonardbones', 'https://example.com/headshots/leonard.jpg', 'LeonardB#1234', 'Math Professor', '2005-01-23'),
(4, 'Jack', 'Harlow', 'jack.person4@example.com', 'https://linkedin.com/in/jackharlow', 'https://example.com/headshots/jack.jpg', 'JackH#1234', 'Music Producer', '2012-09-11'),
(5, 'Peter', 'Parker', 'spider.person5@example.com', 'https://linkedin.com/in/peterparker', 'https://example.com/headshots/peter.jpg', 'PeterP#1234', 'Photographer', '2018-08-23'),
(6, 'Michael', 'Jackson', 'michael.person6@example.com', 'https://linkedin.com/in/michaeljackson', 'https://example.com/headshots/michael.jpg', 'MichaelJ#1234', 'Dance Instructor', '2003-02-02'),
(7, 'Jane', 'Doe', 'jane.doe7@example.com', 'https://linkedin.com/in/janedoe', 'https://example.com/headshots/jane.jpg', 'JaneD#1234', 'Graphic Designer', '2010-07-15'),
(8, 'Chris', 'Brown', 'chris.brown8@example.com', 'https://linkedin.com/in/chrisbrown', 'https://example.com/headshots/chris.jpg', 'ChrisB#1234', 'Marketing Specialist', '2011-08-19'),
(9, 'Emily', 'Johnson', 'emily.johnson9@example.com', 'https://linkedin.com/in/emilyjohnson', 'https://example.com/headshots/emily.jpg', 'EmilyJ#1234', 'HR Manager', '2014-09-23'),
(10, 'Sam', 'Davis', 'sam.davis10@example.com', 'https://linkedin.com/in/samdavis', 'https://example.com/headshots/sam.jpg', 'SamD#1234', 'Financial Analyst', '2016-05-30');




# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id int not null auto_increment, 
    skills_id int not null, 
    people_id int not null, 
    date_acquired DATE not null DEFAULT (current_date),
    PRIMARY KEY (id),
    foreign key (skills_id) references skills (id),
    foreign key (people_id) references people (people_id),
    unique (skills_id,people_id)
    );


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills (people_id, skills_id) VALUES
(1,1),
(1,3),
(1,6),
(2,3),
(2,4),
(2,5),
(3,1),
(3,5),
(5,3),
(5,6),
(6,2),
(6,3),
(6,4),
(7,3),
(7,5),
(7,6),
(8,1),
(8,3),
(8,5),
(8,6),
(9,2),
(9,5),
(9,6),
(10,1),
(10,4),
(10,5);

SELECT
    people_last_name
FROM
    people a
        left join peopleskills b on (a.people_id=b.people_id)
WHERE
    skills_id is NULL
;

SELECT
    people_last_name,
    name,
    tag
from
    peopleskills a
    INNER JOIN people b on (a.people_id=b.people_id)
    inner join skills c on (a.skills_id=c.id)
Where
    c.id not in (7,8)
ORDER BY
    people_last_name
;


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int,
    name varchar(255),
    sort_priority int,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (roles_id, name, sort_priority) values
(1,'Designer', 10),
(2,'Developer', 20),
(5,'Boss', 50),
(6,'Mentor', 60),
(4,'Team Lead', 40),
(3,'Recruit', 30);

SELECT
    roles_id,
    name,
    sort_priority
FROM
    roles
ORDER BY
    sort_priority;



# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    id int auto_increment not null,
    people_id int not null,
    role_id int not null,
    date_assigned varchar(255) not null,
    PRIMARY KEY(id),
    foreign key (people_id) references people(people_id),
    foreign key (role_id) references roles(roles_id)
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, role_id, date_assigned) VALUES
(1, 2, '2011-05-23'), 
(2, 5, '2011-05-23'), 
(2, 6, '2011-05-23'), 
(3, 2, '2011-05-23'), 
(3, 4, '2011-05-23'), 
(4, 3, '2011-05-23'), 
(5, 3, '2011-05-23'), 
(6, 2, '2011-05-23'), 
(6, 1, '2011-05-23'), 
(7, 1, '2011-05-23'), 
(8, 1, '2011-05-23'), 
(8, 4, '2011-05-23'), 
(9, 2, '2011-05-23'), 
(10, 2, '2011-05-23'), 
(10, 1, '2011-05-23');


SELECT
    people_last_name,
    a.people_id,
    role_id,
    name
from
    peopleroles a
    INNER JOIN people b on (a.people_id=b.people_id)
    inner join roles c on (a.role_id=c.roles_id)
ORDER BY
    people_id
;

