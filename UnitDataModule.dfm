object DataModuleAjendam: TDataModuleAjendam
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 427
  Width = 776
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 512
    Top = 16
  end
  object frxXLSExport1: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 480
    Top = 16
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PictureType = gpPNG
    Wysiwyg = True
    Creator = 'FastReport'
    SuppressPageHeadersFooters = False
    HeaderFooterMode = hfText
    AutoSize = False
    Left = 448
    Top = 16
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'KODE_PKT=KODE_PKT'
      'NO=NO'
      'NOMOR=NOMOR'
      'NOPANG=NOPANG'
      'PANGA=PANGA'
      'VERI=VERI'
      'A=A'
      'NAMA=NAMA'
      'TGL_LAHIR=TGL_LAHIR'
      'PANGKAT=PANGKAT'
      'KAT_AWAL=KAT_AWAL'
      'KD_KAT=KD_KAT'
      'NRP1=NRP1'
      'NRP2=NRP2'
      'KESATUAN=KESATUAN'
      'ALAMAT1=ALAMAT1'
      'ALAMAT2=ALAMAT2'
      'NAMA_ISTRI=NAMA_ISTRI'
      'HIR_ISTRI=HIR_ISTRI'
      'SRT_NIKAH=SRT_NIKAH'
      'TGL_NIKAH=TGL_NIKAH'
      'NO_KPI=NO_KPI'
      'TGL_KPI=TGL_KPI'
      'KARENA=KARENA'
      'ASAL_SKEP1=ASAL_SKEP1'
      'NO_SKEP1=NO_SKEP1'
      'TGL_SKEP1=TGL_SKEP1'
      'NO_URUT1=NO_URUT1'
      'TMT_HENTI1=TMT_HENTI1'
      'TMT_HENT2=TMT_HENT2'
      'ASAL_SKEP2=ASAL_SKEP2'
      'NO_SKEP2=NO_SKEP2'
      'TGL_SKEP2=TGL_SKEP2'
      'NO_URUT2=NO_URUT2'
      'TMT_HENTI2=TMT_HENTI2'
      'BLN_HENTI=BLN_HENTI'
      'BLN_PENS=BLN_PENS'
      'BLN_PENS1=BLN_PENS1'
      'TMT_PENS=TMT_PENS'
      'ASAL_KP=ASAL_KP'
      'NO_SKEP_KP=NO_SKEP_KP'
      'TGL_KEP_KP=TGL_KEP_KP'
      'NO_RUT_KP=NO_RUT_KP'
      'TMT_KP=TMT_KP'
      'ASAL_TNI=ASAL_TNI'
      'TMT_TNI1=TMT_TNI1'
      'TMT_TNI=TMT_TNI'
      'INPASING=INPASING'
      'MDK=MDK'
      'MDK1=MDK1'
      'MKG1=MKG1'
      'MKG=MKG'
      'MKS_THN=MKS_THN'
      'MKS_BLN=MKS_BLN'
      'GPT=GPT'
      'PG=PG'
      'PENS_POK1=PENS_POK1'
      'PENS_POK2=PENS_POK2'
      'PENS_POKOK=PENS_POKOK'
      'BULAT_POK=BULAT_POK'
      'PENS_WARI1=PENS_WARI1'
      'PENS_WARI=PENS_WARI'
      'NO1=NO1'
      'NAMA_NAK1=NAMA_NAK1'
      'HIR_NAK1=HIR_NAK1'
      'HUB_NAK1=HUB_NAK1'
      'USIA_NAK1=USIA_NAK1'
      'NO2=NO2'
      'NAMA_NAK2=NAMA_NAK2'
      'HIR_NAK2=HIR_NAK2'
      'HUB_NAK2=HUB_NAK2'
      'USIA_NAK2=USIA_NAK2'
      'NO3=NO3'
      'NAMA_NAK3=NAMA_NAK3'
      'HIR_NAK3=HIR_NAK3'
      'HUB_NAK3=HUB_NAK3'
      'USIA_NAK3=USIA_NAK3'
      'NO4=NO4'
      'NAMA_NAK4=NAMA_NAK4'
      'HIR_NAK4=HIR_NAK4'
      'HUB_NAK4=HUB_NAK4'
      'USIA_NAK4=USIA_NAK4'
      'TJ_NAK1A=TJ_NAK1A'
      'TJ_NAK1B=TJ_NAK1B'
      'TJ_NAK1=TJ_NAK1'
      'TJ_NAK2A=TJ_NAK2A'
      'TJ_NAK2B=TJ_NAK2B'
      'TJ_NAK2=TJ_NAK2'
      'TJ_NAK3A=TJ_NAK3A'
      'TJ_NAK3B=TJ_NAK3B'
      'TJ_NAK3=TJ_NAK3'
      'YP_NAK1A=YP_NAK1A'
      'YP_NAK1B=YP_NAK1B'
      'YP_NAK1=YP_NAK1'
      'YP_NAK2A=YP_NAK2A'
      'YP_NAK2B=YP_NAK2B'
      'YP_NAK2=YP_NAK2'
      'YP_NAK3A=YP_NAK3A'
      'YP_NAK3B=YP_NAK3B'
      'YP_NAK3=YP_NAK3'
      'BT_JASA=BT_JASA'
      'KA_DANSAT=KA_DANSAT'
      'KA_DANSAT2=KA_DANSAT2'
      'KACAB=KACAB'
      'KOTA=KOTA'
      'PEKAS=PEKAS'
      'MENERIMA=MENERIMA'
      'HASILAN=HASILAN'
      'NO_AGENDA=NO_AGENDA'
      'TGL_AGENDA=TGL_AGENDA'
      'OPERATOR=OPERATOR'
      'NAIK_PANG=NAIK_PANG'
      'TURUN_PANG=TURUN_PANG'
      'SKEP_PENS=SKEP_PENS'
      'TGL_PENS=TGL_PENS'
      'KOREM=KOREM'
      'PP=PP'
      'VERIA=VERIA'
      'PANG=PANG'
      'NAM=NAM'
      'TMT=TMT'
      'NOASABRI=NOASABRI'
      'NPWP=NPWP')
    DataSource = dsVerifikasi
    BCDToCurrency = False
    Left = 416
    Top = 16
  end
  object frxReport1: TfrxReport
    Version = '4.12.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42998.703667210600000000
    ReportOptions.LastChange = 42998.703667210600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 384
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object MasterData1: TfrxMasterData
        Height = 37.795300000000000000
        Top = 268.346630000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape7: TfrxShapeView
          Left = 831.496600000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape6: TfrxShapeView
          Left = 680.315400000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape5: TfrxShapeView
          Left = 529.134200000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape4: TfrxShapeView
          Left = 340.157700000000000000
          Width = 188.976500000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape3: TfrxShapeView
          Left = 188.976500000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape2: TfrxShapeView
          Left = 52.913420000000000000
          Width = 136.063080000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape1: TfrxShapeView
          Left = 11.338590000000000000
          Width = 41.574830000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object frxDBDataset1NAMA: TfrxMemoView
          Left = 52.913420000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NAMA'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NAMA"]')
        end
        object frxDBDataset1PANGKAT: TfrxMemoView
          Left = 188.976500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'PANGKAT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."PANGKAT"]')
        end
        object frxDBDataset1NRP1: TfrxMemoView
          Left = 188.976500000000000000
          Top = 18.897650000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NRP1'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NRP1"]')
        end
        object frxDBDataset1KESATUAN: TfrxMemoView
          Left = 340.157700000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'KESATUAN'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."KESATUAN"]')
        end
        object frxDBDataset1NO_SKEP1: TfrxMemoView
          Left = 532.913730000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'NO_SKEP1'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NO_SKEP1"]')
        end
        object frxDBDataset1BLN_PENS: TfrxMemoView
          Left = 835.276130000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'BLN_PENS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."BLN_PENS"]')
        end
        object frxDBDataset1TGL_PENS: TfrxMemoView
          Left = 684.094930000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'TGL_PENS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."TGL_PENS"]')
        end
        object Line: TfrxMemoView
          Left = 11.338590000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          HAlign = haRight
          Memo.UTF8W = (
            '[Line]')
        end
        object Shape8: TfrxShapeView
          Left = 982.677800000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Memo4: TfrxMemoView
          Left = 41.354360000000000000
          Width = 7.559060000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8W = (
            '.')
        end
      end
      object Header1: TfrxHeader
        Height = 226.771800000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 18.897650000000000000
          Top = 18.897650000000000000
          Width = 359.055350000000000000
          Height = 49.133890000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'KOMANDO DAERAH MILITER V/BRAWIJAYA'
            'AJUNDAN JENDERAL')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = 18.897650000000000000
          Top = 56.692950000000000000
          Width = 359.055350000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          Left = 340.157700000000000000
          Top = 105.826840000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            'DAFTAR VERIFIKASI KEPUTUSAN PENSIUN MANTAN PRAJURIT TNI AD')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 748.346940000000000000
          Top = 18.897650000000000000
          Width = 272.126160000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Lampiran Surat Kaajendam V/Brawijaya'
            'Nomor       B/                /                / 2015'
            'Tanggal                                           2015')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Left = 752.126470000000000000
          Top = 75.590600000000000000
          Width = 264.567100000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Shape9: TfrxShapeView
          Left = 831.496600000000000000
          Top = 170.078850000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape10: TfrxShapeView
          Left = 680.315400000000000000
          Top = 188.976500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Shape11: TfrxShapeView
          Left = 529.134200000000000000
          Top = 188.976500000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Shape12: TfrxShapeView
          Left = 340.157700000000000000
          Top = 170.078850000000000000
          Width = 188.976500000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape13: TfrxShapeView
          Left = 52.913420000000000000
          Top = 170.078850000000000000
          Width = 136.063080000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape14: TfrxShapeView
          Left = 11.338590000000000000
          Top = 170.078850000000000000
          Width = 41.574830000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape15: TfrxShapeView
          Left = 982.677800000000000000
          Top = 170.078850000000000000
          Width = 52.913420000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Shape16: TfrxShapeView
          Left = 188.976500000000000000
          Top = 170.078850000000000000
          Width = 151.181200000000000000
          Height = 37.795300000000000000
          ShowHint = False
        end
        object Memo5: TfrxMemoView
          Left = 18.897650000000000000
          Top = 177.637910000000000000
          Width = 26.456710000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NO')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo6: TfrxMemoView
          Left = 60.472480000000000000
          Top = 177.637910000000000000
          Width = 120.944960000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NAMA')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo7: TfrxMemoView
          Left = 196.535560000000000000
          Top = 173.858380000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'PANGKAT/KORPS'
            'NRP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo8: TfrxMemoView
          Left = 347.716760000000000000
          Top = 177.637910000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'KESATUAN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo9: TfrxMemoView
          Left = 536.693260000000000000
          Top = 188.976500000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'KEP')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo10: TfrxMemoView
          Left = 687.874460000000000000
          Top = 188.976500000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TANGGAL')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo11: TfrxMemoView
          Left = 839.055660000000000000
          Top = 173.858380000000000000
          Width = 136.063080000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'TMB'
            'PENSIUN')
          ParentFont = False
          VAlign = vaCenter
        end
        object Memo12: TfrxMemoView
          Left = 986.457330000000000000
          Top = 173.858380000000000000
          Width = 45.354360000000000000
          Height = 30.236240000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'KET')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape17: TfrxShapeView
          Left = 529.134200000000000000
          Top = 170.078850000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo13: TfrxMemoView
          Left = 536.693260000000000000
          Top = 170.078850000000000000
          Width = 287.244280000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            'NOMOR')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape18: TfrxShapeView
          Left = 11.338590000000000000
          Top = 207.874150000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo14: TfrxMemoView
          Left = 15.118120000000000000
          Top = 207.874150000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '1')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape19: TfrxShapeView
          Left = 52.913420000000000000
          Top = 207.874150000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo15: TfrxMemoView
          Left = 60.472480000000000000
          Top = 207.874150000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '2')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape20: TfrxShapeView
          Left = 188.976500000000000000
          Top = 207.874150000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo16: TfrxMemoView
          Left = 196.535560000000000000
          Top = 207.874150000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '3')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape21: TfrxShapeView
          Left = 340.157700000000000000
          Top = 207.874150000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo17: TfrxMemoView
          Left = 347.716760000000000000
          Top = 207.874150000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '4')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape22: TfrxShapeView
          Left = 529.134200000000000000
          Top = 207.874150000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo18: TfrxMemoView
          Left = 536.693260000000000000
          Top = 207.874150000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '5')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape23: TfrxShapeView
          Left = 680.315400000000000000
          Top = 207.874150000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo19: TfrxMemoView
          Left = 687.874460000000000000
          Top = 207.874150000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '6')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape24: TfrxShapeView
          Left = 831.496600000000000000
          Top = 207.874150000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo20: TfrxMemoView
          Left = 839.055660000000000000
          Top = 207.874150000000000000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '7')
          ParentFont = False
          VAlign = vaCenter
        end
        object Shape25: TfrxShapeView
          Left = 982.677800000000000000
          Top = 207.874150000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          ShowHint = False
        end
        object Memo21: TfrxMemoView
          Left = 986.457330000000000000
          Top = 207.874150000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '8')
          ParentFont = False
          VAlign = vaCenter
        end
      end
    end
  end
  object dsHistory: TDataSource
    DataSet = tbHistory
    Left = 80
    Top = 160
  end
  object tbHistory: TADOTable
    Connection = cnAjendam
    CursorType = ctStatic
    TableName = 'History'
    Left = 16
    Top = 160
  end
  object dsBulan: TDataSource
    DataSet = tbBulan
    Left = 80
    Top = 112
  end
  object tbBulan: TADOTable
    Connection = cnAjendam
    CursorType = ctStatic
    TableName = 'Bulan'
    Left = 16
    Top = 112
  end
  object dsVerifikasi: TDataSource
    DataSet = tbVerifikasi
    OnStateChange = dsVerifikasiStateChange
    OnDataChange = dsVerifikasiDataChange
    OnUpdateData = dsVerifikasiUpdateData
    Left = 80
    Top = 64
  end
  object tbVerifikasi: TADOTable
    Connection = cnAjendam
    CursorType = ctStatic
    OnCalcFields = tbVerifikasiCalcFields
    TableName = 'Verifikasi'
    Left = 16
    Top = 64
    object tbVerifikasiCalcTanggalPensiun: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcTanggalPensiun'
      Calculated = True
    end
    object tbVerifikasiID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tbVerifikasiNRP: TWideStringField
      FieldName = 'NRP'
      Size = 15
    end
    object tbVerifikasiNama: TWideStringField
      FieldName = 'Nama'
      Size = 50
    end
    object tbVerifikasiKode_Pangkat: TSmallintField
      FieldName = 'Kode_Pangkat'
    end
    object tbVerifikasiPangkat: TWideStringField
      FieldName = 'Pangkat'
      Size = 25
    end
    object tbVerifikasiKesatuan: TWideStringField
      FieldName = 'Kesatuan'
      Size = 50
    end
    object tbVerifikasiNo_SKEP: TWideStringField
      FieldName = 'No_SKEP'
    end
    object tbVerifikasiTanggal_Pensiun: TDateTimeField
      FieldName = 'Tanggal_Pensiun'
    end
    object tbVerifikasiTanggal_Pensiun_Indonesia: TWideStringField
      FieldName = 'Tanggal_Pensiun_Indonesia'
      Size = 25
    end
    object tbVerifikasiBulan_Pensiun: TWideStringField
      FieldName = 'Bulan_Pensiun'
      Size = 15
    end
    object tbVerifikasiBulan_Pensiun_Bulan: TIntegerField
      FieldName = 'Bulan_Pensiun_Bulan'
    end
    object tbVerifikasiBulan_Pensiun_Tahun: TIntegerField
      FieldName = 'Bulan_Pensiun_Tahun'
    end
    object tbVerifikasiCalcBulanPensiun: TStringField
      FieldKind = fkCalculated
      FieldName = 'CalcBulanPensiun'
      Calculated = True
    end
    object tbVerifikasiCalcKodePangkat: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CalcKodePangkat'
      Calculated = True
    end
  end
  object cnAjendam: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=data\' +
      'Ajendam.mdb;Mode=Share Deny None;Persist Security Info=False;Jet' +
      ' OLEDB:System database="";Jet OLEDB:Registry Path="";Jet OLEDB:D' +
      'atabase Password="";Jet OLEDB:Engine Type=5;Jet OLEDB:Database L' +
      'ocking Mode=1;Jet OLEDB:Global Partial Bulk Ops=2;Jet OLEDB:Glob' +
      'al Bulk Transactions=1;Jet OLEDB:New Database Password="";Jet OL' +
      'EDB:Create System Database=False;Jet OLEDB:Encrypt Database=Fals' +
      'e;Jet OLEDB:Don'#39't Copy Locale on Compact=False;Jet OLEDB:Compact' +
      ' Without Replica Repair=False;Jet OLEDB:SFP=False;'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 8
  end
  object qrVerCount: TADOQuery
    Connection = cnAjendam
    Parameters = <>
    SQL.Strings = (
      'SELECT Count(ID) AS Result'
      'FROM Verifikasi;')
    Left = 16
    Top = 320
  end
  object dsVerCount: TDataSource
    DataSet = qrVerCount
    Left = 80
    Top = 320
  end
  object qrVerInvalid: TADOQuery
    Connection = cnAjendam
    Parameters = <>
    SQL.Strings = (
      'SELECT Count(ID) AS Result'
      'FROM Verifikasi'
      
        'WHERE NRP="" OR Nama="" OR Kode_Pangkat=0 OR Pangkat="" OR Kesat' +
        'uan="" OR No_SKEP="" OR Tanggal_Pensiun=#30/12/1899# OR Tanggal_' +
        'Pensiun_Indonesia="" OR Bulan_Pensiun=" 0" OR Bulan_Pensiun_Bula' +
        'n=0 OR Bulan_Pensiun_Tahun=0;')
    Left = 16
    Top = 272
  end
  object dsVerInvalid: TDataSource
    DataSet = qrVerInvalid
    Left = 80
    Top = 272
  end
  object tbVerHis: TADOTable
    Connection = cnAjendam
    TableName = 'VerifikasiHistory'
    Left = 16
    Top = 216
  end
  object dsVerHis: TDataSource
    DataSet = tbVerHis
    Left = 80
    Top = 216
  end
  object qrDML: TADOQuery
    Connection = cnAjendam
    Parameters = <>
    Left = 16
    Top = 376
  end
end
