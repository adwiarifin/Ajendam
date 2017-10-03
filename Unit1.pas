unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dbf, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
  StrUtils,
  frxClass, frxDBSet, frxExportRTF, frxExportXML, frxExportXLS, frxExportPDF,
  comobj,
  ADODB, rxToolEdit, RXDBCtrl, jpeg;

type
  TForm1 = class(TForm)
    dsVerifikasiUrut: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    lblNRP: TLabel;
    lblNama: TLabel;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBNavigator1: TDBNavigator;
    frxRTFExport1: TfrxRTFExport;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    Button6: TButton;
    Button7: TButton;
    frxXLSExport1: TfrxXLSExport;
    frxPDFExport1: TfrxPDFExport;
    Button8: TButton;
    Button9: TButton;
    btnLoad: TButton;
    btnSearch: TButton;
    cnAjendam: TADOConnection;
    tbVerifikasiUrut: TADOTable;
    DBText2: TDBText;
    DBDateEdit1: TDBDateEdit;
    lbInvalid: TLabel;
    DBText3: TDBText;
    tbInvalid: TADOTable;
    dsInvalid: TDataSource;
    Label6: TLabel;
    Image1: TImage;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBEdit6: TDBEdit;
    tbBulan: TADOTable;
    dsBulan: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    Label9: TLabel;
    tbVerifikasiUrutCalcTanggalPensiun: TStringField;
    tbVerifikasiUrutID: TAutoIncField;
    tbVerifikasiUrutNRP: TWideStringField;
    tbVerifikasiUrutNama: TWideStringField;
    tbVerifikasiUrutKode_Pangkat: TSmallintField;
    tbVerifikasiUrutPangkat: TWideStringField;
    tbVerifikasiUrutKesatuan: TWideStringField;
    tbVerifikasiUrutNo_SKEP: TWideStringField;
    tbVerifikasiUrutTanggal_Pensiun: TDateTimeField;
    tbVerifikasiUrutTanggal_Pensiun_Indonesia: TWideStringField;
    tbVerifikasiUrutBulan_Pensiun: TWideStringField;
    tbVerifikasiUrutBulan_Pensiun_Bulan: TIntegerField;
    tbVerifikasiUrutBulan_Pensiun_Tahun: TIntegerField;
    tbVerifikasiUrutCalcBulanPensiun: TStringField;
    tbVerifikasiUrutCalcKodePangkat: TIntegerField;
    btnExport: TButton;
    btnImport: TButton;
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure dsVerifikasiUrutUpdateData(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
    procedure dsVerifikasiUrutDataChange(Sender: TObject; Field: TField);
    procedure tbVerifikasiUrutCalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LoadData;
    procedure CloseData;
    procedure RefreshInvalid;
    procedure UpdateData;
    procedure GridToWord(Grid: TDBGrid; FormatNum: integer);
    function ChangeDatePensToString(): String;
    function ChangeMonthPensToString(): String;
    function ChangePangkatToInt(): Integer;
  var
    XlApp, XlBook, XlSheet, XlSheets, Range, chat: Variant;
    WApp, MSWord: Variant;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2;
{$R *.dfm}

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  if Button10.Caption = 'Load Data' then
  begin
    LoadData;
  end
  else
  begin
    CloseData;
  end;
end;

procedure TForm1.btnSearchClick(Sender: TObject);
begin
  CloseData;
  Form2.show;
end;

procedure TForm1.Button1Click(Sender: TObject);
var WordApp, Doc: Variant;
begin
  WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := True;
  Doc := WordApp.Documents.Open(GetCurrentDir + '\1_VERI BANDUNG.doc');
end;

procedure TForm1.Button2Click(Sender: TObject);
var WordApp, Doc: Variant;
begin
  WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := True;
  Doc := WordApp.Documents.Open(GetCurrentDir + '\2_VERI DOSIR.doc');
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  frxReport1.PrepareReport(true);
  frxReport1.Export(frxPDFExport1);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  frxReport1.ShowReport(true);
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  i, x: integer;
  sfile: string;
begin
  // buka excel
  XlApp := CreateOleObject('Excel.Application');
  // tambahkan workbook
  XlBook := XlApp.WorkBooks.Add;
  // tambahkan worksheet
  XlSheet := XlBook.worksheets.Add;
  // cetak header field dari dbgrid
  for i := 0 to DBGrid1.FieldCount - 1 do
  begin
    XlSheet.cells[2, i + 1].Value := DBGrid1.columns[i].Title.Caption;
  end;

  // transfer data ke excel
  tbVerifikasiUrut.First;
  x := 1;
  while not tbVerifikasiUrut.Eof do
  begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    begin
      XlSheet.cells[2 + x, i + 1].Value := DBGrid1.Fields[i].AsString;
    end;
    tbVerifikasiUrut.Next;
    inc(x);
  end;

  if MessageDlg('Apakah hasil export ditampilkan..?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    MessageDlg('Hasil Ditampilkan', mtInformation, [mbOk], 0);
    XlApp.visible := true;
  end
  else
  // simpan ke file
  begin
    sfile := InputBox('Nama File', 'hasil export',
      GetCurrentDir + '\data\hasil.xls');
    XlApp.ActiveWorkbook.SaveAs(sfile);
    XlApp.visible := true;
  end
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  GridToWord(DBGrid1, 42);
end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  case Button of
    nbFirst: ;
    nbPrior: ;
    nbNext: ;
    nbLast: ;
    nbInsert: ;//begin tbVerifikasiUrut.Cancel; showMessage('Penambahan tidak diijinkan, silahkan gunakan fitur Copy Data'); end;
    nbDelete: ;
    nbEdit: ;
    nbPost: ;
    nbCancel: ;
    nbRefresh: ;
  end;
end;

procedure TForm1.dsVerifikasiUrutDataChange(Sender: TObject; Field: TField);
begin
  RefreshInvalid;
  Label9.Caption := IntToStr(tbVerifikasiUrut.RecordCount);
end;

procedure TForm1.dsVerifikasiUrutUpdateData(Sender: TObject);
begin
  RefreshInvalid;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseData;
end;

procedure TForm1.GridToWord(Grid: TDBGrid; FormatNum: integer);
var
  x: integer;
  y: integer;
  Word: Olevariant;
  GColCount: integer;
  GRowCount: integer;
begin
  Word := CreateOleObject('Word.Application');
  Word.visible := true;
  Word.Documents.Add;
  GColCount := Grid.columns.Count;
  GRowCount := Grid.DataSource.DataSet.RecordCount;
  Word.ActiveDocument.Range.Font.Size := Grid.Font.Size;
  Word.ActiveDocument.PageSetup.Orientation := 1;
  Word.ActiveDocument.Tables.Add(Word.ActiveDocument.Range, GRowCount + 1,
    GColCount);
  Word.ActiveDocument.Range.InsertAfter('Date ' + Datetimetostr(Now));
  Word.ActiveDocument.Range.Tables.Item(1).AutoFormat
    (FormatNum, 1, 1, 1, 1, 1, 0, 0, 0, 1);

  for y := 1 to GColCount do
    Word.ActiveDocument.Tables.Item(1).Cell(1, y).Range.InsertAfter
      (Grid.columns[y - 1].Title.Caption);

  x := 1;
  with Grid.DataSource.DataSet do
  begin
    First;
    while not Eof do
    begin
      x := x + 1;
      for y := 1 to GColCount do
        Word.ActiveDocument.Tables.Item(1).Cell(x, y).Range.InsertAfter
          (FieldByName(Grid.columns[y - 1].FieldName).AsString);
      Next;
    end;
  end;
  Word.ActiveDocument.Range.Tables.Item(1).UpdateAutoFormat;
end;

procedure TForm1.LoadData;
begin
  cnAjendam.Open('', '');
  tbBulan.Open;
  tbInvalid.Open;
  tbVerifikasiUrut.Open;

  Button10.Caption := 'Close Data';
end;

procedure TForm1.CloseData;
begin
  UpdateData;

  tbBulan.Close;
  tbInvalid.Close;
  tbVerifikasiUrut.Close;

  cnAjendam.Close;

  Button10.Caption := 'Load Data';
end;

procedure TForm1.UpdateData;
begin
  try
    if tbVerifikasiUrut.Active then
    begin
      tbVerifikasiUrut.First;
      while not tbVerifikasiUrut.Eof do
      begin
        tbVerifikasiUrut.Edit;
        tbVerifikasiUrut.FieldValues['Tanggal_Pensiun_Indonesia'] := ChangeDatePensToString;
        tbVerifikasiUrut.FieldValues['Bulan_Pensiun'] := ChangeMonthPensToString;
        tbVerifikasiUrut.FieldValues['Kode_Pangkat'] := ChangePangkatToInt;
        tbVerifikasiUrut.Post;
        tbVerifikasiUrut.Next;
      end;
    end;
  except
    // do nothing
  end;
end;

procedure TForm1.RefreshInvalid;
begin
  tbInvalid.Close;
  tbInvalid.Open;
end;

procedure TForm1.tbVerifikasiUrutCalcFields(DataSet: TDataSet);
begin
  tbVerifikasiUrut.FieldValues['CalcTanggalPensiun'] := ChangeDatePensToString;
  tbVerifikasiUrut.FieldValues['CalcBulanPensiun'] := ChangeMonthPensToString;
  tbVerifikasiUrut.FieldValues['CalcKodePangkat'] := ChangePangkatToInt;
end;

function TForm1.ChangeDatePensToString : String;
var myYear, myMonth, myDay: Word;
    tdt: TDateTime;
    idMonth: String;
begin
  tdt := tbVerifikasiUrut.FieldByName('Tanggal_Pensiun').AsDateTime;
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

function TForm1.ChangeMonthPensToString;
var sBulan, sTahun: String;
    iBulan, iTahun: Integer;
begin
  iBulan := tbVerifikasiUrut.FieldByName('Bulan_Pensiun_Bulan').AsInteger;
  iTahun := tbVerifikasiUrut.FieldByName('Bulan_Pensiun_Tahun').AsInteger;
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

function TForm1.ChangePangkatToInt;
var sPangkat: String; iPangkat: Integer;
begin
  sPangkat := tbVerifikasiUrut.FieldByName('Pangkat').AsString;
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

end.
