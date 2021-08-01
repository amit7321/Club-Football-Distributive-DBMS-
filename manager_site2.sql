Set lin 200 ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

drop table manager ;

CREATE TABLE manager(
Manager_ID number,
Manager_Name varchar(25) NOT NULL,
Age number NOT NULL,
Nationality VARCHAR(20) NOT NULL,
Current_Team VARCHAR (20)NOT NULL,
Major_Titles number NOT NULL, 
primary key(Manager_ID)
);

INSERT INTO manager
VALUES(1, 'Mikel Arteta',47,'Spanish','Arsenal',3);

INSERT INTO manager
VALUES(2, 'Pep Guardiola',48,'Spanish','Manchester City',27);

INSERT INTO manager
VALUES(3, 'Ole Gunnar Solskjaer',46,'Norwegian','Manchester United',0);

INSERT INTO manager
VALUES(4, 'Thomas Tuchel',46,'English','Chelsea',0);

INSERT INTO manager
VALUES(5, 'Jurgen Klopp',52,'German','Liverpool',7);

select * from manager ;

commit ;

--@"D:\Paralaka\4.1\DDB Lab\Project\Tables\team_site2.sql";