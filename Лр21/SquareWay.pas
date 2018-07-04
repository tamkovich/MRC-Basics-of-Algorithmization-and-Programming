// стр. 101
// ЛАБОРАТОРНАЯ РАБОТА 15(21)

// Алгоритмы с возвращением. Волновой алгоритм Ли
// 27."Путь по квадратам"

// Подготовил: Тамкович Д.И., гр. 62492
unit SquareWay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids;

type
  TForm1 = class(TForm)
    PoleGrid: TStringGrid;
    vvod: TBitBtn;
    proiti: TBitBtn;
    CloseBtn: TBitBtn;
    Edit1: TEdit;
    Edit2: TEdit;
    GenPole: TButton;
    procedure vvodClick(Sender: TObject);
    procedure PoleGridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure proitiClick(Sender: TObject);
    procedure CloseBtnClick(Sender: TObject);
    procedure GenPoleClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  Tmas= array[0..101,0..101]of string;

var
  Form1: TForm1;
  pole, ra, dlak, resha:Tmas;
  i,j,n, all_squares:integer;
  go:boolean;
  hop, max_walk:integer;
  x,y,errorPos, num, visited_squares, num1, num2 :integer;

implementation

{$R *.dfm}
procedure back_kontur(i,j:integer);
Begin
  // проверяем клетку, если она попала в квадрат
  if pole[i,j]='*' then
  begin                    // X.
    resha[i,j+1]:='.';     // ..
    resha[i+1,j+1]:='.';
    resha[i+1,j]:='.';
    dec(visited_squares);
  end
  else if pole[i,j-1]='*' then
  begin                   // .X
    resha[i,j-1]:='.';    // ..
    resha[i+1,j]:='.';
    resha[i+1,j-1]:='.';
    dec(visited_squares);
  end
  else if pole[i-1,j-1]='*' then
  begin                   // ..
    resha[i-1,j-1]:='.';  // .X
    resha[i-1,j]:='.';
    resha[i,j-1]:='.';
    dec(visited_squares);
  end
  else if pole[i-1,j]='*' then
  begin                  // ..
    resha[i-1,j]:='.';   // X.
    resha[i-1,j+1]:='.';
    resha[i,j+1]:='.';
    dec(visited_squares);
  end;
End;

procedure solve(come_visited_squares:integer; i,j:integer);
Var
  f: textfile;
begin
  visited_squares:=come_visited_squares;
  // окрашивание клеток
{  if go=False then
  begin
    for x:=1 to n do
      for y:=1 to n do
      begin
        val(resha[x,y],num,errorPos);
        if errorPos=0 then
          dlak[x,y]:=inttostr(num)
        else
          dlak[x,y]:=resha[x,y];
        Form1.PoleGrid.Cells[y,x]:=dlak[x,y];
      end;
   end;     }
  // проверка на решенность
  // all_squares
  Form1.Edit2.Text:=inttostr(visited_squares);
  if ((pole[i+1,j]='F')or(pole[i,j+1]='F'))and(visited_squares=all_squares) then
  begin
    if StrToInt(resha[i,j])<max_walk then
    begin
      max_walk:=StrToInt(resha[i,j]);
      inc(hop);
      assignfile(f, 'nr'+inttostr(hop)+'.txt'); rewrite(f);
      writeln(f,'STEPS : ',max_walk);
      for x:=0 to n+1 do
      begin
        for y:=0 to n+1 do
        begin
          write(f,resha[x,y]:3);
          dlak[x,y]:=resha[x,y];
          Form1.PoleGrid.Cells[y,x]:=dlak[x,y];
        end;
        writeln(f);
      end;
      closefile(f);
      go:=False;
      exit;
    end;
  end;
  if go=False then
    exit;
  // проверяем клетку, если она попала в квадрат
  if (pole[i,j]='*')and(go=True) then
  begin                    // X.
    resha[i,j+1]:='-';     // ..
    resha[i+1,j+1]:='-';
    resha[i+1,j]:='-';
    inc(visited_squares);
  end
  else if (pole[i,j-1]='*')and(go=True) then
  begin                   // .X
    resha[i,j-1]:='-';    // ..
    resha[i+1,j]:='-';
    resha[i+1,j-1]:='-';
    inc(visited_squares);
  end
  else if (pole[i-1,j-1]='*')and(go=True) then
  begin                   // ..
    resha[i-1,j-1]:='-';  // .X
    resha[i-1,j]:='-';
    resha[i,j-1]:='-';
    inc(visited_squares);
  end
  else if (pole[i-1,j]='*')and(go=True) then
  begin                  // ..
    resha[i-1,j]:='-';   // X.
    resha[i-1,j+1]:='-';
    resha[i,j+1]:='-';
    inc(visited_squares);
  end;
  // ищем подходящую клетку для продвижения
  num1:=0;
  num2:=0;
  val(resha[i+1,j],num1,errorPos);
  val(resha[i+1,j+1],num2,errorPos);
  val(resha[i,j],num,errorPos);    // число на текущей позиции
  if (pole[i,j+1]<>'F')and(resha[i,j+1]='.')and(go=True) then     // right
  begin
    if not((num1<num)and(num2-1=num1)) then
    begin
      resha[i,j+1]:=inttostr(strtoint(resha[i,j])+1);
      solve(visited_squares, i,j+1);
      resha[i,j+1]:='.';
      back_kontur(i,j+1);
    end;
  end;
  num1:=0;
  num2:=0;
  val(resha[i,j+1],num1,errorPos);
  val(resha[i+1,j+1],num2,errorPos);
  if (pole[i+1,j]<>'F')and(resha[i+1,j]='.')and(go=True) then     // down
  begin
    if not((num1<num)and(num2-1=num1)) then
    begin
      resha[i+1,j]:=inttostr(strtoint(resha[i,j])+1);
      solve(visited_squares, i+1,j);
      resha[i+1,j]:='.';
      back_kontur(i+1,j);
    end;
  end;
  num1:=0;
  num2:=0;
  val(resha[i+1,j],num1,errorPos);
  val(resha[i+1,j-1],num2,errorPos);
  if (pole[i,j-1]<>'F')and(resha[i,j-1]='.')and(go=True)and(i<n)and(i>1) then     // left
  begin
    if not((num1<num)and(num2-1=num1)) then
    begin
      resha[i,j-1]:=inttostr(strtoint(resha[i,j])+1);
      solve(visited_squares, i,j-1);
      resha[i,j-1]:='.';
      back_kontur( i,j-1);
    end;
  end;
  num1:=0;
  num2:=0;
  val(resha[i,j-1],num1,errorPos);
  val(resha[i-1,j-1],num2,errorPos);
  if (pole[i-1,j]<>'F')and(resha[i-1,j]='.')and(go=True)and(j<n)and(j>1) then     // up
  begin
    if not((num1<num)and(num2-1=num1)) then
    begin
      resha[i-1,j]:=inttostr(strtoint(resha[i,j])+1);
      solve(visited_squares,  i-1,j);
      resha[i-1,j]:='.';
      back_kontur( i-1,j);
    end;
  end;
