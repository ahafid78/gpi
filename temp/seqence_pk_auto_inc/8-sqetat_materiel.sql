


CREATE SEQUENCE SQETAT_MATERIEL
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXETAT_MATERIEL
              before insert on ETAT_MATERIEL
              for each row
              begin
                  if :new.ETAT_MAT_ID is null then
                      SELECT SQETAT_MATERIEL.NEXTVAL
						INTO :New.ETAT_MAT_ID from sys.dual;
                 end if;
              end;