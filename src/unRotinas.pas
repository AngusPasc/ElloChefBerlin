unit unRotinas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Menus, DBGrids, Db, Extctrls, stdctrls, dbctrls,
  cxRadioGroup, cxDBEdit, cxCalendar, cxGrid, variants,ShellApi,ShlObj,FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, StrUtils, Tlhelp32;


function Existe_Empresa : boolean;
function ChecaUF(UF : String) : Boolean;
function IncCodigo(campo, tabela : String) : String;
function BuscaProduto(codigo : String) : String;
function BuscaCodItem(CodPedido : integer) : integer;
procedure listarArquivosDir(diretorio: string; lista: TStrings);

implementation

uses U_DataModule_Library;

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

function IncCodigo(campo, tabela : String) : String;
begin
   with TFDQuery.Create(nil) do begin
     try
        Connection := DataModule_Library.Conexao;
        SQL.Add('SELECT COUNT('+campo+') + 1 AS NEXTVALUE  FROM '+ tabela);
        Open;

        if not IsEmpty then
        Result := FieldByName('NEXTVALUE').AsString;

     finally
        Free;
     end;
   end;
end;

function BuscaProduto(codigo : String) : String;
begin
   with TFDQuery.Create(nil) do begin
     try
        Connection := DataModule_Library.Conexao;
        SQL.Add('SELECT DESCRICAO FROM PRODUTO WHERE COD_PRODUTO = ' + codigo);
        Open;

        if not IsEmpty then
        Result := FieldByName('DESCRICAO').AsString else
        Result := '';

     finally
        Free;
     end;
   end;
end;

function BuscaCodItem(CodPedido : integer) : integer;
begin
   with TFDQuery.Create(nil) do begin
     try
        Connection := DataModule_Library.Conexao;
        SQL.Add('SELECT COUNT(COD_ITEM) + 1 AS NEXTVALUE FROM PEDIDOS_ITENS WHERE COD_PEDIDO = ' + IntToStr(CodPedido) );
        Open;
        Result := FieldByName('NEXTVALUE').AsInteger;
     finally
        Free;
     end;
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

end.
