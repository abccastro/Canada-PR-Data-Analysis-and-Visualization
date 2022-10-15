-- create database
-- create database bdm1043
use bdm1043;

-- create tables
create table if not exists `continents` (
	code char(2) not null comment 'continent code',
    name varchar(15) comment 'continent name',
    primary key (code)
);

create table if not exists `countries`  (
	code char(3) not null comment 'country code',
    name varchar(100) not null comment 'country name',
    continent_code char(2) not null comment 'continent code',
    primary key (code),
    foreign key (continent_code) 
		references continents (code)
        on update cascade on delete cascade
);

create table if not exists `provinces`  (
	code char(2) not null comment 'province code',
    name varchar(30) not null comment 'province name',
    region varchar(20) not null comment 'region name',
    primary key (code)
);

create table if not exists `age_group`  (
	id int not null auto_increment comment 'auto-generated id for age group',
    description varchar(30) not null comment 'range of the age group',
    primary key (id)
);

create table if not exists `immigration_category`  (
	id int not null auto_increment comment 'auto-generated id for immigration category',
    type varchar(60) not null comment 'immigration type',
    primary key (id)
);

create table if not exists `national_occupational_category` (
	code char(4) not null comment 'national occupational category code',
    job_title varchar(200) not null comment 'job title',
    skill_type char(1) not null comment 'skill type: 0, A, B, C or D',
    primary key (code)
);

create table if not exists `pr_admission_by_age_group` (
	id int not null auto_increment comment 'auto-generated id',
    age_group_id int comment 'age group id',
    province_code char(2) not null comment 'province code',
    year char(4) not null comment 'year of the PR approval',
    month char(2) not null comment 'month of the PR approval',
    total_approval int comment 'total number of PR approvals',
    primary key (id),
    foreign key (age_group_id) 
		references age_group (id)
        on update cascade on delete cascade,
    foreign key (province_code) 
		references provinces (code)
        on update cascade on delete cascade    
);

create table if not exists `pr_admission_by_noc` (
	id int not null auto_increment comment 'auto-generated id',
    noc_code char(4) comment 'national occupational category code',
    province_code char(2) not null comment 'province code',
    year char(4) not null comment 'year of the PR approval',
    month char(2) not null comment 'month of the PR approval',
    total_approval int comment 'total number of PR approvals',
    primary key (id),
    foreign key (noc_code) 
		references national_occupational_category (code)
        on update cascade on delete cascade,
	foreign key (province_code) 
		references provinces (code)
        on update cascade on delete cascade
);