{
  12/05/2015 -   Gustavo      -    Criação;
}
unit C_Print_Form5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxPrnDev, cxClasses, dxPrnDlg,
  Vcl.ImgList, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, dbGrids;

type
  TF_Print_Form5 = class(TForm)
    pnBotoes: TPanel;
    bt_Visualiza: TcxButton;
    bt_Envia: TcxButton;
    bt_Sair: TcxButton;
    bt_Imprime: TcxButton;
    Imagens: TImageList;
    dxPrintDialog1: TdxPrintDialog;
    procedure bt_SairClick(Sender: TObject);
    procedure bt_VisualizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    BotaoClicado : boolean;
    EventoVisualizaFilho : TNotifyEvent;
    EventoImprimeFilho : TNotifyEvent;
    procedure Visualiza(Sender: TObject);
    procedure Imprime(Sender: TObject);
  public
    { Public declarations }
  end;

var
  F_Print_Form5: TF_Print_Form5;

implementation

{$R *.dfm}

uses U_DATAMASTER, U_DataModule_Library;

procedure TF_Print_Form5.bt_ImprimeClick(Sender: TObject);
begin
   ActiveControl := nil;
   if BotaoClicado then Abort;
   try
      BotaoClicado := true;
      EventoImprimeFilho(Sender);
   finally
      BotaoClicado := false;
   end;
end;

procedure TF_Print_Form5.bt_SairClick(Sender: TObject);
begin
    Self.Close;
end;

procedure TF_Print_Form5.bt_VisualizaClick(Sender: TObject);
begin
   ActiveControl := nil;
   if BotaoClicado then Abort;
   try
      BotaoClicado := true;
      EventoVisualizaFilho(Sender);
   finally
      BotaoClicado := false;
   end;
end;

procedure TF_Print_Form5.FormCreate(Sender: TObject);
begin
   Application.ProcessMessages;
   EventoVisualizaFilho := Self.Bt_Visualiza.OnClick;
   EventoImprimeFilho := Self.Bt_Imprime.OnClick;
   Self.Bt_Visualiza.OnClick := Visualiza;
   Self.Bt_Imprime.OnClick := Imprime;
   BotaoClicado := false;
end;

procedure TF_Print_Form5.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
   if (not (ActiveControl is TDBGrid)) and (not (ActiveControl is TCustomMemo)) then begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end
   else if (ActiveControl is TDBGrid) then
	   with TDBGrid(ActiveControl) do
		if selectedindex < (fieldcount -1) then selectedindex := selectedindex +1
		else selectedindex := 0;
end;

procedure TF_Print_Form5.Imprime(Sender: TObject);
begin
   ActiveControl := nil;
   if BotaoClicado then Abort;
   try
      BotaoClicado := true;
      EventoImprimeFilho(Sender);
   finally
      BotaoClicado := false;
   end;
end;

procedure TF_Print_Form5.Visualiza(Sender: TObject);
begin

end;

end.
