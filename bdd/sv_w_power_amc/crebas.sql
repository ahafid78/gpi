/*==============================================================*/
/* Nom de SGBD :  ORACLE Version 11g                            */
/* Date de cr�ation :  25/12/2023 09:53:31                      */
/*==============================================================*/


alter table CONTRAT_MAINTENANCE
   drop constraint FK_CONTRAT__MAINTENAN_FOURNISS;

alter table EFFECTIF
   drop constraint FK_EFFECTIF_ASSOCIATI_TYPE_BUR;

alter table EFFECTIF
   drop constraint FK_EFFECTIF_TRAVAIL_DIRECTIO;

alter table EFFECTIF
   drop constraint FK_EFFECTIF_WORKS_DEPARTEM;

alter table LOGICIELS
   drop constraint FK_LOGICIEL_VENDRE_FOURNISS;

alter table MATERIEL
   drop constraint FK_MATERIEL_AFFECTATI_DIRECTIO;

alter table MATERIEL
   drop constraint FK_MATERIEL_APPARTENA_DEPARTEM;

alter table MATERIEL
   drop constraint FK_MATERIEL_CONSTATAT_ETAT_MAT;

alter table MATERIEL
   drop constraint FK_MATERIEL_CONTENANC_TYPE_BUR;

alter table MATERIEL
   drop constraint FK_MATERIEL_FOURNIR_FOURNISS;

alter table MATERIEL
   drop constraint FK_MATERIEL_UTILISATI_EFFECTIF;

alter table PRESTATIONS
   drop constraint FK_PRESTATI_ASSOCIATI_DIRECTIO;

alter table PRESTATIONS
   drop constraint FK_PRESTATI_PRESTATIO_FOURNISS;

drop table CONTRAT_MAINTENANCE cascade constraints;

drop table DEPARTEMENTS cascade constraints;

drop table DIRECTIONS cascade constraints;

drop table EFFECTIF cascade constraints;

drop table ETAT_MATERIEL cascade constraints;

drop table FOURNISSEURS cascade constraints;

drop table LOGICIELS cascade constraints;

drop table MATERIEL cascade constraints;

drop table PRESTATIONS cascade constraints;

drop table TYPE_BUREAU cascade constraints;

/*==============================================================*/
/* Table : CONTRAT_MAINTENANCE                                  */
/*==============================================================*/
create table CONTRAT_MAINTENANCE 
(
   CONT_ID              NUMBER               not null,
   FOURN_ID             NUMBER               not null,
   REFERENCE_CONTRAT    VARCHAR2(256),
   constraint PK_CONTRAT_MAINTENANCE primary key (CONT_ID)
);

/*==============================================================*/
/* Table : DEPARTEMENTS                                         */
/*==============================================================*/
create table DEPARTEMENTS 
(
   DEP_ID               NUMBER               not null,
   DEPARTEMENT          VARCHAR2(256),
   NOM_DEPARTEMENT      VARCHAR2(256),
   DR_ID                NUMBER,
   constraint PK_DEPARTEMENTS primary key (DEP_ID)
);

/*==============================================================*/
/* Table : DIRECTIONS                                           */
/*==============================================================*/
create table DIRECTIONS 
(
   DR_ID                NUMBER               not null,
   NOM_DIRECTION        VARCHAR2(256),
   CODE_DR              VARCHAR2(256),
   constraint PK_DIRECTIONS primary key (DR_ID)
);

/*==============================================================*/
/* Table : EFFECTIF                                             */
/*==============================================================*/
create table EFFECTIF 
(
   EFF_ID               NUMBER               not null,
   DR_ID                NUMBER               not null,
   DEP_ID               NUMBER               not null,
   TYPE_BUR_ID          NUMBER               not null,
   NOM_PRENOM           VARCHAR2(256),
   USER_MAIL            VARCHAR2(256),
   TYPE_JOB             VARCHAR2(256),
   NUMERO_BUREAU        VARCHAR2(256),
   MOBILE               VARCHAR2(256),
   MATRICULE            VARCHAR2(50),
   NUMSECUSOC           VARCHAR2(100),
   DATERECRU            DATE,
   NATCONTRAT           VARCHAR2(50),
   NOM                  VARCHAR2(100),
   PRENOM               VARCHAR2(100),
   constraint PK_EFFECTIF primary key (EFF_ID)
);

