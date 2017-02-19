unit unRelatorioPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoRelatorio, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxPrnDev, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, cxClasses,
  dxPrnDlg, System.ImageList, Vcl.ImgList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Vcl.Mask;

type
  TfrmRelatorioPedido = class(TfrmPadraoRelatorio)
    rgTipoRelatorio: TRadioGroup;
    edDataInicial: TMaskEdit;
    Label1: TLabel;
    edDataFinal: TMaskEdit;
    Label2: TLabel;
    rgSituacaoPedido: TRadioGroup;
    procedure bt_VisualizaClick(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioPedido: TfrmRelatorioPedido;

implementation

{$R *.dfm}

uses unDM_Relatorios, unRotinas;

procedure TfrmRelatorioPedido.bt_SairClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmRelatorioPedido.bt_VisualizaClick(Sender: TObject);
begin
  inherited;

  if (edDataInicial.Text = '  /  /  ') or (edDataFinal.Text = '  /  /  ') then
  begin
    MessageDlg('Informe as datas corretamente.', mtWarning, [mbOK], 0);
    Abort;
  end;

  with DM_Relatorios do
  begin

    //Relatório Padrão de Pedidos
    if (rgTipoRelatorio.ItemIndex = 0 ) then
    begin
      frxReportPedidos.LoadFromFile(BuscaCaminhoEXE + 'Relatorios\RelPedidosSimples.fr3');

      qryPedidos.Close;
      qryPedidos.SQL.Clear;
      qryPedidos.SQL.Add('select * from pedidos');
      qryPedidos.SQL.Add('where data between :dataini and :datafim');
      qryPedidos.ParamByName('dataini').AsDate := StrToDate(edDataInicial.Text);
      qryPedidos.ParamByName('datafim').AsDate := StrToDate(edDataFinal.Text);

      if (rgSituacaoPedido.ItemIndex in [0,1,2] ) then
      begin
        qryPedidos.SQL.Add('and flag_situacao = :flag_situacao');
        qryPedidos.ParamByName('flag_situacao').AsInteger := rgSituacaoPedido.ItemIndex;
      end;

      qryPedidos.SQL.Add('order by data, cod_pedido');
      qryPedidos.Open;

      if qryPedidos.IsEmpty then
      begin
        MessageDlg('Nenhuma informação encontrada.', mtWarning, [mbOK], 0);
        Abort;
      end;

      frxReportPedidos.ShowReport;
    end;


  end;
end;

end.
