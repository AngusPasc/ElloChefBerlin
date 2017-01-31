{
Gustavo      -   12/02/2015  - Criação
}

unit U_DATAMASTER;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, DBTables, Menus, DBGrids, Db, Extctrls, stdctrls, dbctrls,
  cxRadioGroup, cxDBEdit, cxCalendar, cxGrid, variants,ShellApi,ShlObj,FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, StrUtils, Tlhelp32;
//  cxExportGrid4Link

function  Numero_Conta(codigo:Real):Real;
function  Nome_Empresa: String; Forward;
function  Razao_Empresa(empresa:Real): String;
function  Logotipo_Empresa: TBitmap; Forward;
function  Nome_Usuario: String; Forward;
function  Codigo_Usuario: Integer; Forward;
function  pesquisa_descricao(tabela, campo, chave, criterio : string; valor : variant) : variant; Forward;
function  config_sigma(campo : string) : variant;
function  DEFAULT_COMPANY : Variant; Forward;
procedure Formata_CGC(var CGC:string);
function  Direitos(action: string; form: string): Boolean; Forward;
function  Direitos_Usuario(action, form, user: string): Boolean; Forward;
procedure Registra_Log(var log:string; action:string; form: string);
procedure TecleGrid(Sender: TObject; var Key: Char);
function  Sequence(Nome_Sequence : string): real;
function  Ultimo_Valor(Campo : string; Tabela:string): real;
procedure Refresh_Query(var QryTmp : TQuery; sChave : string);
function descricao_mes(mes : byte): String;
procedure AtivaDesativa(Controle : TWinControl; Status : boolean);
function ultimo_dia_util:TDate;
function ultimo_dia_util_mes(Data:TDate):TDate;
procedure SubstTextoSQL(var TSQL : TQuery; old : string; new : string);
function DateServer : TDateTime;
function StringSQL(TS : TStrings) : string;
function UserRole(ROLE : string) : boolean;
function Existe_Empresa : boolean;
function Alterou_Query(MTable : TFDQuery) : boolean;
procedure LimpaClausulaIN(Chave : integer);
procedure IncluiClausulaIN(Chave : integer; Dados : variant);
procedure ZeraRowNum;
Procedure Desformata_CGC(var CGC:string);
function ReplaceStr(const S, Srch, Replace: string): string;
function StringObservacao(s : string) : string;
function Valida_Inscricao_Estadual( const Insc, UF: String): Integer;
procedure ControlaCriterioSQL(var pQuery : TQuery; pHints : array of string; Ativa : boolean);
function Ramo_Atividade(Codigo_Empresa: Real) : String;
function RetiraCaracteresInvalidosCheque(s:string) : string;
function NomeComputador : String;
function tem_alfa(s:string):boolean;
function Formata_CNPJ(var CNPJ:string):string;
function Formata_CPF(var CPF:string):string;
Function ExternalProcedure(MainApplication : TApplication; ServerName, UserName, PassWord, Empresa : String; const dbhandle : LongWord; Params : TStrings; LibraryName : string; ProcedureName : string): pointer;
Function Empresa_matriz(codigo_empresa :Real): Integer;
function digito_codbar_boleto( Numero:String ):integer;
procedure ExecuteDirect(SQL: String; connection: TDataBase);
procedure cxGridExportForExcel(cxGrid: TcxGrid);
function GetPathFileNameExport: String;
function GetRecordSet(var RecordSet: TQuery; SQL: String): TDataSet;
function ObterDataCorrenteOracle: TDateTime;
procedure permiteFaturarCTe;
procedure listarArquivosDir(diretorio: string; lista: TStrings);
function LimpaString(ATexto: String):String;
function ProcessoExiste(ExeFileName: string): boolean;

{Funções de envio de email - sendmail.dll}
function Enviar(Host_Pop:ShortString;  Port_Pop:Integer;  User_Pop, Pass_Pop:ShortString;
                Host_Smtp:ShortString; Port_Smtp:Integer; User_Smtp, Pass_Smtp:ShortString;
                Origem, DisplayLabel, Destino, Subject, Anexo:ShortString; Corpo:PCHAR;
                Autenticado:Integer; Possui_SSL:Integer; Conteudo:ShortString = 'text/plain' ; identidade :String = '' ; mostrarStatusEnvio:Boolean = true): integer; external 'sendmail.dll'; overload;
function Enviar(Host_Pop:ShortString;  Port_Pop:Integer;  User_Pop, Pass_Pop:ShortString;
                Host_Smtp:ShortString; Port_Smtp:Integer; User_Smtp, Pass_Smtp:ShortString;
                Origem, DisplayLabel, Destino, Subject:ShortString; ListaAnexos:TStringList; Corpo:PCHAR;
                Autenticado:Integer; Possui_SSL:Integer; Conteudo:ShortString = 'text/plain'; identidade :String = ''; mostrarStatusEnvio:Boolean = true): integer; external 'sendmail.dll'; overload;
function Encrypt(Word:ShortString):ShortString;  external 'sendmail.dll';
function Decrypt(Word:ShortString):ShortString;  external 'sendmail.dll';
{Funções para verificar se a conta corrente esta homologada}
function VerificaHomologacaoBoleto(sequencial_titulo_receber: double;modulo:string ):boolean;
function VerificaBoletosNota(sequencial_nota_saida:double): boolean;
function VerificaHomologacaoBoletoContaCorrenteEspecie(sequencialContaCorrente, idEspecieCobranca : double; descricaoConta : String) : boolean;
function ValidaChaveAcesso(chave: string; codUF: integer = 0; dtEmissao: TDateTime  = varDate; CNPJ: string = ''; Modelo: Integer = 0; Serie: Integer = 0; NumeroNF: integer = 0): string;
function categoriaPedidoAtiva(sequencial_categoria_pedido : double) : Boolean;
function CriptografaSenhaPDV(Action, Src: String; contra_chave : String = ''): String;

function mergePDFs(pdfs: TStringList; nomeArquivo : String = 'Merge.pdf'): String;
function abrirArquivo(Arquivo : String) : boolean;
function imprimirArquivo(Arquivo : String) : boolean;

function ExecAndWait(const ExecuteFile, ParamString : string): boolean;
procedure RegisterDLLs(svr32Patch, DLLPath  : string; registrar : boolean);
function getSysDir: String;
function getTempDir: String;
function GetSpecialFolder(const CSIDL: integer) : string;
function GetProgramFilesCommonDir: String;
function patchSvr32: String;
procedure registrarPDFSplitMerge;

function RetiraCaracteresInvalidosNomeArquivo(s:string) : string;

Function Arredonda(Valor :Real; Casa :Integer) :Real;
function ChecaUF(UF : String) : Boolean;
Function ExisteTabela(Tabela : String) : Boolean;
function Calcular_IMC(Peso, Altura : variant) : variant;
function StrZero(Zeros:string;Quant:integer):String;

Procedure SetupElloManager;



var
   Form_Principal: String;
   VerificaDireitos: Boolean;
   RegistraLog : Boolean;
   DiretorioDLL : String;

implementation

uses U_DataModule_Library;

Procedure Registra_Log(var log:string; action:string; form: string);
begin
  if NOT (Nome_Usuario = 'SIGMA') then begin
   if RegistraLog then begin
      With tQuery.Create(Nil) do begin
        DataBasename := 'Data_Base';

        Sql.Add('begin');
        Sql.Add(' begin');
        Sql.Add('  insert into SIGMA.LOG_SIGMA (USUARIO, DATA, FORM, ACTION, OBSERVACAO)');
        Sql.Add('    values (USER, sysdate, :form, :action, :log ); ');
        Sql.Add('  commit;');
        Sql.Add(' EXCEPTION WHEN others THEN');
        Sql.Add('   null;');
        Sql.Add(' end;');
        Sql.Add('end;');
        ParamByName('form').AsString   := form;
        ParamByName('action').AsString := action;
        ParamByName('log').AsString    := log;
        ExecSQL;

        Free;

      End;
   end;
   end;
