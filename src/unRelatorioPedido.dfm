inherited frmRelatorioPedido: TfrmRelatorioPedido
  Caption = 'Relat'#243'rio de Pedidos'
  ClientHeight = 204
  ExplicitHeight = 243
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 232
    Top = 7
    Width = 53
    Height = 13
    Caption = 'Data Inicial'
  end
  object Label2: TLabel [1]
    Left = 312
    Top = 7
    Width = 48
    Height = 13
    Caption = 'Data Final'
  end
  inherited pnBotoes: TPanel
    Top = 140
    ExplicitTop = 140
    inherited bt_Visualiza: TcxButton
      OnClick = bt_VisualizaClick
    end
  end
  object rgTipoRelatorio: TRadioGroup [3]
    Left = 8
    Top = 8
    Width = 89
    Height = 95
    Caption = ' Tipo Relat'#243'rio '
    ItemIndex = 0
    Items.Strings = (
      'Padr'#227'o'
      'Sint'#233'tico')
    TabOrder = 1
  end
  object edDataInicial: TMaskEdit [4]
    Left = 232
    Top = 26
    Width = 58
    Height = 21
    EditMask = '!99/99/99;1;_'
    MaxLength = 8
    TabOrder = 2
    Text = '  /  /  '
  end
  object edDataFinal: TMaskEdit [5]
    Left = 312
    Top = 26
    Width = 58
    Height = 21
    EditMask = '!99/99/99;1;_'
    MaxLength = 8
    TabOrder = 3
    Text = '  /  /  '
  end
  object RadioGroup1: TRadioGroup [6]
    Left = 112
    Top = 8
    Width = 101
    Height = 95
    Caption = ' Situa'#231#227'o Pedido '
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Abertos'
      'Finalizados'
      'Cancelados')
    TabOrder = 4
  end
  inherited Imagens: TImageList
    Left = 447
    Top = 16
    Bitmap = {
      494C01010B0090002C0110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007CD65E0049BF210037B80C0037B80C0049BF210070CD51000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006633000066330000B2997F000000000000000000000000000000
      00000000000000000000000000007E7E7E008383830000000000000000000000
      0000000000000000000000000000838383000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007CD6
      5E003FC1140037C7080033CC000033CC000033CC000033CC000033C3020030B6
      040070CD51000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000066330000CC996600E5B27F00996633000000000000000000000000000000
      000000000000000000007E7E7E0069696900696969008B8B8B00000000000000
      000000000000000000008B8B8B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000005ACC350040C9
      130033CC000033CC000033CC000033CC000033CC000033CC000033CC000033CC
      000031BE020045BC1D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006633
      0000CC996600E5B27F00FFCC9900996633000000000000000000000000000000
      0000000000007E7E7E0069696900EAEAEA00DEDEDE0069696900919191000000
      0000000000009191910069696900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000081DA640040C9130033CC
      000033CC000033CC000033CC000033CC0000259500002595000033CC000033CC
      000033CC000031BE020070CD5100000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000066330000CC99
      6600E5B27F00FFCC990099663300000000000000000000000000000000000000
      00007E7E7E0069696900EAEAEA00FFE48300FFEDAD00D8D8D800666666009B9B
      9B009D9D9D0063636300D8D8D800000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001FB10A004CCB220033CC000033CC
      000033CC000033CC000033CC0000FFFFFF00FFFFFF002595000033CC000033CC
      000033CC000033CC000030B604001FB10A000000000000000000000000000000
      000000000000000000000000000000000000000000008C664000B27F4C00E5B2
      7F00FFCC99009966330000000000000000000000000000000000000000007E7E
      7E0069696900EAEAEA00FFDF8300FFBD0000FFBD0000FFEEBF00CFCFCF006666
      660063636300CCCCCC0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007CDB5D0043CF140033CC000033CC
      000033CC000033CC000033CC0000FFFFFF00FFFFFF002595000033CC000033CC
      000033CC000033CC000033C3020068CC47000000000000000000000000000000
      0000000000000000000000000000000000000000000066666600E5B27F00E5B2
      7F009966330000000000000000000000000000000000000000007E7E7E006969
      6900EAEAEA00FFD98300FFB10000FFB10000FFB10000FFB10000FFEBBF000000
      000000000000FFEDC50000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000068D5430033CC000033CC000033CC
      000033CC00002595000025950000FFFFFF00FFFFFF0025950000259500002595
      00002595000033CC000033CC000049BF21000000000000000000CACACA009292
      9200666666006666660092929200CACACA0066666600CCCCCC0099999900B38C
      660000000000000000000000000000000000000000007E7E7E0069696900EAEA
      EA00FFD48300FFA60000FFA60000FFA60000FFA60000FFA60000FFA60000FFA6
      0000FFA60000FFA6000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005BD6320033CC000033CC000033CC
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF002595000033CC000033CC000037B80C0000000000B3B3B30083838300C2C2
      C200EEEEEE00EEEEEE00C2C2C200838383000000000099999900000000000000
      0000000000000000000000000000000000007E7E7E0069696900EAEAEA00FFCE
      8300FF9A0000FF9A0000FF9A0000FF9A0000FF9A0000FF9A0000FF9A0000FF9A
      0000FF9A0000FF9A000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005BD6320033CC000033CC000033CC
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0033CC000033CC000033CC000037B80C00CDCDCD0087878700E8E8E800F8DC
      C100FFCC9900FFCC9900F8DCC100E8E8E80087878700CDCDCD00000000000000
      0000000000000000000000000000000000008383830069696900E7E7E700FFCA
      8900FF8D0000FF8D0000FF8D0000FF8D0000FF8D0000FF8D0000FF8D0000FF8D
      0000FF8D0000FF8D000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006FDB4A0033CC000033CC000033CC
      000033CC000033CC000033CC0000FFFFFF00FFFFFF002595000033CC000033CC
      000033CC000033CC000033CC000049BF21009D9D9D00C8C8C800F9DDC100FFD4
      AA00FFE5CC00FFE5CC00FFCFA500F9D9BD00C8C8C8009D9D9D00000000000000
      000000000000000000000000000000000000000000008383830069696900E7E7
      E700FFC48900FF800000FF800000FF800000FF800000FF800000FF800000FF80
      0000FF800000FF80000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084E0650043CF140033CC000033CC
      000033CC000033CC000033CC0000FFFFFF00FFFFFF002595000033CC000033CC
      000033CC000033CC000037C708006FD14E007C7C7C00F5F5F500FFCC9900FFCC
      9900FFCC9900FFCC9900FFB27F00FFB98600F5F5F5007C7C7C00000000000000
      0000000000000000000000000000000000000000000000000000838383006969
      6900E7E7E700FFBF8900FF750000FF750000FF750000FF750000FF750000FF75
      0000FF750000FF75000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001FB10A005BD6320033CC000033CC
      000033CC000033CC000033CC0000FFFFFF00FFFFFF0033CC000033CC000033CC
      000033CC000033CC00003FC114000000000083838300F8F8F800FFCC9900FFB3
      8000FFB38000FF996600FF996600FFAC7900F8F8F80083838300000000000000
      0000000000000000000000000000000000000000000000000000000000008383
      83007E7E7E0000000000FF6B0000FF6B0000FF6B0000FF6B0000FF6B0000FF6B
      0000FF6B0000FF6B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008DE270004DD2200033CC
      000033CC000033CC000033CC000033CC000033CC000033CC000033CC000033CC
      000033CC000040C913007CD65E0000000000ACACAC00D5D5D500FDE1C600FFDD
      BB000000000000000000FFC19F00FFAC7900D5D5D500ACACAC00000000000000
      0000000000000000000000000000000000000000000000000000000000007E7E
      7E0081818100FFFCFB00FF620000FF620000FF620000FF620000FF620000FF62
      0000FF620000FF62000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000006FDB4A004DD2
      200033CC000033CC000033CC000033CC000033CC000033CC000033CC000033CC
      000040C913005ACC35000000000000000000D8D8D800A5A5A500F7F7F700FEE2
      C600FFCC9900FF996600FFAC7900F7F7F700A5A5A500D8D8D800000000000000
      00000000000000000000000000000000000000000000000000007E7E7E006969
      6900EAEAEA00FFAF8300FF5B0000FF5B0000FF5B0000FF5B0000FF5B0000FF5B
      0000FF5B0000FF5B000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008DE2
      70005BD6320043CF140033CC000033CC000033CC000033CC000043CF14004CCB
      220081DA640000000000000000000000000000000000C9C9C900A9A9A900DCDC
      DC000000000000000000DCDCDC00A9A9A900C9C9C90000000000000000000000
      000000000000000000000000000000000000000000007E7E7E0069696900EAEA
      EA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008DE270006FDB4A005BD632005BD6320066D5410081DA64000000
      0000000000000000000000000000000000000000000000000000DBDBDB00B7B7
      B7009999990099999900B7B7B700DBDBDB000000000000000000000000000000
      0000000000000000000000000000000000007E7E7E0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AC6A2C00E1A53C00E6C59000F2E1
      C400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000E5CDBA00B6B6BA00975B1900DF9C1F00CC891B00CD8A
      1B00CD8A1B00D6A14900E6BE7400E4CEB7000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6D6D6002D2D2F001919
      1B00787878007878780078787800787878007878780078787800787878001919
      1B0019191B00201F21002D2D2F00000000000000000000000000000000000000
      0000E9E9F2005C5C9D003232880013137A0016167C00333389005C5C9D00E9E9
      F200000000000000000000000000000000000000000000000000000000000000
      00000000000000000000B366230012101900804A0900E39C2000CB891C00CD8A
      1C00CD8A1C00CC891C00D6941C00AC641D00000000000000000000000000FFEF
      EA00FFF4EC00F8EEE400FFFEF500FFE6DF00FEEEE200FFF5E800FFF6E700FFEC
      DD00EFDCCF0000000000000000000000000000000000333335002A292B003130
      32008B8A8B002A292B00201F2100909090009090900090909000909090003333
      3500201F21004F4E5100201F2100000000000000000000000000000000009F9F
      C70015157C0007159E00081BB800091BCC000A1CD2000A1CC0000716A3001515
      7C009F9FC7000000000000000000000000000000000000000000000000000000
      00000000000000000000C77C2D0013111A00864F0900E49A2100CD8A1D00CF8B
      1D00CF8B1D00CE8A1D00D8941B00B36F2B00000000000000000000000000FFF9
      F100E1D0C700C7B9AD00DBC7BC00DCC0B500D4BDAE00D6BDAD00D7BBAA00E0C4
      B300FBE4D50000000000000000000000000000000000252426003B3A3B003B3A
      3B009999990031303200252426009F9F9F009F9F9F009F9F9F009F9F9F004140
      42002524260056555700252426000000000000000000000000009F9FC9000306
      8200081AAA000308BE000613BD000611A4000610A3000716BE00030AD0000819
      B600030682009F9FC90000000000000000000000000000000000000000000000
      0000241CED0000000000D792400014111B008A530B00E69E2200CE8C1F00CF8D
      1F00CF8D1F00CE8C1F00D6941D00B7742F00000000000000000000000000FFFE
      F700D4C1B900C7B9AD00D4BEB300EDCFC400E0C6B600D7BBAA00CDAD9A00D6B6
      A300FFF0E000000000000000000000000000000000002A292B00414042004140
      4200A7A7A7003D3C3D0033333500AEAEAE00AEAEAE00AEAEAE00AEAEAE004140
      42002A292B00464549002A292B000000000000000000E9E9F400151585000817
      9F000000AA000715BF00030880008B8BC800E1E1F0008989C200121B8F00040C
      BC000817AB0015158500E9E9F400000000000000000000000000000000000000
      0000241CED00241CED00AE6D4100251A00008E530E00D8922000CF8C1F00D08F
      2300D08F2200CF8E2200D7962000BA793300000000000000000000000000FFFD
      F900E0CEC700DDCEC500CEB9B100D7BAB300D2B5A700D6B7A800DBBAAA00E5C4
      B400FFFFEF00000000000000000000000000000000002D2D2F00464549004645
      4900CDCDCD00D6D6D600D6D6D600D6D6D600D6D6D600D6D6D600D6D6D6002524
      260025242600464549002D2D2F0000000000000000005C5CA800051197000205
      96000A1BAE000000BC00050EC80004088800A4A4D90000000000E8E8F3001218
      8D000206AB0005109C005C5CA800000000003039E7001D2AE800232CE800222E
      EB00241CED00241CED00241CED0000002F00AA6F0600E4EAF100BC741800D693
      2400D2922700D2912700D8992500BE7D3600000000000000000000000000FFF5
      F300D4C3C000DACEC800E4D0CB00DFC2BD00E1C3B800DFBFB200DFBEAF00D7B8
      A900FFEEE20000000000000000000000000000000000313032004B4A4D004B4A
      4D004B4A4D004B4A4D004B4A4D004B4A4D004B4A4D004B4A4D004B4A4D004B4A
      4D004B4A4D004B4A4D0031303200000000000000000033339A00051191000812
      9C002022B5000814B5000000C700040DCB0004088B00A4A4DB00000000008F8F
      C800040E960005119A0033339A0000000000241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED0089564500FAD27300D29A3D00D698
      2E00D3922900D4932B00DA9C2D00C2823900000000000000000000000000FFF8
      FA00D6C7C500D2C7C300F0DDDA00D7BBBA00DDBEB500D8B8AD00DBB9AC00D6B6
      A900FFF1E70000000000000000000000000000000000333335004F4E51004F4E
      51004F4E51004F4E51004F4E51004F4E51004F4E51004F4E51004F4E51004F4E
      51004F4E51004F4E51003333350000000000000000001111910009128C000B12
      9A00D3D3EE003132BB00141FBE001515CB00141DC600090B8B00A4A4DC00E8E8
      F50003098A00040D90001111910000000000241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED00241CED00A4682000F0BA4D00DEAE5600DFAF
      5800DBA74900D59A3600DB9F3100C6893E0000000000000000008D9D8C00B1C7
      FF006377FF00A2BEFF00DAE7F500FFE9F700FFFDF600FDF3E900FAF4E700FFFF
      F000F8F7E900000000000000000000000000000000003333350056555700E8DD
      D000E8DDD000E8DDD000E8DDD000E8DDD000E8DDD000E8DDD000E8DDD000E8DD
      D000E8DDD00056555700333335000000000000000000111195003A43AA00171E
      9C00E7E7F500EAEAF7003334BE004A52CE003737CC00343AC400090B8C009898
      D7000B108C00161E93001111960000000000241CED00241CED00241CED00241C
      ED00241CED00241CED00241CED000D030000AA762800F2C46D00E0B05D00E0B2
      5E00E2B46200E2B26100E1AE4B00CB8C3F000000000000000000829EDE006098
      FF0056BAFB004EA5E7005875D800A39CE700CEC5BC00CCC2B800CBBFB300C7BA
      AC00FFFAEE00000000000000000000000000000000003B3A3B0056555700F1EA
      E200B8A28B00B8A28B00B8A28B00B8A28B00B8A28B00B8A28B00B8A28B00B8A2
      8B00EDE5DC00565557003B3A3B0000000000000000003333A500373EAF002B31
      A5008B8BCD0000000000EAEAF7003738C0005961CC004646C5003A3FB8000507
      860021259A00363BAC003333A500000000000000000000000000000000000000
      0000241CED00241CED00E9A94E0022180B00A8793A00F5CA7700E2B76800E3B8
      6900E3B86900E4B86A00EAC37700D1984D0000000000B5CCFE00407FD00042C7
      F30030E7EB0063FFFF0055ACEA009FAFFF00FCF9F100FFFBF300FFFCF100FFF7
      ED00FFE5DB00000000000000000000000000000000003B3A3B0056555700F7F3
      EF00F7F3EF00F7F3EF00F7F3EF00F7F3EF00F7F3EF00F7F3EF00F7F3EF00F7F3
      EF00F1EAE200565557003B3A3B0000000000000000005C5CB800252BAB005E60
      C2001A1C9800E9E9F50000000000E9E9F7003738C1004E53C1005353BE004448
      B1004B4DB400262BAA005C5CB800000000000000000000000000000000000000
      0000241CED0000000000F7B64C001C101400B2803F00F8D28400E6BF7300E7C0
      7400E7C07400E7BF7300ECCB8000D59E530000000000B8C5FF004E8EEC005BF5
      FF0018DCE80033E1F7003399C90088A3FF00F4F5EC00FFFFF800000000000000
      000000000000000000000000000000000000000000003D3C3D0061606200FBF9
      F800FBF9F800FBF9F800FBF9F800FBF9F800FBF9F800FBF9F800FBF9F800F7F3
      EF00F7F3EF00616062003D3C3D000000000000000000E9E9F6001616A1005A5D
      BF005457BF00191B9B008D8DD100E4E4F500CDCDEE002122BD00464AB9006161
      C0005053B9001616A100E9E9F600000000000000000000000000000000000000
      00000000000000000000F6B144001D121200B9894900FDD99100EAC68100EAC5
      8100EAC58100EAC58100F0D08F00D9A4570000000000E5E0FF005469EA00388D
      FF0068F4FF0049B9FF00638EFF00A9B8F700FCFCF600FFFCF600000000000000
      000000000000000000000000000000000000000000004140420061606200FBF9
      F800CFB69C00CFB69C00CFB69C00CFB69C00CFB69C00CFB69C00CFB69C00CFB6
      9C000000000061606200414042000000000000000000000000009F9FDA001012
      A6006D6FC9007779D0003737B0001C1CA5002325AE004649BC006F70CB006163
      C2000A0BA3009F9FDA0000000000000000000000000000000000000000000000
      00000000000000000000E7AC5B00180D0E00C4995700FFF2AF00FFE09D00FFE4
      A000F8DB9A00F3D49500F5DEA300DEAB5D0000000000FFF1FF008B88CD007291
      E600619EF4005386E200A3B4F700F1EBFE00FFFFFC00FFF2EF00000000000000
      000000000000000000000000000000000000000000004140420056555700FAF4
      F000FAF4F000FAF4F000FAF4F000FAF4F000FAF4F000FAF4F000FBF9F800FBF9
      F800FBF9F8006160620041404200000000000000000000000000000000009F9F
      DA001616AA004748BB007373CC008A8AD8008B8BD9007676CD004242B9001616
      A8009F9FDA000000000000000000000000000000000000000000000000000000
      00000000000000000000ECB05C00301F1B00231F20006E5A44009E866300BBA7
      7C00DDC18C00F1D39900FEEBBA00E3B164000000000000000000000000000000
      00007F8AC3008FA8B80000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005655570041404200B9B4
      B300B9B4B300B9B4B300B9B4B300B9B4B300B9B4B300BCB9B900BCB9B900BCB9
      B900BCB9B9004140420056555700000000000000000000000000000000000000
      0000E9E9F7005C5CC4003434B7002828B4003434B6003C3CBA005D5DC400E9E9
      F700000000000000000000000000000000000000000000000000000000000000
      00000000000000000000EAB96800DBA85100CF9D4E00C5934600B98A4000B381
      3900CE9A4700DFAB5300E8B86300E4B25F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000554B41004034
      2900403429004034290040342900B1ACA8000000000000009300000093000000
      0000000000000000930000009300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0802000C0802000C0802000C0802000C0802000C0802000C0802000C080
      2000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000695F5600FFFFFF00FFFF
      FF00FFFDF800FCF5F000F1E8E000FFFFFF00000093000029FF000033FF000000
      9300000093000033FF000029FF00000093000000000000000000000000000000
      000000000000000000009F5A00009F5A00009F5A000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0802000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C080
      200000000000000000000000000000000000000000000000000000000000F2F4
      F400FBFDFD00F0F2F200F3F5F500F7F9F900EFFFF900FFFFED00FFFAFE00FBF8
      FF00DCF4F400FFFEFC00000000000000000000000000695F5600FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00FFFFFF000029CA00FFCCFF000029FF000033
      FF000033FF000029FF00FFCCFF000029CA000000000000000000000000000000
      000000000000000000009F5A0000F3CC8700DDAD5C009F5A0000000000000000
      00000000000000000000000000000000000000000000C0802000806000008060
      0000C0802000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C080
      20008060000080600000C060200000000000000000000000000000000000E8EA
      EA00E3E5E500ECEEEE00EDEFEF00E7E9E900D9DECF00D9E7D500F0E9FE00D8C2
      DF00F0E9E600F4F1FA00000000000000000000000000695F5600FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00F4F3F100FFFFFF000029CA000C4CFF000C4C
      FF000C4CFF000C4CFF000029CA00000000000000000000000000000000000000
      00000000000000000000A35D0000F3CF8E00F3CF8E00A35D0000000000000000
      000000000000000000000000000000000000C0A04000C0802000C0C08000C0C0
      8000804020008040200080402000804020008040200080402000804020008040
      2000C0C08000C0C08000C0802000C0804000000000000000000000000000FDFF
      FF00D8DADA008A8C8C006B6D6D00838585000D1900002E56D7008FABE700FBFF
      BD00D1E6E300EFEEFF000000000000000000000000006F655C00FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00F4F3F100FFFFFF0000009300146CFF00146C
      FF00146CFF00146CFF0000009300000000000000000000000000000000000000
      00000000000000000000A35D0000F5D39600F5D39600A35D0000000000000000
      00000000000000000000000000000000000080600000F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA60080600000000000000000000000000000F2F4
      F400DADCDC00DEE0E000ECEEEE00E9EBEB000349DC00090F0000045B6F00005A
      D900CECBF900F4F3D100000000000000000000000000786E6400FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00FFFFFF00000093002083FF002083FF00FFCC
      FF00FFCCFF002083FF002083FF00000093000000000000000000000000000000
      00000000000000000000AD660000F5D7A000F5D7A000AD660000000000000000
      00000000000000000000000000000000000080600000F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA60080600000000000000000000000000000FBFD
      FD00DEE0E0009597970085878700818383006E8EB9000068AC0055BBFF002173
      D9000048BC009DC7FF00000000000000000000000000786E6400FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00FFFFFF000029CA00FFCCFF00FFCCFF000029
      CA000029CA00FFCCFF00FFCCFF000029CA000000000000000000000000000000
      00000000000000000000B36B0000F6DBAB00F6DBAB00B36B0000000000000000
      00000000000000000000000000000000000080600000F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA60080600000000000000000000000000000F2F4
      F400F5F7F700D1D3D300E8EAEA00D4D6D600E4D0D500077CA90022B0FD004AAF
      FF001289FF000F6FCD00335D880000000000000000007E726900FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00F4F3F100FFFFFF000029CA000029CA00FFFF
      FF00FFFFFF000029CA000029CA00000000000000000000000000000000000000
      00000000000000000000B9700000F8E0B500C9850F00B9700000000000000000
      00000000000000000000000000000000000080600000F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF0080600000000000000000000000000000F8FA
      FA00E5E7E70080828200909292008D8F8F00828288008F93B000006AA10000CD
      FF0018A6ED002E7FE8001767D20073AAED00000000007E726900FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00E2DCD600F1EBE400FFFFFF00FFFFFF00F1EB
      E400CDC9C5000000000000000000000000000000000000000000000000000000
      000000000000F6E5C700C0760000F8E6C300D0902100C0760000F6E5C7000000
      00000000000000000000000000000000000080600000F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF0080600000000000000000000000000000EFEF
      EF00D9D9D900E6E6E600EEEEEE00E9E9E900CAF0DE00EFD6DA00EAEBFF00006E
      8E0010C5FC0026B2FF000A78EE00005CDC0000000000857A7100FFFFFF00D4CB
      C400F4F3F100F1EBE400B0A49A00E6DFD900CFC4B900B0A49A00C7BBB000CFC4
      B90091867B000000000000000000000000000000000000000000000000000000
      0000F6E5C700C77B0000F8E0B500F6E5C700DAA13B00DAA13B00C77B0000F6E5
      C70000000000000000000000000000000000C0A06000C0806000F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FBFF00F0FB
      FF00F0FBFF00F0FBFF00C0806000C0A06000000000000000000000000000FFFF
      FF00F2F2F2009696960080808000858585009C8B82006C7B77006F8D98006086
      A8002780B30024B6F80033AEFF00245CC900857A7100857A7100DDDBDA00B1AC
      A800A9A29A00A9A29A00A59C9500A59C95009B9187009B91870091867B00B4A8
      9B0091867B00857A71000000000000000000000000000000000000000000F6E5
      C700D1840000F7E2BC00FBEDD300FBEDD300E5B25500E5B25500F7E2BC00D184
      0000F6E5C70000000000000000000000000000000000C0804000806000008060
      0000806000008060000080600000806000008060000080600000806000008060
      00008060000080600000C080400000000000000000000000000000000000F4F4
      F400F0F0F000CDCDCD00F1F1F100EDEDED00FFE9E400D7EFE700DAF0F500B19C
      B5009CAACE00167BA10010699B00B8B5FD00857A7100FCF5F000E6DFD900E6DF
      D900DAD4CF00D4CBC400D4CBC400CFC4B900C7BBB000BEB2A600B4A89B00A599
      8C00A5998C00857A710000000000000000000000000000000000F6E5C700D184
      0000F8E6C300FCF1DC00FCF1DC00FCF1DC00EBBD6700EBBD6700FCF1DC00F8E6
      C300D1840000F6E5C70000000000000000000000000000000000000000000000
      0000C0C06000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      400000000000000000000000000000000000000000000000000000000000FFFF
      FF00E2E2E200939393009191910086868600808D8500F2E9E600A38E9100B8AD
      B5008F98A20070809000909EB10000000000857A7100FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00DAD4CF00857A7100000000000000000000000000F6E5C700D4870000F6E5
      C700FDF3E400FDF3E400FDF3E400FDF3E400EBBD6700EBBD6700FDF3E400FDF3
      E400F6E5C700D4870000F6E5C700000000000000000000000000000000000000
      0000C0C06000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0C0
      600000000000000000000000000000000000000000000000000000000000FAFA
      FA00E9E9E900D9D9D900E6E6E600ECECEC00C6F4E800F3DFDE00C6A4A500E9F3
      ED00E4F4ED00E8CCCC00000000000000000000000000857A7100857A7100857A
      7100857A7100857A7100857A7100857A7100857A7100857A7100857A7100857A
      7100857A7100000000000000000000000000F6E5C700D4870000F6E5C700FDF6
      E900FDF6E900FDF6E900FDF6E900FDF6E900FDF6E900FDF6E900FDF6E900FDF6
      E900FDF6E900F6E5C700D4870000F6E5C7000000000000000000000000000000
      0000C0C08000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0CAA600F0CA
      A60000000000000000000000000000000000000000000000000000000000F8F8
      F800F6F6F600FFFFFF00F5F5F500DCDCDC00D6EDE900D4DAD900A7A3A200E7E6
      E200FFFFFA000000000000000000000000000000000000000000000000000000
      0000857A7100FCF5F000FCF5F000FCF5F000FCF5F000857A7100000000000000
      000000000000000000000000000000000000D4870000D4870000D4870000D487
      0000D4870000D4870000D4870000D4870000D4870000D4870000D4870000D487
      0000D4870000D4870000D4870000D48700000000000000000000000000000000
      0000C0C08000FFFFFF00FFFFFF00FFFFFF00FFFFFF00F0CAA600F0CAA600F0CA
      A60000000000000000000000000000000000000000000000000000000000EFEF
      EF00FFFFFF00F3F3F300F8F8F800FFFFFF00FFFCFF00E2F1F300EFFFFF00F1EA
      ED00000000000000000000000000000000000000000000000000000000000000
      000000000000857A7100857A7100857A7100857A710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C0C08000C0C08000C0C08000C0C08000C0C08000C0C08000F0CAA6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00F81FFFF8FE7E0000E007FFF0FC3C0000
      C003FFE0F81800008001FFC1F00000000000FF83E00200000000FF87C01A0000
      0000C00F80020000000080BF000200000000003F000200000000003F80020000
      0000003FC00200000001003FE402000080010C3FE0020000C003003FC0020000
      E0078C7F8FFE0000F81FC0FF00000000FF0FFFFFFFFFFFFFFC00C0038001F00F
      FC00C0038001E007FC00C0038001C003F400C00380018001F000C00380018041
      0000C003800180210000C003800180010000C003800180010000C00380018401
      F000800380018201F400800380018001FC0080078009C003FC00800F8001E007
      FC00C01F8001F00FFC00FFFFFFFFFFFFC099FFFFF00FC0018000FC7FF00FC001
      8000FC3F8001C0018001FC3F0000C0018001FC3F0000C0018000FC3F0000C001
      8000FC3F0000C0018001FC3F0000C0008007F81F0000C0008007F00F0000C000
      0003E0078001C0000003C003F00FC00100038001F00FC00180070000F00FC003
      F03F0000F00FC007F87FFFFFF01FC00F00000000000000000000000000000000
      000000000000}
  end
end
