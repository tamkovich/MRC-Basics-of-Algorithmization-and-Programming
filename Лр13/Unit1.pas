//Лабораторная работа 13
//Записи
//
//27. Сведения о сотрудниках института:
//-	фамилия работающего;
//-	название отдела;
//-	год рождения;
//-	стаж работы;
//-	должность;
//-	оклад
//
//Выведите в алфавитном порядке список сотрудников пенсионного
//возраста на сегодняшний день с указанием стажа работы и среднего
//стажа, работающих в отделе X.
//Подготовил : Тамкович Д. И. , гр. 62492

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Edit1: TEdit;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Edit2: TEdit;
    Label2: TLabel;
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N6Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  tstuff=record
          fam:string[15];    //-	фамилия работающего;
          otd:string[15];    //-	название отдела;
          year:integer;    //-	год рождения;
          stag:integer;    //-	стаж работы;
          work:string[15];   //-	должность;
          cash:integer;    //-	оклад
          end;


var
  Form1: TForm1;
  inst_stuff: array[1..30]  of tstuff; //массив сотрудников
  a:array[1..100]of integer;
  n,m:integer;
  inst_name:string[5];
  x:string;

implementation

{$R *.dfm}

procedure TForm1.N4Click(Sender: TObject);
//Выход
begin
  close;
end;

procedure TForm1.N2Click(Sender: TObject);
//Чтение из файла 
Var
    i:integer;
    f:textfile;
begin
   if opendialog1.Execute then
   begin
     assignfile(f,opendialog1.FileName);
     reset(f);
     readln(f,inst_name);
     Edit1.Text:=inst_name;
     n:=0;
     with stringgrid1 do
     begin
      ColCount:=7;
      width:=600;
      rowcount:=n+1;
      height:=27*(n+2);
      ColWidths[0]:=40;
      ColWidths[1]:=100;
      ColWidths[2]:=100;
      ColWidths[3]:=100;
      ColWidths[4]:=100;
      ColWidths[5]:=100;
      ColWidths[6]:=40;
      cells[0,0]:='Номер';
      cells[1,0]:='Фамилия';
      cells[2,0]:='Отдел';
      cells[3,0]:='Год рождения';
      cells[4,0]:='Стаж работы';
      cells[5,0]:='Должность';
      cells[6,0]:='Оклад';
     end;
     while not eof(f) do
      with StringGrid1,inst_stuff[n+1] do
      begin
        rowcount:=rowcount+1;
        height:=height+27;
        readln(f,fam);
        readln(f,otd);
        readln(f,year);
        readln(f,stag);
        readln(f,work);
        readln(f,cash);
        cells[0,n+1]:=inttostr(n+1);
        cells[1,n+1]:=fam;
        cells[2,n+1]:=otd;
        cells[3,n+1]:=inttostr(year);
        cells[4,n+1]:=inttostr(stag);
        cells[5,n+1]:=work;
        cells[6,n+1]:=inttostr(cash);
        n:=n+1;
      end;
    end;
     closefile(f);
end;

procedure TForm1.N3Click(Sender: TObject);
//вывод требуемой инфвормации
var
  sred:integer;
  f:textfile;
  i:integer;
begin
  if savedialog1.Execute then
  begin
   assignfile(f,savedialog1.FileName);
   rewrite(f);
   writeln(f,'Сотрудники работающие в отделе ',x);
   sred:=0;
   write(f,'Количество сорудников в этом отделе : ',m);
   For i:=1 to m do
   begin
    writeln(f);
    write(f,StringGrid1.Cells[1,a[i]],' : ',StringGrid1.Cells[4,a[i]]);
    sred:=sred+strtoint(StringGrid1.Cells[4,a[i]]);
   end;
   case m of
    0:sred:=0
   else
    sred:=sred div m ;
   end;
   writeln(f);
   write(f,'Средний стаж работников : ',sred);
   closefile(f);
  end;
end;

procedure TForm1.N6Click(Sender: TObject);
var
    i,j,tit:integer;
    b:boolean;
begin
  b:=true;
  m:=0;
  if (Edit2.Text='') then begin
                               ShowMessage('Вы должны указать отдел!');
                               exit;
                          end;
  x:=Edit2.Text;
  for i:=1 to  StringGrid1.RowCount do     //получаем массив номеров сотрудников
    if StringGrid1.Cells[2,i]=x then       //указанного отдела
    begin
    b:=false;
      if (2017-strtoint(StringGrid1.Cells[3,i]))>=19 then //пенсионного возраста
      begin
        m:=m+1;
        a[m]:=i;
      end;
    end;
  if b then
  begin
      ShowMessage('Нет указанного отдела!');
      exit;
  end;
            
  //сортируем по фамилиям массив чисел
  for i:=1 to m do
    for j:=i to m-i do
      if StringGrid1.Cells[1,a[j]]>StringGrid1.Cells[1,a[j+1]] then
      begin
        tit:=a[j];
        a[j]:=a[j+1];
        a[j+1]:=tit;
      end;
end;

end.
