// Лабораторная работа 16

// Визуализация Сортировки Шелла (QSort)
// Подготовили: Алексей Башура и Тамкович Денис, гр. 62492

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TElemMass = array[1..15] of TImage;
  TForm1 = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  ElemMass: TElemMass;
  a: array[1..15] of integer;
implementation

{$R *.dfm}

procedure DrawImage(chis,tip,pause: integer;var Img: TImage);
begin
  Img.Picture:=nil;
  case tip of
    1:  Img.Canvas.Pen.Color:=clBlack;
    2:  Img.Canvas.Pen.Color:=clRed;
    3:  Img.Canvas.Pen.Color:=clGreen;
  end;
  Img.Canvas.Brush.Color:=clWhite;
  Img.Canvas.Pen.Width:=7;
  Img.Canvas.Rectangle(1,1,50,50);
  Img.Canvas.Font.Size:=12;
  Img.Canvas.TextOut(10,15,IntToStr(chis));
  Img.Repaint;
  Sleep(pause);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  for i:=1 to 15 do
    begin
      ElemMass[i]:=TImage.Create(Form1);
      ElemMass[i].Parent:=Panel1;
      ElemMass[i].Left:=51*i;
      ElemMass[i].Top:=400;
      ElemMass[i].Height:=50;
      ElemMass[i].Width:=50;
      ElemMass[i].Show;
      DrawImage(i,2,0,ElemMass[i]);
    end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  i: integer;
begin
  randomize;
  for i:=1 to 15 do
    begin
      a[i]:=random(1000);
      DrawImage(a[i],1,0,ElemMass[i]);
    end;
end;

procedure q_sort(l,r:longint);
var
    i,j:longint;
    tit,q, x1,x2,d,p,k:integer;
begin
  i := l;
  j := r;

  for d:=1 to 10 do
    begin
      for k:=l to r do
        ElemMass[k].Top:=ElemMass[k].Top-5;
      Sleep(100);
      Application.ProcessMessages;
    end;
  Sleep(700);

  q := a[(l+r) div 2];

  DrawImage(q,2,700,ElemMass[(l+r) div 2]);
  DrawImage(a[i],3,700,ElemMass[i]);
  DrawImage(a[j],3,1000,ElemMass[j]);

  repeat
    while (a[i] < q) do
      begin
        DrawImage(a[i],1,0,ElemMass[i]);

        inc(i);

        DrawImage(a[i],3,1000,ElemMass[i]);
      end;
    while (q < a[j]) do
      begin
        DrawImage(a[j],1,0,ElemMass[j]);

        dec(j);

        DrawImage(a[j],3,1000,ElemMass[j]);
      end;
    if (i <= j) then
    begin
      tit:=a[i];
      a[i]:=a[j];
      a[j]:=tit;

      if i<>j then
      begin
        x1:=ElemMass[i].Left;
        ElemMass[i].BringToFront;
        x2:=ElemMass[j].Left;
        ElemMass[j].BringToFront;
        p:=abs(ElemMass[i].Left-ElemMass[j].Left) div 20;
        for d:=1 to 20 do
          begin
            ElemMass[i].Left:=ElemMass[i].Left+p;
            ElemMass[j].Left:=ElemMass[j].Left-p;
            Sleep(100);
            Application.ProcessMessages;
          end;
        ElemMass[i].Left:=x1;
        DrawImage(a[i],3,0,ElemMass[i]);
        ElemMass[j].Left:=x2;
        DrawImage(a[j],3,0,ElemMass[j]);
        Application.ProcessMessages;
        Sleep(300);
      end;

      If a[i]=q then
          DrawImage(a[i],2,0,ElemMass[i])
      else
        DrawImage(a[i],1,0,ElemMass[i]);

      inc(i);

      DrawImage(a[i],3,1000,ElemMass[i]);

      If a[j]=q then
          DrawImage(a[j],2,0,ElemMass[j])
      else
        DrawImage(a[j],1,0,ElemMass[j]);

      dec(j);

      DrawImage(a[j],3,1000,ElemMass[j]);
    end;
  until (i > j);

  DrawImage(a[i-1],1,0,ElemMass[i-1]);
  DrawImage(a[j+1],1,0,ElemMass[j+1]);
  DrawImage(a[i],1,0,ElemMass[i]);
  DrawImage(a[j],1,0,ElemMass[j]);
  
  for d:=1 to 10 do
    begin
      for k:=l to r do
        ElemMass[k].Top:=ElemMass[k].Top+5;
      Sleep(100);
      Application.ProcessMessages;
    end;
  Sleep(700);

  if (l < j) then
    q_sort(l,j);
  if (i < r) then
    q_sort(i,r);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
q_sort(1,15);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
begin
  for i:=1 to 15 do
    ElemMass[i].Destroy;
end;

end.
