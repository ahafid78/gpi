

CREATE SEQUENCE SQTYPE_BUREAU
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXTYPE_BUREAU
              before insert on TYPE_BUREAU
              for each row
              begin
                  if :new.TYPE_BUR_ID is null then
                      SELECT SQTYPE_BUREAU.NEXTVAL
						INTO :New.TYPE_BUR_ID from sys.dual;
                 end if;
              end;