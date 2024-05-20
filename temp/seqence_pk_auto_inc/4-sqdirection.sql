

CREATE SEQUENCE SQDIRECTIONS
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXDIRECTIONS
              before insert on DIRECTIONS
              for each row
              begin
                  if :new.DR_ID is null then
                      SELECT SQDIRECTIONS.NEXTVAL
						INTO :New.DR_ID from sys.dual;
                 end if;
              end;