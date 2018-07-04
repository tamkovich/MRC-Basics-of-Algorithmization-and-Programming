// ���. 70
// ������������ ������ 14(20)

// ��������� �� ������
// ������� 16

// 1.	��������� ����������������� ������� ����, ���������� n ������ � m �����.
// 2.	� ��������� ����� ����������� ������� ���������� ������� �����.
// 3.	�������� ��������� ����� ������ �������.
// 4.	�������� ��������� ������ ������ ������� �� �����.
// 5.	�������� ���������, ��������� ���������� �������� ������, �.�. ������, �� ������� ������� �������� ���������� �����.
// 6.	�������� ��������� ������ ������� ���� ������ � ����� �����, ��������� �� ������ ����� �������,
//�� �����.


program Graph;

{$APPTYPE CONSOLE}

uses
  SysUtils;

Var
  a:array[1..100,1..100]of byte;
  i,j,n,m,kol:integer;
  b:array[1..10]of integer;

{ ���� }
Procedure Vvod(filename:string);
Var
  f:textfile;
Begin
  assignfile(f,filename); reset(f);
  read(f,n,m);
  for i:=1 to n do
    for j:=1 to m do
      read(f,a[i,j]);
  closefile(f);
End;

{ ����� }
Procedure Vivod;
Begin
  for i:=1 to n do
  begin
    for j:=1 to m do
      write(a[i,j],' ');
    writeln;
  end;
End;

{ ������� �������� ������� }
// ������� ��� ����� ��� ������ �������
Procedure FindNech;
Begin
  for i:=1 to n do
  begin
    b[i]:=0;
    for j:=1 to m do
      if a[i,j]=1 then
        inc(b[i]);
  end;

End;

{ ����� �������� ������ }
Procedure VivodNech;
Begin
  for i:=1 to n do
    if b[i] mod 2 > 0 then     // ���� ���������� ����� ��������, �� ������� �� �����
                               // ���� �����-�������� 
      writeln(i,' == ', b[i]);
End;

begin
  Vvod('graph.txt'); { ���� }
  Vivod;             { ����� }
  FindNech;          { ������� �������� ������� }
  VivodNech;         { ����� �������� ������ }
  readln;
end.
