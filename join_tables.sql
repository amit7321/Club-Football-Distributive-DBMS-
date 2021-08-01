clear screen ;
Set lin 250 ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

DECLARE

begin
    select * from Player 
    union 
    select * from Player@site2;
end;
/