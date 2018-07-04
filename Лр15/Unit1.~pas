//Лабораторная работа 15
//
//Рекуррентные соотношения. Рекурсии.
//Вариант 27
//Функция f(n) определена на множестве натуральных чисел следующим образом:
//    f(n) = 1 , если n = 1
//    f(n) = (n div 2)+(n div 3)+...+(n div n) , если n >=2
//Вычислите значение данной функции для заданного значения n.
//
//Выполнил: Тамкович Д.И.
//гр. 62492

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    Edit2: TEdit;
    Button3: TButton;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  n,fn: integer;
  f1:textfile;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//ввод данных из файла
Var
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    read(f,n);
    Edit1.Text:=inttostr(n);
    Edit2.Text:=' . . . ';
    Edit3.Text:=' . . . ';
    closefile(f);
  end;
end;

Function RealValue(n:integer):integer;
Var
  i,fn:integer;
begin
  fn:=0;
  if n = 1 then
                RealValue:=1
           else
  begin
    for i:=2 to n do
    begin
      fn:=fn+RealValue(n div i);
    end;
    RealValue:=fn;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  fn:=RealValue(n);
  Edit2.Text:='Выполнено!';
end;

procedure TForm1.Button3Click(Sender: TObject);
//вывод данных в файле
Var
  f:textfile;
begin
  assignfile(f,'output.txt');
  rewrite(f);
  write(f,fn);
  Edit3.Text:='Ответ в файле!';
  closefile(f);
end;

end.
