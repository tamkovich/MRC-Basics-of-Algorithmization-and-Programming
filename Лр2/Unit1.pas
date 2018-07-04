unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Button1: TButton;
    Button2: TButton;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject); 
    procedure Button2Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);

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
v,v1,v2,v3:real;
begin 
v1:=strtofloat(Edit1.Text);
v2:=strtofloat(Edit2.Text);
v3:=strtofloat(Edit3.Text);
v:=(v1+v2+v3)/3;
Label4.Caption:='—редн€€ скорость '+floattostr(v); 
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

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8])then begin
  Key:=#0;
                                 end;
end;

procedure TForm1.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9',#8])then begin
  Key:=#0;
                                 end;
end;

end.
