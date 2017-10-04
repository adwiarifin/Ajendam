unit UnitDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, frxClass, frxDBSet, frxExportRTF, frxExportXLS,
  frxExportPDF, StrUtils;

type
  TDataModuleAjendam = class(TDataModule)
    frxPDFExport1: TfrxPDFExport;
    frxXLSExport1: TfrxXLSExport;
    frxRTFExport1: TfrxRTFExport;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    dsHistory: TDataSource;
    tbHistory: TADOTable;
    dsBulan: TDataSource;
    tbBulan: TADOTable;
    dsVerifikasi: TDataSource;
    tbVerifikasi: TADOTable;
    tbVerifikasiCalcTanggalPensiun: TStringField;
    tbVerifikasiID: TAutoIncField;
    tbVerifikasiNRP: TWideStringField;
    tbVerifikasiNama: TWideStringField;
    tbVerifikasiKode_Pangkat: TSmallintField;
    tbVerifikasiPangkat: TWideStringField;
    tbVerifikasiKesatuan: TWideStringField;
    tbVerifikasiNo_SKEP: TWideStringField;
    tbVerifikasiTanggal_Pensiun: TDateTimeField;
    tbVerifikasiTanggal_Pensiun_Indonesia: TWideStringField;
    tbVerifikasiBulan_Pensiun: TWideStringField;
    tbVerifikasiBulan_Pensiun_Bulan: TIntegerField;
    tbVerifikasiBulan_Pensiun_Tahun: TIntegerField;
    tbVerifikasiCalcBulanPensiun: TStringField;
    tbVerifikasiCalcKodePangkat: TIntegerField;
    cnAjendam: TADOConnection;
    qrVerCount: TADOQuery;
    dsVerCount: TDataSource;
    qrVerInvalid: TADOQuery;
    dsVerInvalid: TDataSource;
    tbVerHis: TADOTable;
    dsVerHis: TDataSource;
    qrDML: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure tbVerifikasiCalcFields(DataSet: TDataSet);
    procedure dsVerifikasiDataChange(Sender: TObject; Field: TField);
    procedure dsVerifikasiUpdateData(Sender: TObject);
    procedure dsVerifikasiStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure RefreshQuery;
    function ChangeDatePensToString(): String;
    function ChangeMonthPensToString(): String;
    function ChangePangkatToInt(): Integer;
  end;

var
  DataModuleAjendam: TDataModuleAjendam;

implementation

{$R *.dfm}

procedure TDataModuleAjendam.DataModuleCreate(Sender: TObject);
begin
  cnAjendam.Open('', '');
end;

procedure TDataModuleAjendam.DataModuleDestroy(Sender: TObject);
begin
  cnAjendam.Close;
end;

procedure TDataModuleAjendam.dsVerifikasiDataChange(Sender: TObject;
  Field: TField);
begin
  RefreshQuery;
end;

procedure TDataModuleAjendam.dsVerifikasiStateChange(Sender: TObject);
begin
  RefreshQuery;
end;

procedure TDataModuleAjendam.dsVerifikasiUpdateData(Sender: TObject);
begin
  RefreshQuery;
end;

procedure TDataModuleAjendam.tbVerifikasiCalcFields(DataSet: TDataSet);
begin
  tbVerifikasi.FieldValues['CalcTanggalPensiun'] := ChangeDatePensToString;
  tbVerifikasi.FieldValues['CalcBulanPensiun'] := ChangeMonthPensToString;
  tbVerifikasi.FieldValues['CalcKodePangkat'] := ChangePangkatToInt;
end;

function TDataModuleAjendam.ChangeDatePensToString : String;
var myYear, myMonth, myDay: Word;
    tdt: TDateTime;
    idMonth: String;
begin
  tdt := DataModuleAjendam.tbVerifikasi.FieldByName('Tanggal_Pensiun').AsDateTime;
  DecodeDate(tdt, myYear, myMonth, myDay);
  case myMonth of
     1: idMonth := 'Januari';
     2: idMonth := 'Februari';
     3: idMonth := 'Maret';
     4: idMonth := 'April';
     5: idMonth := 'Mei';
     6: idMonth := 'Juni';
     7: idMonth := 'Juli';
     8: idMonth := 'Agustus';
     9: idMonth := 'September';
     10: idMonth := 'Oktober';
     11: idMonth := 'November';
     12: idMonth := 'Desember';
  end;
  Result := IntToStr(myDay) + ' ' + idMonth + ' ' + IntToStr(myYear);
end;

function TDataModuleAjendam.ChangeMonthPensToString;
var sBulan, sTahun: String;
    iBulan, iTahun: Integer;
begin
  iBulan := DataModuleAjendam.tbVerifikasi.FieldByName('Bulan_Pensiun_Bulan').AsInteger;
  iTahun := DataModuleAjendam.tbVerifikasi.FieldByName('Bulan_Pensiun_Tahun').AsInteger;
  case iBulan of
     1: sBulan := 'Januari';
     2: sBulan := 'Februari';
     3: sBulan := 'Maret';
     4: sBulan := 'April';
     5: sBulan := 'Mei';
     6: sBulan := 'Juni';
     7: sBulan := 'Juli';
     8: sBulan := 'Agustus';
     9: sBulan := 'September';
     10: sBulan := 'Oktober';
     11: sBulan := 'November';
     12: sBulan := 'Desember';
  end;
  sTahun := IntToStr(iTahun);
  Result := sBulan + ' ' + sTahun;
end;

function TDataModuleAjendam.ChangePangkatToInt;
var sPangkat: String; iPangkat: Integer;
begin
  sPangkat := DataModuleAjendam.tbVerifikasi.FieldByName('Pangkat').AsString;
  if AnsiStartsStr('Kolonel', sPangkat) then iPangkat := 83
  else if AnsiStartsStr('Letkol', sPangkat) then iPangkat := 82
  else if AnsiStartsStr('Mayor', sPangkat) then iPangkat := 81
  else if AnsiStartsStr('Kapten', sPangkat) then iPangkat := 73
  else if AnsiStartsStr('Lettu', sPangkat) then iPangkat := 72
  else if AnsiStartsStr('Letda', sPangkat) then iPangkat := 71
  else if AnsiStartsStr('Peltu', sPangkat) then iPangkat := 66
  else if AnsiStartsStr('Pelda', sPangkat) then iPangkat := 65
  else if AnsiStartsStr('Serma', sPangkat) then iPangkat := 64
  else if AnsiStartsStr('Serka', sPangkat) then iPangkat := 63
  else if AnsiStartsStr('Sertu', sPangkat) then iPangkat := 62
  else if AnsiStartsStr('Serda', sPangkat) then iPangkat := 61
  else if AnsiStartsStr('Kopka', sPangkat) then iPangkat := 56
  else if AnsiStartsStr('Koptu', sPangkat) then iPangkat := 55
  else if AnsiStartsStr('Kopda', sPangkat) then iPangkat := 54
  else if AnsiStartsStr('Praka', sPangkat) then iPangkat := 53
  else if AnsiStartsStr('Pratu', sPangkat) then iPangkat := 52
  else if AnsiStartsStr('Prada', sPangkat) then iPangkat := 51
  else iPangkat := 0;
  Result := iPangkat;
end;

procedure TDataModuleAjendam.RefreshQuery;
begin
  qrVerCount.Close;
  qrVerCount.Open;

  qrVerInvalid.Close;
  qrVerInvalid.Open;
end;

end.
