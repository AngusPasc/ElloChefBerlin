unit unPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, cxControls, dxSkinscxPCPainter, dxBarBuiltInMenu, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MSSQLDef, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, ACBrBase, ACBrEnterTab, FireDAC.Comp.UI, FireDAC.Phys,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.MSSQL, System.ImageList, Vcl.ImgList,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, cxPC, cxButtons, cxTextEdit, cxContainer, cxEdit,
  cxDBEdit;

type
  TfrmPedidos = class(TForm)
    pnBotoes: TPanel;
    bt_Salvar: TcxButton;
    bt_Altera: TcxButton;
    bt_Sair: TcxButton;
    bt_Cancelar: TcxButton;
    MainTable: TFDQuery;
    DS_MainTable: TDataSource;
    upt_MainTable: TFDUpdateSQL;
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
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    ACBrEnterTab1: TACBrEnterTab;
    qryPedidoItem: TFDQuery;
    qryPedidoItemCOD_PEDIDO: TIntegerField;
    qryPedidoItemCOD_ITEM: TIntegerField;
    qryPedidoItemCOD_PRODUTO: TStringField;
    qryPedidoItemCOD_GRADE: TStringField;
    qryPedidoItemQTD: TBCDField;
    qryPedidoItemUNIDADE: TStringField;
    qryPedidoItemDESCRICAO_ADICIONAL: TStringField;
    qryPedidoItemVR_UNITARIO: TFMTBCDField;
    qryPedidoItemVR_BRUTO: TBCDField;
    qryPedidoItemVR_DESCONTO: TBCDField;
    qryPedidoItemVR_LIQUIDO: TBCDField;
    qryPedidoItemVR_ACRESCIMO: TBCDField;
    qryPedidoItemFLAG_CANCELADO: TSmallintField;
    qryPedidoItemDATA_CANCELAMENTO: TSQLTimeStampField;
    qryPedidoItemMOTIVO_CANCELAMENTO: TStringField;
    qryPedidoItemDESCRICAO: TStringField;
    dsPedidoItem: TDataSource;
    updPedidoItem: TFDUpdateSQL;
    DBGrid2: TDBGrid;
    edCodigoProduto: TEdit;
    EdQuantidade: TEdit;
    edValorTotal: TEdit;
    edValorUnitario: TEdit;
    Image1: TImage;
    Label10: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lbDescProduto: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    lbNumeroPedido: TLabel;
    Panel2: TPanel;
    Label8: TLabel;
    lbSubTotal: TLabel;
    procedure ExecutaOnExit;
    procedure Grava;
    procedure Novo;
    procedure Exclui;
    procedure Cancela;
    procedure MainTableAfterInsert(DataSet: TDataSet);
    procedure qryPedidoItemAfterInsert(DataSet: TDataSet);
    procedure qryPedidoItemAfterPost(DataSet: TDataSet);
    procedure qryPedidoItemBeforeInsert(DataSet: TDataSet);
    procedure qryPedidoItemBeforePost(DataSet: TDataSet);
    procedure edCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_CancelarClick(Sender: TObject);
    procedure bt_SalvarClick(Sender: TObject);
    procedure edValorTotalExit(Sender: TObject);
    procedure edValorUnitarioExit(Sender: TObject);
  private
    { Private declarations }
    procedure GravaItem;
    procedure LimpaTela;
    procedure CalculaItem;
    procedure LimpaDadosProduto;
    procedure CalcTotalPedido;
  public
    { Public declarations }
     OnCommit : Procedure(IsDelete : Boolean);
     OnCancel : Procedure;
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses unRotinas, U_DataModule_Library, unPesquisaProdutoZ, unRegrasDataModule;

procedure none(IsDelete : Boolean);
begin
   //none
end;

procedure cnone;
begin
   //none
end;

{ TfrmPedidos }

procedure TfrmPedidos.bt_CancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja Realmente Cancelar esse Pedido?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
  begin
    Maintable.CancelUpdates;
    LimpaTela;
    MainTable.Insert;
  end else
    Abort;
end;

procedure TfrmPedidos.bt_SalvarClick(Sender: TObject);
begin
     if not MainTable.Connection.InTransaction then MainTable.Connection.StartTransaction;
     try
        MainTable.Post;
        MainTable.ApplyUpdates; //Aplica as atualizações
        OnCommit(False);
        if MainTable.Connection.InTransaction then MainTable.Connection.Commit;
     except
        if MainTable.Connection.InTransaction then MainTable.Connection.Rollback;
           MainTable.Edit;  //Se der problema volta o registro em edição e aborta
        raise;
     end;
     MainTable.CommitUpdates;  //Limpa o cache de atualizações
end;

