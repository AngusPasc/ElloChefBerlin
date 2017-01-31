unit unPedido;

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
  FireDAC.VCLUI.Wait, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, ACBrBase,
  ACBrEnterTab, FireDAC.Comp.UI, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, Vcl.ImgList, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, cxPC, cxButtons, Vcl.ExtCtrls;

type
  TfrmPedido = class(TF_DataAware)
    Panel1: TPanel;
    Label1: TLabel;
    lbNumeroPedido: TLabel;
    DBGrid2: TDBGrid;
    edCodigoProduto: TEdit;
    Label3: TLabel;
    lbDescProduto: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EdQuantidade: TEdit;
    edValorUnitario: TEdit;
    Label7: TLabel;
    Image1: TImage;
    Panel2: TPanel;
    Label8: TLabel;
    lbSubTotal: TLabel;
    Label10: TLabel;
    edValorTotal: TEdit;
    qryPedidoItem: TFDQuery;
    dsPedidoItem: TDataSource;
    updPedidoItem: TFDUpdateSQL;
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
    procedure FormShow(Sender: TObject);
    procedure bt_CancelarClick(Sender: TObject);
    procedure edCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure MainTableAfterInsert(DataSet: TDataSet);
    procedure bt_SalvarClick(Sender: TObject);
    procedure EdQuantidadeExit(Sender: TObject);
    procedure edValorUnitarioExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryPedidoItemAfterInsert(DataSet: TDataSet);
    procedure edCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edValorTotalExit(Sender: TObject);
    procedure bt_SairClick(Sender: TObject);
    procedure qryPedidoItemBeforePost(DataSet: TDataSet);
    procedure qryPedidoItemBeforeInsert(DataSet: TDataSet);
    procedure qryPedidoItemAfterPost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure LimpaTela;
    procedure CalculaItem;
    procedure GravaItem;
    procedure LimpaDadosProduto;
    procedure CalcTotalPedido;
  public
    { Public declarations }
     OnCommit : Procedure(IsDelete : Boolean);
     OnCancel : Procedure;
     FirstTabField : TWinControl;
  end;

var
  frmPedido: TfrmPedido;

implementation

{$R *.dfm}

uses unRotinas;

procedure none(IsDelete : Boolean);
begin
   //none
end;

procedure cnone;
begin
   //none
end;

procedure TfrmPedido.bt_CancelarClick(Sender: TObject);
begin
  //inherited;
  if MessageDlg('Deseja Realmente Cancelar esse Pedido?', mtConfirmation,
                [mbYes, mbNo], 0) = mrYes then
  begin
    Maintable.CancelUpdates;
    LimpaTela;
    MainTable.Insert;
  end else
    Abort;
end;



procedure TfrmPedido.bt_SairClick(Sender: TObject);
var par : string;
begin
  //inherited;
  if (MainTable.FieldByName('FLAG_EDITANDO').AsFloat = 1) then
  begin
      if MessageDlg('O Pedido está aberto e não foi finalizado, Deseja excluir ?', mtConfirmation,
                    [mbYes, mbNo], 0) = mrYes then
      begin
          //Primeiro, excluir os Itens do Pedido
          par := ' DELETE FROM PEDIDOS_ITENS WHERE COD_PEDIDO = ' + IntToStr(MainTable.FieldByName('COD_PEDIDO').AsInteger);
          with TFDQuery.Create(nil) do
          try
            Connection := frmPedido.MainTable.Connection;
            Sql.Append(par);
            ExecSQL;
          finally
            Free;
          end;

          //Segundo, excluir o Pedido
          par := ' DELETE FROM PEDIDOS WHERE COD_PEDIDO = ' + IntToStr(MainTable.FieldByName('COD_PEDIDO').AsInteger);
          with TFDQuery.Create(nil) do
          try
            Connection := frmPedido.MainTable.Connection;
            Sql.Append(par);
            ExecSQL;
          finally
            Free;
          end;

          close;


//          if not qryPedidoItem.Connection.InTransaction then
//                 qryPedidoItem.Connection.StartTransaction;
//          try
//             qryPedidoItem.Delete;
//             qryPedidoItem.ApplyUpdates;
//             OnCommit(True);
//             if qryPedidoItem.Connection.InTransaction then
//                qryPedidoItem.Connection.Commit;
//          except
//
//             MessageDlg('Esse registro não pode ser excluído.'+#13+#10+'Motivo: *Dependência de outro cadastro.', mtError, [mbOK], 0);
//
//             if qryPedidoItem.Connection.InTransaction then
//                qryPedidoItem.Connection.Rollback;
//
//                qryPedidoItem.CancelUpdates;
//                raise;
//          end;
//                qryPedidoItem.CommitUpdates;  //Limpa o cache de atualizações

          //Segundo, excluir o Pedido
//          if not MainTable.Connection.InTransaction then
//                 MainTable.Connection.StartTransaction;
//          try
//             MainTable.Delete;
//             MainTable.ApplyUpdates;
//             OnCommit(True);
//             if MainTable.Connection.InTransaction then
//                MainTable.Connection.Commit;
//          except
//
//             MessageDlg('Esse registro não pode ser excluído.'+#13+#10+'Motivo: *Dependência de outro cadastro.', mtError, [mbOK], 0);
//
//             if MainTable.Connection.InTransaction then
//                MainTable.Connection.Rollback;
//
//                MainTable.CancelUpdates;
//                raise;
//          end;
//                MainTable.CommitUpdates;  //Limpa o cache de atualizações


      end;
  end;

end;

procedure TfrmPedido.bt_SalvarClick(Sender: TObject);
begin

//  inherited;

   MainTable.FieldByName('DATA').AsDateTime := date;
   MainTable.FieldByName('HORA').AsDateTime := Time;

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

