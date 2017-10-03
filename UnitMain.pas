unit UnitMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dbf, Grids, DBGrids, StdCtrls, Mask, DBCtrls, Buttons, ExtCtrls,
  frxClass, frxDBSet, frxExportRTF, frxExportXML, frxExportXLS, frxExportPDF,
  comobj, ADODB, rxToolEdit, RXDBCtrl, jpeg;

type
  TFormMain = class(TForm)
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
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    btnLoad: TButton;
    btnSearch: TButton;
    DBText2: TDBText;
    DBDateEdit1: TDBDateEdit;
    lbInvalid: TLabel;
    DBText3: TDBText;
    Label6: TLabel;
    Image1: TImage;
    Label7: TLabel;
    Button1: TButton;
    Button2: TButton;
    DBEdit6: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label8: TLabel;
    btnExport: TButton;
    btnImport: TButton;
    DBText1: TDBText;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LoadData;
    procedure CloseData;
    procedure UpdateData;
    procedure GridToWord(Grid: TDBGrid; FormatNum: integer);

  var
    XlApp, XlBook, XlSheet, XlSheets, Range, chat: Variant;
    WApp, MSWord: Variant;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses UnitCariData, UnitDataModule;
{$R *.dfm}

procedure TFormMain.btnExportClick(Sender: TObject);
var petugas: String;
    historyID: Integer;
begin
  if DataModuleAjendam.tbVerifikasi.Active then
  begin
    repeat
      petugas := InputBox('Export Data', 'Masukkan Nama Petugas', '');
    until petugas <> '';

    with DataModuleAjendam do
    begin
      tbHistory.Open;
      tbHistory.Insert;
      tbHistory.FieldValues['petugas'] := petugas;
      tbHistory.FieldValues['tanggal'] := Now;
      tbHistory.Post;
      historyID := tbHistory.FieldByName('ID').AsInteger;
      tbHistory.Close;

      ShowMessage('new ID: ' + IntToStr(historyID));

      tbVerHis.Open;
      tbVerifikasi.First;
      while not tbVerifikasi.Eof do
      begin
        tbVerHis.Insert;
        tbVerHis.FieldValues['History_ID'] := historyID;
        tbVerHis.FieldValues['NRP'] := tbVerifikasi.FieldByName('NRP').AsString;
        tbVerHis.FieldValues['Nama'] := tbVerifikasi.FieldByName('Nama').AsString;
        tbVerHis.FieldValues['Kode_Pangkat'] := tbVerifikasi.FieldByName('Kode_Pangkat').AsInteger;
        tbVerHis.FieldValues['Pangkat'] := tbVerifikasi.FieldByName('Pangkat').AsString;
        tbVerHis.FieldValues['Kesatuan'] := tbVerifikasi.FieldByName('Kesatuan').AsString;
        tbVerHis.FieldValues['No_SKEP'] := tbVerifikasi.FieldByName('No_SKEP').AsString;
        tbVerHis.FieldValues['Tanggal_Pensiun'] := tbVerifikasi.FieldByName('Tanggal_Pensiun').AsDateTime;
        tbVerHis.FieldValues['Tanggal_Pensiun_Indonesia'] := tbVerifikasi.FieldByName('Tanggal_Pensiun_Indonesia').AsString;
        tbVerHis.FieldValues['Bulan_Pensiun'] := tbVerifikasi.FieldByName('Bulan_Pensiun').AsString;
        tbVerHis.FieldValues['Bulan_Pensiun_Bulan'] := tbVerifikasi.FieldByName('Bulan_Pensiun_Bulan').AsInteger;
        tbVerHis.FieldValues['Bulan_Pensiun_Tahun'] := tbVerifikasi.FieldByName('Bulan_Pensiun_Tahun').AsInteger;
        tbVerHis.Post;
        tbVerifikasi.Next;
      end;
      tbVerHis.Close;
    end;
  end
  else
  begin
    ShowMessage('Data masih kosong, klik Load Data terlebih dahulu.');
  end;
end;

procedure TFormMain.btnLoadClick(Sender: TObject);
begin
  if btnLoad.Caption = 'Load Data' then
  begin
    LoadData;
  end
  else
  begin
    CloseData;
  end;
end;

procedure TFormMain.btnSearchClick(Sender: TObject);
begin
  CloseData;
  FormCariData.show;
end;


///////////////////////////// INACTIVE /////////////////////////////
procedure TFormMain.Button1Click(Sender: TObject);
var WordApp, Doc: Variant;
begin
  WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := True;
  Doc := WordApp.Documents.Open(GetCurrentDir + '\1_VERI BANDUNG.doc');
end;

procedure TFormMain.Button2Click(Sender: TObject);
var WordApp, Doc: Variant;
begin
  WordApp := CreateOleObject('Word.Application');
  WordApp.Visible := True;
  Doc := WordApp.Documents.Open(GetCurrentDir + '\2_VERI DOSIR.doc');
end;

procedure TFormMain.Button6Click(Sender: TObject);
begin
  DataModuleAjendam.frxReport1.PrepareReport(true);
  DataModuleAjendam.frxReport1.Export(DataModuleAjendam.frxPDFExport1);
end;

procedure TFormMain.Button7Click(Sender: TObject);
begin
  DataModuleAjendam.frxReport1.ShowReport(true);
end;

procedure TFormMain.Button8Click(Sender: TObject);
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
  DataModuleAjendam.tbVerifikasi.First;
  x := 1;
  while not DataModuleAjendam.tbVerifikasi.Eof do
  begin
    for i := 0 to DBGrid1.FieldCount - 1 do
    begin
      XlSheet.cells[2 + x, i + 1].Value := DBGrid1.Fields[i].AsString;
    end;
    DataModuleAjendam.tbVerifikasi.Next;
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

procedure TFormMain.Button9Click(Sender: TObject);
begin
  GridToWord(DBGrid1, 42);
end;

procedure TFormMain.GridToWord(Grid: TDBGrid; FormatNum: integer);
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
///////////////////////////// END OF INACTIVE /////////////////////////////

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CloseData;
end;

procedure TFormMain.LoadData;
begin
  //cnAjendam.Open('', '');
  with DataModuleAjendam do
  begin
    tbBulan.Open;
    tbVerifikasi.Open;
    qrVerCount.Open;
    qrVerInvalid.Open;
  end;

  btnLoad.Caption := 'Close Data';
end;

procedure TFormMain.CloseData;
begin
  UpdateData;

  with DataModuleAjendam do
  begin
    tbBulan.Close;
    tbVerifikasi.Close;
    qrVerCount.Close;
    qrVerInvalid.Close;
  end;

  btnLoad.Caption := 'Load Data';
end;

procedure TFormMain.UpdateData;
begin
  with DataModuleAjendam do
  begin
    try
      if tbVerifikasi.Active then
      begin
        tbVerifikasi.First;
        while not tbVerifikasi.Eof do
        begin
          tbVerifikasi.Edit;
          tbVerifikasi.FieldValues['Tanggal_Pensiun_Indonesia'] := ChangeDatePensToString;
          tbVerifikasi.FieldValues['Bulan_Pensiun'] := ChangeMonthPensToString;
          tbVerifikasi.FieldValues['Kode_Pangkat'] := ChangePangkatToInt;
          tbVerifikasi.Post;
          tbVerifikasi.Next;
        end;
      end;
    except
      // do nothing
    end;
  end;
end;

end.
