// ЛАБОРАТОРНАЯ РАБОТА 22
// Динамическое программирование

// 27. Даны две последовательности натуральных чисел.
// Составьте программу нахождения наибольшей общей подпоследовательности
// этих последовательностей.

// Подготовил: Тамкович Д. И., гр. 62492
program Project2;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Type
  Tmas = array[1..100]of integer;

// ввод
Procedure Vvod(Var a:Tmas; Var b:Tmas; Var n:integer; Var m:integer; filename:string);
Var
  f:textfile;
  i:integer;
Begin
  assignfile(f,filename); reset(f);
  readln(f,n);
  for i:=1 to n do
    read(f,a[i]);
  readln(f,m);
  for i:=1 to m do
    read(f,b[i]);
  closefile(f);
End;

// вывод последовательностей на экран
Procedure Vivod(a,b:Tmas; n,m:integer);
Var
  i:integer;
Begin
  writeln('Posledovatelnost A');
  for i:=1 to n do
    write(a[i],' ');
  writeln;
  writeln('Posledovatelnost B');
  for i:=1 to m do
    write(b[i],' ');
  writeln;
End;

// Поиск наибольшей подпоследовательности
Procedure LCS(a,b:Tmas; n,m:integer);
Var
  F:array[0..100,0..100]of integer;
  i,j,kol:integer;
  res:Tmas;
Begin
  For i:=0 to n do
    For j:=0 to m do
      F[i,j]:=0;

  For i:=1 to n do
    For j:=1 to n do
      if a[i] = b[j] then
        F[i,j]:=F[i-1,j-1]+1
      else
        if F[i-1,j]>F[i,j-1] then
          F[i,j]:=F[i-1,j]
        else
          F[i,j]:=F[i,j-1];
  writeln;
  writeln('Dlina podposledovatelnosti = ',F[n,m]);
  i:=n;
  j:=m;
  kol:=0;
  While (i>0)and(j>0)do
    if a[i]=b[j] then
    begin
      inc(kol);
      res[kol]:=a[i];
      dec(i);
      dec(j);
    end
    else
      if F[i-1,j]=F[i,j] then
        i:=i-1
      else
        j:=j-1;
  writeln('Sama Podposledovatelnost:');
  for i:=kol downto 1 do
    write(res[i],' ');
End;

Var
  a,b:Tmas;
  n,m,i:integer;
begin
  Vvod(a,b,n,m,'input.txt');
  Vivod(a,b,n,m);
  LCS(a,b,n,m);

  readln;
end.
