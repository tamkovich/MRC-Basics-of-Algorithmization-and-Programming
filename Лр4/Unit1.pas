unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  n , A , x: integer;
begin
  if (Edit1.Text='') then begin
                               ShowMessage('Вы должны ввести некоторые значения!');
                               exit;
                          end;
n:=strtoint(Edit1.Text);
x:=(n*2)-1;
A:=((x+1)*n) div 2;
Label2.Caption:= 'Сумма чисел = '+inttostr(A);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8])then begin
  Key:=#0;
                                 end;
end;

end.