/*==============================================================*/
/* Table : ETAT_MATERIEL                                        */
/*==============================================================*/
create table ETAT_MATERIEL 
(
   ETAT_MAT_ID          NUMBER               not null,
   ETAT_MATERIEL        VARCHAR2(256),
   constraint PK_ETAT_MATERIEL primary key (ETAT_MAT_ID)
);

/*==============================================================*/
/* Table : FOURNISSEURS                                         */
/*==============================================================*/
create table FOURNISSEURS 
(
   FOURN_ID             NUMBER               not null,
   NOM_ENTREPRISE       VARCHAR2(256),
   MAIL                 VARCHAR2(256),
   TELEPHONE            VARCHAR2(256),
   ADRESSE              VARCHAR2(256),
   constraint PK_FOURNISSEURS primary key (FOURN_ID)
);

/*==============================================================*/
/* Table : LOGICIELS                                            */
/*==============================================================*/
create table LOGICIELS 
(
   LOG_ID               NUMBER               not null,
   FOURN_ID             NUMBER               not null,
   NOM_LOGICIEL         VARCHAR2(256),
   DATE_ACTIVATION      DATE,
   DATE_EXPIRATION      DATE,
   COUT_LOGICIEL_DA     NUMBER(8,2),
   constraint PK_LOGICIELS primary key (LOG_ID)
);

comment on table LOGICIELS is
'LOGICIELS INSTALLES';

/*==============================================================*/
/* Table : MATERIEL                                             */
/*==============================================================*/
create table MATERIEL 
(
   MAT_ID               NUMBER               not null,
   FOURN_ID             NUMBER               not null,
   ETAT_MAT_ID          NUMBER               not null,
   EFF_ID               NUMBER               not null,
   DR_ID                NUMBER               not null,
   DEP_ID               NUMBER               not null,
   TYPE_BUR_ID          NUMBER               not null,
   TYPE_MATERIEL        VARCHAR2(256),
   MARQUE               VARCHAR2(256),
   MODEL_REFERENCE      VARCHAR2(256),
   NUM_INVENTAIRE       VARCHAR2(256),
   REF_TAG              VARCHAR2(256),
   MAT_NUM_BUR          VARCHAR2(256),
   DATE_ACHAT_MAT       DATE,
   COUT_MATERIEL_DA     NUMBER(8,2),
   OBSERVATIONS         VARCHAR2(256),
   constraint PK_MATERIEL primary key (MAT_ID)
);

/*==============================================================*/
/* Table : PRESTATIONS                                          */
/*==============================================================*/
create table PRESTATIONS 
(
   PRES_ID              NUMBER               not null,
   FOURN_ID             NUMBER               not null,
   DR_ID                NUMBER               not null,
   PRESTATION           VARCHAR2(256),
   DATE_PRESTATION      DATE,
   COUT_PRESTATION      NUMBER(8,2),
   constraint PK_PRESTATIONS primary key (PRES_ID)
);

/*==============================================================*/
/* Table : TYPE_BUREAU                                          */
/*==============================================================*/
create table TYPE_BUREAU 
(
   TYPE_BUR_ID          NUMBER               not null,
   TYPE_BUREAU          VARCHAR2(256),
   constraint PK_TYPE_BUREAU primary key (TYPE_BUR_ID)
);

/*==============================================================*/
/* Table : GPI_USERS                                            */
/*==============================================================*/

create table GPI_USERS 
(
   USER_ID          NUMBER               not null,
   DR_ID            VARCHAR2(256),
   USERS_GPI        VARCHAR2(256),
   ROLE_USERS_GPI   VARCHAR2(50),
   constraint PK_GPI_USERS primary key (USER_ID)
);

/*==============================================================*/
/* Foreign Key                                                  */
/*==============================================================*/


alter table CONTRAT_MAINTENANCE
   add constraint FK_CONTRAT__MAINTENAN_FOURNISS foreign key (FOURN_ID)
      references FOURNISSEURS (FOURN_ID);

