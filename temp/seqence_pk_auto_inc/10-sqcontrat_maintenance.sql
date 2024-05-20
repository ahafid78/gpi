

CREATE SEQUENCE SQCONTRAT_MAINTENANCE
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXCONTRAT_MAINTENANCE
              before insert on CONTRAT_MAINTENANCE
              for each row
              begin
                  if :new.CONT_ID  is null then
                      SELECT SQCONTRAT_MAINTENANCE.NEXTVAL
						INTO :New.CONT_ID from sys.dual;
                 end if;
              end;