object F_PesquisaZ: TF_PesquisaZ
  Left = 0
  Top = 0
  ActiveControl = edt_Pesquisa
  Caption = 'Pesquisa'
  ClientHeight = 352
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisa: TPanel
    Left = 0
    Top = 41
    Width = 486
    Height = 56
    Align = alTop
    TabOrder = 0
    object ComboBox1: TComboBox
      Left = 6
      Top = 7
      Width = 153
      Height = 21
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 164
      Top = 7
      Width = 73
      Height = 21
      ItemIndex = 2
      TabOrder = 1
      Text = 'Contendo'
      Items.Strings = (
        'Iniciado'
        'Finalizado'
        'Contendo'
        '='
        '<'
        '<='
        '>'
        '>='
        '<>')
    end
    object edt_Pesquisa: TcxTextEdit
      Left = 241
      Top = 7
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      OnKeyDown = edt_PesquisaKeyDown
      Width = 134
    end
    object RadioMaiuscula: TRadioButton
      Left = 391
      Top = 4
      Width = 83
      Height = 17
      Caption = '&Mai'#250'sculas'
      Checked = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      TabStop = True
    end
    object RadioMinuscula: TRadioButton
      Left = 391
      Top = 20
      Width = 83
      Height = 17
      Caption = 'Mi&n'#250'sculas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object RadioIdentico: TRadioButton
      Left = 391
      Top = 36
      Width = 83
      Height = 17
      Caption = '&Id'#234'ntico'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object panel_ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 41
    Align = alTop
    Color = clMoneyGreen
    ParentBackground = False
    TabOrder = 1
    object b_OK: TcxButton
      Left = 8
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Ok'
      TabOrder = 0
      OnClick = b_OKClick
    end
    object cxButton1: TcxButton
      Left = 89
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = cxButton1Click
    end
    object B_Localiza: TcxButton
      Left = 170
      Top = 9
      Width = 75
      Height = 25
      Caption = '&Localizar'
      TabOrder = 2
      OnClick = B_LocalizaClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 97
    Width = 486
    Height = 255
    Align = alClient
    DataSource = DataSource
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnKeyDown = DBGrid1KeyDown
  end
  object Query: TFDQuery
    Connection = DataModule_Library.Conexao
    Left = 336
    Top = 162
  end
  object DataSource: TDataSource
    DataSet = Query
    Left = 400
    Top = 162
  end
end