alter table DEPARTEMENTS
   add constraint FK_DEPARTEMENTS_DIRECTIO foreign key (DR_ID)
      references DIRECTIONS (DR_ID);

alter table EFFECTIF
   add constraint FK_EFFECTIF_ASSOCIATI_TYPE_BUR foreign key (TYPE_BUR_ID)
      references TYPE_BUREAU (TYPE_BUR_ID);

alter table EFFECTIF
   add constraint FK_EFFECTIF_TRAVAIL_DIRECTIO foreign key (DR_ID)
      references DIRECTIONS (DR_ID);

alter table EFFECTIF
   add constraint FK_EFFECTIF_WORKS_DEPARTEM foreign key (DEP_ID)
      references DEPARTEMENTS (DEP_ID);

alter table LOGICIELS
   add constraint FK_LOGICIEL_VENDRE_FOURNISS foreign key (FOURN_ID)
      references FOURNISSEURS (FOURN_ID);

alter table MATERIEL
   add constraint FK_MATERIEL_AFFECTATI_DIRECTIO foreign key (DR_ID)
      references DIRECTIONS (DR_ID);

alter table MATERIEL
   add constraint FK_MATERIEL_APPARTENA_DEPARTEM foreign key (DEP_ID)
      references DEPARTEMENTS (DEP_ID);

alter table MATERIEL
   add constraint FK_MATERIEL_CONSTATAT_ETAT_MAT foreign key (ETAT_MAT_ID)
      references ETAT_MATERIEL (ETAT_MAT_ID);

alter table MATERIEL
   add constraint FK_MATERIEL_CONTENANC_TYPE_BUR foreign key (TYPE_BUR_ID)
      references TYPE_BUREAU (TYPE_BUR_ID);

alter table MATERIEL
   add constraint FK_MATERIEL_FOURNIR_FOURNISS foreign key (FOURN_ID)
      references FOURNISSEURS (FOURN_ID);

alter table MATERIEL
   add constraint FK_MATERIEL_UTILISATI_EFFECTIF foreign key (EFF_ID)
      references EFFECTIF (EFF_ID);

alter table PRESTATIONS
   add constraint FK_PRESTATI_ASSOCIATI_DIRECTIO foreign key (DR_ID)
      references DIRECTIONS (DR_ID);

alter table PRESTATIONS
   add constraint FK_PRESTATI_PRESTATIO_FOURNISS foreign key (FOURN_ID)
      references FOURNISSEURS (FOURN_ID);


/*==============================================================*/
/* Sequences & triggers  (pour auto increment)                  */
/*==============================================================*/


/* Sequence & trigger pour EFFECTIF                              */
/*==============================================================*/

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


/* Sequence & trigger pour MATERIEL                               */
/*==============================================================*/

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


/* Sequence & trigger pour PRESTATIONS                           */
/*==============================================================*/

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


/* Sequence & trigger pour DIRECTIONS                            */
/*==============================================================*/

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


/* Sequence & trigger pour DEPARTEMENTS                          */
/*==============================================================*/

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


/* Sequence & trigger pour TYPE_BUREAU                            */
/*==============================================================*/

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

/* Sequence & trigger pour FOURNISSEURS                           */
/*==============================================================*/

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

/* Sequence & trigger pour ETAT_MATERIEL                         */
/*==============================================================*/

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

/* Sequence & trigger pour LOGICIELS                              */
/*==============================================================*/

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

/* Sequence & trigger pour CONTRAT_MAINTENANCE                    */
/*==============================================================*/

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

/* Sequence & trigger pour GPI_USERS                             */
/*==============================================================*/


CREATE SEQUENCE SQGPI_USERS
	  START WITH 10
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXGPI_USERS
              before insert on GPI_USERS
              for each row
              begin
                  if :new.USER_ID is null then
                      SELECT SQGPI_USERS.NEXTVAL
						INTO :New.USER_ID from sys.dual;
                 end if;
              end;


/*==============================================================*/
/* Types & Fonctions                                            */
/*==============================================================*/

