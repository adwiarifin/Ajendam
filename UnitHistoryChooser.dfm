object FormHistory: TFormHistory
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Pilih History'
  ClientHeight = 249
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TButton
    Left = 8
    Top = 215
    Width = 241
    Height = 25
    Caption = 'Pilih'
    TabOrder = 0
    OnClick = btnOkClick
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 241
    Height = 201
    DataSource = DataModuleAjendam.dsHistory
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Petugas'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Tanggal'
        Width = 120
        Visible = True
      end>
  end
end
