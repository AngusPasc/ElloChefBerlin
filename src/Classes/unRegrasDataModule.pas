{
Gustavo      -   12/02/2015  - Criação
}

unit unRegrasDataModule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Menus, DBGrids, Db, Extctrls, stdctrls, dbctrls,
  cxRadioGroup, cxDBEdit, cxCalendar, cxGrid, variants,ShellApi,ShlObj,FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, StrUtils, Tlhelp32;
//  cxExportGrid4Link

procedure Refresh_Query(var QryTmp : TFDQuery; sChave : string);
function Alterou_Query(MTable : TFDQuery) : boolean;

var
   Form_Principal: String;


implementation

uses U_DataModule_Library;

procedure Refresh_Query;
var Bookmark : TBookmark;
begin

  Bookmark := QryTmp.GetBookmark;
  QryTmp.Close;
  QryTmp.Open;
  if (not QryTmp.IsEmpty) and (QryTmp.BookmarkValid(Bookmark)) then QryTmp.GotoBookmark(Bookmark);
  QryTmp.FreeBookmark(Bookmark);

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

end.