procedure TfrmPedidos.CalcTotalPedido;
begin
    with TFDQuery.Create(nil) do
    try
      Connection := frmPedidos.MainTable.Connection;
      Sql.Add(' SELECT SUM(I.VR_BRUTO) AS VR_TOTAL FROM PEDIDOS_ITENS I WHERE I.COD_PEDIDO = :COD_PEDIDO');
      ParamByName('COD_PEDIDO').AsFloat := MainTable.FieldByName('COD_PEDIDO').AsFloat;
      Open;
      lbSubTotal.Caption   := 'R$ ' + FormatFloat('0.00', FieldByName('VR_TOTAL').AsFloat );
    finally
      Free;
    end;
end;

procedure TfrmPedidos.CalculaItem;
begin
  edValorTotal.Text := FormatFloat('0.00', StrToFloat(EdQuantidade.Text) * StrToFloat(edValorUnitario.Text));
end;

procedure TfrmPedidos.Cancela;
begin
   Maintable.CancelUpdates;
end;

procedure TfrmPedidos.edCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if key = VK_RETURN then
   begin
      with TFDQuery.Create(nil) do
      try
        Connection := frmPedidos.MainTable.Connection;
        Sql.Add(' SELECT P.*');
        Sql.Add('   FROM PRODUTO P');
        Sql.Add('  WHERE P.COD_PRODUTO LIKE :COD_PRODUTO ');
        ParamByName('COD_PRODUTO').AsString := '%' + edCodigoProduto.Text + '%';
        Open;

        if ((not IsEmpty) and (MainTable.State in [dsInsert,dsEdit])) then begin
           lbDescProduto.Caption   := FieldByName('DESCRICAO').AsString;
           edValorUnitario.Text    := FormatFloat('0.00', StrToFloat(FieldByName('PRECO').AsString) );
           EdQuantidade.Text       := '1';
        end else
        begin
          MessageDlg('Produto Não Cadastrado!', mtWarning, [mbOK], 0);
          edCodigoProduto.Clear;
          if edCodigoProduto.CanFocus then edCodigoProduto.SetFocus;
          Exit;
        end;

      finally
        Free;
      end;

   end;

   if Key = VK_F1 then
   begin
      with DataModule_Library do
      begin
          FrmPesquisaProdutoZ := TFrmPesquisaProdutoZ.Create(Application);

          with FrmPesquisaProdutoZ do
          begin
            Query.Close;
            Query.SQL.Clear;
            Query.SQL.Add(strProdutos);
            Query.Open;

            FrmPesquisaProdutoZ.ShowModal;
            if (btConfimar.Tag = 1) then
            edCodigoProduto.Text := Query.FieldByName('COD_PRODUTO').AsString else
            edCodigoProduto.Text := '';
          end;

      end;
   end;
end;

