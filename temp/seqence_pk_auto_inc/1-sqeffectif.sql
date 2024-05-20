

CREATE SEQUENCE SQEFFECTIF
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXEFFECTIF
              before insert on EFFECTIF
              for each row
              begin
                  if :new.EFF_ID is null then
                      SELECT SQEFFECTIF.NEXTVAL
						INTO :New.EFF_ID from sys.dual;
                 end if;
              end;
	