/*==============================================================*/
/* Type T_EFFECTIF_ROW                                          */
/*==============================================================*/
create or replace TYPE t_effectif_row AS OBJECT(
    EFF_ID Number,
       DR_ID Number,
       DEP_ID Number,
       TYPE_BUR_ID Number,
       NOM_PRENOM VARCHAR2(256),
       USER_MAIL VARCHAR2(256),
       TYPE_JOB VARCHAR2(256),
       NUMERO_BUREAU VARCHAR2(256),
       MOBILE VARCHAR2(256)
);

/*==============================================================*/
/* Type T_EFFECTIF_TABLE                                        */
/*==============================================================*/
create or replace TYPE t_effectif_table AS TABLE OF t_effectif_row;

/*==============================================================*/
/* Type T_MATERIEL_ROW                                          */
/*==============================================================*/
create or replace TYPE t_materiel_row AS OBJECT(

    MAT_ID Number,
       FOURN_ID Number,
       ETAT_MAT_ID Number,
       EFF_ID Number,
       DR_ID Number,
       DEP_ID Number,
       TYPE_BUR_ID Number,
       TYPE_MATERIEL VARCHAR2(256),
       MARQUE VARCHAR2(256),
       MODEL_REFERENCE VARCHAR2(256),
       NUM_INVENTAIRE VARCHAR2(256),
       REF_TAG VARCHAR2(256),
       MAT_NUM_BUR VARCHAR2(256),
       DATE_ACHAT_MAT DATE,
       COUT_MATERIEL_DA NUMBER(8,2),
       OBSERVATIONS VARCHAR2(256)
)
/*==============================================================*/
/* Type T_MATERIEL_TABLE                                        */
/*==============================================================*/
create or replace TYPE t_materiel_table AS TABLE OF t_materiel_row;

/*==============================================================*/
/* Type T_PRESTATIONS_ROW                                       */
/*==============================================================*/
create or replace TYPE t_prestations_row AS OBJECT(

    PRES_ID Number,
       FOURN_ID Number,
       DR_ID Number,
       PRESTATION VARCHAR2(256),
       DATE_PRESTATION DATE,
       COUT_PRESTATION NUMBER(8,2)   
);

/*==============================================================*/
/* Type T_PRESTATIONS_TABLE                                     */
/*==============================================================*/
create or replace TYPE t_prestations_table AS TABLE OF t_prestations_row;

/*==============================================================*/
/* Type T_DIR_ROW                                       */
/*==============================================================*/
create or replace TYPE t_dir_row AS OBJECT(
       DR_ID Number, 
       NOM_DIRECTION VARCHAR2(256),
       CODE_DR VARCHAR2(256)
);

/*==============================================================*/
/* Type T_DIR_TABLE                                     */
/*==============================================================*/
create or replace TYPE t_dir_table AS TABLE OF t_dir_row;

/*==============================================================*/
/* Type T_DEP_ROW                                       */
/*==============================================================*/
create or replace TYPE t_dep_row AS OBJECT(
       DEP_ID Number, 
       DEPARTEMENT VARCHAR2(256),
       NOM_DEPARTEMENT VARCHAR2(256)
);

/*==============================================================*/
/* Type T_DEP_TABLE                                     */
/*==============================================================*/
create or replace TYPE t_dep_table AS TABLE OF t_dep_row;

/*==============================================================*/
/* FUNCTION getEffectifData                                     */
/*==============================================================*/

create or replace FUNCTION getEffectifData(p_current_user in varchar2) RETURN t_effectif_table
AS
    v_result t_effectif_table;
    v_dr number;
    v_current_user varchar2(256):=trim(p_current_user);
    
