//Лабораторная работа 10
//Вариант 27
//
//27. Дан массив А, состоящий из n натуральных чисел.
//Выберите элементы, встречающиеся более одного раза.
//
//подготовил : Тамкович Д. И. , гр. 62492
library lib;

{ Все процедуры здесь }

uses
  SysUtils,
  Classes;

{$R *.res}
type
    tmas = array[0..100] of integer;

Procedure polychit(fname:string; Var a:tmas; Var n:integer; Var out_message:string); stdcall; export;
Var
    i:integer;
    f:textfile;
Begin
    assignfile(f,fname);
    reset(f);
    //assignfile(t,'res.txt');
    //rewrite(t);
    readln(f,n);
    for i:=1 to n do
      read(f,a[i]);
    out_message:='Данные прочитаны!';
    //writeln(t,n);
    //for i:=1 to n do
    //  write(t,a[i],' ');
    closefile(f);
    //closefile(t);
end;

Procedure analiz(a:tmas; Var b:tmas; Var c:tmas; n:integer; Var m:integer; Var out_message:string);  stdcall; export;
Var
    i,j:integer;
    f:boolean;
Begin
  m:=1;
  i:=1;
  f:=true;
  b[1]:=a[1];
  c[1]:=0;

  For i:=1 to n do
  begin
    f:=true;                //устанавливаем флаг
    For j:=1 to m do        //прооверяем:есть ли элемент в массиве b
      if b[j]=a[i] then
      begin
        f:=false;           //менем значение флага , если найден элемент который уже был
        c[j]:=c[j]+1;       //увеличиваем кол-во повторений таких элементов
        break;
      end;
    if f then               //если флаг = TRUE , значит мы не встречали такой элемент ещё
    begin
      m:=m+1;
      b[m]:=a[i];           //заносим новый элемент в массив b
      c[m]:=1;
    end;
   end;
   out_message:='Анализ успешно проведён!';
end;

Procedure vivod(b:tmas; c:tmas; m:integer; Var out_message:string);  stdcall; export;
var
    i:integer;
    f:textfile;
begin
  assignfile(f,'output.txt');
  rewrite(f);
  For i:=1 to m do
    if c[i]>1 then      //вывод элементов , которые встречались более одного раза
    begin
      write(f,b[i],' ');
    end;
  out_message:='Результат находится в файле ';
  closefile(f);
end;
exports   vivod, analiz, polychit;

begin
end.
 