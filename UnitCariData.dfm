object FormCariData: TFormCariData
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Cari Data'
  ClientHeight = 577
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelSearchNRP: TLabel
    Left = 8
    Top = 48
    Width = 46
    Height = 13
    Caption = 'Cari NRP:'
  end
  object LabelSourceRecordCount: TLabel
    Left = 8
    Top = 556
    Width = 66
    Height = 13
    Caption = 'Jumlah Data: '
  end
  object LabelTargetRecordCount: TLabel
    Left = 400
    Top = 556
    Width = 66
    Height = 13
    Caption = 'Jumlah Data: '
  end
  object LabelCariNama: TLabel
    Left = 200
    Top = 48
    Width = 56
    Height = 13
    Caption = 'Cari Nama: '
  end
  object Label1: TLabel
    Left = 648
    Top = 556
    Width = 65
    Height = 13
    Caption = 'Data Invalid: '
  end
  object DBText1: TDBText
    Left = 711
    Top = 556
    Width = 65
    Height = 17
    DataField = 'Result'
    DataSource = DataModuleAjendam.dsVerInvalid
  end
  object Label2: TLabel
    Left = 400
    Top = 8
    Width = 320
    Height = 78
    Caption = 
      'Petunjuk:'#13#10'1. Pilih alamat dBase (.DBF) pada kolom di samping ki' +
      'ri ini.'#13#10'2. Click Load Data'#13#10'3. Masukkan NRP pada kolom Cari NRP' +
      #13#10'4. Click [Copy Data] untuk memasukkan data pada daftar verifik' +
      'asi'#13#10'nb: tombol [Clear Data] berfungsi untuk menghapus data.'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 99
    Height = 13
    Caption = 'Alamat dBase (.DBF)'
  end
  object SourceRecordCount: TLabel
    Left = 76
    Top = 556
    Width = 6
    Height = 13
    Caption = '0'
  end
  object DBText2: TDBText
    Left = 464
    Top = 556
    Width = 65
    Height = 17
    DataField = 'Result'
    DataSource = DataModuleAjendam.dsVerCount
  end
  object edPath: TEdit
    Left = 113
    Top = 8
    Width = 232
    Height = 21
    TabOrder = 0
  end
  object dbGridSource: TDBGrid
    Left = 8
    Top = 131
    Width = 377
    Height = 419
    DataSource = dsSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NRP1'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PANGKAT'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NAMA'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BLN_PENS'
        Width = 100
        Visible = True
      end>
  end
  object ButtonLoadData: TButton
    Left = 8
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Load Data'
    TabOrder = 2
    OnClick = ButtonLoadDataClick
  end
  object EditCariNRP: TEdit
    Left = 60
    Top = 45
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 3
    OnChange = EditCariNRPChange
  end
  object ButtonCopyData: TButton
    Left = 400
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Copy Data'
    Enabled = False
    TabOrder = 4
    OnClick = ButtonCopyDataClick
  end
  object ButtonClearData: TButton
    Left = 481
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Clear Data'
    Enabled = False
    TabOrder = 5
    OnClick = ButtonClearDataClick
  end
  object EditCariNama: TEdit
    Left = 262
    Top = 45
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 6
    OnChange = EditCariNamaChange
  end
  object DBGrid1: TDBGrid
    Left = 399
    Top = 131
    Width = 377
    Height = 419
    DataSource = DataModuleAjendam.dsVerifikasi
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NRP'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pangkat'
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nama'
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bulan_Pensiun'
        Width = 100
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 351
    Top = 8
    Width = 33
    Height = 25
    Caption = '...'
    TabOrder = 8
    OnClick = Button1Click
  end
  object dbfSource: TDbf
    FilePath = 'D:\Project\Delphi Project\2010 DBF Reader\data\'
    IndexDefs = <>
    TableName = 'DATAA.dbf'
    TableLevel = 25
    Left = 40
    Top = 8
  end
  object dsSource: TDataSource
    DataSet = dbfSource
    Left = 8
    Top = 8
  end
end