End;


Function Direitos(action: string; form: string): Boolean;
Begin
  Result := true;
end;


Function Direitos_Usuario(action, form, user: string): Boolean;
Begin
   Result := true;
end;



Function Nome_Empresa: String;
Begin
     With TQuery.Create(nil) do begin
          databaseName := 'Data_Base';
          SQl.add('select UPPER(min(name)) NAME from SIGMA.parameters');
          Open;
          Nome_Empresa := FieldByName('NAME').AsString;
          Free;
     End;
end;



Function Razao_Empresa(empresa:Real): String;
Begin
   If empresa>0 then begin
     With TQuery.Create(nil) do begin
          databaseName := 'Data_Base';
          SQl.add('select RAZAO_SOCIAL NOME from SIGMA_FIS.EMPRESA WHERE Codigo_Empresa=:empresa');
          ParamByName('empresa').AsFloat := empresa;
          Open;
          Razao_Empresa := UpperCase(FieldByName('NOME').AsString);
          Close;
          Free;
     End;
   end
   else begin
          Razao_Empresa := '<Todas>';
   end;
end;


{Function Logotipo_Empresa: TBitmap;
Begin
 Try
    with TPicture.Create do begin
        LoadFromFile('c:\windows\temp\logo.bmp');
        Logotipo_Empresa:= Bitmap;
    end;
 Except;
   Try
      with TPicture.Create do begin
          LoadFromFile('c:\work\logo.bmp');
          Logotipo_Empresa:= Bitmap;
      end;
   Except;
     Try
        with TPicture.Create do begin
            LoadFromFile('logo.bmp');
            Logotipo_Empresa:= Bitmap;
        end;
     Except;
     End;
   End;
 End;

end;}

Function Logotipo_Empresa: TBitmap;
Begin

  try
    with TQuery.Create(nil) do
    try
      DatabaseName := 'Data_Base';
      SQL.Add('SELECT LOGOTIPO FROM SIGMA_FIS.EMPRESA');
      SQL.Add(' WHERE CODIGO_EMPRESA = SIGMA.PKG_SIGMA.GET_EMPRESA');
      Open;
      if IsEmpty then Abort;
      if FieldByName('LOGOTIPO').IsNull then Abort;
      Logotipo_Empresa := TBitmap.Create;
      Logotipo_Empresa.Assign(FieldByName('LOGOTIPO'));
    finally
      Free;
    end;
  except
    Logotipo_Empresa := nil;
  end;

end;

Function Nome_Usuario: String;
Begin
     With TQuery.Create(nil) do begin
          databaseName := 'Data_Base';
          SQl.add('select user "USER" from dual');
          Open;
          Nome_Usuario := FieldByName('USER').AsString;
          Free;
     End;
end;

Function Codigo_Usuario: Integer;
Begin
     With TQuery.Create(nil) do begin
          databaseName := 'Data_Base';
          SQl.add('select uid "CODIGO_USER" from dual');
          Open;
          Codigo_Usuario := FieldByName('CODIGO_USER').AsInteger;
          Free;
     End;
end;

function pesquisa_descricao(tabela, campo, chave, criterio : string; valor : variant) : variant;
begin
     with TFDQuery.create(nil) do begin
          Connection := DataModule_Library.Conexao;
          SQL.Clear;
          SQL.Add('SELECT '+campo+' FROM '+tabela+' WHERE '+chave+' = :1');
          if criterio <> '' then SQL.Add('AND ('+criterio+')');
          parambyname('1').value := valor;
          open;

          if NOT IsEmpty then
             pesquisa_descricao := Fields[0].AsString //fieldbyname(campo).asstring
          else
              pesquisa_descricao := null;
          free;
     end;

end;

function config_sigma(campo : string) : variant;
begin
     with tquery.create(nil) do begin
          DatabaseName := 'data_base';
          SQL.Add('SELECT '+campo+' FROM SIGMA.CONFIG_SIGMA');
          open;
          if NOT IsEmpty then
             config_sigma := fieldbyname(campo).asvariant
          else
             config_sigma := null;
          free;
     end;
end;

function DEFAULT_COMPANY;
begin
{
try
  with TQuery.Create(nil) do begin
    DatabaseName := 'Data_Base';
    SQL.Add('Select 1 from dual');
    Open;
    DEFAULT_COMPANY := Database.Params.Values['DEFAULT COMPANY'];
    Close;
    Free;
  end;
except
  Result := '';
end;
}
  // esquema novo de pegar a empresa
  with TQuery.Create(nil) do begin
    try
        DatabaseName := 'Data_Base';
        SQL.Add('select SIGMA.PKG_SIGMA.Get_Empresa EMPRESA from dual');
        Open;
        DEFAULT_COMPANY := FieldByName('EMPRESA').AsInteger;
    finally
        Free;
    end;
  end;

end;

procedure SubstTextoSQL(var TSQL : TQuery; old : string; new : string);
var x : integer;
begin
    for x := 0 to TSQL.SQL.Count-1 do
        TSQL.SQL[x] := ReplaceStr(TSQL.SQL[x], old, new);
end;

procedure Formata_CGC;
var x : integer;
    S : string;
begin
 s := '';
 for x := 1 to length(CGC) do
   if (CGC[x] in ['0'..'9']) then s := s + CGC[x];
 CGC := FormatFloat('00000000000000', StrToFloat(s));
 CGC := COPY(CGC,1,2) + '.' + COPY(CGC,3,3) + '.' + COPY(CGC,6,3) + '/' + COPY(CGC,9,4) + '-' +   COPY(CGC,13,2);
end;

procedure TecleGrid(Sender: TObject; var Key: Char);
begin
 // verifica o registro
   try
    Screen.Cursor := crHourGlass;
    try
      if TDBGrid(Sender).SelectedField.DataType in [ftString, ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftAutoInc] then
         TDataSet(TDBGrid(Sender).DataSource.DataSet).Locate(TDBGrid(Sender).SelectedField.FieldName, Key, [loCaseInsensitive, loPartialKey]);
    except
    end;
   finally
    Screen.Cursor := crDefault;
   end;

end;

function Sequence;
begin
  with TQuery.Create(nil) do begin
    try
      try
         DatabaseName := 'Data_Base';
         SQL.Text := 'SELECT '+ TRIM(Nome_Sequence) +'.NEXTVAL SEQUENCIAL FROM DUAL';
         Open;
         Result := FieldByName('SEQUENCIAL').AsFloat;
      except
         raise exception.Create('Sequence '+TRIM(Nome_Sequence)+' não existe!');
      end;
    finally
      Free;
    end;
  end;
end;

function Ultimo_Valor;
begin
  with TQuery.Create(nil) do begin
    try
      try
         DatabaseName := 'Data_Base';
         SQL.Text := 'SELECT NVL(MAX('+ TRIM(Campo) +'),0)+1 SEQUENCIAL FROM '+TRIM(Tabela);
         Open;
         Result := FieldByName('SEQUENCIAL').AsFloat;
      except
         Result := 0;
      end;
    finally
      Free;
    end;
  end;
end;



function Descricao_Mes;
const aMes : array[1..12] of string = ('Janeiro', 'Fevereiro','Março','Abril','Maio','Junho','Julho', 'Agosto','Setembro','Outubro','Novembro','Dezembro');
begin
   Result := aMes[mes];
end;


