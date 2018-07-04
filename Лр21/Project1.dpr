program Project1;

uses
  Forms,
  SquareWay in 'SquareWay.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
