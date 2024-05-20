

CREATE SEQUENCE SQMATERIEL
	  START WITH 100
	  MAXVALUE 99999999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXMATERIEL
              before insert on MATERIEL
              for each row
              begin
                  if :new.MAT_ID is null then
                      SELECT SQMATERIEL.NEXTVAL
						INTO :New.MAT_ID from sys.dual;
                 end if;
              end;