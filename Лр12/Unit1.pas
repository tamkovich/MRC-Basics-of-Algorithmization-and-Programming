//Лабораторная работа 12
//Методы внутренней сортировки
//
//Вариант 27
//27. Реализуйте сортировку простым выбором.
//Подсчитайте количество сравнений.
//
//Подготовил : Тамкович Д.И. , гр.62492
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
    OpenDialog1: TOpenDialog;
    Edit1: TEdit;
    Button3: TButton;
    Edit2: TEdit;
    Edit3: TEdit;
    Button4: TButton;
    Edit4: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a:array[1..1000]of integer;
  n,kol:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
//ввод данных из файла
Var
    i:integer;
    f:textfile;
begin
  if OpenDialog1.Execute then
  begin
    assignfile(f,OpenDialog1.FileName);
    reset(f);
    readln(f,n);
    For i:=1 to n do
    begin
      read(f,a[i]);                             //получаем элементы массива
    end;
  closefile(f);
  Edit1.Text:='Данные получены!';
  Edit2.Text:=' . . . ';
  Edit3.Text:=' . . . ';
  Edit4.Text:=' . . . ';
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
    i,min,j,tit:integer;
    f:textfile;
begin
  kol:=0;
  For i:=1 to n-1 do
  begin
    min:=i;
    for j:=i+1 to n do
    begin
      kol:=kol+1;                //увеличиваем кол-во сравнений
      if a[min] > a[j] then      //меняем индекс элеменанта с минимальным
        min:=j;
    end;
    kol:=kol+1;                  //увеличиваем кол-во сравнений
    if min<>i then         //меняем минимальный элемент с текущим места, если требуется
    begin
      tit:=a[i];
      a[i]:=a[min];
      a[min]:=tit;
    end;
  end;
  Edit2.Text:='Массив отсортирован!';
  Edit4.Text:='Найдено';
end;

procedure TForm1.Button3Click(Sender: TObject);
//вывод результата
Var
    f:textfile;
begin
  assignfile(f,'output.txt');
  rewrite(f);
  write(f,'Количество сравнений = ',kol);  //вывод кол-ва сравнений
  Edit3.Text:='Результат находится в файле';
  closefile(f);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if kol > 0 then
                  kol:=(n*(n+1) div 2 ) - 1;
  Edit4.Text:='Найдено';
end;

end.
