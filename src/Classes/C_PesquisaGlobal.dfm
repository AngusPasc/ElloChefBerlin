object F_PesquisaGlobal: TF_PesquisaGlobal
  Left = 0
  Top = 0
  ActiveControl = Word_Search
  Caption = 'Pesquisa'
  ClientHeight = 428
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 37
    Width = 527
    Height = 54
    Align = alTop
    BevelOuter = bvNone
    ParentColor = True
    TabOrder = 0
    object Word_Search: TEdit
      Left = 237
      Top = 7
      Width = 196
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu2
      TabOrder = 2
      OnKeyDown = Word_SearchKeyDown
    end
    object ComboBox1: TComboBox
      Left = 2
      Top = 8
      Width = 145
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object ComboBox2: TComboBox
      Left = 152
      Top = 8
      Width = 81
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
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
      Left = 435
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
      Left = 435
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
      Left = 435
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
  object Panel_ToolBar: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 37
    Align = alTop
    BevelOuter = bvNone
    Color = clInactiveCaption
    ParentBackground = False
    TabOrder = 1
    object Bevel_Panel: TBevel
      Left = 0
      Top = 34
      Width = 527
      Height = 3
      Align = alBottom
      Shape = bsBottomLine
      ExplicitWidth = 514
    end
    object Panel_TopToolBar: TPanel
      Left = 0
      Top = 0
      Width = 527
      Height = 2
      Align = alTop
      BevelOuter = bvNone
      Color = 16752029
      TabOrder = 0
    end
    object ToolBar2: TToolBar
      Left = 0
      Top = 2
      Width = 527
      Height = 30
      ButtonHeight = 26
      ButtonWidth = 70
      Color = clWhite
      ParentColor = False
      TabOrder = 1
      object B_OK: TSpeedButton
        Left = 0
        Top = 0
        Width = 65
        Height = 26
        Caption = '&OK'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = B_OKClick
      end
      object B_Cancela: TSpeedButton
        Left = 65
        Top = 0
        Width = 65
        Height = 26
        Caption = '&Cancela'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        OnClick = B_CancelaClick
      end
      object ToolButton2: TToolButton
        Left = 130
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        Style = tbsDivider
      end
      object B_Localiza: TSpeedButton
        Left = 138
        Top = 0
        Width = 65
        Height = 26
        Hint = 'Localiza um registro'
        Caption = '&Localizar'
        Enabled = False
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        NumGlyphs = 2
        ParentFont = False
        OnClick = B_LocalizaClick
      end
      object Panel2: TPanel
        Left = 203
        Top = 0
        Width = 1
        Height = 26
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 0
      end
      object B_Tabela: TSpeedButton
        Left = 204
        Top = 0
        Width = 65
        Height = 26
        Caption = '&Tabela'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Layout = blGlyphTop
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Visible = False
      end
    end
  end
  object cxgPesquisa: TcxGrid
    Left = 0
    Top = 91
    Width = 527
    Height = 337
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    DragOpening = False
    LookAndFeel.SkinName = 'TheAsphaltWorld'
    object cxgPesquisaDBTableView1: TcxGridDBTableView
      OnDblClick = cxgPesquisaDBTableView1DblClick
      Navigator.Buttons.CustomButtons = <>
      Navigator.Buttons.First.Visible = False
      Navigator.Buttons.PriorPage.Visible = False
      Navigator.Buttons.Prior.Visible = False
      Navigator.Buttons.Next.Visible = False
      Navigator.Buttons.NextPage.Visible = False
      Navigator.Buttons.Last.Visible = False
      Navigator.Buttons.Insert.Visible = False
      Navigator.Buttons.Delete.Visible = False
      Navigator.Buttons.Edit.Visible = False
      Navigator.Buttons.Post.Visible = False
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      FilterRow.InfoText = 'Clique aqui para definir um Filtro'
      NewItemRow.InfoText = 'Clique aqui para adicionar uma nova linha'
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.NoDataToDisplayInfoText = '<Sem Dados>'
      OptionsView.GroupByBox = False
    end
    object cxgPesquisaLevel1: TcxGridLevel
      GridView = cxgPesquisaDBTableView1
    end
  end
  object DataSource1: TDataSource
    Left = 392
    Top = 208
  end
  object PopupMenu1: TPopupMenu
    Left = 464
    Top = 288
    object Pesquisar1: TMenuItem
      Caption = '&Localizar'
      ShortCut = 114
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object OK1: TMenuItem
      Caption = 'OK'
      ShortCut = 13
    end
    object Cancela1: TMenuItem
      Caption = 'Cancela'
      ShortCut = 27
    end
  end
  object PopupMenu2: TPopupMenu
    Left = 304
    Top = 136
    object Localizar1: TMenuItem
      Caption = 'Localizar'
      ShortCut = 13
    end
  end
  object Query: TFDQuery
    AfterOpen = QueryAfterOpen
    Connection = DataModule_Library.Conexao
    Left = 392
    Top = 272
  end
end
