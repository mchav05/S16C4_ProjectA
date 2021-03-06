-- Generated by Oracle SQL Developer Data Modeler 4.1.3.901
--   at:        2016-03-27 21:04:44 CDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g

DROP TABLE A_Department CASCADE CONSTRAINTS ;

DROP TABLE A_Employees_Projects CASCADE CONSTRAINTS ;

DROP TABLE A_Parents_Children CASCADE CONSTRAINTS ;

DROP TABLE A_Person CASCADE CONSTRAINTS ;

DROP TABLE A_Project CASCADE CONSTRAINTS ;

CREATE TABLE A_Department
  (
    dept_no   INTEGER NOT NULL ,
    dept_name VARCHAR2 (20) NOT NULL
  ) ;
ALTER TABLE A_Department ADD CONSTRAINT A_Department_PK PRIMARY KEY ( dept_no ) ;


CREATE TABLE A_Employees_Projects
  (
    employees_projects_id INTEGER NOT NULL ,
    A_Person_person_id    INTEGER ,
    A_Project_project_no  INTEGER
  ) ;
ALTER TABLE A_Employees_Projects ADD CONSTRAINT A_Employees_Projects_PK PRIMARY KEY ( employees_projects_id ) ;


CREATE TABLE A_Parents_Children
  (
    parents_children_id INTEGER NOT NULL ,
    A_Person_person_id  INTEGER ,
    A_Person_person_id2 INTEGER
  ) ;
ALTER TABLE A_Parents_Children ADD CONSTRAINT A_Parents_Children_PK PRIMARY KEY ( parents_children_id ) ;


CREATE TABLE A_Person
  (
    person_id            INTEGER NOT NULL ,
    first_name           VARCHAR2 (255) NOT NULL ,
    last_name            VARCHAR2 (255) NOT NULL ,
    home_address         VARCHAR2 (255) ,
    zipcode              INTEGER ,
    home_phone           INTEGER ,
    us_citizen           CHAR (1) NOT NULL ,
    is_fired             CHAR (1) ,
    salary               INTEGER ,
    employee_id          INTEGER ,
    salary_exception     CHAR (1) ,
    bonus                INTEGER ,
    type                 VARCHAR2 (255) ,
    A_Person_person_id   INTEGER ,
    A_Person_person_id2  INTEGER ,
    A_Department_dept_no INTEGER
  ) ;
CREATE UNIQUE INDEX A_Person__IDX ON A_Person
  (
    A_Person_person_id2 ASC
  )
  ;
ALTER TABLE A_Person ADD CONSTRAINT A_Person_PK PRIMARY KEY ( person_id ) ;


CREATE TABLE A_Project
  (
    project_no           INTEGER NOT NULL ,
    project_title        VARCHAR2 (20) NOT NULL ,
    project_active       CHAR (1) ,
    end_date             DATE ,
    est_person_hours     INTEGER ,
    type                 VARCHAR2 (255) ,
    A_Person_person_id   INTEGER ,
    A_Project_project_no INTEGER ,
    A_Department_dept_no INTEGER
  ) ;
ALTER TABLE A_Project ADD CONSTRAINT A_Project_PK PRIMARY KEY ( project_no ) ;


ALTER TABLE A_Employees_Projects ADD CONSTRAINT A_Emps_Projs_A_Person_FK FOREIGN KEY ( A_Person_person_id ) REFERENCES A_Person ( person_id ) ;

ALTER TABLE A_Employees_Projects ADD CONSTRAINT A_Emps_Projs_A_Project_FK FOREIGN KEY ( A_Project_project_no ) REFERENCES A_Project ( project_no ) ;

ALTER TABLE A_Parents_Children ADD CONSTRAINT A_Par_Chi_A_Person_FK FOREIGN KEY ( A_Person_person_id ) REFERENCES A_Person ( person_id ) ;

ALTER TABLE A_Parents_Children ADD CONSTRAINT A_Par_Chi_A_Person_FKv1 FOREIGN KEY ( A_Person_person_id2 ) REFERENCES A_Person ( person_id ) ;

ALTER TABLE A_Person ADD CONSTRAINT A_Person_A_Department_FK FOREIGN KEY ( A_Department_dept_no ) REFERENCES A_Department ( dept_no ) ;

ALTER TABLE A_Person ADD CONSTRAINT A_Person_A_Person_FK FOREIGN KEY ( A_Person_person_id ) REFERENCES A_Person ( person_id ) ;

ALTER TABLE A_Person ADD CONSTRAINT A_Person_A_Person_FKv2 FOREIGN KEY ( A_Person_person_id2 ) REFERENCES A_Person ( person_id ) ;

ALTER TABLE A_Project ADD CONSTRAINT A_Project_A_Department_FK FOREIGN KEY ( A_Department_dept_no ) REFERENCES A_Department ( dept_no ) ;

ALTER TABLE A_Project ADD CONSTRAINT A_Project_A_Person_FK FOREIGN KEY ( A_Person_person_id ) REFERENCES A_Person ( person_id ) ;

ALTER TABLE A_Project ADD CONSTRAINT A_Project_A_Project_FK FOREIGN KEY ( A_Project_project_no ) REFERENCES A_Project ( project_no ) ;


-- Oracle SQL Developer Data Modeler Summary Report:
--
-- CREATE TABLE                             5
-- CREATE INDEX                             1
-- ALTER TABLE                             15
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
--
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
--
-- REDACTION POLICY                         0
--
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
--
-- ERRORS                                   0
-- WARNINGS                                 0
