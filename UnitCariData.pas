unit UnitCariData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, dbf, Grids, DBGrids, ADODB, FMTBcd, SqlExpr, StrUtils,
  DBCtrls;

type
  TFormCariData = class(TForm)
    dbfSource: TDbf;
    dsSource: TDataSource;
    edPath: TEdit;
    dbGridSource: TDBGrid;
    ButtonLoadData: TButton;
    LabelSearchNRP: TLabel;
    EditCariNRP: TEdit;
    LabelSourceRecordCount: TLabel;
    SourceRecordCount: TLabel;
    ButtonCopyData: TButton;
    dsVerifikasi: TDataSource;
    LabelTargetRecordCount: TLabel;
    TargetRecordCount: TLabel;
    ButtonClearData: TButton;
    LabelCariNama: TLabel;
    EditCariNama: TEdit;
    DBGrid1: TDBGrid;
    cnAjendam: TADOConnection;
    tbVerifikasi: TADOTable;
    tbInvalid: TADOTable;
    dsInvalid: TDataSource;
    Label1: TLabel;
    DBText1: TDBText;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure ButtonLoadDataClick(Sender: TObject);
    procedure EditCariNRPChange(Sender: TObject);
    procedure ButtonCopyDataClick(Sender: TObject);
    procedure ButtonClearDataClick(Sender: TObject);
    procedure dsVerifikasiDataChange(Sender: TObject; Field: TField);
    procedure dsSourceDataChange(Sender: TObject; Field: TField);
    procedure EditCariNamaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure SearchNRP;
    procedure SearchNama;
    procedure LoadData;
    procedure CloseData;
  public
    { Public declarations }
  end;

var
  FormCariData: TFormCariData;

implementation

{$R *.dfm}

procedure TFormCariData.Button1Click(Sender: TObject);
var
  openDialog: topendialog;
begin
  openDialog := topendialog.Create(self);
  openDialog.InitialDir := GetCurrentDir + '\data';
  openDialog.Options := [ofFileMustExist];
  openDialog.Filter := 'dBase File|*.dbf';
  openDialog.FilterIndex := 1;
  if openDialog.Execute then
  begin
    edPath.Text := openDialog.FileName;
    LoadData;
  end;

  // Free up the dialog
  openDialog.Free;
end;

procedure TFormCariData.ButtonClearDataClick(Sender: TObject);
var buttonSelected: Integer;
begin
  buttonSelected := MessageDlg('Apakah anda yakin akan menghapus data ini?', mtConfirmation, mbYesNo, 0);

  if buttonSelected = mrYes then
  begin
    // Delete All Data
    tbVerifikasi.First;
    while not tbVerifikasi.Eof do
    begin
      tbVerifikasi.Delete;
    end;
  end;
end;

procedure TFormCariData.ButtonCopyDataClick(Sender: TObject);
var i: Integer;
    tdt: TDateTime;
    myYear, myMonth, myDay: Word;
    sPangkat, idMonth, sTglPensiun: String;
    iPangkat : Integer;
    List: TStrings;
