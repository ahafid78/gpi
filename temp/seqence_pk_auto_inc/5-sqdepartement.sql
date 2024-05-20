

CREATE SEQUENCE SQDEPARTEMENTS
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXDEPARTEMENTS
              before insert on DEPARTEMENTS
              for each row
              begin
                  if :new.DEP_ID is null then
                      SELECT SQDEPARTEMENTS.NEXTVAL
						INTO :New.DEP_ID from sys.dual;
                 end if;
              end;