function Numero_Conta;
begin
    with TQuery.Create(nil) do begin
      DatabaseName := 'Data_Base';
      SQL.Add('SELECT CONTA FROM SIGMA_FIS.CONTA_CONTABIL WHERE CODIGO_CONTA_CONTABIL=:codigo');
      ParamByName('codigo').AsFloat := Codigo;
      Open;
      If not IsEmpty then
         Result := FieldbyName('CONTA').AsFloat
      else
         Result := 0;
      Free;
    End;
end;

function StringSQL(TS : TStrings) : string;
var i : integer;
begin
  Result := '';
  for i := 0 to TS.Count-1 do
     Result := Result + Trim(TS.Strings[i]) + ' ';
  Result := AnsiUpperCase(Trim(Result));
end;


procedure Refresh_Query;
var Bookmark : TBookmark;
begin

  Bookmark := QryTmp.GetBookmark;
  QryTmp.Close;
  QryTmp.Open;
  if (not QryTmp.IsEmpty) and (QryTmp.BookmarkValid(Bookmark)) then QryTmp.GotoBookmark(Bookmark);
  QryTmp.FreeBookmark(Bookmark);

end;

procedure AtivaDesativa(Controle : TWinControl; Status : boolean);
var x : integer;
begin

  for x := 0 to Controle.ControlCount -1 do begin
     if (Controle.Controls[x] is TWinControl) and (TWinControl(Controle.Controls[x]).ControlCount > 0) then AtivaDesativa(TWinControl(Controle.Controls[x]), Status);

     If Controle.Controls[x] is TEdit       then TEdit(Controle.Controls[x]).ReadOnly := not Status
     else if Controle.Controls[x] is TDBEdit then TDBEdit(Controle.Controls[x]).ReadOnly := not Status
     else if Controle.Controls[x] is TCustomEdit then TCustomEdit(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TButton     then TButton(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TSpeedButton then TSpeedButton(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TCustomRadioGroup then TCustomRadioGroup(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TCheckBox   then TCheckBox(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TDBCheckBox then TDBCheckBox(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TcxRadioGroup then TcxRadioGroup(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TcxDBRadioGroup then TcxDBRadioGroup(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TcxDateEdit then TcxDateEdit(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TcxDBDateEdit then TcxDBDateEdit(Controle.Controls[x]).Enabled := Status
     else if Controle.Controls[x] is TDBLookupComboBox then TDBLookupComboBox(Controle.Controls[x]).Enabled := Status;

  end;

end;

function ultimo_dia_util;
Var ultima_data:String;
    ultimo_dia:TDate;
begin
   ultima_data := datetostr(IncMonth(date(),1));
   ultima_data := '1'+Copy(ultima_data,3,8);
   ultimo_dia := strtodate(ultima_data)-1;
   If DayOfWeek(ultimo_dia)=7 then
      ultimo_dia := ultimo_dia-1
   else
   If DayOfWeek(ultimo_dia)=1 then
      ultimo_dia := ultimo_dia-2;

   Result := ultimo_dia;
end;

function ultimo_dia_util_mes;
Var ultima_data:String;
    ultimo_dia:TDate;
begin
   ultima_data := datetostr(IncMonth(Data,1));
   ultima_data := '1'+Copy(ultima_data,3,8);
   ultimo_dia := strtodate(ultima_data)-1;
   If DayOfWeek(ultimo_dia)=7 then
      ultimo_dia := ultimo_dia-1
   else
   If DayOfWeek(ultimo_dia)=1 then
      ultimo_dia := ultimo_dia-2;

   Result := ultimo_dia;
end;


Function DateServer : TDateTime;
begin
  with TQuery.Create(nil) do begin
    DatabaseName := 'Data_Base';
    SQL.Add('SELECT SYSDATE "Data" FROM DUAL');
    Open;
    Result := FieldByName('Data').AsDateTime;
    Close;
    Free;
  end;
end;

function UserRole(ROLE : string) : boolean;
begin
   with TQuery.Create(nil) do begin
     try
        DataBaseName := 'Data_Base';
        SQL.Add('SELECT name USERNAME, user# USER_ID');
        SQL.Add('    FROM sys.user$');
        SQL.Add('    WHERE exists (select * from sys.sysauth$ privs, sys.user$ role');
        SQL.Add('                          where privs.grantee# = user$.user#');
        SQL.Add('                            and privs.privilege# = role.user#');
        SQL.Add('                            and role.name = :ROLE)');
        SQL.Add('      AND name = USER');
        ParamByName('ROLE').AsString := ROLE;
        Open;
        Result := not IsEmpty;
     finally
        Free;
     end;
   end;
end;

function Existe_Empresa : boolean;
begin
   with TFDQuery.Create(nil) do begin
     try
        Connection := DataModule_Library.Conexao;
        SQL.Add('SELECT E.*');
        SQL.Add('    FROM EMPRESA E');
        Open;
        Result := not IsEmpty;
     finally
        Free;
     end;
   end;
end;

Function Alterou_Query(MTable : TFDQuery) : boolean;
var x : integer;
begin
  Result := false;
  if (MTable <> nil) and (MTable.Active) and (not MTable.IsEmpty) then begin
     for x := 0 to MTable.FieldCount-1 do begin
         // Verifica se houve alteração em uma campo BLOB
         if MTable.Fields[x].IsBlob then begin
            if TBlobField(MTable.Fields[x]).Modified then begin
               Result := true;
               Break;
            end;
         end else
         // Se estiver modificando, verifica se algum valor foi alterado
         if MTable.State = dsEdit then begin
            if (VarToStr(MTable.Fields[x].NewValue) <> VarToStr(MTable.Fields[x].OldValue)) then begin
               Result := true;
               Break;
            end;
         end else
         // Se estiver inserindo, verifica se algum valor não está vazio
         if MTable.State = dsInsert then begin
            if not MTable.Fields[x].IsNull then begin
               Result := true;
               Break;
            end;
         end;
     end;
  end;
end;

procedure LimpaClausulaIN;
begin
  with TQuery.Create(nil) do
  try
     DatabaseName := 'Data_Base';
     SQL.Add('DELETE SIGMA.CLAUSULA_IN WHERE CHAVE = :Chave');
     ParamByName('Chave').AsInteger := Chave;
     ExecSQL;
  finally
     Free;
  end;
end;

procedure ZeraRowNum;
begin
  with TQuery.Create(nil) do
  try
     DatabaseName := 'Data_Base';
     SQL.Add('BEGIN');
     SQL.Add(' SIGMA.PKG_ROWNUM.SET_ROWNUM(0);');
     SQL.Add('END;');
     ExecSQL;
  finally
     Free;
  end;
end;

procedure IncluiClausulaIN;
begin
  with TQuery.Create(nil) do
  try
     DatabaseName := 'Data_Base';
     SQL.Add('INSERT INTO SIGMA.CLAUSULA_IN ( CHAVE , ');
     case VarType(Dados) of
          varSmallint, varInteger, varSingle, varDouble, varCurrency, varByte : SQL.Add('NUMERO ) ');
          varString : SQL.Add('CARACTER ) ');
          varDate : SQL.Add('DATA )' );
          else raise exception.Create('Tipo de dado inválido!');
     end;
     SQL.Add('VALUES ( :CHAVE , :DADOS )');
     ParamByName('CHAVE').AsInteger := Chave;
     ParamByName('DADOS').Value := Dados;
     ExecSQL;
  finally
     Free;
  end;
end;

procedure Desformata_CGC;
var x : integer;
    S : string;
begin
 s := '';
 for x := 1 to length(CGC) do
   if (CGC[x] in ['0'..'9']) then s := s + CGC[x];
 If s = '' then s:='0';
 CGC := FormatFloat('00000000000000', StrToFloat(s));
end;


function ReplaceStr(const S, Srch, Replace: string): string;
var
  I: Integer;
  Source: string;
begin
  Source := S;
  Result := '';
  repeat
    I := Pos(Srch, Source);
    if I > 0 then begin
      Result := Result + Copy(Source, 1, I - 1) + Replace;
      Source := Copy(Source, I + Length(Srch), MaxInt);
    end
    else Result := Result + Source;
  until I <= 0;
end;


function StringObservacao(s : string) : string;
 var            i : integer;
     tsObservacao : TStringList;
begin
    try
       Result := '';
       tsObservacao := TStringList.Create;
       tsObservacao.Text := s;
       for i := 0 to tsObservacao.Count-1 do
           Result := Result + Trim(tsObservacao.Strings[i]) + ' ';
       Result := Trim(Result);
    finally
       tsObservacao.Destroy;
    end;
end;


function Valida_Inscricao_Estadual( const Insc, UF: String): Integer;
type
  TConsisteInscricaoEstadual = function( const Insc, UF: String): Integer ; stdcall;
var
  IRet: Integer;
  LibHandle                 : THandle;
  ConsisteInscricaoEstadual : TConsisteInscricaoEstadual;
  sDLL: String ;
  IE : String;
begin
  if Insc <> 'ISENTO' then begin

      IE   := replaceStr(Insc,'.','');

      sDLL := DiretorioDLL+'DllInscE32.Dll' ;

      LibHandle :=  LoadLibrary( PChar( sDLL ) ) ;
      if  LibHandle <=  HINSTANCE_ERROR then
        raise Exception.Create ('DllInscE32.Dll Checagem Inscrição Estadual não carregada');
      @ConsisteInscricaoEstadual  :=  GetProcAddress (LibHandle,'ConsisteInscricaoEstadual');
      if  @ConsisteInscricaoEstadual  = nil then
        raise Exception.Create('Entrypoint Download não encontrado em DllInscE32.Dll Checagem Inscrição Estadual');
      IRet := ConsisteInscricaoEstadual ( IE , UF ) ;
      Result := Iret ;

      FreeLibrary(LibHandle);

  end;
end;

{
Exemplo :
Critério Cliente Ativa = true
/*CLIENTE(I)*/  AND codigo_cliente = :codigo   /*CLIENTE(F)*/
Critério Cliente Ativa = false
/*CLIENTE(R)    AND codigo_cliente = ::codigo    CLIENTE(R)*/
}
procedure ControlaCriterioSQL;
var x : integer;
    vHintIni, vHintFim : string;
    vHintIniR, vHintFimR : string;
    vPosHintIni, vPosHintFim : integer;
    vSQL : string;
    NaoHaMais : boolean;
    vSQL1, vSQL2, vSQL3 : string;
begin

  vSQL := pQuery.SQL.Text;
  for x := 0 to High(pHints) do begin
      if Ativa then begin
         vHintIni := '/*' + pHints[x] + '(R)';
         vHintFim := pHints[x] + '(R)*/';
         vHintIniR := '/*' + pHints[x] + '(I)*/';
         vHintFimR := '/*' + pHints[x] + '(F)*/';
      end else begin
         vHintIni := '/*' + pHints[x] + '(I)*/';
         vHintFim := '/*' + pHints[x] + '(F)*/';
         vHintIniR := '/*' + pHints[x] + '(R)';
         vHintFimR := pHints[x] + '(R)*/';
      end;
      repeat
         NaoHaMais := true;
         vPosHintIni := Pos(vHintIni, vSQL);
         vPosHintFim := Pos(vHintFim, vSQL);
         if (vPosHintIni <> 0) and (vPosHintFim <> 0) then begin
            NaoHaMais := false;
            vSQL1 := Copy(vSQL, 1, vPosHintIni - 1);
            vSQL2 := Copy(vSQL, vPosHintIni, vPosHintFim + length(vHintFim) - length(vSQL1) - 1);
            vSQL3 := Copy(vSQL, vPosHintFim + length(vHintFim), length(vSQL) - length(vSQL1 + vSQL2));
            vSQL2 := ReplaceStr(vSQL2, vHintIni, vHintIniR);
            vSQL2 := ReplaceStr(vSQL2, vHintFim, vHintFimR);
            if Ativa then vSQL2 := ReplaceStr(vSQL2, '::', ':')
            else vSQL2 := ReplaceStr(vSQL2, ':', '::');
            vSQL := vSQL1 + vSQL2 + vSQL3;
         end;
      until NaoHaMais;
  end;
  pQuery.SQL.Text := vSQL;

end;

function Ramo_Atividade(Codigo_Empresa: Real) : String;
begin
   with TQuery.Create(nil) do begin
        DatabaseName := 'Data_Base';
        SQL.Add('SELECT RAMO_ATIVIDADE FROM SIGMA_FIS.EMPRESA ');
        SQL.Add(' WHERE CODIGO_EMPRESA = :CODIGO_EMPRESA ');
        ParamByName('CODIGO_EMPRESA').AsFloat := Codigo_Empresa;
        Open;
        if not IsEmpty then
           Ramo_Atividade := FieldByName('RAMO_ATIVIDADE').AsString
        else
           Ramo_Atividade := '';
        Free;
   end;
end;

function RetiraCaracteresInvalidosCheque(s:string) : string;
var x : integer;
begin
   Result := '';
   for x := 1 to length(s) do
       if not (s[x] in ['<','>','!','Ç','?','ç',':']) then Result := Result + s[x];
end;

{function NomeComputador : String;
  var buffer: PChar;
      size: dword;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
Begin
  size:= Buff_Size;
  buffer:= StrAlloc(Buff_Size);
  GetComputerName(Buffer,size);
  result:= String(Buffer);
  StrDispose(Buffer);
End;}

function NomeComputador : String;
  var buffer, buffer2: PChar;
      size: dword;
      nomeEstacao : String;
const Buff_Size = MAX_COMPUTERNAME_LENGTH + 1;
Begin
  size:= Buff_Size;
  buffer2:= StrAlloc(Buff_Size);
  GetEnvironmentVariable('ClientName',Buffer2,Size);
  nomeEstacao := string(buffer2);
  StrDispose(Buffer2);
  if ((trim(nomeEstacao) = '') or (trim(nomeEstacao) = 'Console') or (trim(nomeEstacao) = 'MS Sans Serif') or (length(trim(nomeEstacao)) <= 3)) then
  begin
    buffer:= StrAlloc(Buff_Size);
    GetComputerName(Buffer,size);
    nomeEstacao := string(buffer);
    StrDispose(Buffer);
    nomeEstacao := upperCase(nomeEstacao);
  end;
  nomeEstacao := upperCase(nomeEstacao);
  result:= nomeEstacao;
End;

function tem_alfa;
var x : integer;
begin
   for x := 1 to length(s) do begin
       if not (s[x] in ['0'..'9']) then begin
          result := true;
          break;
       end
       else
          result := false;
   end;
end;

function Formata_CNPJ(var CNPJ:string):string;
var x : integer;
    S : string;
begin
    s := '';
    for x := 1 to length(CNPJ) do
      if (CNPJ[x] in ['0'..'9']) then s := s + CNPJ[x];
    CNPJ    := FormatFloat('00000000000000', StrToFloat(s));
    CNPJ    := COPY(CNPJ,1,2) + '.' + COPY(CNPJ,3,3) + '.' + COPY(CNPJ,6,3) + '/' + COPY(CNPJ,9,4) + '-' +   COPY(CNPJ,13,2);
    Result := CNPJ;
end;


Function Formata_CPF(var CPF:string):string;
var x : integer;
    S : string;
begin
    s := '';
    for x := 1 to length(CPF) do
      if (CPF[x] in ['0'..'9']) then s := s + CPF[x];
    CPF := FormatFloat('00000000000', StrToFloat(s));
    CPF := COPY(CPF,1,3) + '.' + COPY(CPF,4,3) + '.' + COPY(CPF,7,3) + '-' + COPY(CPF,10,2);
    Result:=CPF
end;

Function ExternalProcedure(MainApplication : TApplication; ServerName, UserName, PassWord, Empresa : String; const dbhandle : LongWord; Params : TStrings; LibraryName : string; ProcedureName : string): pointer;
var
   DBSync : procedure(ApplicationMenu : TApplication;  ServerName, UserName, PassWord, Empresa : String ; const dbhandle : LongWord; Params : TStrings);
//   DBSync : procedure(ApplicationMenu : TApplication; const dbhandle : LongWord; Params : TStrings);
   DLLHandle : hwnd;
   DLLProcedure : procedure;
   dwError: DWORD;

   FullLibraryName : string;

begin

//	     FullLibraryName := DiretorioTMP+LibraryName;
	     FullLibraryName := LibraryName;
	     DLLHandle := LoadLibrary(Pchar(LowerCase(FullLibraryName)));

             if (DLLHandle = 0) then begin
                dwError:=GetLastError;
                ShowMessage(SysErrorMessage(dwError));
                showMessage(  floattostr( dwError ) );
             end
             else begin
                 DBSync := getProcAddress(DLLHandle, 'DBSync');
                 DBSync(MainApplication,ServerName,UserName,PassWord, Empresa,DBHandle,Params);

                 DllProcedure := GetProcAddress(DLLHandle, PChar(ProcedureName));
                 if @DllProcedure = nil then
                     messagedlg('Segmento "'+ProcedureName+'" não encontrado em "'+FullLibraryName+'"! ',mtError,[mbOK],0);

                 Result := @DLLProcedure;
             end;

end;

Function Empresa_matriz(codigo_empresa :Real):Integer;
begin
   with TQuery.Create(nil) do
   try
      DatabaseName := 'data_base';
      SQL.Add(' select codigo_empresa from ( ');
      SQL.Add('                   select codigo_empresa ');
      SQL.Add('                     from sigma_fis.filial ');
      SQL.Add('                    where codigo_empresa_filial = :codigo_empresa ');
      SQL.Add('      union all ');
      SQL.Add('                   select codigo_empresa ');
      SQL.Add('                     from sigma_fis.empresa ');
      SQL.Add('                    where codigo_empresa = :codigo_empresa ');
      SQL.Add(' ) where rownum = 1 ');
      ParambyName('codigo_empresa').AsFloat := codigo_empresa;
      Open;

      Empresa_matriz := FieldByName('codigo_empresa').AsInteger;
   finally
      Free;
   end;


end;

function digito_codbar_boleto( Numero:String ):integer;
var
   Resto, I, DF, Digito : integer;
   D:Array[1..44] of integer;

begin
   //Deixando a variável de entrada com 44 posições (Padrão)
   Numero := copy(trim(Numero),1,44);
   for I:=0 to (44 - length(Numero)) do
     Numero := Numero + '0';

   //Inicializando vetor de calculo
   for I:=1 to 44 do
     D[I] := 0;

   //Preenchendo o vetor de calculo
   for I:=1 to length(Numero) do
   begin
     try
       D[I] := StrToInt( Numero[I] );
     except
       D[I] := 0;
     end;
   end;

   { Calcula o Digito }
   DF := (4*D[1])+(3*D[2])+(2*D[3])+(9*D[4])+(8*D[6])
        +(7*D[7])+(6*D[8])+(5*D[9])+(4*D[10])+(3*D[11])+(2*D[12])
        +(9*D[13])+(8*D[14])+(7*D[15])+(6*D[16])+(5*D[17])+(4*D[18])
        +(3*D[19])+(2*D[20])+(9*D[21])+(8*D[22])+(7*D[23])+(6*D[24])
        +(5*D[25])+(4*D[26])+(3*D[27])+(2*D[28])+(9*D[29])+(8*D[30])
        +(7*D[31])+(6*D[32])+(5*D[33])+(4*D[34])+(3*D[35])+(2*D[36])
        +(9*D[37])+(8*D[38])+(7*D[39])+(6*D[40])+(5*D[41])+(4*D[42])
        +(3*D[43])+(2*D[44]);
   Resto := DF MOD 11;
   if ( Resto = 0 ) or ( Resto = 1 ) or ( Resto > 9 ) then
      Digito   := 1
   else Digito := 11-Resto;

   Result := Digito;
end;


procedure ExecuteDirect(SQL: String; connection: TDataBase);
var
   executeDB: TDataBase;
begin
   try
      try
         executeDB := TDatabase.Create(Application);
         executeDB.DatabaseName := 'executeDB';
         executeDB.DriverName := 'ORACLE';
         executeDB.LoginPrompt := False;
         executeDB.Params := connection.Params;
         executeDB.TransIsolation := tiReadCommitted;
         executeDB.Connected := True;
         executeDB.StartTransaction;
         executeDB.Execute(SQL);
         executeDB.Commit;
      except
         begin
            executeDB.Rollback;
            raise;
         end;
      end;
   finally
       FreeAndNil(executeDB);
   end;
end;


procedure cxGridExportForExcel(cxGrid: TcxGrid);
var
   FFileName : String;
   FSaveAll : Boolean;
begin

 //  FFileName := GetPathFileNameExport;
//   if FFileName <> '' then
//   begin
//         FSaveAll := True;
//      if UpperCase(ExtractFileExt(FFileName)) = '.XLS' then
//      begin
//         ExportGrid4ToExcel(FFileName, cxGrid, FSaveAll, FSaveAll);
//         MessageDLG('Exportação do grid concluída.', mtInformation, [mbOK], 0 );
//      end
//      else
//         Raise Exception.Create('Extensão de arquivo não suportada!');
//   end;
end;


function GetPathFileNameExport: String;
var
   FSaveDialog : TSaveDialog;
begin
   FSaveDialog := TSaveDialog.Create(Nil);
   try
      FSaveDialog.Filter     := 'Excel|*.xls';
      FSaveDialog.Title      := 'Exportar dados do grid';
      FSaveDialog.DefaultExt := 'Null';

      if FSaveDialog.Execute then
      begin
         if not FileExists(ExtractShortPathName(FSaveDialog.FileName)) then
            Result := FSaveDialog.FileName
         else
         begin
            if MessageDlg('Arquivo já existe. Deseja substituí-lo?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
               Result := ''
            else
               Result := FSaveDialog.FileName;
         end
      end
      else
         Result := '';
   finally
      if Assigned(FSaveDialog) then
         FreeAndNil(FSaveDialog);
   end;
end;

function GetRecordSet(var RecordSet: TQuery; SQL: String): TDataSet;
begin
    RecordSet :=  TQuery.Create( Nil );
    RecordSet.DatabaseName := 'data_base';
    RecordSet.SQL.Clear;
    RecordSet.SQL.Add(SQL);
    RecordSet.Open;
    Result := RecordSet;
end;


function ObterDataCorrenteOracle: TDateTime;
var
   SQL:String;
    Rs: TQuery;
begin
    SQL := 'select current_date from dual';
    GetRecordSet(Rs, SQL);
    Result := Rs.Fields[0].AsDateTime;

    if Assigned(Rs) then
       FreeAndNil(Rs);
end;

function VerificaHomologacaoBoletoContaCorrenteEspecie(sequencialContaCorrente, idEspecieCobranca : double;descricaoConta : String) : boolean;
var nomeDll             ,
    versaoDll           ,
    versaoHomologada    ,
    mensagemErro        : String;
begin

 // result := false;
//
//  with TQuery.Create(nil) do
//  begin
//    try
//      DataBaseName := 'Data_Base';
//      SQL.Add('select hb.versao_patch                                                ');
//      SQL.Add('  from sigma_fin.homologacao_boleto hb                           ');
//      SQL.Add(' where hb.id_especie_cobranca       = :id_especie_cobranca       ');
//      SQL.Add('  and hb.sequencial_conta_corrente = :sequencial_conta_corrente ');
//
//      ParamByName('sequencial_conta_corrente').AsFloat := sequencialContaCorrente;
//      ParamByName('id_especie_cobranca').AsFloat       := idEspecieCobranca;
//      Open;
//
//      nomeDLL         := GetLibraryPath;
//      versaoHomologada:= FieldByName('versao_patch').AsString;
//
//      if not IsEmpty then
//      begin
//        if FileExists(nomeDLL) and (UpperCase(ExtractFileExt(nomeDLL)) = '.DLL' ) then
//        begin
//          versaoDll  := FileVersion(nomeDLL);
//
//          if (NumeroVersao(versaoDll) >= NumeroVersao(versaoHomologada)) then
//            result := true;
//        end;
//      end;
//
//    finally
//      Free;
//    end;
//  end;// with
//
//  if result = false then
//  begin
//    mensagemErro :='';
//
//    if versaoDll <> '' then
//      mensagemErro := ' e versão do sistema  '+versaoDll;
//
//
//    Application.MessageBox(pChar(ReplaceStr('ATENÇÃO: Não está homologada a impressão de boleto para a conta '+ descricaoConta +
//                                            ', espécie de cobrança '+formatFloat('00000', idEspecieCobranca)+
//                                            ' #VERSAO_SISTEMA'+
//                                            ' e não será possível a emissão do boleto, por favor, contacte o administrador do sistema!',
//                                            '#VERSAO_SISTEMA',mensagemErro)), '.:: Advertência ::.', MB_ICONWARNING + MB_OK);
//    Exit;
//  end;
end;


function VerificaHomologacaoBoleto(sequencial_titulo_receber: double;modulo:string ):boolean;
var conta               ,
    DiretorioTMP        ,
    nomeDll             ,
    versaoDll           ,
    versaoHomologada    ,
    mensagemErro        : String;
    id_especie_cobranca ,
    sequencial_conta    :double;
begin
  {Modulo F = Financeiro
          V = Vendas Industrial    }

  result := false;
  with TQuery.Create(nil) do
  begin
    try
      DataBaseName := 'Data_Base';
      SQL.Add('select tr.*, cc.numero_conta || ''-'' || cc.digito conta                         ');
      SQL.Add('  from (select tr.id_especie_cobranca,                                           ');
      SQL.Add('               nvl(tr.seq_conta_correspondente,                                  ');
      SQL.Add('                   nvl(tr.sequencial_conta_corrente,                             ');
      SQL.Add('                       bc.sequencial_conta_corrente)) sequencial_conta_corrente  ');
      SQL.Add('          from sigma_fin.titulo_receber tr, sigma_fin.banco bc                   ');
      SQL.Add('         where tr.codigo_banco = bc.codigo_banco                                 ');
      SQL.Add('           and tr.sequencial_titulo_receber = :sequencial_titulo_receber) tr,    ');
      SQL.Add('       sigma_fin.conta_corrente cc                                               ');
      SQL.Add(' where cc.sequencial_conta_corrente = tr.sequencial_conta_corrente               ');
      ParamByName('sequencial_titulo_receber').AsFloat := sequencial_titulo_receber;
      Open;

      conta               := FieldByName('conta').AsString;
      id_especie_cobranca := FieldByName('id_especie_cobranca').AsFloat;
      sequencial_conta    := FieldByName('sequencial_conta_corrente').AsFloat;

      result := not IsEmpty;
    finally
      Free;
    end;
  end;// with

  if result then
  begin
    result := VerificaHomologacaoBoletoContaCorrenteEspecie(sequencial_conta,id_especie_cobranca,conta);
  end;

  if result = false then
   Exit;

  with TQuery.Create(nil) do
  begin
    try
      DataBaseName := 'Data_Base';
      SQL.Add('SELECT nf.situacao,nf.forma_emissao                               ');
      SQL.Add('  FROM sigma_fin.titulo_receber tr,                               ');
      SQL.Add('       sigma_fin.relacionamento_titulo_receber rt,                ');
      SQL.Add('       sigma_mat.nota_saida ns,                                   ');
      SQL.Add('       sigma_nfe.nota_fiscal nf                                   ');
      SQL.Add(' WHERE tr.sequencial_titulo_receber = rt.sequencial_titulo_receber');
      SQL.Add('   AND tr.sequencial_nota_saida     = ns.sequencial_nota_saida    ');
      SQL.Add('   AND ns.id_nota_fiscal            = nf.id_nota_fiscal           ');
      SQL.Add('   AND tr.sequencial_titulo_receber = :sequencial_titulo_receber  ');
      ParamByName('sequencial_titulo_receber').AsFloat := sequencial_titulo_receber;
      Open;

      result := ((not IsEmpty) and ((FieldByName('situacao').AsString = 'A') or (FieldByName('forma_emissao').Asfloat <> 1))) or (IsEmpty);

    finally
      Free;
    end;
  end;// with

  if result = false then
  begin
    Application.MessageBox(pChar('ATENÇÃO: o boleto só poderá ser impresso após a transmissão da nota !') , '.:: Advertência ::.', MB_ICONWARNING + MB_OK);
  end;


end;

function VerificaBoletosNota(
  sequencial_nota_saida:double): boolean;
var  BoletoHomologado : boolean;
begin
  result :=false;
  with TQuery.Create(nil) do
  begin
    try
      DataBaseName:= 'Data_Base';
      SQL.Add(' select /*PRG# 4405*/                                                                                                             ');
      SQL.Add('        min(tr.sequencial_titulo_receber) sequencial_titulo_receber,                                                              ');
      SQL.Add('        tr.id_especie_cobranca,                                                                                                   ');
      SQL.Add('        nvl(tr.seq_conta_correspondente,nvl(tr.sequencial_conta_corrente,bc.sequencial_conta_corrente)) sequencial_conta_corrente ');
      SQL.Add('   from sigma_fin.titulo_receber tr,                                                                                              ');
      SQL.Add('        sigma_fin.relacionamento_titulo_receber rt,                                                                               ');
      SQL.Add('        sigma_fin.banco bc                                                                                                        ');
      SQL.Add('  where tr.sequencial_titulo_receber = rt.sequencial_titulo_receber                                                               ');
      SQL.Add('    and tr.codigo_banco = bc.codigo_banco                                                                                         ');
      SQL.Add('    and rt.sequencial_nota_saida in (:sequencial_nota_saida)                                                                      ');
      SQL.Add('  group by tr.id_especie_cobranca,                                                                                                ');
      SQL.Add('        nvl(tr.seq_conta_correspondente,nvl(tr.sequencial_conta_corrente,bc.sequencial_conta_corrente))                           ');
      ParamByName('sequencial_nota_saida').AsFloat := sequencial_nota_saida;
      Open;

      BoletoHomologado := true;
      first;
      while not eof do
      begin
        if (VerificaHomologacaoBoleto(FieldByName('SEQUENCIAL_TITULO_RECEBER').AsFloat,'V')) = false then
          BoletoHomologado := false;
        next;
      end;

    finally
      Free;
      result :=  BoletoHomologado;
    end;
  end;

end;

function categoriaPedidoAtiva(sequencial_categoria_pedido : double) : Boolean;
begin
  if sequencial_categoria_pedido = 0 then
  begin
    Result := true;
    Exit; // Não foi informada a categoria
  end;
  with TQuery.Create(nil) do
  try
    DatabaseName := 'Data_Base';
    SQL.Add(' Select Ativa ');
    SQL.Add('   from sigma_ven.categoria_pedido ');
    SQL.Add('  where sequencial_categoria_pedido = :sequencial_categoria_pedido');
    ParamByName('sequencial_categoria_pedido').AsFloat := sequencial_categoria_pedido;

    open;

    if IsEmpty then
    begin
      Application.MessageBox('Categoria não cadastrada!','Atenção',MB_ICONWARNING);
      Result := false;
    end else if FieldByName('Ativa').AsInteger = 0 then
    begin
      Application.MessageBox('Atenção! Esta categoria está desativada!','Atenção',MB_ICONERROR);
      Result := false;
    end else
      Result := true;
  finally
    close;
    free;
  end;
end;

function ValidaChaveAcesso(chave: string; codUF: integer; dtEmissao: TDateTime; CNPJ: string; Modelo: Integer; Serie: Integer; NumeroNF: integer): string;
var
  str : string;
begin
//    result := '';
//
//    if length(chave) <> 44 then
//    begin
//       result := result +'Chave de Acesso deve possuir 44 dígitos'+#13#10;
//    end
//    else
//    begin
//      str := Copy(chave,44,1);
//      if str <> Digito_Modulo11_Base(Copy(chave,1,43),9,false) then
//      begin
//         result := Result +'Chave de Acesso Inválida!'+#13#10;
//      end
//      else
//      begin
//        if CNPJ <> '' then
//        begin
//          //Estado
//          str := Copy(chave,1,2);
//          if StrToInt(str)<> codUF then
//             result := result+'   Estado inválido'+#13#10;
//
//          //Mes Emissão
//          str := Copy(chave,5,2);
//          if str<>FormatDateTime('MM',dtEmissao) then
//             result := result+'   Mês Inválido'+#13#10;
//
//          //Ano Emissão
//          str := Copy(chave,3,2);
//          if str<>FormatDateTime('YY',dtEmissao) then
//             result := result+'   Ano Inválido'+#13#10;
//
//          //CNPJ
//          str := Copy(chave,7,14);
//          if str<>CNPJ then
//             result := result+'   CNPJ inválido'+#13#10;
//
//          //Modelo
//          str := Copy(chave,21,2);
//          if StrToInt(str)<>Modelo then
//             result := result+'   Modelo inválido'+#13#10;
//
//          //Série
//          str := Copy(chave,23,3);
//          if StrToInt(str)<>Serie then
//             result := result+'   Série inválida'+#13#10;
//
//          //Número
//          str := Copy(chave,26,9);
//          if StrToInt(str)<>NumeroNF then
//          begin
//            result := result+'   Número inválido'+#13#10;
//          end;
//
//          if result <> '' then
//          begin
//            result := 'Divergencia entre Chave de Acesso e Informação Digitada na Nota: '+#13#10+result;
//            result := Result + 'Por Favor Corrija a Informação e Tente Novamente!'
//          end;
//        end;
//      end;
//    end;


end;

function CriptografaSenhaPDV(Action, Src: String; contra_chave : String = ''): String;
label Fim;
var
  KeyLen : Integer;
  KeyPos : Integer;
  OffSet : Integer;
  Dest, Key : String;
  SrcPos : Integer;
  SrcAsc : Integer;
  TmpSrcAsc : Integer;
  Range : Integer;
begin
  if ( Src = '' ) Then
  begin
    Result:= '';
    goto Fim;
  end;
  key:= contra_chave + '%G1&g@$Tr#0n%*MM4A4VZYW9KHJUI2347EJHJKDF3425SKL';
  Dest := '';
  KeyLen := Length(Key);
  KeyPos := 0;
  //SrcPos := 0;
  //SrcAsc := 0;
  Range := 1;
  if (Action = UpperCase('C')) then
  begin
    Randomize;
    OffSet := Random(Range);
    Dest := Format('%1.2x',[OffSet]);
    for SrcPos := 1 to Length(Src) do
    begin
      Application.ProcessMessages;
      SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
      if ( KeyPos < KeyLen ) then
        KeyPos := KeyPos + 1
      else
        KeyPos := 1;
      SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
      Dest := Dest + Format('%1.2x',[SrcAsc]);
      OffSet := SrcAsc;
    end;
  end
  else
    if ( Action = UpperCase('D') ) then
    begin
      OffSet := StrToInt('$'+ Copy(Src,1,2));
      SrcPos := 3;
      repeat
        SrcAsc := StrToInt('$'+ Copy(Src, SrcPos,2));
        if ( KeyPos < KeyLen ) then
          KeyPos := KeyPos + 1
        else
          KeyPos := 1;
        TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        if ( TmpSrcAsc <= OffSet ) then
          TmpSrcAsc := (255 + TmpSrcAsc - OffSet)
        else
          TmpSrcAsc := (TmpSrcAsc - OffSet);
        Dest := Dest + Chr(TmpSrcAsc);
        OffSet := SrcAsc;
        SrcPos := SrcPos + 2;
      until (SrcPos >= Length(Src));
    end;
  Result:= Dest;
  Fim:
end;

function mergePDFs(pdfs: TStringList;nomeArquivo : String = 'Merge.pdf'): String;
var i : integer;
  sMerge : WideString;
 // pdf :TCPDFSplitMergeObj;
  TempDir  : array[0..MAX_PATH] of Char;
  DestinoMerge : String;
begin
//  try
//    GetTempPath(MAX_PATH, @TempDir);
//    DestinoMerge := StrPas(TempDir) + nomeArquivo;
//    pdf := TCPDFSplitMergeObj.Create(nil);
//    i := 0;
//    while (i < pdfs.Count) do
//    begin
//      if i = 0 then
//        sMerge :=pdfs[i]
//      else
//        sMerge := sMerge+'|'+pdfs[i];
//
//      inc(i);
//    end;
//    pdf.Merge(sMerge,DestinoMerge);
//  finally
//    pdf.Free;
//  end;
//  Result := DestinoMerge;
end;

function abrirArquivo(Arquivo : String) : boolean;
var H : HWND;
begin
  if FileExists(Arquivo) then
  begin
    ShellExecute(H, 'open', PChar(Arquivo), nil, nil, SW_SHOWNORMAL);
    Result := true;
  end
  else
    Result := false;
end;

function imprimirArquivo(Arquivo : String) : boolean;
var H : HWND;
begin
  if FileExists(Arquivo) then
  begin
    ShellExecute(H, 'print', PChar(Arquivo), nil, nil, SW_HIDE);
    Result := true;
  end
  else
    Result := false;
end;

function ExecAndWait(const ExecuteFile, ParamString : string): boolean;
var
  SEInfo: TShellExecuteInfo;
  ExitCode: DWORD;
begin
  FillChar(SEInfo, SizeOf(SEInfo), 0);
  SEInfo.cbSize := SizeOf(TShellExecuteInfo);
  with SEInfo do begin
    fMask := SEE_MASK_NOCLOSEPROCESS;
    Wnd := Application.Handle;
    lpFile := PChar(ExecuteFile);
    lpParameters := PChar(ParamString);
    nShow := SW_HIDE;
    lpVerb := PChar('Runas'); //Exibe diálogo para executar como administrador.
  end;
  if ShellExecuteEx(@SEInfo) then
  begin
    repeat
      Application.ProcessMessages;
      GetExitCodeProcess(SEInfo.hProcess, ExitCode);
    until ((ExitCode - STILL_ACTIVE) = 0) or Application.Terminated;
    Result:=True;
  end
  else Result:=False;
end;

procedure RegisterDLLs(svr32Patch, DLLPath  : string; registrar : boolean);
type
  TRegFunc = function : HResult; stdcall;
var
  ARegFunc : TRegFunc;
  aHandle  : THandle;
begin
 try
  aHandle := LoadLibrary(PChar(DLLPath));
  if aHandle <> 0 then
  begin
    ARegFunc := GetProcAddress(aHandle,'DllRegisterServer');
    if Assigned(ARegFunc) then
    begin
      if registrar then
        ExecAndWait('regsvr32','/s '+DLLPath)
      else
        ExecAndWait('regsvr32','/u ' +DLLPath);

    end;
     {/ s - Silencioso; não apresentam caixas de mensagem
      / u - Cancelar o registro do servidor
      / i - Chamar DllInstall passando um opcional [cmdline];
           quando usado com / u chama dll desinstalação
      / n - não chamar DllRegisterServer; esta opção deve
           ser utilizado com / i}
    FreeLibrary(aHandle);
    MessageDlg(Format('DLL %s registrada com sucesso!', [DLLPath]),mtInformation,[mbOK],0);
  end;
 except on e : exception do
 begin
   MessageDlg(Format('Atenção não foi possível registrar a DLL %s', [DLLPath])+#13+e.Message,mtError,[mbOK],0);
 end;
 end;
end;

//Diretório de sistema(c:\windows\system32)
function getSysDir: String;
var
 lng: DWORD;
begin
 SetLength(Result, MAX_PATH) ;
 lng := GetSystemDirectory(PChar(Result), MAX_PATH);
 SetLength(Result, lng) ;
end;

//Diretório Temporário do usuário( {usuario}\Configurações Locais\Temp)
function getTempDir: String;
var lng: DWORD;
begin
 SetLength(Result, MAX_PATH);
 lng := GetTempPath( MAX_PATH, PChar(Result)) ;
 SetLength(Result, lng) ;
end;

function GetSpecialFolder(const CSIDL: integer) : string;
var
  RecPath : PAnsiChar;
begin
//  RecPath := StrAlloc(MAX_PATH);
//    try
//    FillChar(RecPath^, MAX_PATH, 0);
//    if SHGetSpecialFolderPath(0, RecPath, CSIDL, false)
//      then result := RecPath
//      else result := '';
//    finally
//      StrDispose(RecPath);
//    end;
end;

function GetProgramFilesCommonDir: String;
begin
  Result := GetSpecialFolder($0023);
end;

procedure registrarPDFSplitMerge;
 var sDiretorioSistema : string;
      sDiretorioComumSistemas : String;
      sPathPDFSplitMerge : String;
      sPathPDFkit : String;
begin
  sDiretorioSistema := ExtractFilePath(Application.ExeName);
  sDiretorioComumSistemas := GetProgramFilesCommonDir+'\Sensatta';

  //Caminho ds dlls no servidor
  sPathPDFSplitMerge := sDiretorioSistema+'\lib\extras\PDFSplitMerge.DLL';
  sPathPDFkit        := sDiretorioSistema+'\lib\extras\pdfkit.dll';

  ForceDirectories(sDiretorioComumSistemas);

  CopyFile(pchar(sPathPDFSplitMerge),pchar(sDiretorioComumSistemas+'\PDFSplitMerge.DLL'),true);
  CopyFile(pchar(sPathPDFkit),pchar(sDiretorioComumSistemas+'\pdfkit.DLL'),true);

  RegisterDLLs(patchSvr32,sDiretorioComumSistemas+'\PDFSplitMerge.DLL',true);
end;

function patchSvr32: String;
var SearchRec: TSearchRec;
begin
  SetCurrentDir(getSysDir);
  if  FindFirst('regsvr32.exe', faAnyFile, SearchRec) = 0 then
    Result := getSysDir+'\regsvr32.exe'
  else
    Result := '';

end;

function RetiraCaracteresInvalidosNomeArquivo(s:string) : string;
var x : integer;
begin
   Result := '';
   for x := 1 to length(s) do
   begin
       if (s[x] in ['\','/',':','*','?','"','<','>','|']) then
         s[x] := '-';
       Result := Result + s[x];
   end;
end;

procedure permiteFaturarCTe;
begin
    with TQuery.Create(nil) do
    try
      DataBaseName := 'Data_Base';
      SQL.Add ('Select nvl(cte_permitir_faturar,1) cte_permitir_faturar');
      SQL.Add ('  from sigma_rh.funcionario');
      SQL.Add (' where username = TRIM(User) ');
      Open;
      if FieldByName('cte_permitir_faturar').AsFloat = 0 then
       Begin
        MessageDlg('O seu Usuário não tem Permissão para Manifestar um CTe (Cadastro de Funcionário aba "Permissões" sub-aba "CTe". Por Favor Verifique!', mtWarning, [mbOK], 0);
        abort;
       end;

    finally
      Free;
    end;
end;

Function Arredonda(Valor :Real; Casa :Integer) :Real;
Var sValor :String;
begin
   sValor := FloatToStrF(Valor,ffFixed,18,Casa);
   Arredonda := StrToFloat(sValor);
end;

function ChecaUF(UF : String) : Boolean;
begin

   Result := False;

  case AnsiIndexStr(UpperCase(UF), ['AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO']) of
    1 : Result := True;
    2 : Result := True;
    3 : Result := True;
    4 : Result := True;
    5 : Result := True;
    6 : Result := True;
    7 : Result := True;
    8 : Result := True;
    9 : Result := True;
   10 : Result := True;
   11 : Result := True;
   12 : Result := True;
   13 : Result := True;
   14 : Result := True;
   15 : Result := True;
   16 : Result := True;
   17 : Result := True;
   18 : Result := True;
   19 : Result := True;
   20 : Result := True;
   21 : Result := True;
   22 : Result := True;
   23 : Result := True;
   24 : Result := True;
   25 : Result := True;
   26 : Result := True;
   27 : Result := True;
  end;
end;

procedure listarArquivosDir(diretorio: string; lista: TStrings);
var
  search_rec: TSearchRec;
begin
  if FindFirst(diretorio + '*.*', faAnyFile, search_rec) = 0 then
    begin
      repeat
        if search_rec.Attr <> faDirectory then
          lista.Add(search_rec.Name);
      until FindNext(search_rec) <> 0;

      FindClose(search_rec);
    end;
end;

function LimpaString(ATexto: String):String;
var
  I: Integer;
  s: string;
begin
  S := '';
  for I := 1 To Length(ATexto) Do
    if (ATexto[I] in ['0'..'9']) then
      S := S + Copy(ATexto, I, 1);
  Result := S;
end;


//################################################################################

function ProcessoExiste(ExeFileName: string): boolean;
const
  PROCESS_TERMINATE=$0001;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32{declarar Uses Tlhelp32};
begin
  result := false;

  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := Sizeof(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle,FProcessEntry32);

  while integer(ContinueLoop) <> 0 do
  begin
  if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName))
  or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
  begin
  Result := true;
  exit;
  end;
  ContinueLoop := Process32Next(FSnapshotHandle,FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;


Function ExisteTabela(Tabela : String) : Boolean;
begin
  with TFDQuery.Create(nil) do
  try
    Connection := DataModule_Library.Conexao;
    Sql.Add(' SELECT *');
    Sql.Add('   FROM SYSOBJECTS');
    Sql.Add('  WHERE XTYPE = ''U'' ');
    Sql.Add('    AND NAME = :TABELA ' );
    ParamByName('TABELA').AsString := Tabela;
    Open;

    if not (IsEmpty) then
       Result := True
    else
       Result := False;

  finally
    Free;
  end;
end;

function StrZero(Zeros:string;Quant:integer):String;
var
I,Tamanho:integer;
aux: string;
begin
  aux     := zeros;
  Tamanho := length(ZEROS);
  ZEROS   := '';
  for I:=1 to quant-tamanho do ZEROS := ZEROS + '0';
  aux     := zeros + aux;
  StrZero := aux;
end;

//CALCULAR O IMC
function Calcular_IMC(Peso, Altura : variant) : variant;
begin
    result :=  ( Peso/(Altura * Altura) );
end;


Procedure SetupElloManager;
begin
      if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Script') then
         ForceDirectories(ExtractFilePath(Application.ExeName) + '\Script');
end;


end.
