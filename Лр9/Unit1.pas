//������������ ������ 9
//������� �����. ��������� ��������. ����� ��������� �����������
//������� 27
//27. ���� ������� �, ������� n ����� � m ��������, ���������� ������ ������ �� ������ �������.
//�������� ������ ���������, �� ������� ������� ������� ������.
//���������� : �������� �.�. , ��.62492
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:array[1..10,1..10]of integer;
  n,m:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
    f:textfile;
    i,j:integer;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    read(f,n,m);
    Label1.Caption:='���������� ������ �� ������� = '+inttostr(n);
    Label2.Caption:='���������� ��������� = '+inttostr(m);
    StringGrid1.ColCount:=m+1;
     StringGrid1.Width:=(StringGrid1.DefaultColWidth+2*StringGrid1.GridLineWidth)*StringGrid1.ColCount;
    StringGrid1.RowCount:=n+1;
    For i:=1 to n do
    begin
      StringGrid1.Cells[0,i]:=inttostr(i);
      for j:=1 to m do
      begin
        read(f,a[i,j]);                           //�������� ������
        StringGrid1.Cells[j,0]:=inttostr(j);
        StringGrid1.Cells[j,i]:=inttostr(a[i,j]); //������� ������ � �������
      end;
      readln(f);
    end;
  closefile(f);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
    i,j:integer;
    b:boolean;
begin
  StringGrid2.ColCount:=0;
  For j:=1 to m do
  begin
    b:=true;
    For i:=1 to n do
      if a[i,j]=0 then //�������� �� ������� ������� ������ � ��������
      begin
        b:=false;      //���� �� ������� ���� ������� ������, �� ������������� ������
        break;
      end;
    if not b then      //���� �� ���� �� TRUE, ������ �� ��� ������
    begin              //� �������� ��������� => ������� ������� ������
      StringGrid2.Cells[StringGrid2.ColCount-1,0]:=inttostr(j); //����� ��������� � �������� ��������
      StringGrid2.ColCount:=StringGrid2.ColCount+1;
    end;
  end;
  StringGrid2.ColCount:=StringGrid2.ColCount-1;
end;

end.