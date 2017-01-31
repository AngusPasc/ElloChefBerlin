object F_Pesquisa: TF_Pesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa'
  ClientHeight = 445
  ClientWidth = 625
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
    Top = 0
    Width = 625
    Height = 73
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 69
      Height = 13
      Caption = 'Pesquisar por:'
    end
    object B_OK: TcxButton
      Left = 512
      Top = 7
      Width = 75
      Height = 25
      Caption = 'Ok'
      OptionsImage.Spacing = 9
      TabOrder = 0
      OnClick = B_OKClick
    end
    object cxButton2: TcxButton
      Left = 512
      Top = 38
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      OptionsImage.Spacing = 9
      TabOrder = 1
      OnClick = cxButton2Click
    end
    object Word_Search: TcxTextEdit
      Left = 251
      Top = 31
      Properties.CharCase = ecUpperCase
      TabOrder = 2
      OnKeyPress = Word_SearchKeyPress
      Width = 134
    end
    object ComboBox1: TComboBox
      Left = 16
      Top = 31
      Width = 153
      Height = 21
      TabOrder = 3
    end
    object ComboBox2: TComboBox
      Left = 174
      Top = 31
      Width = 73
      Height = 21
      ItemIndex = 2
      TabOrder = 4
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
    object RadioMaiuscula: TRadioButton
      Left = 391
      Top = 12
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
      TabOrder = 5
      TabStop = True
    end
    object RadioMinuscula: TRadioButton
      Left = 391
      Top = 28
      Width = 83
      Height = 17
      Caption = 'Mi&n'#250'sculas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object RadioIdentico: TRadioButton
      Left = 391
      Top = 44
      Width = 83
      Height = 17
      Caption = '&Id'#234'ntico'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 73
    Width = 625
    Height = 372
    Align = alClient
    DataSource = DataSource
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    OnTitleClick = DBGrid1TitleClick
  end
  object query: TFDQuery
    Connection = DataModule_Library.Conexao
    Left = 456
    Top = 272
  end
  object DataSource: TDataSource
    DataSet = query
    Left = 520
    Top = 272
  end
end
