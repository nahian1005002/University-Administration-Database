CREATE SEQUENCE oid_seq;

CREATE OR REPLACE TRIGGER officer_oidgen 
after INSERT ON officer
FOR EACH ROW

BEGIN
  SELECT oid_seq.NEXTVAL
  INTO   :new.oid
  FROM   dual;
END;
/