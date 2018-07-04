// ЛАБОРАТОРНАЯ РАБОТА 13

// Комбинаторные алгоритмы

// Цель работы: формирование умений и навыков в раз-работке программ,
// реализующих сложные комбинаторные алгоритмы.

// 27. Головоломка "Одинаковые суммы" заключается в следующем.
// Необходимо переставить числа от 1 до N в кружочках (N- количество кружочков)
// так, чтобы суммы чи-сел, расположенных на всех прямых, были одинаковы.



unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    StartImage: TImage;
    FinishImage: TImage;
    GO: TBitBtn;
    GetInput: TButton;
    PushOutput: TButton;
    Point1: TEdit;
    Point2: TEdit;
    Point3: TEdit;
    Point4: TEdit;
    Point5: TEdit;
    Point6: TEdit;
    Point7: TEdit;
    Goodluck: TBitBtn;
    procedure GetInputClick(Sender: TObject);
    procedure PushOutputClick(Sender: TObject);
    procedure GOClick(Sender: TObject);
    procedure GoodluckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
Var
  a:array[1..100]of integer;
  n:integer;
  globalflag:boolean;

procedure TForm1.GetInputClick(Sender: TObject);
Var
  f:textfile;
  i,j:integer;
begin
  globalflag:=True;
  assignfile(f,'input.txt'); reset(f);
  readln(f,n);
  readln(f,a[1]);
  for i:=2 to 4 do
    read(f,a[i]);
  for i:=5 to 7 do
    read(f,a[i]);
  Point1.Text:=IntToStr(a[1]);
  Point2.Text:=IntToStr(a[2]);
  Point3.Text:=IntToStr(a[3]);
  Point4.Text:=IntToStr(a[4]);
  Point5.Text:=IntToStr(a[5]);
  Point6.Text:=IntToStr(a[6]);
  Point7.Text:=IntToStr(a[7]);
  closefile(f);
end;

procedure TForm1.PushOutputClick(Sender: TObject);
Var
  f:textfile;
  i,j:integer;
begin
  assignfile(f,'output.txt'); rewrite(f);
  writeln(f,n);
  writeln(f,a[1]);
  for i:=2 to 4 do
    write(f,a[i]);
  writeln(f);
  for i:=5 to 7 do
    write(f,a[i]);
  closefile(f);
end;

function B(m,i:integer):integer;
{Определяет номер элемента, участвующего в транс-позиции}
begin
 if ((m mod 2)=0) and (m>2) then
  if i<m-1 then
   B:=i
  else
   B:=m-2
 else
  B:=m-1;
end;

procedure Perm(m:integer);
{Основная процедура генерирования и вывода очеред-ной перестановки}
var
 k,k1,i:integer;
 sum1,sum2,sum3,sum4,sum5:integer;
begin
 if m=1 then {Нерекурсивная ветвь}
 begin
 { for i:=1 to n do
   Write(fout,a[i]:4);
   Writeln(fout); }
    sum1:=a[2]+a[5];
    sum2:=a[1]+a[4];
    sum3:=a[2]+a[3]+a[4];
    sum4:=a[5]+a[6]+a[7];
    sum5:=a[1]+a[3]+a[6];
    if sum1=sum2 then
      if sum2=sum3 then
        if sum3=sum4 then
          if sum4=sum5 then
          begin
            globalflag:=False;
            exit;
          end;
  end
 else {Рекурсивная ветвь}
  if globalflag then
    for i:=1 to m do
    begin
      Perm(m-1);
      if i<m then
      begin
        if not globalflag then
          exit;
        k1:=b(m,i);
        k:=a[k1];
        a[k1]:=a[m];
        a[m]:=k;
      end;
    end;
end;


procedure TForm1.GOClick(Sender: TObject);
Var
  i:integer;
begin
  Perm(n);
  if globalflag then
    ShowMessage('Wrong Input!')
  else
  begin
    Point1.Text:=IntToStr(a[1]);
    Point2.Text:=IntToStr(a[2]);
    Point3.Text:=IntToStr(a[3]);
    Point4.Text:=IntToStr(a[4]);
    Point5.Text:=IntToStr(a[5]);
    Point6.Text:=IntToStr(a[6]);
    Point7.Text:=IntToStr(a[7]);
    ShowMessage('Congrutulate!');
    globalflag:=True;
  end;
end;

procedure TForm1.GoodluckClick(Sender: TObject);
begin
  close;
end;

end.
