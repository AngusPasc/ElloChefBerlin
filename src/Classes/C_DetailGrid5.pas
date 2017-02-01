{ Gustavo Persan - Criação

}
unit C_DetailGrid5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, DB, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, vcl.DBCtrls,
  Menus, DBGrids, FireDAC.Comp.Client,

  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, cxGridDBTableView, cxGrid, cxDB, cxDBFilter, cxDBData, cxDBEdit,
  cxGridDBDataDefinitions, cxGridTableView,


  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit,
  cxNavigator, dxmdaset, cxGridLevel, cxGridCustomTableView,
  cxClasses, cxGridCustomView, cxEditRepositoryItems, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxButtons, Vcl.ImgList,
  dxSkinMetropolis, dxSkinMetropolisDark, dxSkinOffice2013DarkGray,
  dxSkinOffice2013LightGray, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, System.ImageList;


type
  TSavedObject = record
                       SavedObject : TComponent;
                       SavedClass : String;
                       Enabled : Boolean;
                       ReadOnly : Boolean;
                       OnShow : TNotifyEvent;
                       OnEnter : TNotifyEvent;
                       OnExit : TNotifyEvent;
                       OnKeyDown : TKeyEvent;
                 end;

  TSavedObjects = array[0..512] of TSavedObject;

  TF_DetailGrid5 = class(TForm)
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    Novo1: TMenuItem;
    Grava1: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Adiciona1: TMenuItem;
    Modifica1: TMenuItem;
    Exclui1: TMenuItem;
    Imagens: TImageList;
    b_Novo: TcxButton;
    b_Grava: TcxButton;
    b_Sair: TcxButton;
    procedure ExecutaOnExit;
    procedure Grava;
    procedure Cancela;
    procedure Altera;
    procedure Novo;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Novo1Click(Sender: TObject);
    procedure Grava1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure NovoRegistro(var MTable : TFDQuery);
    procedure AlteraRegistro(var MTable : TFDQuery);
    procedure ExcluiRegistro(var MTable : TFDQuery;Pergunta: Boolean = True; Retorno: Integer = 0);
    procedure ConsultaRegistro( var MTable : TFDQuery) ;
    procedure FormShow(Sender: TObject);
    procedure b_NovoClick(Sender: TObject);
    procedure b_GravaClick(Sender: TObject);
    procedure b_SairClick(Sender: TObject);
  private
    { Private declarations }
    LogDatamaster: String;
    SavedObjects : TSavedObjects;
    SavedObjectsCount : integer;
    SaveObjectsNow : Boolean;
  public
    { Public declarations }
    MainTable : TFDQuery;
    OnCommit : Procedure(IsDelete : Boolean);
    OnCancel : Procedure;
    FirstTabField : TWinControl;
    ButtonResult : TModalResult;
    NO_Insert : Boolean;
    NO_Update : Boolean;
    NO_Delete : Boolean;
  end;

var
  F_DetailGrid5: TF_DetailGrid5;

implementation

{$R *.dfm}

uses unRegrasDataModule, U_DataModule_Library;

{ TF_DetailGrid5 }

procedure none(IsDelete : Boolean);
begin
   //none
end;

procedure cnone;
begin
   //none
end;

procedure TF_DetailGrid5.Altera;
begin
    MainTable.Edit;
end;

procedure TF_DetailGrid5.AlteraRegistro(var MTable: TFDQuery);
begin
    MainTable := MTable;
   //se entrou para alterar e não possui permissão ajustar objetos
    if Addr(Self.OnShow) = nil then
       Self.OnShow := SavedObjects[0].OnShow;

   SaveObjectsNow := True; //NO_Update; removido temporario by gustavo
   Altera;
   ShowModal;
   if MainTable.State in [dsInsert,dsEdit] then MainTable.Cancel;
end;

procedure TF_DetailGrid5.Cancela;
begin
    MainTable.CancelUpdates;
end;

procedure TF_DetailGrid5.ConsultaRegistro(var MTable: TFDQuery);
var StatusGrava, StatusNovo : boolean;
begin
     MainTable := MTable;
     StatusGrava := B_Grava.Enabled;
     StatusNovo := B_Novo.Enabled;
     StatusGrava := Grava1.Enabled;
     StatusNovo := Novo1.Enabled;
     B_Grava.Enabled := False;
     B_Novo.Enabled := False;
     Grava1.Enabled := False;
     Novo1.Enabled := False;
     ShowModal;
     B_Grava.Enabled := StatusGrava;
     B_Novo.Enabled := StatusNovo;
     Grava1.Enabled := StatusGrava;
     Novo1.Enabled := StatusNovo;
