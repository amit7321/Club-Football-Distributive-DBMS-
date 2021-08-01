clear screen ;
Set lin 250 ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

--drop table Player ;

create table Player (
Player_ID number,
Player_Name varchar2(25),
Position varchar2(10),
Age number,
Jersey_No number,
Team varchar2(20),
League varchar2(15),
National_Team varchar2(10),
primary key (Player_ID)
);

insert into Player
values (10,'Thomas Partey','Midfielder','27','18','Arsenal FC','Premiere League','Ghana');

insert into Player
values (11,'Emile Smith Rowe','Midfielder','20','32','Arsenal FC','Premiere League','England');

insert into Player
values (12,'Thomas Partey','Midfielder','27','18','Arsenal FC','Premiere League','Ghana');

insert into Player
values (1,'Granit Xhaka','Midfielder','28','34','Arsenal FC','Premiere League','Switzerland');
