// Вариант 4

// 1.	Начертите неориентированный связный граф, со-держащий  n вершин и m ребер.
// 2.	В текстовом файле подготовьте список ребер дан-ного графа.
// 3.	Напишите процедуру ввода данного списка и формирования его в виде динамической
//структу-ры линейного односвязного списка.
// 4.	Напишите процедуру вывода данного списка на экран.
// 5.	Напишите процедуру, определяющую можно ли попасть из вершины Р в вершину Т.
// 6.	Напишите процедуру вывода полученной после-довательности вершин, если ответ положитель-ный.

program Project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  MAX_N = 10;
Var
  list_of_adjacency:array[1..MAX_N,1..MAX_N]of boolean;
  visited:array[1..10]of boolean;
  vershin,reber,P,T:integer;
  go:boolean;
  bil:array[1..MAX_N]of integer;
  
Procedure retToFalse;
Var
  i:integer;
Begin
  for i:=1 to vershin do
    visited[i]:=False;
end;

Procedure dfs(v: integer);
Var
  j:integer;
Begin
  visited[v]:=True;
  if go then
  begin
    exit; 
  end;
  for j:=1 to vershin do
    if list_of_adjacency[v,j] and not visited[j] then
    begin
      if j=T then
      begin
        go:=True;
        bil[T]:=v;
        exit;        
      end;
      dfs(j);
      bil[j]:=v;
    end;
End;

Var
  i,j,x,y:integer;
  f:textfile;
Begin
  assignfile(f,'hop.txt'); reset(f);
  read(f,vershin);
  for i:=1 to vershin do 
    for j:=1 to vershin do
      list_of_adjacency[i,j]:=False;  
  while not eof(f) do
  begin
    read(f,x);
    while not eoln(F) do
    begin
      read(f,y);
      list_of_adjacency[x,y]:=True;
    end;
  end;
  closefile(f);  
  for i:=1 to vershin do
  begin
    write(i,': ');
    for j:=1 to vershin do
      if list_of_adjacency[i,j] then
        write(j,'->');
    writeln;
  end;
  writeln('Vvedite dve vershini:');
  read(P,T);
  go:=False;
  dfs(P);
  x:=bil[T];
  if go then 
  begin
    write(T);
    while x>0 do
    begin
      write('~~',x);
      x:=bil[x];
    end;
    writeln;
  end
  else
    write('NO WAY');

  readln;
  readln;
End.