end;

procedure TF_DetailGrid5.b_GravaClick(Sender: TObject);
var
   CurrentComponent : TWinControl;
begin
{$IFNDEF Prototipo}
     ExecutaOnExit;
     Grava;
{$ENDIF}
    Close;
end;

procedure TF_DetailGrid5.b_NovoClick(Sender: TObject);
var
   CurrentComponent : TWinControl;
begin
{$IFNDEF Prototipo}
     ExecutaOnExit;
     Grava;
     Novo;
{$ENDIF}

	OnShow(Sender);
end;

procedure TF_DetailGrid5.b_SairClick(Sender: TObject);
begin
  Close;
end;

procedure TF_DetailGrid5.ExcluiRegistro(var MTable: TFDQuery; Pergunta: Boolean;
  Retorno: Integer);
begin
    if Pergunta then
    begin
      Retorno := MessageDlg('Deseja excluir registro?',mtConfirmation, [mbYes, mbNo], 0);
    end;
     if Retorno = mrYes then begin
	  MainTable := MTable;
	  if not MainTable.Connection.InTransaction then MainTable.Connection.StartTransaction;
	  try
	     MainTable.Delete;
	     MainTable.ApplyUpdates;
	     OnCommit(True);
	     if MainTable.Connection.InTransaction then MainTable.Connection.Commit;
	  except
	     if MainTable.Connection.InTransaction then MainTable.Connection.Rollback;
             Cancela;
             raise;
          end;
          MainTable.CommitUpdates;  //Limpa o cache de atualizações
     end;

end;

Procedure TF_DetailGrid5.ExecutaOnExit;
var
   ExitField : TNotifyEvent;
   CurrentComponent : TWinControl;
begin
     CurrentComponent := ActiveControl; //Guarda o componente corrente
     ExitField := Nil; // Variavel para guardar o onExit
     if ActiveControl is TDBEdit then // força saída onExit apenas para DBEdit
     begin
       ExitField := TDBEdit(ActiveControl).OnExit; //Quarda a programação do onExit
       TDBEdit(ActiveControl).OnExit := nil; //zera o onExit
     end;

     ActiveControl := nil; //Força o onExit vazio apenas para garantir que o valor vai estar na query, para evitar problema de utilizar o fieldbyname no onexit e o mesmo não estar atualizado
     try
       if Addr(ExitField) <> nil then //Se existia programação do onExit
         ExitField(CurrentComponent); // executo o onExit
     finally
       if CurrentComponent is TDBEdit then
       begin
         TDBEdit(CurrentComponent).OnExit := ExitField; //Atribuo o onExit novamente para o componente
       end;

       if (CurrentComponent <> nil) and (CurrentComponent.canfocus) then
         ActiveControl := CurrentComponent; //volto o foco para o componente
     end;
end;

procedure TF_DetailGrid5.FormActivate(Sender: TObject);
var
   ComponentIndex, ObjectIndex : integer;

begin
    if SaveObjectsNow then begin
        ObjectIndex := 0; //Form
        Show;
        SavedObjects[0].OnShow := Self.OnShow;
        Self.Onshow := nil;

      	SavedObjectsCount := 1;
        ObjectIndex := 1;
        //Verifica se existem botões de manutenção de grids
        for ComponentIndex := 0 to Self.ComponentCount-1 do begin
            //Desabilita os SpeedButtons
	    if (Self.Components[ComponentIndex].ClassName = 'TSpeedButton') and (Self.Components[ComponentIndex] <> b_sair) then begin
          SavedObjects[ObjectIndex].SavedObject := FindComponent(Self.Components[ComponentIndex].Name);
          SavedObjects[ObjectIndex].SavedClass  := TWinControl(SavedObjects[ObjectIndex].SavedObject).ClassName;
          SavedObjects[ObjectIndex].Enabled     := TWinControl(SavedObjects[ObjectIndex].SavedObject).Enabled;
          TWinControl(SavedObjects[ObjectIndex].SavedObject).Enabled := False;
          Inc(ObjectIndex);
          Inc(SavedObjectsCount);
	    end
	    else
      if (Self.Components[ComponentIndex].ClassName = 'TMenuItem') and (Self.Components[ComponentIndex] <> Sair1) then begin
	       	SavedObjects[ObjectIndex].SavedObject := FindComponent(Self.Components[ComponentIndex].Name);
          SavedObjects[ObjectIndex].SavedClass  := TWinControl(SavedObjects[ObjectIndex].SavedObject).ClassName;
          SavedObjects[ObjectIndex].Enabled := TMenuItem(SavedObjects[ObjectIndex].SavedObject).Enabled;
          TMenuItem(SavedObjects[ObjectIndex].SavedObject).Enabled := False;
          Inc(ObjectIndex);
          Inc(SavedObjectsCount);
      end
      else
      if (Self.Components[ComponentIndex].ClassName = 'TcxGrid') then begin
                SavedObjects[ObjectIndex].SavedObject := FindComponent(Self.Components[ComponentIndex].Name);

                //SavedObjects[ObjectIndex].Readonly    := TcxGrid(SavedObjects[ObjectIndex].SavedObject).Readonly;
                //SavedObjects[ObjectIndex].Readonly    := TcxGrid(SavedObjects[ObjectIndex].SavedObject).Readonly;

                //TcxGrid(SavedObjects[ObjectIndex].SavedObject).Readonly := True;
                //TcxGrid(SavedObjects[ObjectIndex].SavedObject).Re

                Inc(ObjectIndex);
                Inc(SavedObjectsCount);
      end;


      end;

	SaveObjectsNow := false;
    end;

