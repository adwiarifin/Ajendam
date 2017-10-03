unit UnitHistoryChooser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Grids, DBGrids;

type
  TFormHistory = class(TForm)
    btnOk: TButton;
    DBGrid1: TDBGrid;
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistory: TFormHistory;

implementation

uses UnitDataModule;

{$R *.dfm}

procedure TFormHistory.btnOkClick(Sender: TObject);
begin
  Close;
end;

end.
