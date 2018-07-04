unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button2: TButton;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
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
  fname:string;
  a,b,c:tmas;
  n,m,i:integer;
  out_message:string;

implementation

{$R *.dfm}
Procedure polychit(fname:string; Var a:tmas; Var n:integer; Var out_message:string);
      stdcall; external 'lib.dll';
Procedure analiz(a:tmas; Var b:tmas; Var c:tmas; n:integer; Var m:integer; Var out_message:string);
      stdcall; external 'lib.dll';
Procedure vivod(b:tmas; c:tmas; m:integer; Var out_message:string);
      stdcall; external 'lib.dll';

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    fname:=OpenDialog1.FileName;
    polychit(fname,a,n,out_message);
    Edit1.Text:=out_message;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  analiz(a,b,c,n,m,out_message);
  Edit2.Text:=out_message;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  vivod(b,c,m,out_message);
  Edit3.Text:=out_message;
end;

end.