procedure TfrmPedidos.edCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
begin
   if not(key in ['0'..'9',#8]) then
      Key:=#0;
end;

procedure TfrmPedidos.edValorTotalExit(Sender: TObject);
begin
  GravaItem;
end;

procedure TfrmPedidos.edValorUnitarioExit(Sender: TObject);
begin
  edValorUnitario.Text := FormatFloat('0.00', StrToFloat(edValorUnitario.Text) );
  CalculaItem;
end;

procedure TfrmPedidos.Exclui;
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
end;

procedure TfrmPedidos.ExecutaOnExit;
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

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
     OnCommit := none;
     OnCancel := cnone;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
{$IFNDEF Prototipo}
   Application.ProcessMessages;
   MainTable.Open;
{$ELSE}
     MainTable.Close;
{$ENDIF}

     MainTable.Insert;

     bt_Cancelar.Enabled := True;
     bt_Salvar.Enabled   := True;
     bt_Altera.Enabled   := True;

  if edCodigoProduto.CanFocus then edCodigoProduto.SetFocus;
end;

procedure TfrmPedidos.Grava;
begin
     if not MainTable.Connection.InTransaction then MainTable.Connection.StartTransaction;
     try
        MainTable.Post;
        MainTable.ApplyUpdates; //Aplica as atualizações
        OnCommit(False);
        if MainTable.Connection.InTransaction then MainTable.Connection.Commit;
     except
        if MainTable.Connection.InTransaction then MainTable.Connection.Rollback;
        MainTable.edit;  //Se der problema volta o registro em edição e aborta
        raise;
     end;
     MainTable.CommitUpdates;  //Limpa o cache de atualizações

end;

procedure TfrmPedidos.GravaItem;
begin
     // Gravando o Pedido
     if MainTable.State = dsInsert then begin
        if not MainTable.Connection.InTransaction then MainTable.Connection.StartTransaction;
        try
           MainTable.Post;
           MainTable.ApplyUpdates; //Aplica as atualizações
           OnCommit(False);
           if MainTable.Connection.InTransaction then MainTable.Connection.Commit;
        except
           if MainTable.Connection.InTransaction then MainTable.Connection.Rollback;
           MainTable.edit;  //Se der problema volta o registro em edição e aborta
           raise;
        end;
        MainTable.CommitUpdates;  //Limpa o cache de atualizações
        MainTable.edit;
     end;


     //Gravando o Item Pedido
     qryPedidoItem.Close;
     qryPedidoItem.ParamByName('COD_PEDIDO').AsFloat := MainTable.FieldByName('COD_PEDIDO').AsFloat;
     qryPedidoItem.Open;
     qryPedidoItem.Insert;

     if not qryPedidoItem.Connection.InTransaction then qryPedidoItem.Connection.StartTransaction;
     try
        qryPedidoItem.Post;
        qryPedidoItem.ApplyUpdates; //Aplica as atualizações
        OnCommit(False);
        if qryPedidoItem.Connection.InTransaction then qryPedidoItem.Connection.Commit;
     except
        if qryPedidoItem.Connection.InTransaction then qryPedidoItem.Connection.Rollback;
           qryPedidoItem.Edit;  //Se der problema volta o registro em edição e aborta
        raise;
     end;
     qryPedidoItem.CommitUpdates;  //Limpa o cache de atualizações
     qryPedidoItem.Close;
     qryPedidoItem.Open;

     //Calculando TOTAL
     CalcTotalPedido;

     //Limpando para a proxima inserção de produto
     LimpaDadosProduto;
end;

procedure TfrmPedidos.LimpaDadosProduto;
begin
     edCodigoProduto.Clear;
     EdQuantidade.Clear;
     edValorUnitario.Clear;
     edValorTotal.Clear;
     if edCodigoProduto.CanFocus then edCodigoProduto.SetFocus;
     lbDescProduto.Caption := '';
end;

procedure TfrmPedidos.LimpaTela;
begin
  edCodigoProduto.Clear;
  EdQuantidade.Clear;
  edValorUnitario.Clear;
  edValorTotal.Clear;
  lbSubTotal.Caption := '';
  edCodigoProduto.SetFocus;
end;

procedure TfrmPedidos.MainTableAfterInsert(DataSet: TDataSet);
begin
  DataSet.FieldByName('FLAG_EDITANDO').AsFloat := 1;
  DataSet.FieldByName('FLAG_GRAVADO').AsFloat  := 0;
  DataSet.FieldByName('COD_EMPRESA').AsFloat   := 1;
  DataSet.FieldByName('COD_CLIENTE').AsFloat   := 1;
  lbNumeroPedido.Caption :=  IncCodigo('COD_PEDIDO','PEDIDOS');
  DataSet.FieldByName('COD_PEDIDO').AsFloat := StrToInt( IncCodigo('COD_PEDIDO','PEDIDOS') );
end;

procedure TfrmPedidos.Novo;
begin
    MainTable.Insert;
end;

procedure TfrmPedidos.qryPedidoItemAfterInsert(DataSet: TDataSet);
begin
    TFloatField(DataSet.FieldByName('QTD')).DisplayFormat         := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_BRUTO')).DisplayFormat    := '#,##0.00';


    DataSet.FieldByName('COD_PEDIDO').AsInteger  := MainTable.FieldByName('COD_PEDIDO').AsInteger;
    DataSet.FieldByName('COD_ITEM').AsInteger    := BuscaCodItem(MainTable.FieldByName('COD_PEDIDO').AsInteger  );
    DataSet.FieldByName('COD_PRODUTO').AsString  := edCodigoProduto.Text;
    DataSet.FieldByName('QTD').AsFloat           := StrToFloat(EdQuantidade.Text);
    DataSet.FieldByName('VR_UNITARIO').AsFloat   := StrToFloat(edValorUnitario.Text);
    DataSet.FieldByName('VR_BRUTO').AsFloat      := StrToFloat(edValorTotal.Text);
end;

procedure TfrmPedidos.qryPedidoItemAfterPost(DataSet: TDataSet);
begin
    TFloatField(DataSet.FieldByName('QTD')).DisplayFormat         := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_BRUTO')).DisplayFormat    := '#,##0.00';
end;

procedure TfrmPedidos.qryPedidoItemBeforeInsert(DataSet: TDataSet);
begin
    TFloatField(DataSet.FieldByName('QTD')).DisplayFormat         := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_BRUTO')).DisplayFormat    := '#,##0.00';
end;

procedure TfrmPedidos.qryPedidoItemBeforePost(DataSet: TDataSet);
begin
    TFloatField(DataSet.FieldByName('QTD')).DisplayFormat         := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_BRUTO')).DisplayFormat    := '#,##0.00';
end;

end.
