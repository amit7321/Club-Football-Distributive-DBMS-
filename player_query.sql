clear screen ;

SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

create or replace package playerPackage as 

    procedure playerQuery (querySelectedPlayer in number, playerSelected in Player.Player_Name%TYPE) ;

end playerPackage ;
/

create or replace package body playerPackage as 

procedure playerQuery (querySelectedPlayer in number, playerSelected in Player.Player_Name%TYPE) is 

position Player.Position%TYPE ;
age Player.Age%TYPE ;
team Player.Team%TYPE ;
league Player.League%TYPE ;
nationalTeam  Player.National_Team%TYPE ;
jersey Player.Jersey_No%TYPE ;

begin
    if(querySelectedPlayer = 1) then 
        for r in (select * from Player where Player_Name = playerSelected) loop
          position := r.Position ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Player name : ' || playerSelected || chr(13)||chr(10) || 'Players Position: ' || position) ;
    end if ;

    if(querySelectedPlayer = 2) then 
        for r in (select * from Player where Player_Name = playerSelected) loop
          age := r.Age ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Player name : ' || playerSelected || chr(13)||chr(10) || 'Players Age: ' || age) ;
    end if ;

    if(querySelectedPlayer = 3) then 
        for r in (select * from Player where Player_Name = playerSelected) loop
          team := r.Team ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Player name : ' || playerSelected || chr(13)||chr(10) || 'Players Current Team: ' || team) ;
    end if ;

    if(querySelectedPlayer = 4) then 
        for r in (select * from Player where Player_Name = playerSelected) loop
          league := r.League ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Player name : ' || playerSelected || chr(13)||chr(10) || 'Players Current League: ' || league) ;
    end if ;

    if(querySelectedPlayer = 5) then 
        for r in (select * from Player where Player_Name = playerSelected) loop
          nationalTeam := r.National_Team ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Player name : ' || playerSelected || chr(13)||chr(10) || 'Players Current National Team: ' || nationalTeam) ;
    end if ;
    
    if(querySelectedPlayer = 6) then 
        for r in (select * from Player where Player_Name = playerSelected) loop
          position := r.Position ;
          age := r.Age ;
          jersey := r.Jersey_No; 
          team := r.Team ; 
          league := r.League ;
          nationalTeam := r.National_Team ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Player name : ' || playerSelected ||  chr(13)||chr(10) ||'Player Position: '|| position ||  chr(13)||chr(10) || 'Players Age: ' || age ||  
                            chr(13)||chr(10) || 'Players Current Team: ' || team || chr(13)||chr(10) || 'Jersey No: ' || jersey ||  chr(13)||chr(10) ||
                            'Players Current League: ' || league || chr(13)||chr(10) || 'Players Current National Team: ' || nationalTeam ) ;
    end if ;

end playerQuery ;
end playerPackage ;
/



accept playerMenuSelect number prompt "Player Query- 1.Player 2.Age 3.Current Team 4.League 5.National Team 6.All .Enter your choice=  " ;

DECLARE

    playerMenu number ;
    playerName Player.Player_Name%TYPE ;

    invalidMenuChoice exception ;

begin
    playerMenu := &playerMenuSelect ;

    if((playerMenu < 0) or (playerMenu > 6)) then 
        raise invalidMenuChoice ;
    end if ;

    playerName := &playerName ;
    playerPackage.playerQuery(playerMenu, playerName) ;
        

exception
  when no_data_found then
    dbms_output.put_line('Sorry !!!... There is no such data');
  when invalidMenuChoice then
    dbms_output.put_line('Invalid Menu choice. You have to chose from option 1-5') ;
   
end;
/