BEGIN
   begin
  
    select dr_id into v_dr from gpi_users where users_gpi=v_current_user;
    dbms_output.put_line('dir id=,' ||v_dr);

    exception when no_data_found then
    Rollback;
   end;
    v_result := t_effectif_table();
    if(v_dr=1) then
      for rec in (SELECT EFF_ID,
       DR_ID,
       DEP_ID,
       TYPE_BUR_ID,
       NOM_PRENOM,
       USER_MAIL,
       TYPE_JOB,
       NUMERO_BUREAU,
       MOBILE
      FROM EFFECTIF) loop
         v_result.extend;
         v_result(v_result.count):=t_effectif_row(rec.EFF_ID,rec.DR_ID,rec.DEP_ID,rec.TYPE_BUR_ID,rec.NOM_PRENOM,rec.USER_MAIL,rec.TYPE_JOB,rec.NUMERO_BUREAU,rec.MOBILE);        
    end loop ;
    RETURN v_result;
    end if;
    
    if(v_dr !=1) then
     for rec in (SELECT EFF_ID,
       DR_ID,
       DEP_ID,
       TYPE_BUR_ID,
       NOM_PRENOM,
       USER_MAIL,
       TYPE_JOB,
       NUMERO_BUREAU,
       MOBILE
      FROM EFFECTIF where dr_id=(select dr_id from gpi_users where users_gpi=v_current_user) ) loop
         v_result.extend;
         v_result(v_result.count):=t_effectif_row(rec.EFF_ID,rec.DR_ID,rec.DEP_ID,rec.TYPE_BUR_ID,rec.NOM_PRENOM,rec.USER_MAIL,rec.TYPE_JOB,rec.NUMERO_BUREAU,rec.MOBILE);        
    end loop ;
    RETURN v_result;
    end if;
END getEffectifData;

/*==============================================================*/
/* FUNCTION getMaterielData                                     */
/*==============================================================*/

create or replace FUNCTION getMaterielData(p_current_user in varchar2) RETURN t_materiel_table
AS
    v_result t_materiel_table;
    v_dr number;
    v_current_user varchar2(256):=trim(p_current_user);
    
BEGIN
   begin
  
    select dr_id into v_dr from gpi_users where users_gpi=v_current_user;
    dbms_output.put_line('dir id=,' ||v_dr);

    exception when no_data_found then
    Rollback;
   end;
    v_result := t_materiel_table();
    if(v_dr=1) then
      for rec in (SELECT MAT_ID,
       FOURN_ID,
       ETAT_MAT_ID,
       EFF_ID,
       DR_ID,
       DEP_ID,
       TYPE_BUR_ID,
       TYPE_MATERIEL,
       MARQUE,
       MODEL_REFERENCE,
       NUM_INVENTAIRE,
       REF_TAG,
       MAT_NUM_BUR,
       DATE_ACHAT_MAT,
       COUT_MATERIEL_DA,
       OBSERVATIONS
      FROM MATERIEL) loop
         v_result.extend;
         v_result(v_result.count):=t_materiel_row(rec.MAT_ID,rec.FOURN_ID,rec.ETAT_MAT_ID,rec.EFF_ID,rec.DR_ID,rec.DEP_ID,rec.TYPE_BUR_ID,rec.TYPE_MATERIEL,rec.MARQUE,rec.MODEL_REFERENCE,rec.NUM_INVENTAIRE,rec.REF_TAG,rec.MAT_NUM_BUR,rec.DATE_ACHAT_MAT,rec.COUT_MATERIEL_DA,rec.OBSERVATIONS);        
    end loop ;
    RETURN v_result;
    end if;
    
    if(v_dr !=1) then
     for rec in (SELECT MAT_ID,
       FOURN_ID,
       ETAT_MAT_ID,
       EFF_ID,
       DR_ID,
       DEP_ID,
       TYPE_BUR_ID,
       TYPE_MATERIEL,
       MARQUE,
       MODEL_REFERENCE,
       NUM_INVENTAIRE,
       REF_TAG,
       MAT_NUM_BUR,
       DATE_ACHAT_MAT,
       COUT_MATERIEL_DA,
       OBSERVATIONS
      FROM MATERIEL where dr_id=(select dr_id from gpi_users where users_gpi=v_current_user) ) loop
         v_result.extend;
         v_result(v_result.count):=t_materiel_row(rec.MAT_ID,rec.FOURN_ID,rec.ETAT_MAT_ID,rec.EFF_ID,rec.DR_ID,rec.DEP_ID,rec.TYPE_BUR_ID,rec.TYPE_MATERIEL,rec.MARQUE,rec.MODEL_REFERENCE,rec.NUM_INVENTAIRE,rec.REF_TAG,rec.MAT_NUM_BUR,rec.DATE_ACHAT_MAT,rec.COUT_MATERIEL_DA,rec.OBSERVATIONS);        
    end loop ;
    RETURN v_result;
    end if;
