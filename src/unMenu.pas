unit unMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  Vcl.ComCtrls, FireDAC.Phys, FireDAC.Phys.IBBase, FireDAC.Phys.FB,
  FireDAC.Stan.Intf, FireDAC.Comp.UI, Vcl.ImgList, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, FireDAC.Phys.FBDef, System.ImageList;

type
  TfrmMenu = class(TForm)
    ListaImagemMenu: TImageList;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    sbMenu: TStatusBar;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses unRotinas, unEmpresa, unProduto, unPedido;

{$R *.dfm}

procedure TfrmMenu.BitBtn1Click(Sender: TObject);
begin
    frmProduto := TfrmProduto.Create(nil);
    frmProduto.ShowModal;
    frmProduto.Release;
end;

procedure TfrmMenu.BitBtn2Click(Sender: TObject);
begin
    frmPedido := TfrmPedido.Create(nil);
    frmPedido.ShowModal;
    frmPedido.Release;
end;

procedure TfrmMenu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      Application.Terminate;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
    if not (Existe_Empresa) then begin
       case MessageDlg('Não existe nenhuma "Empresa" cadastrada para dar continuidade.'+#13+' O cadastro de empresa é de carater obrigatório.'+#13+'Continuar ?', mtWarning, [mbYes, mbNo], 0) of
            mrYes : begin
                      frmEmpresa := TfrmEmpresa.Create(nil);
                      frmEmpresa.ShowModal;
                      frmEmpresa.Release;

                      if not (Existe_Empresa) then begin
                        MessageDlg('Por medida de segurança, o sistema será fechado por falta de cadastro da Empresa.', mtWarning, [mbOK], 0);
                        Application.Terminate;
                      end;

                    end;
            mrNo :  begin
                    MessageDlg('Por medida de segurança, o sistema será fechado por falta de cadastro da Empresa.', mtWarning, [mbOK], 0);
                    Application.Terminate;
                    end;
       end;
    end;
end;

end.
