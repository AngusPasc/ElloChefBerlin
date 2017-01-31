object F_EntryGrid5: TF_EntryGrid5
  Left = 0
  Top = 0
  Caption = 'EntryGrid5'
  ClientHeight = 392
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 344
    Width = 771
    Height = 48
    Align = alBottom
    Color = clCream
    ParentBackground = False
    TabOrder = 0
    object b_Novo: TBitBtn
      Left = 10
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Novo'
      TabOrder = 0
    end
    object b_Altera: TBitBtn
      Left = 100
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Alterar'
      TabOrder = 1
      OnClick = b_AlteraClick
    end
    object b_Exclui: TBitBtn
      Left = 190
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Excluir'
      TabOrder = 2
      OnClick = b_ExcluiClick
    end
    object b_Localiza: TBitBtn
      Left = 280
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Localiza'
      TabOrder = 3
    end
    object b_Pesquisa: TBitBtn
      Left = 370
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Pesquisa'
      TabOrder = 4
      OnClick = b_PesquisaClick
    end
    object b_Filtro: TBitBtn
      Left = 460
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Filtro'
      TabOrder = 5
      OnClick = b_PesquisaClick
    end
    object b_Print: TBitBtn
      Left = 562
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Imprime'
      TabOrder = 6
      OnClick = b_PesquisaClick
    end
    object b_Sair: TBitBtn
      Left = 674
      Top = 6
      Width = 84
      Height = 34
      Caption = '&Sair'
      TabOrder = 7
      OnClick = b_PesquisaClick
    end
  end
  object DS_MainTable: TDataSource
    DataSet = MainTable
    Left = 64
    Top = 96
  end
  object UPD_MainTable: TFDUpdateSQL
    Connection = DataModule_Library.Conexao
    Left = 64
    Top = 152
  end
  object Q_Criterio_Filtro2: TFDQuery
    Connection = DataModule_Library.Conexao
    UpdateObject = Upd_Criterio
    SQL.Strings = (
      'select REPLICATE('#39#39',2) conector,'
      '       REPLICATE('#39#39',30) campo,'
      '       REPLICATE('#39#39',15) operador,'
      '       REPLICATE('#39#39',40) valor1,'
      '       REPLICATE('#39#39',40) valor2')
    Left = 64
    Top = 208
  end
  object Upd_Criterio: TFDUpdateSQL
    InsertSQL.Strings = (
      '/* inserido para permitir inserir */')
    ModifySQL.Strings = (
      '/* inserido para permitir alterar */')
    DeleteSQL.Strings = (
      '/* inserido para permitir excluir */')
    Left = 168
    Top = 208
  end
  object MainTable: TFDQuery
    AfterOpen = MainTableAfterOpen
    AfterPost = MainTableAfterPost
    AfterDelete = MainTableAfterDelete
    CachedUpdates = True
    Connection = DataModule_Library.Conexao
    Transaction = DataModule_Library.Transaction
    Left = 64
    Top = 40
  end
  object PopupMenu1: TPopupMenu
    Left = 608
    Top = 40
    object Novo1: TMenuItem
      Caption = '&Novo'
      ShortCut = 32813
      OnClick = Novo1Click
    end
    object Altera1: TMenuItem
      Caption = '&Altera'
      ShortCut = 32781
      OnClick = Altera1Click
    end
    object Exclui1: TMenuItem
      Caption = '&Exclui'
      ShortCut = 16430
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Filtro1: TMenuItem
      Caption = '&Filtro'
      ShortCut = 16454
      OnClick = Filtro1Click
    end
    object Imprime1: TMenuItem
      Caption = '&Imprime'
      ShortCut = 16464
      OnClick = Imprime1Click
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object Sair1: TMenuItem
      Caption = '&Sair'
      ShortCut = 32883
      OnClick = Sair1Click
    end
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    ODBCDriver = 'SQL Server'
    Left = 408
    Top = 48
  end
  object FDGUIxWaitCursor2: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 408
    Top = 120
  end
end