END getMaterielData;


/*==============================================================*/
/* FUNCTION getPrestationsData                                  */
/*==============================================================*/

create or replace FUNCTION getPrestationsData(p_current_user in varchar2) RETURN t_prestations_table
AS
    v_result t_prestations_table;
    v_dr number;
    v_current_user varchar2(256):=trim(p_current_user);
    
BEGIN
   begin
  
    select dr_id into v_dr from gpi_users where users_gpi=v_current_user;
    dbms_output.put_line('dir id=,' ||v_dr);

    exception when no_data_found then
    Rollback;
   end;
    v_result := t_prestations_table();
    if(v_dr=1) then
      for rec in (SELECT PRES_ID,
       FOURN_ID,
       DR_ID,
       PRESTATION,
       DATE_PRESTATION,
       COUT_PRESTATION
      FROM PRESTATIONS) loop
         v_result.extend;
         v_result(v_result.count):=t_prestations_row(rec.PRES_ID,rec.FOURN_ID,rec.DR_ID,rec.PRESTATION,rec.DATE_PRESTATION,rec.COUT_PRESTATION );        
    end loop ;
    RETURN v_result;
    end if;
    
    if(v_dr !=1) then
     for rec in (SELECT PRES_ID,
       FOURN_ID,
       DR_ID,
       PRESTATION,
       DATE_PRESTATION,
       COUT_PRESTATION
      FROM PRESTATIONS where dr_id=(select dr_id from gpi_users where users_gpi=v_current_user) ) loop
         v_result.extend;
         v_result(v_result.count):=t_prestations_row(rec.PRES_ID,rec.FOURN_ID,rec.DR_ID,rec.PRESTATION,rec.DATE_PRESTATION,rec.COUT_PRESTATION );        
    end loop ;
    RETURN v_result;
    end if;
END getPrestationsData;


/*==============================================================*/
/* FUNCTION getDirData                                          */
/*==============================================================*/

create or replace FUNCTION getDirData(p_current_user in varchar2) RETURN t_dir_table
AS
    v_result t_dir_table;
    v_dr number;
    v_current_user varchar2(256):=trim(p_current_user);
    
BEGIN
   begin
  
    select dr_id into v_dr from gpi_users where users_gpi=v_current_user;
    dbms_output.put_line('dir id=,' ||v_dr);

    exception when no_data_found then
    Rollback;
   end;
    v_result := t_dir_table();
    if(v_dr=1) then
      for rec in (SELECT 
        DR_ID,
       NOM_DIRECTION,
       CODE_DR
       
      FROM DIRECTIONS) loop
         v_result.extend;
         v_result(v_result.count):=t_dir_row(rec.DR_ID,rec.NOM_DIRECTION,rec.CODE_DR);        
    end loop ;
    RETURN v_result;
    end if;
    
    if(v_dr !=1) then
     for rec in (SELECT 
    
       DR_ID,
       NOM_DIRECTION,
       CODE_DR
       
      FROM DIRECTIONS where dr_id=(select dr_id from gpi_users where users_gpi=v_current_user) ) loop
         v_result.extend;
         v_result(v_result.count):=t_dir_row(rec.DR_ID,rec.NOM_DIRECTION,rec.CODE_DR);        
    end loop ;
    RETURN v_result;
    end if;
END getDirData;

/*==============================================================*/
/* FUNCTION getDepData                                          */
/*==============================================================*/

create or replace FUNCTION getDepData(p_current_user in varchar2) RETURN t_dep_table
AS
    v_result t_dep_table;
    v_dr number;
    v_current_user varchar2(256):=trim(p_current_user);
    