end;

procedure TfrmPedido.CalcTotalPedido;
begin
    with TFDQuery.Create(nil) do
    try
      Connection := frmPedido.MainTable.Connection;
      Sql.Add(' SELECT SUM(I.VR_BRUTO) AS VR_TOTAL FROM PEDIDOS_ITENS I WHERE I.COD_PEDIDO = :COD_PEDIDO');
      ParamByName('COD_PEDIDO').AsFloat := MainTable.FieldByName('COD_PEDIDO').AsFloat;
      Open;
      lbSubTotal.Caption   := 'R$ ' + FormatFloat('0.00', FieldByName('VR_TOTAL').AsFloat );
    finally
      Free;
    end;
end;

procedure TfrmPedido.CalculaItem;
begin
  edValorTotal.Text := FormatFloat('0.00', StrToFloat(EdQuantidade.Text) * StrToFloat(edValorUnitario.Text));
end;

procedure TfrmPedido.edCodigoProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
   if key = VK_RETURN then
   begin
      with TFDQuery.Create(nil) do
      try
        Connection := frmPedido.MainTable.Connection;
        Sql.Add(' SELECT P.*');
        Sql.Add('   FROM PRODUTO P');
        Sql.Add('  WHERE P.COD_PRODUTO = :COD_PRODUTO ');
        ParamByName('COD_PRODUTO').AsString := edCodigoProduto.Text;
        Open;

        if ((not IsEmpty) and (MainTable.State in [dsInsert,dsEdit])) then begin
           lbDescProduto.Caption   := FieldByName('DESCRICAO').AsString;
           edValorUnitario.Text    := FormatFloat('0.00', StrToFloat(FieldByName('PRECO').AsString) );
           EdQuantidade.Text       := '1';
        end else
        begin
          MessageDlg('Produto Não Cadastrado!', mtWarning, [mbOK], 0);
          edCodigoProduto.SetFocus;
          Exit;
        end;

      finally
        Free;
      end;
   end;
end;

procedure TfrmPedido.edCodigoProdutoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
   if not(key in ['0'..'9',#8]) then
      Key:=#0;
end;

procedure TfrmPedido.EdQuantidadeExit(Sender: TObject);
begin
  inherited;
  CalculaItem;
end;

procedure TfrmPedido.edValorTotalExit(Sender: TObject);
begin
  inherited;
  GravaItem;
end;

procedure TfrmPedido.edValorUnitarioExit(Sender: TObject);
begin
  inherited;
  edValorUnitario.Text := FormatFloat('0.00', StrToFloat(edValorUnitario.Text) );
  CalculaItem;
end;

procedure TfrmPedido.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // inherited;

end;

procedure TfrmPedido.FormCreate(Sender: TObject);
begin
  inherited;
     OnCommit := none;
     OnCancel := cnone;
end;

procedure TfrmPedido.FormShow(Sender: TObject);
begin
  inherited;
     pc_Cadastro.ActivePage := tsCadastro;
     //MainTable.Open;
     //MainTable.Close;
     MainTable.Insert;

       bt_Cancelar.Enabled := True;
       bt_Salvar.Enabled   := True;
       bt_Altera.Enabled   := True;
       bt_Excluir.Enabled  := True;
       bt_Imprime.Enabled  := True;
       bt_Filtro.Enabled   := True;

  if edCodigoProduto.CanFocus then edCodigoProduto.SetFocus;


end;

procedure TfrmPedido.GravaItem;
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

procedure TfrmPedido.LimpaDadosProduto;
begin
     edCodigoProduto.Clear;
     EdQuantidade.Clear;
     edValorUnitario.Clear;
     edValorTotal.Clear;
     if edCodigoProduto.CanFocus then edCodigoProduto.SetFocus;
     lbDescProduto.Caption := '';
end;

procedure TfrmPedido.LimpaTela;
begin
  edCodigoProduto.Clear;
  EdQuantidade.Clear;
  edValorUnitario.Clear;
  edValorTotal.Clear;
  lbSubTotal.Caption := '';
  edCodigoProduto.SetFocus;
end;

procedure TfrmPedido.MainTableAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('FLAG_EDITANDO').AsFloat := 1;
  DataSet.FieldByName('FLAG_GRAVADO').AsFloat  := 0;
  DataSet.FieldByName('COD_EMPRESA').AsFloat   := 1;
  DataSet.FieldByName('COD_CLIENTE').AsFloat   := 1;
  lbNumeroPedido.Caption :=  IncCodigo('COD_PEDIDO','PEDIDOS');
  DataSet.FieldByName('COD_PEDIDO').AsFloat := StrToInt( IncCodigo('COD_PEDIDO','PEDIDOS') );
end;

procedure TfrmPedido.qryPedidoItemAfterInsert(DataSet: TDataSet);
begin
  inherited;
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

procedure TfrmPedido.qryPedidoItemAfterPost(DataSet: TDataSet);
begin
  inherited;
    TFloatField(DataSet.FieldByName('QTD')).DisplayFormat         := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_BRUTO')).DisplayFormat    := '#,##0.00';
end;

procedure TfrmPedido.qryPedidoItemBeforeInsert(DataSet: TDataSet);
begin
  inherited;
    TFloatField(DataSet.FieldByName('QTD')).DisplayFormat         := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_BRUTO')).DisplayFormat    := '#,##0.00';
end;

procedure TfrmPedido.qryPedidoItemBeforePost(DataSet: TDataSet);
begin
  inherited;
    TFloatField(DataSet.FieldByName('QTD')).DisplayFormat         := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_UNITARIO')).DisplayFormat := '#,##0.00';
    TFloatField(DataSet.FieldByName('VR_BRUTO')).DisplayFormat    := '#,##0.00';
end;

end.
