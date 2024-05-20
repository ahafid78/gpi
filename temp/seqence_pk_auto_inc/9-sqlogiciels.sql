

CREATE SEQUENCE SQLOGICIELS
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXLOGICIELS
              before insert on LOGICIELS
              for each row
              begin
                  if :new.LOG_ID  is null then
                      SELECT SQLOGICIELS.NEXTVAL
						INTO :New.LOG_ID from sys.dual;
                 end if;
              end;