begin
  try
    if tbVerifikasi.RecordCount < 100 then
    begin
      tbVerifikasi.Insert;
      tbVerifikasi.FieldByName('NRP').Value := dbfSource.FieldByName('NRP1').AsString;
      tbVerifikasi.FieldByName('Nama').Value := dbfSource.FieldByName('NAMA').AsString;
      tbVerifikasi.FieldByName('Pangkat').Value := dbfSource.FieldByName('PANGKAT').AsString;
      tbVerifikasi.FieldByName('Kesatuan').Value := dbfSource.FieldByName('KESATUAN').AsString;
      tbVerifikasi.FieldByName('No_SKEP').Value := dbfSource.FieldByName('SKEP_PENS').AsString;
      //////////////////////////////////////////////////////////////////////////
      sTglPensiun := dbfSource.FieldByName('BLN_PENS1').AsString;
      try
        myDay := StrToInt(Copy(sTglPensiun, 1,2));
      except
        myDay := 0;
      end;
      try
        myMonth := StrToInt(Copy(sTglPensiun, 4,2));
      except
        myMonth := 0;
      end;
      try
        myYear := StrToInt(Copy(sTglPensiun, 7,4));
      except
        myMonth := 0;
      end;

      tbVerifikasi.FieldByName('Bulan_Pensiun_Bulan').Value := myMonth;
      tbVerifikasi.FieldByName('Bulan_Pensiun_Tahun').Value := myYear;

      sTglPensiun := dbfSource.FieldByName('BLN_PENS').AsString;
      tbVerifikasi.FieldByName('Bulan_Pensiun').Value := sTglPensiun;
      ////////////////////////////////////////////////////////////////////////////
      sTglPensiun := dbfSource.FieldByName('TGL_PENS').AsString;
      if ((Length(sTglPensiun) = 0)) then
      begin
        // do nothing
      end
      else
      begin
        List := TStringList.Create;
        ExtractStrings([' '],[], PChar(sTglPensiun), List);
        myDay := StrToInt(List[0]);
        myYear := StrToInt(List[2]);
        idMonth := List[1];
        if(idMonth = 'Januari') then myMonth := 1
        else if(idMonth = 'Februari') OR (idMonth = 'Pebruari') then myMonth := 2
        else if(idMonth = 'Maret') then myMonth := 3
        else if(idMonth = 'April') then myMonth := 4
        else if(idMonth = 'Mei') then myMonth := 5
        else if(idMonth = 'Juni') then myMonth := 6
        else if(idMonth = 'Juli') then myMonth := 7
        else if(idMonth = 'Agustus') then myMonth := 8
        else if(idMonth = 'September') then myMonth := 9
        else if(idMonth = 'Oktober') then myMonth := 10
        else if(idMonth = 'November') or (idMonth = 'Nopember') then myMonth := 11
        else if(idMonth = 'Desember') then myMonth := 12;
        tdt := EncodeDate(myYear, myMonth, myDay);
        tbVerifikasi.FieldByName('Tanggal_Pensiun').Value := tdt;
        tbVerifikasi.FieldByName('Tanggal_Pensiun_Indonesia').Value := sTglPensiun;
        List.Free;
      end;
      List := nil;
      //////////////////////////////////////////////////////////////////////////
      sPangkat := tbVerifikasi.FieldByName('Pangkat').AsString;
      if AnsiStartsStr('Kolonel', sPangkat) then iPangkat := 83;
      if AnsiStartsStr('Letkol', sPangkat) then iPangkat := 82;
      if AnsiStartsStr('Mayor', sPangkat) then iPangkat := 81;
      if AnsiStartsStr('Kapten', sPangkat) then iPangkat := 73;
      if AnsiStartsStr('Lettu', sPangkat) then iPangkat := 72;
      if AnsiStartsStr('Letda', sPangkat) then iPangkat := 71;
      if AnsiStartsStr('Peltu', sPangkat) then iPangkat := 66;
      if AnsiStartsStr('Pelda', sPangkat) then iPangkat := 65;
      if AnsiStartsStr('Serma', sPangkat) then iPangkat := 64;
      if AnsiStartsStr('Serka', sPangkat) then iPangkat := 63;
      if AnsiStartsStr('Sertu', sPangkat) then iPangkat := 62;
      if AnsiStartsStr('Serda', sPangkat) then iPangkat := 61;
      if AnsiStartsStr('Kopka', sPangkat) then iPangkat := 56;
      if AnsiStartsStr('Koptu', sPangkat) then iPangkat := 55;
      if AnsiStartsStr('Kopda', sPangkat) then iPangkat := 54;
      if AnsiStartsStr('Praka', sPangkat) then iPangkat := 53;
      if AnsiStartsStr('Pratu', sPangkat) then iPangkat := 52;
      if AnsiStartsStr('Prada', sPangkat) then iPangkat := 51;
      tbVerifikasi.FieldValues['Kode_Pangkat'] := iPangkat;
      ////////////////////////////////////////////////////////////////////////////
      tbVerifikasi.Post;
      tbVerifikasi.Next;
      tbInvalid.Close;
      tbInvalid.Open;
    end
    else
      ShowMessage('Data telah penuh atau telah mencapai 100 data.'+#13#10+' Kosongkan data terlebih dahulu jika ingin melanjutkan.');
  except
    on E : Exception do
    begin
      if (AnsiContainsStr(E.Message, 'duplicate')) then
        showMessage('Data sudah ada')
      else
        showMessage('Terjadi kesalahan yang belum diketahui');
      tbVerifikasi.Cancel;
    end;
  end;
end;

procedure TFormCariData.ButtonLoadDataClick(Sender: TObject);
begin
  if ButtonLoadData.Caption = 'Load Data' then
  begin
    LoadData;
  end
  else
  begin
    CloseData;
  end;
end;

procedure TFormCariData.dsSourceDataChange(Sender: TObject; Field: TField);
begin
  SourceRecordCount.Caption := IntToStr(dbfSource.RecordCount);
end;

procedure TFormCariData.dsVerifikasiDataChange(Sender: TObject; Field: TField);
begin
  TargetRecordCount.Caption := IntToStr(tbVerifikasi.RecordCount);
end;

procedure TFormCariData.EditCariNamaChange(Sender: TObject);
begin
  SearchNama;
end;

procedure TFormCariData.EditCariNRPChange(Sender: TObject);
begin
  SearchNRP;
end;

procedure TFormCariData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  dbfSource.Close;
  cnAjendam.Close;
  ButtonLoadData.Caption := 'Load Data';
  SourceRecordCount.Caption := '0';
  TargetRecordCount.Caption := '0';
end;

procedure TFormCariData.FormCreate(Sender: TObject);
begin
  edPath.Text := GetCurrentDir + '\data\DATAA.dbf';
end;

procedure TFormCariData.LoadData;
begin
  dbfSource.Close;
  dbfSource.FilePath := ExtractFilePath(edPath.Text);
  dbfSource.TableName := ExtractFileName(edPath.Text);
  dbfSource.Open;

  cnAjendam.Open('', '');
  tbVerifikasi.Open;
  tbInvalid.Open;

  ButtonCopyData.Enabled := True;
  ButtonClearData.Enabled := True;
  EditCariNRP.Enabled := True;
  EditCariNama.Enabled := True;

  ButtonLoadData.Caption := 'Close Data';
end;

procedure TFormCariData.CloseData;
begin
  dbfSource.Close;

  cnAjendam.Close;
  tbVerifikasi.Close;
  tbInvalid.Close;

  ButtonCopyData.Enabled := False;
  ButtonClearData.Enabled := False;
  EditCariNRP.Enabled := False;
  EditCariNama.Enabled := False;

  ButtonLoadData.Caption := 'Load Data';
  SourceRecordCount.Caption := '0';
  TargetRecordCount.Caption := '0';
end;

procedure TFormCariData.SearchNRP;
var
  Options: TLocateOptions;
begin
  Options := [loPartialKey, loCaseInsensitive];
  dbfSource.Locate('NRP1', EditCariNRP.text, Options);
end;

procedure TFormCariData.SearchNama;
var
  Options: TLocateOptions;
begin
  Options := [loPartialKey, loCaseInsensitive];
  dbfSource.Locate('NAMA', EditCariNama.text, Options);
end;

end.
