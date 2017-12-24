drop table dependant;
drop table medicalrecord;
drop table working;
drop table employee;

drop table teacher_leave;
drop table Additional_Resposibility;
drop table head_department;
drop table dean_faculty;
drop table teacher;

drop table officer;
drop table designation;
drop table payscale;
drop table office;


drop table departments;
drop table faculty;
drop table Institute;
drop table leave;



create table officer
(
	oid number(10) constraint pk_officer primary key,
	name varchar2(30),
	universityemail varchar2(40) unique,
	email varchar2(40) ,
	salarybase number(10),
	mobile char(11) unique,
	residantphone char(10)
);

alter table officer
  add constraint check_universityemail
  check (REGEXP_LIKE(universityemail,'[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}')); 
alter table officer
  add constraint check_email
  check (REGEXP_LIKE(email,'[a-zA-Z0-9._%-]+@[a-zA-Z0-9._%-]+\.[a-zA-Z]{2,4}'));


create table office 
(
	name varchar2(50) constraint pk_office primary key,
	building varchar2(20),
	PABX char(15),
	fax  char(11)
);

create table payscale
(
	grade number(5) constraint pk_payscale primary key,
	startingsalary number(10) not null,
	yearlyincrement number(10),
	yearofdeclaration date
);

create table designation
(
	designationid raw(16) default sys_guid() constraint pk_designation primary key,
	designation  varchar2(20) not null,
	officetelephone char(10),
	roomno	number(4),
	officename varchar2(50) references office(name)
	on delete cascade,
	grade number(10) references payscale(grade)
	on delete set null
);

create table dependant
(
	dependantid raw(16) default sys_guid() constraint pk_dependant primary key,
	name varchar2(30),
	dateofbirth date,
	relation varchar2(20),
	oid number(10) references officer(oid)
	on delete cascade
);

create table medicalrecord
(
	medid raw(16) default sys_guid() constraint pk_medicalrecord primary key,
	description varchar2(500),
	recorddate date,
	oid number(10)  references officer(oid)
	on delete cascade
);

create table employee
(
	oid number(10) constraint pk_employee primary key references officer(oid)
	on delete cascade
);

create table working
(
	oid number(10)  references officer(oid)
	on delete cascade,
	startdate date,
	enddate date,
	designationid raw(16) references designation(designationid)
	on delete cascade,
	primary key (oid,designationid)
);



CREATE TABLE Institute(
	I_ID raw(16) default sys_guid() NOT NULL PRIMARY KEY,
	I_Name VARCHAR2(70),
	I_Code VARCHAR2(10),
	I_Location VARCHAR2(30)
);
CREATE TABLE Leave(
	L_ID NUMBER(5) NOT NULL PRIMARY KEY,
	L_Type VARCHAR2(50),
	L_Description VARCHAR2(50)
);
CREATE TABLE Faculty(
	F_ID raw(16) default sys_guid() NOT NULL,
	F_Name VARCHAR2(60),
	PRIMARY KEY (F_ID)
);

CREATE TABLE Departments(
	D_ID raw(16) default sys_guid() NOT NULL,
	D_Name VARCHAR2(60) NOT NULL,
	D_Officeroom NUMBER(10),
	F_ID raw(16),
	D_Code VARCHAR2(10),
	PRIMARY KEY (D_ID),
	FOREIGN KEY (F_ID) REFERENCES Faculty(F_ID)
);

CREATE TABLE Teacher(
	T_ID NUMBER(10) REFERENCES officer(oid),
	office_telephone char(10),
	T_roomno NUMBER(10) ,
	Joining_date Date,
	Retiring_date Date ,
	D_ID raw(16),
	PRIMARY KEY (T_ID),
	FOREIGN KEY (D_ID) REFERENCES Departments (D_ID)
);

CREATE TABLE Head_Department(
	T_ID NUMBER(10),
	D_ID raw(16),
	Starting_date DATE,
	Finishing_date DATE,
	FOREIGN KEY (T_ID) REFERENCES Teacher(T_ID),
	FOREIGN KEY (D_ID) REFERENCES Departments(D_ID),
	primary key(T_ID,D_ID,starting_date)
);
CREATE TABLE Dean_Faculty(
	T_ID NUMBER(10),
	F_ID raw(16),
	Starting_date DATE,
	FInishing_date DATE,
	FOREIGN KEY (T_ID) REFERENCES Teacher(T_ID),
	FOREIGN KEY (F_ID) REFERENCES Faculty(F_ID),
	primary key(T_ID,F_ID,starting_date)
);
CREATE TABLE Additional_Resposibility(
	I_ID raw(16),
	T_ID NUMBER(10),
	Designation VARCHAR2(20),
	Starting_date DATE,
	Finishing_date DATE,
	FOREIGN KEY (T_ID) REFERENCES Teacher(T_ID),
	FOREIGN KEY (I_ID) REFERENCES Institute(I_ID),
	primary key(I_ID,T_ID,designation)
);
CREATE TABLE Teacher_Leave(
	T_ID NUMBER(10),
	L_ID NUMBER(5),
	Leave_Start DATE,
	Leave_End DATE,
	FOREIGN KEY (T_ID) REFERENCES Teacher(T_ID),
	FOREIGN KEY (L_ID) REFERENCES Leave(L_ID),
	primary key (T_ID,L_ID,Leave_Start)
);
