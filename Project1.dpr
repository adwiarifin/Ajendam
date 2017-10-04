program Project1;

uses
  Forms,
  UnitDataModule in 'UnitDataModule.pas' {DataModuleAjendam},
  UnitMain in 'UnitMain.pas' {FormMain},
  UnitCariData in 'UnitCariData.pas' {FormCariData},
  UnitHistoryChooser in 'UnitHistoryChooser.pas' {FormHistory};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Ajendam - Program Verifikasi';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormCariData, FormCariData);
  Application.CreateForm(TFormHistory, FormHistory);
  Application.CreateForm(TDataModuleAjendam, DataModuleAjendam);
  Application.Run;
end.
