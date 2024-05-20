
CREATE SEQUENCE SQFOURNISSEURS
	  START WITH 100
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXFOURNISSEURS
              before insert on FOURNISSEURS
              for each row
              begin
                  if :new.FOURN_ID is null then
                      SELECT SQFOURNISSEURS.NEXTVAL
						INTO :New.FOURN_ID from sys.dual;
                 end if;
              end;