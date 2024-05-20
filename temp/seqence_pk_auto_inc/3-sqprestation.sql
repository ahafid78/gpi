

CREATE SEQUENCE SQPRESTATIONS
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXPRESTATIONS
              before insert on PRESTATIONS
              for each row
              begin
                  if :new.PRES_ID is null then
                      SELECT SQPRESTATIONS.NEXTVAL
						INTO :New.PRES_ID from sys.dual;
                 end if;
              end;