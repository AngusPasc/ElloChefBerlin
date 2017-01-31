unit unProduto;

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
  FireDAC.VCLUI.Wait, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, Data.DB, cxDBData, Vcl.ExtCtrls,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, Vcl.StdCtrls, cxTextEdit, cxDBEdit,
  ACBrBase, ACBrEnterTab, FireDAC.Comp.UI, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Vcl.ImgList, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  cxPC, cxButtons, Vcl.ExtDlgs, Vcl.DBCtrls;

type
  TfrmProduto = class(TF_DataAware)
    edtCodigo: TcxDBTextEdit;
    lbEmpresa: TLabel;
    edtDescProduto: TcxDBTextEdit;
    lbDescproduto: TLabel;
    cxgProduto: TcxGrid;
    cxgProdutoDBTableView1: TcxGridDBTableView;
    cxgEmpresaDBTVCodigoProduto: TcxGridDBColumn;
    cxgEmpresaDBTVCNPJ: TcxGridDBColumn;
    cxgProdutoLevel1: TcxGridLevel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Label1: TLabel;
    edtPrecoProd: TcxDBTextEdit;
    Shape1: TShape;
    odImagem: TOpenPictureDialog;
    imgFoto: TImage;
    qryImagem: TFDQuery;
    qryImagemIMAGEM: TMemoField;
    procedure cxButton1Click(Sender: TObject);
    procedure MainTableBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProduto: TfrmProduto;

implementation

{$R *.dfm}

uses U_DataModule_Library;

procedure TfrmProduto.cxButton1Click(Sender: TObject);
var vArquivo: TFileStream;
    BlobStream : TStream;
    MemStream: TMemoryStream;
begin
  inherited;
   if odImagem.Execute then begin
      imgFoto.Picture.LoadFromFile(odImagem.FileName);
   end;



//   if odImagem.Execute then begin
//      imgFoto.Picture.LoadFromFile(odImagem.FileName);
////      vArquivo := TFileStream.Create(odImagem.FileName, fmOpenRead or fmShareDenyWrite);
//      vArquivo := TFileStream.Create(odImagem.FileName,fmShareDenyWrite);
//      with TFDQuery.Create(nil) do
//      try
//        Connection := frmProduto.MainTable.Connection;
//        Sql.Add(' INSERT INTO PRODUTO (IMAGEM) VALUES(:FOTOCARREGADA) ');
//        Params[0].DataType := ftBlob;
//
//        ExecSQL;
//      finally
//        Free;
//      end;
//
//   end;

//   if odImagem.Execute then begin
//      imgFoto.Picture.LoadFromFile(odImagem.FileName);
//      BlobStream := TFileStream.Create(odImagem.FileName,fmOpenRead);
//      with TFDQuery.Create(nil) do
//      try
//        if not (MainTable.State in [dsInsert, dsEdit]) then MainTable.Insert;
//        BlobStream.Position :=0;
//        MemStream.LoadFromStream(BlobStream);
//        MemStream.Seek(0,soFromBeginning);
//
//        if (MemStream.Size = 0) then
//        exit;
//
//        MainTable.LoadFromStream(MemStream);
//        MainTable.Post;
//      finally
//        Free;
//      end;
//   end;

//  BlobStream := MainTable.CreateBlobStream(MainTable.FieldByName('IMAGEM'),TBlobStreamMode.bmRead);
//  imgFoto.
//     // odImagem.InitialDir := ExtractFilePath(Application.ExeName) + 'Foto';
//   if odImagem.Execute then begin
//      imgFoto.Picture.LoadFromFile(odImagem.FileName);
//      vArquivo := TFileStream.Create(odImagem.FileName,fmShareDenyWrite);
//      //Pode ser feito Insert ou Update
//      with TFDQuery.Create(nil) do
//      try
//        Connection := frmProduto.MainTable.Connection;
//        Sql.Add(' INSERT INTO PRODUTO (IMAGEM) VALUES(:FOTOCARREGADA) ');
//        Params[0].DataType := ftBlob;
//        TFDQuery.ParamByName('FOTOCARREGADA').ASAsBlob := vArquivo;
//        ExecSQL;
//      finally
//        Free;
//      end;
//   end;



end;

procedure TfrmProduto.MainTableBeforePost(DataSet: TDataSet);
var vArquivo: TFileStream;
    BlobStream : TStream;
    MemStream: TMemoryStream;
begin
  inherited;
  if (MainTable.State in[dsInsert,dsEdit]) then
  begin
   if odImagem.Execute then begin
      imgFoto.Picture.LoadFromFile(odImagem.FileName);
      vArquivo := TFileStream.Create(odImagem.FileName,fmOpenRead);
      //Pode ser feito Insert ou Update
      with qryImagem do
      try
        qryImagem.Connection := frmProduto.MainTable.Connection;
        qryImagem.Sql.Add(' INSERT INTO PRODUTO (IMAGEM) VALUES(:FOTOCARREGADA) ');
        qryImagem.Params[0].DataType := ftBlob;
        qryImagem.Params[0].AsStream   := vArquivo;
        ExecSQL;
      finally
        Free;
      end;
   end;
  end;

end;

end.
