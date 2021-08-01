clear screen ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

create or replace trigger insertPlayerTableSite2 
after insert on Player

DECLARE 

begin
    DBMS_OUTPUT.PUT_LINE('Data is successfully inserted in the Player table') ;
end;
/ 


DECLARE
    insertPlayerID number ;
    insertPlayerName varchar2(25) ;
    insertPosition varchar2(10) ;
    insertAge number ;
    insertJerseyNo number ;
    insertTeam varchar2(20) ;
    insertLeague varchar2(15) ;
    insertNationalTeam varchar2(10) ;

begin
    insertPlayerID := &insertPlayerID ;
    insertPlayerName := &insertPlayerName ;
    insertPosition := &insertPosition ;
    insertAge := &insertAge ;
    insertJerseyNo := &insertJerseyNo ;
    insertTeam := &insertTeam ;
    insertLeague := &insertLeague ;
    insertNationalTeam := &insertNationalTeam ;

    insert into Player
    values (insertPlayerID, insertPlayerName, insertPosition, insertAge, insertJerseyNo, insertTeam, insertLeague, insertNationalTeam) ; 


end;
/