end;

procedure TF_DetailGrid5.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TF_DetailGrid5.FormCreate(Sender: TObject);
begin
     OnCommit := none;
     OnCancel := cnone;

{$IFNDEF Prototipo}
     FirstTabField := ActiveControl;
{$ENDIF}
end;

procedure TF_DetailGrid5.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
   if (not (ActiveControl is TcxGrid)) and (not (ActiveControl is TCustomMemo)) then begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
//   else if (ActiveControl is TcxGrid) then
//           with TcxGrid(ActiveControl) do
//                if selectedindex < (fieldcount -1) then selectedindex := selectedindex +1
//                else selectedindex := 0;
end;

procedure TF_DetailGrid5.FormShow(Sender: TObject);
begin
{$IFNDEF Prototipo}
     if FirstTabField <> nil then FirstTabField.SetFocus;
{$ENDIF}
end;

Procedure TF_DetailGrid5.Grava;
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
end;

procedure TF_DetailGrid5.Grava1Click(Sender: TObject);
begin
    b_Grava.Click;
end;

procedure TF_DetailGrid5.Novo;
begin
    MainTable.Insert;
end;

procedure TF_DetailGrid5.Novo1Click(Sender: TObject);
begin
    b_Novo.Click;
end;

procedure TF_DetailGrid5.NovoRegistro(var MTable: TFDQuery);
var
    ObjectIndex : Integer;

begin
     MainTable := MTable;

     //Pesquisa Permissões
//     with TQuery.Create(Self) do
//     try
//        DatabaseName := 'Data_Base';
//        SQL.Add('SELECT NVL(sigma.pkg_sigma.get_NO_INSERT,0) NO_INSERT, NVL(sigma.pkg_sigma.get_NO_UPDATE,0) NO_UPDATE, NVL(sigma.pkg_sigma.get_NO_DELETE,0) NO_DELETE from DUAL');
//        Open;
//
//        NO_Insert := (FieldByName('NO_INSERT').AsInteger = 1);
//        NO_Update := (FieldByName('NO_UPDATE').AsInteger = 1);
//        NO_Delete := (FieldByName('NO_DELETE').AsInteger = 1);
//        Free;
//     except
//           Free;
//           Raise;
//     end;

     //Restaura as configurações dos componentes armazenados em SavedObjects
     for ObjectIndex := 0 to SavedObjectsCount-1 do begin
         //Restaura o Form
         if ObjectIndex = 0 then Self.OnShow := SavedObjects[0].OnShow;

         //Restaura os demais objetos
         if ObjectIndex > 0 then begin
             if SavedObjects[ObjectIndex].SavedClass = 'TSpeedButton' then TWinControl(SavedObjects[ObjectIndex].SavedObject).Enabled := SavedObjects[ObjectIndex].Enabled
             else if SavedObjects[ObjectIndex].SavedClass = 'TMenuItem' then TMenuItem(SavedObjects[ObjectIndex].SavedObject).Enabled := SavedObjects[ObjectIndex].Enabled
             //else if SavedObjects[ObjectIndex].SavedClass = 'TcxGrid' then TcxGrid(SavedObjects[ObjectIndex].SavedObject).Readonly := SavedObjects[ObjectIndex].Readonly;
         end;
     end;
     SavedObjectsCount := 0;
     SaveObjectsNow := false;

     Novo;
     Showmodal;
     if MainTable.State in [dsInsert,dsEdit] then MainTable.Cancel;
end;

procedure TF_DetailGrid5.Sair1Click(Sender: TObject);
begin
    b_Sair.Click;
end;

end.
