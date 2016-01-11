program Tear;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FPrincipal},
  uDataModule in 'uDataModule.pas' {DModule: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  UBase in 'UBase.pas' {FBase},
  U01001 in 'M01\U01001.pas' {F01001},
  U01002 in 'M01\U01002.pas' {F01002},
  U01003 in 'M01\U01003.pas' {F01003},
  U01004 in 'M01\U01004.pas' {F01004},
  U01005 in 'M01\U01005.pas' {F01005},
  U01006 in 'M01\U01006.pas' {F01006},
  U01007 in 'M01\U01007.pas' {F01007},
  U01008 in 'M01\U01008.pas' {F01008},
  U01009 in 'M01\U01009.pas' {F01009},
  U03001 in 'M03\U03001.pas' {F03001},
  U01010 in 'M01\U01010.pas' {F01010},
  U01011 in 'M01\U01011.pas' {F01011},
  U01012 in 'M01\U01012.pas' {F01012},
  U03002 in 'M03\U03002.pas' {F03002},
  U01013 in 'M01\U01013.pas' {F01013};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDModule, DModule);
  Application.CreateForm(TFBase, FBase);
  Application.CreateForm(TF01013, F01013);
  Application.Run;
end.
