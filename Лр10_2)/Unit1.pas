unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
    tmas = array[0..100] of integer;

var
  Form1: TForm1;
  f:textfile;
  a,b,c:tmas;
  n,m:integer;
  {$I Unit2.pas}         //Подключение внешнего файла

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    polychit(f,a,n);
    closefile(f);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  analiz;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  vivod;
end;

end.
