{
  12/05/2015 -   Gustavo      -    Criação;
}
unit U_Preview;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, Vcl.StdCtrls, ppViewr, Vcl.ImgList,
  cxButtons, Vcl.ExtCtrls, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxDropDownEdit, Vcl.Buttons, cxTextEdit,ppComm, ppRelatv,
  ppProd, ppClass, ppReport, ToolWin, ppTypes;

type
  TF_Preview = class(TForm)
    pnBotoes: TPanel;
    bt_Sair: TcxButton;
    bt_Imprime: TcxButton;
    Imagens: TImageList;
    ppViewer1: TppViewer;
    Panel1: TPanel;
    L_Status: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    NumEdit1: TcxTextEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    cxComboBox1: TcxComboBox;
    procedure Execute(Report : TppReport);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure NumEdit1Enter(Sender: TObject);
    procedure NumEdit1Exit(Sender: TObject);
    procedure NumEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxComboBox1PropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ppViewer1PageChange(Sender: TObject);
    procedure ppViewer1StatusChange(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure bt_ImprimeClick(Sender: TObject);
  private
    { Private declarations }
    Executed : Boolean;
  public
    { Public declarations }
  end;

var
  F_Preview: TF_Preview;

implementation

{$R *.dfm}

procedure TF_Preview.bt_ImprimeClick(Sender: TObject);
begin
  ppViewer1.Print;
end;

procedure TF_Preview.bt_SairClick(Sender: TObject);
begin
  close;
end;

procedure TF_Preview.cxComboBox1PropertiesChange(Sender: TObject);
begin
  If cxComboBox1.Text = 'Largura da Página' then ppViewer1.ZoomSetting :=  zsPageWidth
  else if cxComboBox1.Text = 'Página Inteira' then ppViewer1.ZoomSetting := zsWholePage
  else if cxComboBox1.Text = 'Tamanho Normal' then ppViewer1.ZoomPercentage := 100
  else if cxComboBox1.Text = '10%' then ppViewer1.ZoomPercentage := 10
  else if cxComboBox1.Text = '25%' then ppViewer1.ZoomPercentage := 25
  else if cxComboBox1.Text = '50%' then ppViewer1.ZoomPercentage := 50
  else if cxComboBox1.Text = '75%' then ppViewer1.ZoomPercentage := 75
  else if cxComboBox1.Text = '100%' then ppViewer1.ZoomPercentage := 100
  else if cxComboBox1.Text = '150%' then ppViewer1.ZoomPercentage := 150;
  NumEdit1.SetFocus;
end;

procedure TF_Preview.Execute(Report: TppReport);
begin
    ppViewer1.Report := Report;

    ShowModal;
end;

procedure TF_Preview.FormShow(Sender: TObject);
begin
	Executed := False;
	cxComboBox1.ItemIndex := 0;
end;

procedure TF_Preview.NumEdit1Enter(Sender: TObject);
begin
     If not Executed then begin
	ppViewer1.Report.PrintToDevices;
	Executed := true;
     end;
end;

procedure TF_Preview.NumEdit1Exit(Sender: TObject);
begin
	ppViewer1.GotoPage(StrToInt(NumEdit1.text));
end;

procedure TF_Preview.NumEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_DOWN   : ppViewer1.ScrollBox.VertScrollBar.Position := ppViewer1.ScrollBox.VertScrollBar.Position + ppViewer1.ScrollBox.VertScrollBar.Increment;
    VK_UP     : ppViewer1.ScrollBox.VertScrollBar.Position := ppViewer1.ScrollBox.VertScrollBar.Position - ppViewer1.ScrollBox.VertScrollBar.Increment;
    VK_RIGHT  : ppViewer1.ScrollBox.HorzScrollBar.Position := ppViewer1.ScrollBox.HorzScrollBar.Position + ppViewer1.ScrollBox.HorzScrollBar.Increment;
    VK_LEFT   : ppViewer1.ScrollBox.HorzScrollBar.Position := ppViewer1.ScrollBox.HorzScrollBar.Position - ppViewer1.ScrollBox.HorzScrollBar.Increment;
    VK_NEXT   : if ppViewer1.ScrollBox.VertScrollBar.Position = (ppViewer1.ScrollBox.VertScrollBar.Range - ppViewer1.ScrollBox.ClientHeight) then begin
		      ppViewer1.NextPage;
		      ppViewer1.ScrollBox.VertScrollBar.Position := 0;
		end
		else ppViewer1.ScrollBox.VertScrollBar.Position := ppViewer1.ScrollBox.VertScrollBar.Position + (ppViewer1.ScrollBox.VertScrollBar.Increment*10);
    VK_PRIOR  : if ppViewer1.ScrollBox.VertScrollBar.Position = 0 then begin
		      ppViewer1.PriorPage;
		      ppViewer1.ScrollBox.VertScrollBar.Position := (ppViewer1.ScrollBox.VertScrollBar.Range - ppViewer1.ScrollBox.ClientHeight);
		end
		else ppViewer1.ScrollBox.VertScrollBar.Position := ppViewer1.ScrollBox.VertScrollBar.Position - (ppViewer1.ScrollBox.VertScrollBar.Increment*10);
    VK_HOME   : if Shift = [ssCtrl] then ppViewer1.FirstPage
		else ppViewer1.ScrollBox.VertScrollBar.Position := 0;
    VK_END    : if Shift = [ssCtrl] then ppViewer1.LastPage
		else ppViewer1.ScrollBox.VertScrollBar.Position := (ppViewer1.ScrollBox.VertScrollBar.Range - ppViewer1.ScrollBox.ClientHeight);
    VK_RETURN : NumEdit1.OnExit(Sender);
  end;
end;

procedure TF_Preview.ppViewer1PageChange(Sender: TObject);
begin
	NumEdit1.Text := FloatToStr(ppViewer1.AbsolutePageNo);
end;

procedure TF_Preview.ppViewer1StatusChange(Sender: TObject);
begin
	L_Status.Caption := ppViewer1.Status;
end;

procedure TF_Preview.SpeedButton1Click(Sender: TObject);
begin
	ppViewer1.FirstPage;
end;

procedure TF_Preview.SpeedButton2Click(Sender: TObject);
begin
	ppViewer1.PriorPage;
end;

procedure TF_Preview.SpeedButton3Click(Sender: TObject);
begin
	ppViewer1.NextPage;
end;

procedure TF_Preview.SpeedButton4Click(Sender: TObject);
begin
	ppViewer1.LastPage;
end;

end.