BEGIN
   begin
  
    select dr_id into v_dr from gpi_users where users_gpi=v_current_user;
    dbms_output.put_line('dir id=,' ||v_dr);

    exception when no_data_found then
    Rollback;
   end;
    v_result := t_dep_table();
    if(v_dr=1) then
      for rec in (SELECT 
        DEP_ID,
       DEPARTEMENT,
       NOM_DEPARTEMENT
       
      FROM DEPARTEMENTS) loop
         v_result.extend;
         v_result(v_result.count):=t_dep_row(rec.DEP_ID,rec.DEPARTEMENT,rec.NOM_DEPARTEMENT);        
    end loop ;
    RETURN v_result;
    end if;
    
    if(v_dr !=1) then
     for rec in (SELECT 
    
       DEP_ID,
       DEPARTEMENT,
       NOM_DEPARTEMENT
       
      FROM DEPARTEMENTS where dr_id=(select dr_id from gpi_users where users_gpi=v_current_user) ) loop
         v_result.extend;
         v_result(v_result.count):=t_dep_row(rec.DEP_ID,rec.DEPARTEMENT,rec.NOM_DEPARTEMENT);        
    end loop ;
    RETURN v_result;
    end if;
END getDepData;


/*==============================================================*/
/* Creer table DEPART                                          */
/*==============================================================*/

create table DEPART 
(
   DEPART_ID            NUMBER               not null,
   MATRICULE            VARCHAR2(50),
   MOBILE               VARCHAR2(256),
   NUMSECUSOC           VARCHAR2(100),
   DATERECRU            DATE,
   NATCONTRAT           VARCHAR2(50),
   NOM                  VARCHAR2(100),
   PRENOM               VARCHAR2(100),
   TYPE_JOB             VARCHAR2(256),
   DEP_ID               NUMBER               not null,
   GROUPSOC             VARCHAR2(50),
   DR_ID                NUMBER               not null, 
   USER_MAIL            VARCHAR2(256),
   MOTIFDEPART          VARCHAR2(256),
   DATEDEPART           DATE,

   constraint PK_DEPART primary key (DEPART_ID)
);

/*==============================================================*/
/* Sequences & triggers  (pour auto increment)                  */
/*==============================================================*/


/* Sequence & trigger pour DEPART                              */
/*==============================================================*/

CREATE SEQUENCE SQDEPART
	  START WITH 10
	  MAXVALUE 99999
	   MINVALUE 1
	  NOCYCLE
	  CACHE 20
	  NOORDER;

create or replace trigger TRINDEXDEPART
              before insert on DEPART
              for each row
              begin
                  if :new.DEPART_ID is null then
                      SELECT SQDEPART.NEXTVAL
						INTO :New.DEPART_ID from sys.dual;
                 end if;
              end;


/*==============================================================*/
/* PROCEDURE GESTDEPART                                         */
/*==============================================================*/

create or replace PROCEDURE GESTDEPART IS
    V_MATRICULE EFFECTIF.MATRICULE%TYPE;
BEGIN
    -- Selection automatique de l'employe demissionnaire
    SELECT MATRICULE
    INTO V_MATRICULE
    FROM EFFECTIF
    WHERE MATRICULE = (SELECT MAX(MATRICULE) FROM EFFECTIF WHERE STATUT_EMP='i');

    -- Transfert de l'employe selectionne vers la table DEPART
    INSERT INTO DEPART (MATRICULE, MOBILE, NUMSECUSOC, DATERECRU, NATCONTRAT, NOM, PRENOM, TYPE_JOB, DEP_ID, GROUPSOC, DR_ID, USER_MAIL, DATEDEPART)
    SELECT MATRICULE, MOBILE, NUMSECUSOC, DATERECRU, NATCONTRAT, NOM, PRENOM, TYPE_JOB, DEP_ID, GROUPSOC, DR_ID, USER_MAIL, SYSDATE
    FROM EFFECTIF
    WHERE MATRICULE = V_MATRICULE;
    
    -- Suppression de l'employe transfere de la table EFFECTIF
    DELETE FROM EFFECTIF WHERE MATRICULE = V_MATRICULE AND STATUT_EMP='i';
    
    EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Aucun employe demissionnaire trouve.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Une erreur est survenue lors du transfert du personnel demissionnaire.');
END;



