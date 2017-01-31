unit C_PesquisaGlobal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Menus, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls,
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
  cxNavigator, cxDBData, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  pgStyle = (pgSingle, pgWordSearch);

  TF_PesquisaGlobal = class(TForm)
    Panel1: TPanel;
    Word_Search: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    RadioMaiuscula: TRadioButton;
    RadioMinuscula: TRadioButton;
    RadioIdentico: TRadioButton;
    Panel_ToolBar: TPanel;
    Bevel_Panel: TBevel;
    Panel_TopToolBar: TPanel;
    ToolBar2: TToolBar;
    B_OK: TSpeedButton;
    B_Cancela: TSpeedButton;
    ToolButton2: TToolButton;
    Panel2: TPanel;
    B_Localiza: TSpeedButton;
    B_Tabela: TSpeedButton;
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    Pesquisar1: TMenuItem;
    N1: TMenuItem;
    OK1: TMenuItem;
    Cancela1: TMenuItem;
    PopupMenu2: TPopupMenu;
    Localizar1: TMenuItem;
    Query: TFDQuery;
    cxgPesquisa: TcxGrid;
    cxgPesquisaDBTableView1: TcxGridDBTableView;
    cxgPesquisaLevel1: TcxGridLevel;
    function Open(SQL : String; ResultField, DefaultField, DefaultOperator : Integer; Style : pgStyle; OrderField : String = '') : variant;
    function Predicado(operador, valor : string) : String ;
    procedure B_OKClick(Sender: TObject);
    procedure B_CancelaClick(Sender: TObject);
    procedure B_LocalizaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Word_SearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxgPesquisaDBTableView1DblClick(Sender: TObject);
    procedure QueryAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultField : integer;
    WordSearch : boolean;
    TableForm : TCustomForm;
  end;

var
  F_PesquisaGlobal: TF_PesquisaGlobal;

implementation

{$R *.dfm}

uses U_DataModule_Library;

function TF_PesquisaGlobal.Predicado(operador, valor : string) : String ;
begin

        if operador = 'Contendo' then Predicado := 'LIKE ''%'+Trim(valor)+'%'' '
        else if operador = 'Iniciado' then Predicado := 'LIKE '''+Trim(valor)+'%'' '
             else if operador = 'Finalizado' then Predicado := 'LIKE ''%'+Trim(valor)+''' '
                  else Predicado := Operador+' '''+Trim(valor)+''' ';

end;

procedure TF_PesquisaGlobal.QueryAfterOpen(DataSet: TDataSet);
var x : integer;
begin
// for x := 0 to cxgPesquisaDBTableView1.ColumnCount - 1 do
//     if UpperCase(cxgPesquisaDBTableView1.ViewData.Records[x].FieldName) = 'ROWID' then DBGrid1.Columns[x].Visible := false;
end;

function TF_PesquisaGlobal.Open(SQL : String; ResultField, DefaultField, DefaultOperator : Integer; Style : pgStyle; OrderField : String = '') : variant;
var x : integer;
    IndexRowId : integer;
begin
     Query.Close;
     Query.SQL.Clear;
     Query.SQL.Add('SELECT X.* FROM (');
     Query.SQL.Add(SQL);
     Query.SQL.Add(') X');
     Query.SQL.Add('/* Clausula WHERE */');
     Query.SQL.Add('/* Clausula ORDER BY */');
     if OrderField <> '' then Query.SQL.Add('ORDER BY "'+Trim(OrderField)+'"');
     Query.Open;

     if Style = pgWordSearch then begin
         B_Localiza.Visible := True;
         Panel1.Visible := True;
         Pesquisar1.Enabled := True;

         ComboBox1.Items.Clear;
         Query.GetFieldNames(ComboBox1.Items);

         IndexRowId := -1;
         for x := 0 to ComboBox1.Items.Count-1 do
             if UpperCase(ComboBox1.Items[x]) = 'ROWID' then IndexRowId := x;

         ComboBox1.ItemIndex := (DefaultField-1);
         if IndexRowId >= 0 then ComboBox1.Items.Delete(IndexRowId);

         ComboBox2.ItemIndex := (DefaultOperator-1);
         Tag := 1;
     end
     else begin
        B_Localiza.Visible := False;
        Panel1.Visible := False;
        Pesquisar1.Enabled := False;
        Tag := 0;
     end;


     if showmodal = mrOK then begin
          Open := query.fields[(ResultField-1)].asvariant;
     end
     else begin
         Open := null;
     end;

     query.close;
end;

procedure TF_PesquisaGlobal.B_CancelaClick(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TF_PesquisaGlobal.B_LocalizaClick(Sender: TObject);
Var
        cont, I, ItemOfWHERE, ItemOfORDER : Integer;
        Valor, Campo : String;
begin

try
   Screen.Cursor := crHourGlass;

   cont := 0;
   ItemOfWHERE := 0;
   ItemOfORDER := 0;
   for I := 0 to Query.SQL.Count - 1 do begin
      if Pos('/* Clausula WHERE */', Query.SQL.Strings[I]) >= 1 then ItemOfWHERE := I;
      if Pos('/* Clausula ORDER BY */', Query.SQL.Strings[I]) >= 1 then ItemOfORDER := I;
   end;

   for I := 1 to (ItemOfORDER - ItemOfWHERE) do Query.SQL.Delete(ItemOFWHERE);

   if RadioMaiuscula.Checked then begin
      Valor := UpperCase(Word_Search.Text);
      Campo := 'Upper("'+ComboBox1.Text+'")';

   end
   else if RadioMinuscula.Checked then begin
      Valor := LowerCase(Word_Search.Text);
      Campo := 'Lower("'+ComboBox1.Text+'")';
   end
   else begin
      Valor := Word_Search.Text;
      Campo := '"'+ComboBox1.Text+'"';
   end;

   Query.SQL.Insert(ItemOfWHERE,'/* Clausula WHERE */');
   Query.SQL.Insert(ItemOfWHERE+1,'WHERE '+Campo+' '+Predicado(ComboBox2.Text,Valor) );
   Query.open;
finally
  Screen.Cursor := crDefault;
end;
  If not Query.IsEmpty then begin
    Query.First;
    While not Query.Eof do begin
      Query.Next;
      Inc(cont);
      If cont=2 then begin
        Query.First;
        Abort;
      end;
    end;
  end;
  If cont=1 then B_OK.Click;
end;

procedure TF_PesquisaGlobal.B_OKClick(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TF_PesquisaGlobal.cxgPesquisaDBTableView1DblClick(Sender: TObject);
begin
      B_OK.Click;
end;

procedure TF_PesquisaGlobal.FormShow(Sender: TObject);
begin
 If Tag=1 then begin
   Word_Search.SetFocus;
   Word_Search.SelectAll;
 end
 else begin
   cxgPesquisa.SetFocus;
 end;
end;

procedure TF_PesquisaGlobal.Word_SearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  If Key=VK_RETURN then B_Localiza.Click;
end;

end.
