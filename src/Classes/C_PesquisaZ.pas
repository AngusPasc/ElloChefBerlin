unit C_PesquisaZ;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
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
  dxSkinWhiteprint, dxSkinXmas2008Blue, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, cxTextEdit,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus, cxButtons, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2016Colorful, dxSkinOffice2016Dark, dxSkinVisualStudio2013Blue,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light;

type
  pgStyle = (pgSingle, pgWordSearch);

  TF_PesquisaZ = class(TForm)
    pnlPesquisa: TPanel;
    panel_ToolBar: TPanel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    edt_Pesquisa: TcxTextEdit;
    DataSource: TDataSource;
    RadioMaiuscula: TRadioButton;
    RadioMinuscula: TRadioButton;
    RadioIdentico: TRadioButton;
    Query: TFDQuery;
    DBGrid1: TDBGrid;
    b_OK: TcxButton;
    cxButton1: TcxButton;
    B_Localiza: TcxButton;
   function Open(SQL : String; ResultField, DefaultField, DefaultOperator : Integer; Style : pgStyle; OrderField : String = '') : variant;
    function Predicado(operador, valor : string) : String ;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edt_PesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure b_OKClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure B_LocalizaClick(Sender: TObject);
  private
    { Private declarations }
    ConsultaSQL, WhereIsNull, WhereParametro : string;
  public
    { Public declarations }
    Tabela, CampoBusca, CampoChave, LegendaGrouBox : string;
    ResultField : integer;
    WordSearch : boolean;
    TableForm : TCustomForm;
  end;

var
  F_PesquisaZ: TF_PesquisaZ;

implementation

{$R *.dfm}

uses U_DataModule_Library, unRegrasDataModule;

procedure TF_PesquisaZ.FormShow(Sender: TObject);
begin
     If Tag=1 then begin
       edt_Pesquisa.SetFocus;
       edt_Pesquisa.SelectAll;
     end
     else begin
       DBGrid1.SetFocus;
     end;
end;

function TF_PesquisaZ.Open(SQL: String; ResultField, DefaultField,
  DefaultOperator: Integer; Style: pgStyle; OrderField: String): variant;
var x : integer;
    IndexRowId : integer;
begin
     Query.Close;
     Query.SQL.Clear;
     Query.SQL.Add(SQL);
     Query.SQL.Add('/* Clausula WHERE */');
     Query.SQL.Add('/* Clausula ORDER BY */');
     if OrderField <> '' then Query.SQL.Add('ORDER BY "'+Trim(OrderField)+'"');
     Query.Open;

     if Style = pgWordSearch then begin
         B_Localiza.Visible := True;
       //  Panel1.Visible := True;
      //   Pesquisar1.Enabled := True;

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
 //       Panel1.Visible := False;
//        Pesquisar1.Enabled := False;
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

function TF_PesquisaZ.Predicado(operador, valor: string): String;
begin
    if operador = 'Contendo' then Predicado := 'LIKE ''%'+Trim(valor)+'%'' '
    else if operador = 'Iniciado' then Predicado := 'LIKE '''+Trim(valor)+'%'' '
         else if operador = 'Finalizado' then Predicado := 'LIKE ''%'+Trim(valor)+''' '
              else Predicado := Operador+' '''+Trim(valor)+''' ';
end;

procedure TF_PesquisaZ.B_LocalizaClick(Sender: TObject);
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
      if Pos('/* Clausula WHERE */', Query.SQL.Strings[I]) >= 1 then
      ItemOfWHERE := I;

      if Pos('/* Clausula ORDER BY */', Query.SQL.Strings[I]) >= 1 then
      ItemOfORDER := I;
   end;

   for I := 1 to (ItemOfORDER - ItemOfWHERE) do Query.SQL.Delete(ItemOFWHERE);

   if RadioMaiuscula.Checked then begin
      Valor := UpperCase(edt_Pesquisa.Text);
      Campo := 'Upper("'+ComboBox1.Text+'")';

   end
   else if RadioMinuscula.Checked then begin
      Valor := LowerCase(edt_Pesquisa.Text);
      Campo := 'Lower("'+ComboBox1.Text+'")';
   end
   else begin
      Valor := edt_Pesquisa.Text;
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

procedure TF_PesquisaZ.b_OKClick(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TF_PesquisaZ.cxButton1Click(Sender: TObject);
begin
     ModalResult := mrCancel;
end;

procedure TF_PesquisaZ.DBGrid1DblClick(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TF_PesquisaZ.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) and not (Query.IsEmpty)then
    begin

      ModalResult := mrOk;
      Close;

    end;
end;

procedure TF_PesquisaZ.edt_PesquisaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  If Key=VK_RETURN then B_Localiza.Click;

end;

end.



