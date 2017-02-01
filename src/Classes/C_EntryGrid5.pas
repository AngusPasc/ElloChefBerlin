unit C_EntryGrid5;
{   Gutopersan   -  12/02/2015 - Criação.
}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Dbgrids,
  Vcl.Menus, cxGridDBTableView, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys, FireDAC.Phys.ODBCBase,
  FireDAC.Phys.MSSQL, cxDB, cxDBFilter, cxDBData, cxDBEdit, cxGridDBDataDefinitions,
  cxGridTableView, cxGrid,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxmdaset, cxGridLevel, cxGridCustomTableView,
  cxClasses, cxGridCustomView, cxEditRepositoryItems, FireDAC.Phys.MSSQLDef;


type
  TF_EntryGrid5 = class(TForm)
    DS_MainTable: TDataSource;
    UPD_MainTable: TFDUpdateSQL;
    Q_Criterio_Filtro2: TFDQuery;
    Upd_Criterio: TFDUpdateSQL;
    Panel1: TPanel;
    b_Novo: TBitBtn;
    b_Altera: TBitBtn;
    b_Exclui: TBitBtn;
    b_Localiza: TBitBtn;
    b_Pesquisa: TBitBtn;
    b_Filtro: TBitBtn;
    b_Print: TBitBtn;
    b_Sair: TBitBtn;
    MainTable: TFDQuery;
    PopupMenu1: TPopupMenu;
    Novo1: TMenuItem;
    Altera1: TMenuItem;
    Exclui1: TMenuItem;
    N1: TMenuItem;
    Filtro1: TMenuItem;
    Imprime1: TMenuItem;
    N2: TMenuItem;
    Sair1: TMenuItem;
    FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink;
    FDGUIxWaitCursor2: TFDGUIxWaitCursor;
    procedure b_PesquisaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Sair1Click(Sender: TObject);
    procedure Imprime1Click(Sender: TObject);
    procedure Filtro1Click(Sender: TObject);
    procedure Novo1Click(Sender: TObject);
    procedure Altera1Click(Sender: TObject);
    procedure MainTableAfterPost(DataSet: TDataSet);
    procedure MainTableAfterOpen(DataSet: TDataSet);
    procedure MainTableAfterDelete(DataSet: TDataSet);
    procedure b_ExcluiClick(Sender: TObject);
    procedure b_AlteraClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    NO_Insert : Boolean;
    NO_Update : Boolean;
    NO_Delete : Boolean;
  public
    { Public declarations }
    Grid : TcxGrid;
    cxGridTV : TcxGridDBTableView;
    ReportFields : TList;
    procedure Ativa_Desativa_Botoes;
  end;

var
  F_EntryGrid5: TF_EntryGrid5;

implementation

{$R *.dfm}

uses U_DataModule_Library, unRegrasDataModule;

procedure TF_EntryGrid5.Altera1Click(Sender: TObject);
begin
    b_Altera.Click;
end;

procedure TF_EntryGrid5.Ativa_Desativa_Botoes;
begin
     B_Novo.Enabled   := not NO_Insert;

     if MainTable.IsEmpty then begin
	if B_Altera.Visible then B_Altera.Enabled := false;
	if B_Exclui.Visible then B_Exclui.Enabled := false;
	if B_Print.Visible then B_Print.Enabled := false;
     end
     else begin
	if B_Altera.Visible then B_Altera.Enabled := true;
	if B_Exclui.Visible and (not NO_Delete) then B_Exclui.Enabled := true;
	if B_Print.Visible then B_Print.Enabled := true;
     end;
     Novo1.Enabled    := B_Novo.Enabled;
     Altera1.Enabled  := B_Altera.Enabled;
     Exclui1.Enabled  := B_Exclui.Enabled;
     Imprime1.Enabled := B_Print.Enabled;
end;

procedure TF_EntryGrid5.b_AlteraClick(Sender: TObject);
begin
{$IFNDEF Prototipo}
{$ENDIF}
end;

procedure TF_EntryGrid5.b_ExcluiClick(Sender: TObject);
begin
{$IFNDEF Prototipo}
{$ENDIF}
end;

procedure TF_EntryGrid5.b_PesquisaClick(Sender: TObject);
begin
  Close;
end;

procedure TF_EntryGrid5.Filtro1Click(Sender: TObject);
begin
    b_Filtro.Click;
end;

procedure TF_EntryGrid5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Q_Criterio_Filtro2.Close;
end;

procedure TF_EntryGrid5.FormDestroy(Sender: TObject);
begin
{$IFNDEF Prototipo}
    MainTable.Close;
{$ENDIF}
end;

procedure TF_EntryGrid5.FormKeyPress(Sender: TObject; var Key: Char);
begin
    if key = #13 then
      if not (ActiveControl is TcxGrid) then begin
         Key := #0;
         Perform(WM_NEXTDLGCTL, 0, 0);
      end
      else if (ActiveControl is TcxGrid) then
              With TdbGrid(ActiveControl) do
                   if SelectedIndex < (FieldCount - 1) then selectedIndex := selectedIndex + 1
                   else SelectedIndex := 0;
end;

procedure TF_EntryGrid5.FormShow(Sender: TObject);
begin
{$IFNDEF Prototipo}
   Form_Principal := Self.Name;
   Q_Criterio_Filtro2.Open;
   Application.ProcessMessages;
   MainTable.Open;
   MainTable.Active := True;

   Ativa_Desativa_Botoes;
{$ELSE}
     MainTable.Close;
{$ENDIF}
end;

procedure TF_EntryGrid5.Imprime1Click(Sender: TObject);
begin
    b_Print.Click;
end;

procedure TF_EntryGrid5.MainTableAfterDelete(DataSet: TDataSet);
begin
      Ativa_Desativa_Botoes;
end;

procedure TF_EntryGrid5.MainTableAfterOpen(DataSet: TDataSet);
begin
      Ativa_Desativa_Botoes;
end;

procedure TF_EntryGrid5.MainTableAfterPost(DataSet: TDataSet);
begin
      Ativa_Desativa_Botoes;
end;

procedure TF_EntryGrid5.Novo1Click(Sender: TObject);
begin
    b_Novo.Click;
end;

procedure TF_EntryGrid5.Sair1Click(Sender: TObject);
begin
    b_Sair.Click;
end;

end.
