unit DataModule;

interface

uses
  SysUtils, Classes, DB, ADODB, frxClass, frxDBSet, frxExportRTF, frxExportXLS,
  frxExportPDF;

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
    dsInvalid: TDataSource;
    tbInvalid: TADOTable;
    dsVerifikasiUrut: TDataSource;
    tbVerifikasiUrut: TADOTable;
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
    cnAjendam: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleAjendam: TDataModuleAjendam;

implementation

{$R *.dfm}

end.
