unit U_DataAware;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, cxGrid,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, Data.DB, cxDBData, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  Vcl.StdCtrls, Vcl.Buttons, FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL,
  FireDAC.Comp.Client, FireDAC.Comp.UI, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  cxContainer, FireDAC.Comp.DataSet, cxTextEdit, cxDBEdit, Vcl.Menus, cxButtons,
  Vcl.ImgList, dbGrids, cxPCdxBarPopupMenu, cxPC, ACBrBase, ACBrEnterTab,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxBarBuiltInMenu, FireDAC.Phys.MSSQLDef,
  System.ImageList;

type
  TF_DataAware = class(TForm)
    pnBotoes: TPanel;
    MainTable: TFDQuery;
    DS_MainTable: TDataSource;
    upt_MainTable: TFDUpdateSQL;
    bt_Novo: TcxButton;
    PopupMenu1: TPopupMenu;
    Novo1: TMenuItem;
    Altera1: TMenuItem;
    Exclui1: TMenuItem;
    N1: TMenuItem;
    Filtro1: TMenuItem;
    Imprime1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    Imagens: TImageList;
    bt_Salvar: TcxButton;
    bt_Altera: TcxButton;
    bt_Excluir: TcxButton;
    bt_Filtro: TcxButton;
    bt_Sair: TcxButton;
    bt_Imprime: TcxButton;
    bt_Cancelar: TcxButton;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    pc_Cadastro: TcxPageControl;
    tsPesquisa: TcxTabSheet;
    tsCadastro: TcxTabSheet;
    ACBrEnterTab1: TACBrEnterTab;
    procedure Altera;
    procedure Grava;
    procedure Novo;
    procedure Exclui;
    procedure Cancela;
    procedure ExecutaOnExit;
    procedure b_AlteraClick(Sender: TObject);
    procedure b_ExcluiClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bt_NovoClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure bt_AlteraClick(Sender: TObject);
    procedure bt_ExcluirClick(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Altera1Click(Sender: TObject);
    procedure Exclui1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure MainTableAfterDelete(DataSet: TDataSet);
    procedure MainTableAfterOpen(DataSet: TDataSet);
    procedure MainTableAfterPost(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
     OnCommit : Procedure(IsDelete : Boolean);
     OnCancel : Procedure;
     FirstTabField : TWinControl;
     Procedure Ativa_Desativa_Botoes;
  end;

var
  F_DataAware: TF_DataAware;

implementation

{$R *.dfm}

uses U_DataModule_Library, unRegrasDataModule;


procedure none(IsDelete : Boolean);
begin
   //none
end;

procedure cnone;
begin
   //none
end;

procedure TF_DataAware.Altera;
begin
   MainTable.Edit;
   Ativa_Desativa_Botoes;
   pc_Cadastro.ActivePage := tsCadastro;
end;

procedure TF_DataAware.Altera1Click(Sender: TObject);
begin
  Altera;
end;

procedure TF_DataAware.Ativa_Desativa_Botoes;
begin
    bt_Novo.Enabled   := True;

    if (MainTable.IsEmpty) then begin
       bt_Cancelar.Enabled := False;
       bt_Salvar.Enabled   := False;
       bt_Altera.Enabled   := False;
       bt_Excluir.Enabled  := False;
       bt_Imprime.Enabled  := False;
       bt_Filtro.Enabled   := False;
    end else
    if (MainTable.State in [dsInsert, dsEdit]) then begin
       bt_Cancelar.Enabled := True;
       bt_Salvar.Enabled   := True;
       bt_Altera.Enabled   := False;
       bt_Excluir.Enabled  := False;
       bt_Imprime.Enabled  := False;
       bt_Filtro.Enabled   := False;
    end else
    if (MainTable.State in [dsBrowse]) then begin
       bt_Cancelar.Enabled := False;
       bt_Salvar.Enabled   := False;
       bt_Altera.Enabled   := True;
       bt_Excluir.Enabled  := True;
       bt_Imprime.Enabled  := True;
       bt_Filtro.Enabled   := True;
    end;
    Novo1.Enabled    := bt_Novo.Enabled;
    Altera1.Enabled  := bt_Altera.Enabled;
    Exclui1.Enabled  := bt_Excluir.Enabled;
    Imprime1.Enabled := bt_Imprime.Enabled;
end;

procedure TF_DataAware.b_AlteraClick(Sender: TObject);
begin
  MainTable.Edit;
end;

procedure TF_DataAware.b_ExcluiClick(Sender: TObject);
begin
	  if not MainTable.Connection.InTransaction then
       MainTable.Connection.StartTransaction;
	  try
	     MainTable.Delete;
	     MainTable.ApplyUpdates;
	     OnCommit(True);
	     if MainTable.Connection.InTransaction then
          MainTable.Connection.Commit;
	  except
	     if MainTable.Connection.InTransaction then
          MainTable.Connection.Rollback;

          MainTable.CancelUpdates;
          raise;
    end;
          MainTable.CommitUpdates;  //Limpa o cache de atualizações
end;

procedure TF_DataAware.Cancela;
begin
   Maintable.CancelUpdates;
   Ativa_Desativa_Botoes;
   pc_Cadastro.ActivePage := tsPesquisa;

end;

procedure TF_DataAware.bt_SairClick(Sender: TObject);
begin
    Close;
end;

procedure TF_DataAware.bt_AlteraClick(Sender: TObject);
begin
   Altera;
end;

procedure TF_DataAware.bt_CancelarClick(Sender: TObject);
begin
  Cancela;
end;

procedure TF_DataAware.Exclui;
begin

     if (MessageDlg('Deseja realmente excluir esse registro ?', mtWarning, [mbYes, mbNo], 0) = mrYes) then begin

        if not MainTable.Connection.InTransaction then
               MainTable.Connection.StartTransaction;
        try
           MainTable.Delete;
           MainTable.ApplyUpdates;
           OnCommit(True);
           if MainTable.Connection.InTransaction then
              MainTable.Connection.Commit;
        except

           MessageDlg('Esse registro não pode ser excluído.'+#13+#10+'Motivo: *Dependência de outro cadastro.', mtError, [mbOK], 0);

           if MainTable.Connection.InTransaction then
              MainTable.Connection.Rollback;

              Cancela;
              raise;
        end;
              MainTable.CommitUpdates;  //Limpa o cache de atualizações

     end else
     Abort;

   Ativa_Desativa_Botoes;
   pc_Cadastro.ActivePage := tsPesquisa;

end;

procedure TF_DataAware.Exclui1Click(Sender: TObject);
begin
    Exclui;
    Ativa_Desativa_Botoes;
    pc_Cadastro.ActivePage := tsPesquisa;
end;

procedure TF_DataAware.ExecutaOnExit;
var
   ExitField : TNotifyEvent;
   CurrentComponent : TWinControl;
begin
     CurrentComponent := ActiveControl; //Guarda o componente corrente
     ExitField := Nil; // Variavel para guardar o onExit
     if ActiveControl is TcxDBTextEdit then // força saída onExit apenas para DBEdit
     begin
       ExitField := TcxDBTextEdit(ActiveControl).OnExit; //Quarda a programação do onExit
       TcxDBTextEdit(ActiveControl).OnExit := nil; //zera o onExit
     end;

     ActiveControl := nil; //Força o onExit vazio apenas para garantir que o valor vai estar na query, para evitar problema de utilizar o fieldbyname no onexit e o mesmo não estar atualizado
     try
       if Addr(ExitField) <> nil then //Se existia programação do onExit
         ExitField(CurrentComponent); // executo o onExit
     finally
       if CurrentComponent is TcxDBTextEdit then
       begin
         TcxDBTextEdit(CurrentComponent).OnExit := ExitField; //Atribuo o onExit novamente para o componente
       end;

       if (CurrentComponent <> nil) and (CurrentComponent.canfocus) then
         ActiveControl := CurrentComponent; //volto o foco para o componente
     end;
end;

procedure TF_DataAware.bt_SalvarClick(Sender: TObject);
begin
    Grava;
end;

procedure TF_DataAware.bt_ExcluirClick(Sender: TObject);
begin
   Exclui;
end;

procedure TF_DataAware.bt_NovoClick(Sender: TObject);
begin
    Novo;
end;

procedure TF_DataAware.FormClose(Sender: TObject; var Action: TCloseAction);
var CurrentComponent : TWinControl;
begin
  if (MainTable <> nil) then
  begin
    if MainTable.State in [dsInsert, dsEdit] then
    begin
	    ExecutaOnExit;
	  end;
	  if MainTable.CachedUpdates then
    begin
	    if MainTable.UpdatesPending or Alterou_Query(MainTable) then
      begin
   	      case MessageDlg('Dados alterados. Deseja gravar o registro?',mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
		        mrYes : Grava;
		        mrNo : Cancela;
		        mrCancel : Action := caNone;
        end;
      end;
    end;
  end;
end;

procedure TF_DataAware.FormCreate(Sender: TObject);
begin
     OnCommit := none;
     OnCancel := cnone;

{$IFNDEF Prototipo}
     FirstTabField := ActiveControl;
{$ENDIF}
end;

procedure TF_DataAware.FormDestroy(Sender: TObject);
begin
{$IFNDEF Prototipo}
     MainTable.Close;
{$ENDIF}
end;

procedure TF_DataAware.FormShow(Sender: TObject);
begin
     pc_Cadastro.ActivePage := tsPesquisa;
{$IFNDEF Prototipo}
   Application.ProcessMessages;
   MainTable.Open;
   Ativa_Desativa_Botoes;
{$ELSE}
     MainTable.Close;
{$ENDIF}
end;


procedure TF_DataAware.Grava;
begin
     if not MainTable.Connection.InTransaction then MainTable.Connection.StartTransaction;
     try
        MainTable.Post;
        MainTable.ApplyUpdates; //Aplica as atualizações
        OnCommit(False);
        if MainTable.Connection.InTransaction then MainTable.Connection.Commit;
     except
        if MainTable.Connection.InTransaction then MainTable.Connection.Rollback;
        Altera;  //Se der problema volta o registro em edição e aborta
        raise;
     end;
     MainTable.CommitUpdates;  //Limpa o cache de atualizações

    Ativa_Desativa_Botoes;
    pc_Cadastro.ActivePage := tsPesquisa;
end;

procedure TF_DataAware.MainTableAfterDelete(DataSet: TDataSet);
begin
  Ativa_Desativa_Botoes;
end;

procedure TF_DataAware.MainTableAfterOpen(DataSet: TDataSet);
begin
  Ativa_Desativa_Botoes;
end;

procedure TF_DataAware.MainTableAfterPost(DataSet: TDataSet);
begin
  Ativa_Desativa_Botoes;
end;

procedure TF_DataAware.Novo;
begin
    MainTable.Insert;
    Ativa_Desativa_Botoes;
    pc_Cadastro.ActivePage := tsCadastro;
end;

procedure TF_DataAware.Novo1Click(Sender: TObject);
begin
  Novo;
end;

procedure TF_DataAware.Sair1Click(Sender: TObject);
begin
    Close;
end;

end.
