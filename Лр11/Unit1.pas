//Лабораторная работа 11
//
//Множества, строки
//27. Проверьте, имеется ли в заданном тексте баланс открывающих и закрывающих скобок,
//имея в виду, что балансом, например, будет комбинация (…),
//в то время как комбинация )..(..)..( балансом не является.
//
//Подготовил : Тамкович Д.И. , гр. 62492

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
    Label2: TLabel;
    Edit1: TEdit;
    OpenDialog1: TOpenDialog;
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

var
  Form1: TForm1;
  s:string;
  c:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//ввод строки из файла 
Var
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    readln(f,s);
    Edit1.text:=s;
  closefile(f);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
//проверка строки
Var
    i:integer;
begin
  c:=0;
  For i:=1 to length(s) do
    if s[i]='(' then
                    c:=c+1 //увеличиваем количество открывающихся символов
                else
    if c>0 then
                c:=c-1     //если закрывающая скобка , то уменьшаем кол-во открывающихся
           else begin
                      c:=-1; //если скобка закрывающая и больше нет открывающихся
                      break; //то заканчиваем проверку и устанавливаем заведомо неправильно
                end;         //значение c=-1
  Edit2.Text:='Строка проверена!';
end;

procedure TForm1.Button3Click(Sender: TObject);
//вывод результата
var
    f:textfile;
begin
  assignfile(f,'output.txt');
  rewrite(f);
  writeln(f,'Строка = ' , s);
  if c=0 then //по разности отрывающихся и закрывающихся скобок выводим ответ
              write(f,'Строка сбалансирована')
         else
              write(f,'Строка не сбалансирована');
  Edit3.Text:='Ответ хранится в файле!';
  closefile(f);
end;

end.
