create database hrms;
use hrms;


create table employee(
id int primary key auto_increment,
corporation_name varchar(200) unique key,
web_site_name varchar(300) unique key,
email varchar(100) unique key,
password varchar(100) unique key
);

create table job_position(
id int primary key auto_increment,
job_name varchar(100),
job_explanation text
);

create table job_seeker(
id int primary key auto_increment,
job_position_id int unique key null,
name varchar(100) unique key not null,
surname varchar(100) unique key not null,
email varchar(100) unique key,
password varchar(100) unique key,
birth_year int not null,

CONSTRAINT job_seeker_ibfk_01 foreign key (job_position_id) references job_position(id)
);

create table curriculum_vitae(
id int primary key auto_increment,
job_seeker_id int unique key not null,
about varchar(250) not null,
linkedin_link varchar(100) null,
github_link varchar(100) null,

CONSTRAINT curriculum_vitae_ibfk_01 foreign key (job_seeker_id) references job_seeker(id)
);

create table job_advertisement(
id int primary key auto_increment,
job_position_id int,
employee_id int,
advertisement_title varchar(50),
advertisement_context text,
min_salary double check(min_salary >= 0),
max_salary double check(max_salary > 0),
position_amount int check(position_amount > 0),
is_active boolean,

CONSTRAINT job_advertisement_ibfk_01 foreign key (job_position_id) references job_position(id),
CONSTRAINT job_advertisement_ibfk_02 foreign key (employee_id) references employee(id)
);

create table job_experiences(
id int primary key auto_increment,
curriculum_vitae_id int unique key not null,
corporation_name varchar(300),
position_id int,
beginning varchar(8),
finish varchar(8),

CONSTRAINT job_experiences_ibfk_01 foreign key (curriculum_vitae_id) references curriculum_vitae(id),
CONSTRAINT job_experiences_ibfk_02 foreign key (position_id) references job_position(id)
);

create table school(
id int primary key auto_increment,
curriculum_vitae_id int unique key not null,
school_name varchar(100),
section varchar(75),
graduation_year int check(graduation_year > 1900),
beginning varchar(8),
finish varchar(8) ,

CONSTRAINT school_ibfk_01 foreign key (curriculum_vitae_id) references curriculum_vitae(id)
);

create table language(
id int primary key auto_increment,
curriculum_vitae_id int unique key not null,
language_name varchar(20),
level int check(level >=0 and level <= 5),

CONSTRAINT language_ibfk_01 foreign key (curriculum_vitae_id) references curriculum_vitae(id)
);

create table tech_name(
id int primary key auto_increment,
curriculum_vitae_id int unique key not null,
tech_name varchar(50),

CONSTRAINT tech_name_ibfk_01 foreign key (curriculum_vitae_id) references curriculum_vitae(id)
);


-- drop database hrms;




