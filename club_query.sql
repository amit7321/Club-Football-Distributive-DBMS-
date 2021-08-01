clear screen ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

create or replace package clubPackage as 

    procedure clubQuery (querySelectedClub in number, clubSelected in Team.Team_Name%TYPE) ;

end clubPackage ;
/

create or replace package body clubPackage as 

    procedure clubQuery (querySelectedClub in number, clubSelected in Team.Team_Name%TYPE) is

    year Team.Year%TYPE ;
    leagueTeam Team.League%TYPE ;
    currentManager Team.Current_Manager%TYPE ;

    playerName Player.Player_Name%TYPE ;
    positionPlayer Player.Position%TYPE ;
    agePlayer Player.Age%TYPE ;
    leaguePlayer Player.League%TYPE ;
    jerseyPlayer Player.Jersey_No%TYPE ;
    nationalTeamPlayer  Player.National_Team%TYPE ;  
  

begin
    if(querySelectedClub = 1) then 
        for r in (select * from Team where Team_Name = clubSelected) loop
          year := r.Year ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Team name : ' || clubSelected || chr(13)||chr(10) || 'Club founded in: ' || year) ;
    end if ;

    if(querySelectedClub = 2) then 
        for r in (select * from Team where Team_Name = clubSelected) loop
          leagueTeam := r.League ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Team name : ' || clubSelected || chr(13)||chr(10) || 'League: ' || leagueTeam) ;
    end if ;

    if(querySelectedClub = 3) then 
        for r in (select * from Team where Team_Name = clubSelected) loop
          currentManager := r.Current_Manager ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Team name : ' || clubSelected || chr(13)||chr(10) || 'Team current manager: ' || currentManager) ;
    end if ;

    if(querySelectedClub = 4) then 
        for r in (select * from Team where  Team_Name = clubSelected) loop
          year := r.Year ;
          leagueTeam := r.League ;
          currentManager := r.Current_Manager ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Club name: ' || clubSelected || chr(13)||chr(10) || 'Club founded in: ' || year || chr(13)||chr(10) || 'League: ' || leagueTeam || chr(13)||chr(10) ||
         'Team current manager: ' || currentManager) ;
                            
    end if ;

    if(querySelectedClub = 5) then 
        for r in (select Player_Name, Position, Age, National_Team, Jersey_No from Player P inner join Team T on P.Team = T.Team_Name where T.Team_Name = clubSelected) loop
          playerName := r.Player_Name ;
          positionPlayer := r.Position ;
          agePlayer := r.Age ; 
          jerseyPlayer := r.Jersey_No ; 
          nationalTeamPlayer := r.National_Team ;
          --leaguePlayer := r.League ;
        
          DBMS_OUTPUT.PUT_LINE('Club name : ' || clubSelected || chr(13)||chr(10) ||'Player Name: ' || playerName || chr(13)||chr(10)  || 'Player Position: '|| positionPlayer || 
                             chr(13)||chr(10) || 'Players Age: ' || agePlayer || chr(13)||chr(10) || 'Jersey No: ' || jerseyPlayer ||  chr(13)||chr(10) 
                             || 'Players Current League: ' || leagueTeam || chr(13)||chr(10) || 'Players National Team: ' || nationalTeamPlayer || chr(13)||chr(10)) ;
        end loop ; 
    end if ;    


end clubQuery ;
end clubPackage ;
/


accept clubMenuSelect number prompt "Query about the club- 1.Club Name 2.League 3.Current_Manager 4.All . Enter your choice= " ;
accept clubNameInput char prompt "Enter the name of the Club : " ;

DECLARE

    clubMenuInput number ;
    clubName Team.Team_Name%TYPE ;

    invalidMenuChoice exception ;

begin
    
    clubMenuInput := &clubMenuSelect ;

    if((clubMenuInput < 0) or (clubMenuInput > 5)) then 
        raise invalidMenuChoice ;
    end if ;

    clubName := &clubNameInput ;
    clubPackage.clubQuery(clubMenuInput, clubName) ;

    exception
        when no_data_found then
            dbms_output.put_line('Sorry !!!... There is no such data');
        when invalidMenuChoice then
            dbms_output.put_line('Invalid Menu choice. You have to chose from option 1-5') ;

end;
/