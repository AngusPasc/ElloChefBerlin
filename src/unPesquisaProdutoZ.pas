unit unPesquisaProdutoZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unPadraoPesquisas, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMetropolis, dxSkinMetropolisDark, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2013White, dxSkinOffice2016Colorful,
  dxSkinOffice2016Dark, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, Vcl.Menus, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  FireDAC.Phys.FBDef, FireDAC.UI.Intf, FireDAC.VCLUI.Wait, Vcl.StdCtrls,
  Vcl.ExtCtrls, FireDAC.Comp.UI, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, Vcl.Grids, Vcl.DBGrids, cxButtons, cxLabel, cxTextEdit;

type
  TFrmPesquisaProdutoZ = class(TFrmPadraoPesquisas)
    rgTipo: TRadioGroup;
    procedure edtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure btPesquisaClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPesquisaProdutoZ: TFrmPesquisaProdutoZ;

implementation

{$R *.dfm}

uses U_DataModule_Library;

procedure TFrmPesquisaProdutoZ.btPesquisaClick(Sender: TObject);
var sValor : String;
begin
  inherited;
      sValor := trim(edtPesquisa.Text);

      with Query do
      begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT P.COD_PRODUTO, P.DESCRICAO FROM PRODUTO P' );

        if (rgTipo.ItemIndex = 0) then
        begin
           Sql.Add('  WHERE P.DESCRICAO LIKE :PARAM  ');
           ParamByName('PARAM').AsString := '%' + sValor + '%';
        end else
        if (rgTipo.ItemIndex = 1) then
        begin
           SQL.Add('  WHERE P.COD_PRODUTO LIKE :PARAM ');
           ParamByName('PARAM').AsString := '%' + sValor + '%';
        end;

        SQL.Add('ORDER BY P.COD_PRODUTO, P.DESCRICAO' );
        Open;
      end;
end;

procedure TFrmPesquisaProdutoZ.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btConfimar.Click;
end;

procedure TFrmPesquisaProdutoZ.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
  if Column.FieldName = 'DESC_PRODUTO' then
    Query.IndexFieldNames := 'DESC_PRODUTO;COD_PRODUTO'
  else
  Query.IndexFieldNames := Column.FieldName;
end;

procedure TFrmPesquisaProdutoZ.edtPesquisaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
   if (rgTipo.ItemIndex = 0) then
   begin
     if not(key in ['0'..'9',#8]) then
        Key:=#0;
   end;
end;

end.
