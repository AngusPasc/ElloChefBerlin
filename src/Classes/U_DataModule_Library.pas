unit U_DataModule_Library;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Comp.Client, Data.DB, FireDAC.Phys.ODBCBase,
  cxGridBandedTableView, cxStyles, cxGridTableView, cxClasses,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, IniFiles, Vcl.Forms,
  Winapi.Messages, Vcl.dialogs, Vcl.StdCtrls, FireDAC.Phys.IBBase,
  FireDAC.Phys.FBDef, FireDAC.Phys.FB, frxClass, frxDBSet;

type
  TDataModule_Library = class(TDataModule)
    Conexao: TFDConnection;
    Transaction: TFDTransaction;
    Main_StyleRepository: TcxStyleRepository;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    Default: TcxGridTableViewStyleSheet;
    Default2: TcxGridBandedTableViewStyleSheet;
    Q_CarregaScripts: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule_Library: TDataModule_Library;

  strProdutos : String;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}


{$R *.dfm}

procedure TDataModule_Library.DataModuleCreate(Sender: TObject);
var sConexao : String;
begin
    // Arquivo de Configuração do Banco
    sConexao := ExtractFilePath(Application.ExeName) + 'FoodTruck.ini';

 Try
    if FileExists(sConexao) then begin
       Conexao.Params.Clear;
       Conexao.Params.LoadFromFile(sConexao);
       Conexao.Connected := True;
    end else
    begin
      MessageDlg('Nenhum arquivo de configuração de Banco de Dados foi encontrado.'+#13+#10+'Certifique que o arquivo "Conexao.txt" se encontra no mesmo'+#13+#10+'diretório do sistema.', mtError, [mbOK], 0);
      MessageDlg('Por medida se segurança, seu aplicativo não será inicializado !!', mtWarning, [mbOK], 0);
      Application.Terminate;
    end;
 except
      MessageDlg('O arquivo "Conexao.txt" contido no diretório do Sistema, está inválido. Certifique.', mtError, [mbOK], 0);
      MessageDlg('Por medida se segurança, seu aplicativo não será inicializado !!', mtWarning, [mbOK], 0);
      Application.Terminate;
 End;

     //Selects Iniciais para as pesquisas
     strProdutos := 'SELECT P.COD_PRODUTO, P.DESCRICAO FROM PRODUTO P ORDER BY P.DESCRICAO';


end;

end.
