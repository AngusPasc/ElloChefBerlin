unit unEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, U_DataAware, cxGraphics, cxLookAndFeels,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxControls, dxSkinscxPCPainter,
  cxPCdxBarPopupMenu, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, cxContainer, cxEdit, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  cxMaskEdit, cxDBEdit, cxTextEdit, Vcl.StdCtrls, ACBrBase, ACBrEnterTab,
  FireDAC.Comp.UI, FireDAC.Phys, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  Vcl.ImgList, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, cxPC,
  cxButtons, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, Vcl.ExtDlgs;

type
  TfrmEmpresa = class(TF_DataAware)
    lbEmpresa: TLabel;
    edtCodigo: TcxDBTextEdit;
    edtCNPJ: TcxDBTextEdit;
    edtRazaoSocial: TcxDBTextEdit;
    edtFantasia: TcxDBTextEdit;
    edtEndereco: TcxDBTextEdit;
    edtBairro: TcxDBTextEdit;
    edtNumero: TcxDBTextEdit;
    edtUF: TcxDBTextEdit;
    Label6: TLabel;
    edtCidade: TcxDBTextEdit;
    edtCEP: TcxDBMaskEdit;
    edtTelefone: TcxDBMaskEdit;
    edtEmail: TcxDBTextEdit;
    lbEmail: TLabel;
    lbTelefone: TLabel;
    lbCEP: TLabel;
    lbCidade: TLabel;
    lbBairro: TLabel;
    lbEndereco: TLabel;
    lbFantasia: TLabel;
    lbRazaoSocial: TLabel;
    lbCnpj: TLabel;
    imgFoto: TImage;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    odImagem: TOpenPictureDialog;
    cxgEmpresa: TcxGrid;
    cxgEmpresaDBTableView1: TcxGridDBTableView;
    cxgEmpresaDBTVCodigoEmpresa: TcxGridDBColumn;
    cxgEmpresaDBTVCNPJ: TcxGridDBColumn;
    cxgEmpresaDBTVRazaoSocial: TcxGridDBColumn;
    cxgEmpresaLevel1: TcxGridLevel;
    procedure bt_AlteraClick(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure edtUFKeyPress(Sender: TObject; var Key: Char);
    procedure cxgEmpresaDBTableView1DblClick(Sender: TObject);
    procedure MainTableBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpresa: TfrmEmpresa;

implementation

{$R *.dfm}

uses unRotinas;

procedure TfrmEmpresa.bt_AlteraClick(Sender: TObject);
begin
  inherited;
  if MainTable.State in [dsEdit] then begin
     pc_Cadastro.ActivePage := tsCadastro;
     if edtCodigo.CanFocus then edtCodigo.SetFocus;
  end;
end;

procedure TfrmEmpresa.bt_NovoClick(Sender: TObject);
begin
  inherited;
  if MainTable.State in [dsInsert] then begin
     pc_Cadastro.ActivePage := tsCadastro;
     if edtCodigo.CanFocus then edtCodigo.SetFocus;
  end;
end;

procedure TfrmEmpresa.cxButton1Click(Sender: TObject);
begin
  inherited;
   if odImagem.Execute then begin
      imgFoto.Picture.LoadFromFile(odImagem.FileName);
      MainTable.FieldByName('LOGO').AsString := odImagem.FileName;
   end;
end;

procedure TfrmEmpresa.cxButton2Click(Sender: TObject);
begin
  inherited;
  imgFoto.Picture := nil;
  MainTable.FieldByName('LOGO').AsString := '';
  imgFoto.Picture.LoadFromFile(ExtractFilePath(Application.ExeName) + 'Logo\LogoDefault.jpg');
end;

procedure TfrmEmpresa.cxgEmpresaDBTableView1DblClick(Sender: TObject);
begin
  inherited;
 bt_Altera.Click;
end;

procedure TfrmEmpresa.edtUFKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not(key in ['A'..'Z','a'..'z',#8]) then
      Key:=#0;
end;


procedure TfrmEmpresa.FormShow(Sender: TObject);
begin
  inherited;
  if edtCodigo.CanFocus then edtCodigo.SetFocus;
end;

procedure TfrmEmpresa.MainTableBeforePost(DataSet: TDataSet);
begin
  inherited;
     // Validação do UF
     if length(MainTable.FieldByName('UF').AsString) > 0 then begin
        if ChecaUF(MainTable.FieldByName('UF').AsString) = False  then begin
          MessageDlg('Campo UF inválido, digite corretamente', mtError, [mbOK], 0);
          if edtUF.CanFocus then edtUF.SetFocus;
          Abort;
        end;
     end;
end;

end.
