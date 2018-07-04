//Лабораторная работа 8
//Подпрограммы (процедуры и функции)
//Вариант 27
//27. Напишите программу сложения двух обыкновенных несократимых дробей
// и  Результат представить в виде несократимой дроби.
//Подготовил Тамкович Д.И.

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    BitBtn1: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
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
  m,n,p,q:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
Var
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    read(f,m,n,p,q);
    Label1.Caption:='Первая дробь = '+inttostr(m)+'/'+inttostr(n);   //получаем дроби
    Label2.Caption:='Вторая дробь = '+inttostr(p)+'/'+inttostr(q);
  closefile(f);
  end;
end;

Function NOD(x,y:integer):integer;
Begin
  if x<>0 then NOD:=NOD(y mod x,x) else NOD:=y;
end;

Function NOK(x,y:integer):integer;
Begin
  NOK:=(x div NOD (x,y))*y;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  a,b,c,d:integer;    
begin
  a:= NOK(n,q); //Получаем знаменатель суммы дробей(находим НОК знаменателей двух дробей)
  b:= a div n ;
  c:= a div q ;
  d:=b*m+c*p;  //получаем числитель суммы дробей
  Label3.Caption:='Результат сложения = '+inttostr(d)+'/'+inttostr(a);  //выводим результат сложения дробей
end;

end.
