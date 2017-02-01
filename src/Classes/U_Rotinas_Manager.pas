{
Gustavo      -   30/05/2015  - Criação
}

unit U_Rotinas_Manager;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ToolWin, ComCtrls, Menus, DBGrids, Db, Extctrls, stdctrls, dbctrls,
  cxRadioGroup, cxDBEdit, cxCalendar, cxGrid, variants,ShellApi,ShlObj,FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, StrUtils, Tlhelp32;


Procedure SetupElloManager;


implementation

Procedure SetupElloManager;
begin
    // *** Criando os diretórios Padrão ***

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Tabela') then
       ForceDirectories(ExtractFilePath(Application.ExeName) + '\Tabela');

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Constraint') then
       ForceDirectories(ExtractFilePath(Application.ExeName) + '\Constraint');

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Script') then
       ForceDirectories(ExtractFilePath(Application.ExeName) + '\Script');

    if not DirectoryExists(ExtractFilePath(Application.ExeName) + '\Script') then
       ForceDirectories(ExtractFilePath(Application.ExeName) + '\Script');

end;


end.
