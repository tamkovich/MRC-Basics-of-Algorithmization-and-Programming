program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var v1 , v2 , v3 : integer ;
    v_mid : real ;
begin
  { TODO -oUser -cConsole Main : Insert code here }

  writeln('Enter First speed : ');
  readln(v1);
  if v1<=0 then begin
    writeln('ERROR');
    exit;
                end;
  writeln('Enter Second speed : ');
  readln(v2);
  if v2<=0 then begin
    writeln('ERROR');
    exit;
                end;
  writeln('Enter Third speed : ');
  readln(v3);
  if v3<=0 then begin
    writeln('ERROR');
    exit;
                end;
  v_mid:=(v1+v2+v3)/3;
  writeln('The average speed is ',v_mid:3:3);

  readln;

end.

 