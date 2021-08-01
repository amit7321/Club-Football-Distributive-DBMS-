Set lin 200 ;
clear screen ;
SET SERVEROUTPUT ON ;
SET VERIFY OFF ;

create or replace package managerPackage as 

    procedure managerQuery (querySelectedManager in number, managerSelected in manager.Manager_Name%TYPE) ;

end managerPackage ;
/

create or replace package body managerPackage as 

    procedure managerQuery (querySelectedManager in number, managerSelected in manager.Manager_Name%TYPE) is

    age manager.Age%TYPE ;
    nationality manager.Nationality%TYPE ;
    currentTeam manager.Current_Team%TYPE ;
    majorTitles manager.Major_Titles%TYPE ;

begin
    if(querySelectedManager = 1) then 
        for r in (select * from manager where Manager_Name = managerSelected) loop
          age := r.age ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Manager name : ' || managerSelected || chr(13)||chr(10) || 'Manager age: ' || age) ;
    end if ;

    if(querySelectedManager = 2) then 
        for r in (select * from manager where Manager_Name = managerSelected) loop
          nationality := r.Nationality ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Manager name : ' || managerSelected || chr(13)||chr(10) || 'Manager nationality: ' || nationality) ;
    end if ;

    if(querySelectedManager = 3) then 
        for r in (select * from manager where  Manager_Name = managerSelected) loop
          currentTeam := r.Current_Team ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Manager name : ' || managerSelected || chr(13)||chr(10) || 'Manager Current Team: ' || currentTeam) ;
    end if ;

    if(querySelectedManager = 4) then 
        for r in (select * from manager where Manager_Name = managerSelected) loop
          majorTitles := r.Major_Titles ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Manager name : ' || managerSelected|| chr(13)||chr(10) || 'Manager Major Titles: ' || majorTitles) ;
    end if ;

    if(querySelectedManager = 5) then 
        for r in (select * from manager where Manager_Name = managerSelected) loop
          age := r.Age ; 
          nationality := r.Nationality ; 
          currentTeam := r.Current_Team ;
          majorTitles := r.Major_Titles ;
        end loop ; 
        DBMS_OUTPUT.PUT_LINE('Manager name : ' || managerSelected || chr(13)||chr(10) || 'Manager Age: ' || age || chr(13)||chr(10) || 
         'Manager nationality: '  || nationality  || chr(13)||chr(10) || 'Manager Current Team: ' || currentTeam || chr(13)||chr(10) || 'Manager Major Titles: ' || majorTitles ) ;
    end if ;

end managerQuery ;
end managerPackage ;
/


accept managerMenuSelect number prompt "Query about managers - 1.Age  2.Nationality  3.Current Team 4.Major Tiles 5.All. Enter your choice= " ;
accept managerNameInput char prompt "Enter the name of the manager : " ;

DECLARE

    managerMenuNumber number ;
    managerName manager.Manager_Name%TYPE ;

    invalidMenuChoice exception ;

begin
    
    managerMenuNumber := &managerMenuSelect ;
    if((managerMenuNumber < 0) or (managerMenuNumber > 5)) then 
        raise invalidMenuChoice ;
    end if ;
    managerName := &managerNameInput ;
    managerPackage.managerQuery(managerMenuNumber, managerName) ;

    exception
        when no_data_found then
            dbms_output.put_line('Sorry !!!... There is no such data');
        when invalidMenuChoice then
            dbms_output.put_line('Invalid Menu choice. You have to chose from option 1-5') ;

end;
/