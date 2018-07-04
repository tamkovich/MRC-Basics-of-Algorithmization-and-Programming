unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    StringGrid1: TStringGrid;
    StringGrid2: TStringGrid;
    Label2: TLabel;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject; var Key: Char);
    procedure StringGrid1Click(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 StringGrid1.Cells[0,0]:='A';
 StringGrid1.Cells[1,0]:='B';
 StringGrid2.Cells[0,0]:='A';
 StringGrid2.Cells[1,0]:='B';
end;

procedure TForm1.Button1Click(Sender: TObject);
Var a,b:array[1..1000]of integer;
    tit,i,n:integer;
begin
    if (Edit1.Text='') then
      begin
        ShowMessage('Вы должны ввести некоторое значение!');
        exit;
      end;
    n:=strtoint(Edit1.Text);
    For i:=1 to n do
    begin
      a[i]:=strtoint(StringGrid1.Cells[0,i]);
      b[i]:=strtoint(StringGrid1.Cells[1,i]);            //Ввод элементов массивов
    end;
    For i:=1 to n do
    begin
        tit:=b[i];
        b[i]:=-a[i];
        a[i]:=tit;                                         //Обмен элементов массивов
    end;
    for i:=1 to n do
    begin
      StringGrid2.Cells[0,i]:=inttostr(a[i]);
      StringGrid2.Cells[1,i]:=inttostr(b[i]);            //Вывод новых элементов массивов
    end;
end;

procedure TForm1.Edit1Change(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8])then
    begin
      Key:=#0;
    end;
end;

procedure TForm1.StringGrid1Click(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9',#8,'-'])then
    begin
      Key:=#0;
    end;
end;

end.
