create table officer
(
	oid number(10) constraint pk_officer primary key,
	name varchar2(30),
	universityemail varchar2(40) unique,
	email varchar2(40),
	salarybase number(10),
	mobile char(11),
	residantphone char(10)
);

/* EMPLOYEE MODULE
Roll: 1005002
*/ 
create table office 
(
	name varchar2(50) constraint pk_office primary key,
	building varchar2(20),
	PABX char(15),
	fax  char(11)
);

create table payscale
(
	pid number(10) constraint pk_payscale primary key,
	startingsalary number(10) not null,
	yearlyincrement number(10),
	yearofdeclaration date
);

create table designation
(
	designationid number(10) constraint pk_designation primary key,
	designation  varchar2(20) not null,
	officetelephone char(10),
	roomno	number(4),
	officename varchar2(50) references office(name)
	on delete cascade,
	pid number(10) references payscale(pid)
	on delete set null
);

create table dependant
(
	name varchar2(30),
	dependantid number(10) constraint pk_dependant primary key,
	dateofbirth date,
	relation varchar2(20),
	oid number(10) references officer(oid)
	on delete cascade
);

create table medicalrecord
(
	medid number(15) constraint pk_medicalrecord primary key,
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
	designationid number(10) references designation(designationid)
	on delete cascade,
	primary key (oid,designationid)
);


/*Teaccher Module

Roll :1005017

*/


CREATE TABLE Institute(
	I_ID NUMBER(10) NOT NULL PRIMARY KEY,
	I_Name VARCHAR2(30),
	I_Code VARCHAR2(10),
	I_Location VARCHAR2(30)
);
CREATE TABLE Leave(
	L_ID NUMBER(5) NOT NULL PRIMARY KEY,
	L_Type VARCHAR2(20),
	L_Description VARCHAR2(50)
);
CREATE TABLE Faculty(
	F_ID NUMBER(10) NOT NULL,
	F_Name VARCHAR2(20)
	PRIMARY KEY (F_ID)
);

CREATE TABLE Departments(
	D_ID NUMBER(10) NOT NULL,
	D_Name VARCHAR2(30) NOT NULL,
	D_Officeroom NUMBER(10),
	PRIMARY KEY (D_ID),
	FOREIGN KEY (F_ID) REFERENCES Faculty(F_ID)
);

CREATE TABLE Teacher(
	T_ID NUMBER(10) NOT NULL,
	T_email varchar2(20),
	T_roomno NUMBER(10) ,
	Joining_date Date,
	Retiring_date Date ,
	D_ID NUMBER(10),
	PRIMARY KEY (T_ID)REFERENCES officer(oid),
	FOREIGN KEY (D_ID) REFERENCES Departments (D_ID)
);

CREATE TABLE Head_Department(
	T_ID NUMBER(10),
	D_ID NUMBER(10),
	Starting_date DATE,
	Finishing_date DATE,
	FOREIGN KEY (T_ID) REFERENCES Teacher(T_ID),
	FOREIGN KEY (D_ID) REFERENCES Departments(D_ID)
);
CREATE TABLE Dean_Faculty(
	T_ID NUMBER(10),
	F_ID NUMBER(10),
	Starting_date DATE,
	FInishing_date DATE,
	
	FOREIGN KEY (T_ID) REFERENCES Teacher(T_ID),
	FOREIGN KEY (F_ID) REFERENCES Faculty(F_ID)
	
);
CREATE TABLE Additional_Resposibility(
	I_ID NUMBER(10),
	T_ID NUMBER(10),
	Designation VARCHAR2(20),
	StartingDate DATE,
	FinishingDate DATE,
	
	FOREIGN KEY (T_ID) REFERENCES Teacher(T_ID),
	FOREIGN KEY (I_ID) REFERENCES Institute(I_ID)
);
CREATE TABLE Teacher_Leave(
	T_ID NUMBER(10),
	L_ID NUMBER(5),
	Leave_Start DATE,
	Leave_End DATE,
	
	FOREIGN KEY T_ID REFERENCES Teacher(T_ID),
	FOREIGN KEY L_ID REFERENCES Leave(L_ID)
);

