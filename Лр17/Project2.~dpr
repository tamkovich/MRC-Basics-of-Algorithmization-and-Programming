// ЛАБОРАТОРНАЯ РАБОТА 17

// 27. Постройте магический квадрат нечетного порядка.

// Программист: Тамкович Д. И., гр. 62492
program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  Tmag = array[1..100,1..100] of integer;

Procedure Vivod(a:Tmag; start,n:integer);
Var
  i,j:integer;
Begin
  For i:=start to n do
  begin
    For j:=start to n do
      write(a[i,j]:4);
    writeln;
  end;
  writeln;
End;

// Создание Магического Квадрата нечетного порядка Методом Террас
Procedure magig_square(n:integer);
Var
  i,j,m,di,dj,counter,hop,tak,sup:integer;
  square:Tmag;
Begin
  m:=2 * n - 1;
  // инициализация
  For i:=1 to m do
    For j:=1 to m do
      square[i,j]:=0;

  dj:=0;
  counter:=1;
  // создание террас
  For i:=1 to n do
  begin
    di:=n-1;
    For j:=1 to n do
    begin
      square[i+di,j+dj]:=counter;
      inc(counter);
      dec(di);
    end;
    inc(dj);
  end;

  sup:=n div 2;
  For j:=1 to sup do
    For i:=1 to (2*n-1) do
    begin
      if (j-sup*2) <= 0 then
        hop:=m+(j-sup*2)
      else
        hop:=j-sup*2;

      if (j-sup) <= 0 then
        tak:=m+(j-sup)
      else
        tak:=j-sup;

      // first
      if square[i,j]<>0 then
        square[i,hop]:=square[i,j];
      square[i,j]:=0;

      // second
      if square[i,tak]<>0 then
        square[i,j+sup]:=square[i,tak];
      square[i,tak]:=0;

      // third
      if square[j,i]<>0 then
        square[hop,i]:=square[j,i];
      square[j,i]:=0;

      // fourth
      if square[tak,i]<>0 then
        square[j+sup,i]:=square[tak,i];
      square[tak,i]:=0;
    end;
  Vivod(square,sup+1,2*n-1-sup);
End;

Var
  n:integer;

begin
  While True do
  begin
    writeln('Vvedite poriadok magicheskogo kvadrata:');
    readln(n);
    if (n>2)and(odd(n))then
      break;
  end;
  magig_square(n);

  readln;
end.
