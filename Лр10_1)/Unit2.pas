unit Unit2;

interface
Procedure polychit(Var f:textfile);
Procedure analiz;
Procedure vivod;

type
    tmas = array[0..100] of integer;

Var
    a,b,c:tmas;
    n,m:integer;

implementation

uses Unit1;

Procedure polychit(Var f:textfile);
Var
    i:integer;
Begin
    readln(f,n);
    for i:=1 to n do
      read(f,a[i]);  
    Form1.Edit1.Text:='������ ���������!';
end;

Procedure analiz;
Var
    i,j:integer;
    f:boolean;
Begin
  m:=1;
  i:=1;
  f:=true;
  b[1]:=a[1];
  c[1]:=0;

  For i:=1 to n do
  begin
    f:=true;                //������������� ����
    For j:=1 to m do        //����������:���� �� ������� � ������� b
      if b[j]=a[i] then
      begin
        f:=false;           //����� �������� ����� , ���� ������ ������� ������� ��� ���
        c[j]:=c[j]+1;       //����������� ���-�� ���������� ����� ���������
        break;
      end;
    if f then               //���� ���� = TRUE , ������ �� �� ��������� ����� ������� ���
    begin
      m:=m+1;
      b[m]:=a[i];           //������� ����� ������� � ������ b
      c[m]:=1;
    end;
   end;
   Form1.Edit2.Text:='������ ������� �������!';
end;

Procedure vivod;
var
    i,j:integer;
    f:textfile;
begin
  assignfile(f,'output.txt');
  rewrite(f);
  For i:=1 to m do
    if c[i]>1 then      //����� ��������� , ������� ����������� ����� ������ ����
    begin
      write(f,b[i],' ');
    end;
  Form1.Edit3.Text:='��������� ��������� � ����� ';
  closefile(f);
end;
end.
 
 