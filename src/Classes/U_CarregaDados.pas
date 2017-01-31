{
  04/03/2015 -   Gustavo      -    Criação;
  08/03/2015 -   Gustavo      -    Adicionado o componente TFDScript para tratar os objetos de Tabela, Constraint e outros scripts de banco.
}
unit U_CarregaDados;

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
  dxSkinWhiteprint, dxSkinXmas2008Blue, cxProgressBar, cxLabel, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Comp.Script, FireDAC.UI.Intf,
  FireDAC.Stan.Async, FireDAC.Comp.ScriptCommands, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TF_CarregaDados = class(TForm)
    ImagemLogo: TImage;
    lbCarregando: TcxLabel;
    pb_CarregaDados: TcxProgressBar;
    Script: TFDScript;
    QAux: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure Carregatabela;
    Procedure CarregaConstraint;
    Procedure CarregaScripts;
  public
    { Public declarations }
  end;

var
  F_CarregaDados: TF_CarregaDados;

implementation

{$R *.dfm}

uses U_DataModule_Library, unMenu, U_DATAMASTER;

procedure TF_CarregaDados.CarregaConstraint;
var Lista2 : TListBox;
    i : integer;
begin
       // Verificando Scripts de criação de Constraint
       Lista2 := TListBox.Create(Self);
       Lista2.Name    := 'ListaContraint';
       Lista2.Parent  := Self;
       Lista2.Visible := False;

       if DirectoryExists(ExtractFilePath(Application.ExeName)+'Constraint\') then begin
            listarArquivosDir(ExtractFilePath(Application.ExeName)+'Constraint\', Lista2.Items);
            if Lista2.Count > 0 then begin
                lbCarregando.Caption := 'Carregando arquivos de constraint...';
                pb_CarregaDados.Properties.Max := Lista2.Count;
                pb_CarregaDados.Position := 0;
                for i := 0 to lista2.Count -1 do begin
                    Try
                      with Script do begin
                        SQLScriptFileName := ExtractFilePath(Application.ExeName)+'Constraint\'  + Lista2.Items.Strings[i];
                        ValidateAll;
                        ExecuteAll;
                        DeleteFile(ExtractFilePath(Application.ExeName)+'Constraint\'  + Lista2.Items.Strings[i]);
                      end;
                    except
                    End;
                pb_CarregaDados.Position := Lista2.Count;
                Application.ProcessMessages;
                end;
            end;
           Lista2.Destroy;
       end;
end;

procedure TF_CarregaDados.CarregaScripts;
var Lista3 : TListBox;
    i : integer;
begin
       // Verificando outros Scripts
       Lista3 := TListBox.Create(Self);
       Lista3.Name    := 'ListaOutrosScripts';
       Lista3.Parent  := Self;
       Lista3.Visible := False;

       if DirectoryExists(ExtractFilePath(Application.ExeName)+'Script\') then begin
            listarArquivosDir(ExtractFilePath(Application.ExeName)+'Script\', Lista3.Items);
            if Lista3.Count > 0 then begin
                lbCarregando.Caption := 'Carregando Scripts específicos...';
                pb_CarregaDados.Properties.Max := Lista3.Count;
                pb_CarregaDados.Position := 0;
                for i := 0 to lista3.Count -1 do begin
                    Try
                      with Script do begin
                        SQLScriptFileName := ExtractFilePath(Application.ExeName)+'Script\'  + Lista3.Items.Strings[i];
                        ValidateAll;
                        ExecuteAll;
                        DeleteFile(ExtractFilePath(Application.ExeName)+'Script\'  + Lista3.Items.Strings[i]);
                      end;
                    except
                    End;
                pb_CarregaDados.Position := Lista3.Count;
                Application.ProcessMessages;
                end;
            end;
           Lista3.Destroy;
       end;
end;

procedure TF_CarregaDados.Carregatabela;
var Lista1 : TListBox;
    i : integer;
begin
       // Verificando Scripts de criação de Tabelas
       Lista1 := TListBox.Create(Self);
       Lista1.Name    := 'ListaTabelas';
       Lista1.Parent  := Self;
       Lista1.Visible := False;

       if DirectoryExists(ExtractFilePath(Application.ExeName)+'Tabela\') then begin
            listarArquivosDir(ExtractFilePath(Application.ExeName)+'Tabela\', Lista1.Items);
            if Lista1.Count > 0 then begin
                lbCarregando.Caption := 'Carregando Tabelas...';
                pb_CarregaDados.Properties.Max := Lista1.Count;
                pb_CarregaDados.Position := 0;
                for i := 0 to lista1.Count -1 do begin
                    Try
                      with Script do begin
                        SQLScriptFileName := ExtractFilePath(Application.ExeName)+'Tabela\'  + Lista1.Items.Strings[i];
                        ValidateAll;
                        ExecuteAll;
                        DeleteFile(ExtractFilePath(Application.ExeName)+'Tabela\'  + Lista1.Items.Strings[i]);
                      end;
                    except
                    End;
                pb_CarregaDados.Position := Lista1.Count;
                Application.ProcessMessages;
                end;
            end;
           Lista1.Destroy;
       end;
end;

procedure TF_CarregaDados.FormCreate(Sender: TObject);
var sDiretorioLogo : String;
begin
    sDiretorioLogo := ExtractFilePath(Application.ExeName) + 'Logo\Logo.jpg';
    if fileexists(sDiretorioLogo) then begin
       ImagemLogo.Picture.LoadFromFile(sDiretorioLogo);
    end;
end;

procedure TF_CarregaDados.FormShow(Sender: TObject);
begin
    Carregatabela;
    CarregaConstraint;
    CarregaScripts;

    FrmMenu.ShowModal;
    F_CarregaDados.Close;
end;

end.
