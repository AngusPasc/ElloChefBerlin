object F_CarregaDados: TF_CarregaDados
  Left = 0
  Top = 0
  Caption = 'Carregando Dados'
  ClientHeight = 232
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ImagemLogo: TImage
    Left = 172
    Top = 35
    Width = 145
    Height = 105
    Center = True
    Stretch = True
    Transparent = True
  end
  object lbCarregando: TcxLabel
    Left = 154
    Top = 201
    Caption = 'Carregando dados, Aguarde !! '
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
  end
  object pb_CarregaDados: TcxProgressBar
    Left = 40
    Top = 173
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = []
    Style.IsFontAssigned = True
    TabOrder = 1
    Width = 409
  end
  object Script: TFDScript
    SQLScripts = <
      item
        Name = 'Arquivos'
      end>
    Connection = DataModule_Library.Conexao
    Transaction = DataModule_Library.Transaction
    Params = <>
    Macros = <>
    Left = 368
    Top = 40
  end
  object QAux: TFDQuery
    Connection = DataModule_Library.Conexao
    Left = 368
    Top = 96
  end
end
