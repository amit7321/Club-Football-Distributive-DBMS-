Set lin 250 ;
clear screen ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

drop table Player ;

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
values (1,'Mesut ozil','Midfielder','30','10','Arsenal FC','Premiere League','Germany');

insert into Player
values (2,'Pierre-Emerick Aubameyang','Forward','30','14','Arsenal FC','Premiere League','Gabon');

insert into Player 
values (3,'Nicolas Pepe','Midfielder','24','19','Arsenal FC','Premiere League','Ivory Coast');

insert into Player 
values (4,'Dani Ceballos','Midfielder','23','8','Arsenal FC','Premiere League','Spain');

insert into Player
values (5,'Alexandre Lacazette','Forward','28','9','Arsenal FC','Premiere League','France');

insert into Player
values (6,'Kieran Tierney','Defender','22','3','Arsenal FC','Premiere League','Scotish');

insert into Player
values (7,'Bernd Leno','Goalkeeper','27','10','Arsenal FC','Premiere League','Germany');

insert into Player
values (8,'Sergio Aguero','Forward','31','10','Manchester City','Premiere League','Argentina');

insert into Player
values (9, 'Raheem Sterling','Winger','24','7','Manchester City','Premiere League','Germany');

commit ;



select * from Player ;

--@"D:\Paralaka\4.1\DDB Lab\Project\Tables\team_site2.sql";
--@"D:\Paralaka\4.1\DDB Lab\Project\Tables\manager_site2.sql" ;
--@"D:\Paralaka\4.1\DDB Lab\Project\Tables\trophy_site2.sql" ;

