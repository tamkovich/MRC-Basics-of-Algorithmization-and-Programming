//  26. Составьте программу вывода в верхнюю часть экрана изображения тучи,
// в нижнюю - емкость для воды. При нажатии на кнопку Пуск начинает идти дождь.
// Размер тучи уменьшается, а емкость заполняется водой.
//
//  27. То же, что в задании 26, но из тучи идет снег и внизу растут сугробы.
//
// Программист: Тамкович Д.И. , гр. 62492

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, JPEG;

Const
  COUNT_SF = 15;

type
  TElemMass = array[1..COUNT_SF] of TImage;
  TByteSF = array[1..COUNT_SF] of Byte;
  TForm1 = class(TForm)
    ran: TButton;
    cloud: TImage;
    ExitProg: TBitBtn;
    tree1: TImage;
    tree2: TImage;
    cloud3: TImage;
    cloud2: TImage;
    procedure ExitProgClick(Sender: TObject);
    procedure ranClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  MasSF, MasDrifts: TElemMass;

implementation

{$R *.dfm}

procedure TForm1.ExitProgClick(Sender: TObject);
begin
  close;
end;

// множественный полет сежинок
Procedure GreatMoveSf(ByteMasSF:TByteSF);
Const
  MoveHorizontalSF:array[1..5]of integer = (25,13,11,6,5);
  CountVerticalSF = 4;
Var
  i,j,sign,turn,index_SF:integer;
  w,h:array[1..COUNT_SF] of integer;
  pause_go,pause_new:integer;
Begin
  pause_go:=20;
  pause_new:=100;
  For i:=1 to COUNT_SF do
    if ByteMasSF[i]=1 then
    begin
      MasSF[i].Top:=100;
      MasSF[i].Left:=600;
      w[i]:=random(249)+304;
      h[i]:=random(100)+40;
      MasSF[i].Left:=w[i];
      //MasSF[i].Show;
    end;
  For turn:=1 to 5 do
  begin
    if random(2)=1 then
      sign:=1
    else
      sign:=-1;
    For j:=1 to 5 do
    begin
      For i:=1 to COUNT_SF do
        if ByteMasSF[i]=1 then
        begin
          if (w[i]>248) and (h[i]<140) and (w[i]<577) then
            MasSF[i].Hide
          else
            MasSF[i].Show;
          if random(2)=1 then
            sign:=1
          else
            sign:=-1;
          w[i]:=w[i]+MoveHorizontalSF[j]*sign;
          h[i]:=h[i]+CountVerticalSF;
          MasSF[i].Left:=w[i];
          MasSF[i].Top:=h[i];
          Application.ProcessMessages;
          sleep(random(20));
        end;
      sleep(pause_go);
    end;
  end;
  For i:=1 to COUNT_SF do
    if ByteMasSF[i]=1 then
      MasSF[i].Hide;
  sleep(pause_new);
End;

// полёт снежинок и рост сугробов
procedure TForm1.ranClick(Sender: TObject);
Var
  drift_index,i:integer;
  ByteMasSF:TByteSF;
Begin
  ran.Enabled:=False;
  ExitProg.Enabled:=False;
  For i:=1 to 10 do
    MasDrifts[i].Hide;
  MasDrifts[1].Show;
  // w:=random(249)+304;    // 329-25   // 248+25
  For drift_index:=1 to 10 do
  begin
    // увеличиваем сугроб
    if drift_index>1 then
      MasDrifts[drift_index-1].Hide;
    MasDrifts[drift_index].Show;
    For i:=1 to COUNT_SF do
      ByteMasSF[i]:=random(2);
    GreatMoveSf(ByteMasSF); // начинается зима
  end;
  ran.Enabled:=True;
  ExitProg.Enabled:=True;
end;

procedure TForm1.FormCreate(Sender: TObject);
Var
  i:integer;
begin
  // создаются снежинки
  For i:=1 to COUNT_SF do
  begin
    MasSF[i]:=TImage.Create(Form1);
    MasSF[i].Parent:=Form1;
    MasSF[i].Left:=51*i;
    MasSF[i].Top:=2;
    MasSF[i].Height:=50;
    MasSF[i].Width:=50;
    MasSF[i].Transparent:=True;
    MasSF[i].Hide;
    MasSF[i].Picture.LoadFromFile('snowflake'+IntToStr(random(5)+1)+'.bmp');
  end;
  // создаются сугробы
  For i:=1 to 10 do
  begin
    MasDrifts[i]:=TImage.Create(Form1);
    MasDrifts[i].Parent:=Form1;
    MasDrifts[i].Picture.LoadFromFile('fasa'+IntToStr(i)+'.bmp');
    MasDrifts[i].Width:=MasDrifts[i].Picture.Width;
    MasDrifts[i].Height:=MasDrifts[i].Picture.Height;
    MasDrifts[i].Left:=304;
    MasDrifts[i].Top:=305-MasDrifts[i].Height;
    MasDrifts[i].Transparent:=True;
    MasDrifts[i].Hide;
  end;
  MasDrifts[1].Show;
end;

end.


//snowdrifts : {
 1: 264
 2: 264
 3: 264
 4: 264
 5: 264
 6: 256
 7: 256
 8: 256
 9: 256
 10: 256
}