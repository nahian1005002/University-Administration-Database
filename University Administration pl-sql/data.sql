insert into officer values(5,'asdf','asdssf','asdf',215,'01254','65421');
insert into officer values(5,'asdf','assdfdf','asdf',215,'01254','65421');


create or replace trigger insert_to_isa
after insert on officer
for each row
begin
	if :new.oid>=6000000000 and :new.oid<7000000000 then
	insert into teacher(t_id) values(:new.oid);
	else insert into employee values(:new.oid);
	end if;
end;
/

insert into officer values(6000000005,'asdfa','aassdfdf','aasdf',22515,'0125254','65421');
insert into officer values(7000000005,'asdf','assdfdf','asdf',215,'01254','65421');

/*
create or replace trigger insert_to_officer
before insert on teacher
for each row
declare
a int;
begin
	select count(*) into a from officer where oid=:new.t_id;
	dbms_output.put_line('check_date trigger successfully executed');
	if a=0 then
	insert into officer(oid) values(:new.t_id);
	end if;
end;
/
*/


create or replace procedure insert_teacher(ooid officer.oid%TYPE,nname officer.name%TYPE,uuniversityemail  officer.universityemail%TYPE,eemail  officer.email%type,ssalarybase  officer.salarybase%type,mmobile  officer.mobile%type,rresidantphone  officer.residantphone%type,ooffice_telephone teacher.office_telephone%type,TT_roomno teacher.T_roomno%type,JJoining_date teacher.Joining_date%type,RRetiring_date teacher.Retiring_date%type,DD_ID teacher.D_ID%type) is
begin
	insert into officer values(ooid,nname,uuniversityemail,eemail,ssalarybase,mmobile,rresidantphone);
	update teacher b set b.office_telephone=ooffice_telephone,b.T_roomno=tt_roomno,b.Joining_date=JJoining_date,b.Retiring_date=RRetiring_date,b.D_ID=DD_ID where b.t_id=ooid;
end;
/

alter table teacher modify office_telephone char(10);

execute insert_teacher(6000000011,'raisul','c@gmail.com','b@gmail.com',null,null,null,'125432',2154,null,null,null);