end;

procedure TForm1.vvodClick(Sender: TObject);
Var
  f,f2:textfile;
  stroka:string;
  k,i,j:integer;
begin
  hop:=0;
  all_squares:=0;
  assignfile(f,'POLES/pole1.txt'); reset(f);
  assignfile(f2,'hook.txt'); rewrite(f2);
  readln(f,n);
  max_walk:=n*n;
  // строим стеночку вокруг полей
  for i:=0 to n+1 do
  begin
    dlak[0,i]:='-';
    pole[0,i]:='-';
    ra[0,i]:='-';
    PoleGrid.Cells[i,0]:='';
    dlak[i,0]:='-';
    pole[i,0]:='-';
    ra[i,0]:='-';
    PoleGrid.Cells[0,i]:='';
    dlak[n+1,i]:='-';
    pole[n+1,i]:='-';
    ra[n+1,i]:='-';
    PoleGrid.Cells[n+1,i]:='';
    dlak[i,n+1]:='-';
    pole[i,n+1]:='-';
    ra[i,n+1]:='-';
    PoleGrid.Cells[i,n+1]:='';
  end;
  for i:=1 to n do
  begin
    readln(f,stroka);
    k:=1;
    writeln(f2,stroka, '--', stroka[k]);
    while k<=((n*2)-1) do
    begin
      pole[i,k div 2 +1]:=stroka[k];
      dlak[i,k div 2 +1]:=stroka[k];
      if stroka[k]='*' then
        inc(all_squares);
      PoleGrid.Cells[k div 2 +1,i]:='';
      k:=k+2;
    end;   
  end;
  closefile(f);
  Edit1.Text:=inttostr(all_squares);
  closefile(f2);
{  assignfile(f,'look.txt'); rewrite(f);
  for i:=0 to n+1 do
  begin
    for j:=0 to n+1 do
    begin
      write(f,pole[i,j]:2);
    end;
    writeln(f);
  end;
  closefile(f);  }
  proiti.Enabled:=True;
end;

procedure TForm1.PoleGridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
Var
  num, errorPos:integer;
begin
  val(dlak[ARow, ACol],num,errorPos);
  if errorPos=0 then
    PoleGrid.Canvas.Brush.Color:=clPurple
  else if dlak[ARow, ACol]='F' then
    PoleGrid.Canvas.Brush.Color:=clLime
  else if dlak[ARow, ACol]='.' then
    PoleGrid.Canvas.Brush.Color:=clWindow
  else if dlak[ARow, ACol]='-' then
    PoleGrid.Canvas.Brush.Color:=clMaroon
  else
    PoleGrid.Canvas.Brush.Color:=clGray;

  PoleGrid.Canvas.FillRect(Rect);
  PoleGrid.Canvas.Font.Color:=clRed;
  PoleGrid.Canvas.TextOut(Rect.Left+10, Rect.Top+8, dlak[ARow, ACol]);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  proiti.Enabled:=False;
end;

procedure TForm1.FormClick(Sender: TObject);
begin
  proiti.Enabled:=False;
end;

procedure TForm1.proitiClick(Sender: TObject);
Var
  i,j, visited_squares, num:integer;
  f:textfile;
begin
  go:=True;
  proiti.Enabled:=False;
  for i:=0 to n+1 do
  begin
    resha[0,i]:='-';
    resha[i,0]:='-';
    resha[n+1,i]:='-';
    resha[i,n+1]:='-';
  end;
  for i:=1 to n do
    for j:=1 to n do
      resha[i,j]:='.';
  visited_squares:=0;
  i:=1;
  j:=1;
  resha[i,j]:='0';
  solve(visited_squares, i,j);
end;

procedure TForm1.CloseBtnClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.GenPoleClick(Sender: TObject);
Var
  i,j:integer;
begin
  n:=10 ;
  for i:=0 to n+1 do
  begin
    dlak[0,i]:='-';
    dlak[i,0]:='-';
    dlak[n+1,i]:='-';
    dlak[i,n+1]:='-';
    pole[0,i]:='-';
    pole[i,0]:='-';
    pole[n+1,i]:='-';
    pole[i,n+1]:='-';
  end;
  for i:=1 to n do
    for j:=1 to n do
    begin
      dlak[i,j]:='.';
      pole[i,j]:='.';
    end;
end;

end.
