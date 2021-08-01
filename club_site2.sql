Set lin 200 ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

drop table Team ;

create table Team (
Team_ID number,
Team_Name varchar(25),
Year number,
League varchar(20) not null,
Current_Manager varchar(20),
primary key(Team_ID)
);



insert into Team
values (1,'Arsenal FC', 1886, 'Premiere League','Mikel Arteta');

insert into Team 
values (2, 'Manchester City', 1880, 'Premiere League','Pep Guardiola');

insert into Team
values (3, 'Chelsea',1905, 'Premiere League','Frank Lampard');

insert into Team 
values (4, 'Manchester United', 1878, 'Premiere League','Ole Gunnar Solskjaer');

insert into Team
values (5, 'Liverpool',1892, 'Premiere League','Jurgen Klopp');

select * from Team;

commit ;

--@"D:\Paralaka\4.1\DDB Lab\Project\Tables\trophy_site2.sql" ;