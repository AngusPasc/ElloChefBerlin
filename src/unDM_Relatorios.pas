unit unDM_Relatorios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, frxClass, frxDBSet,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDM_Relatorios = class(TDataModule)
    qryPedidos: TFDQuery;
    frxDataSetPedidos: TfrxDBDataset;
    frxReportPedidos: TfrxReport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM_Relatorios: TDM_Relatorios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses U_DataModule_Library;

{$R *.dfm}

end.
