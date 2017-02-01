program FoodTruck;

uses
  Vcl.Forms,
  unMenu in 'unMenu.pas' {frmMenu},
  unRotinas in 'unRotinas.pas',
  unEmpresa in 'unEmpresa.pas' {frmEmpresa},
  unProduto in 'unProduto.pas' {frmProduto},
  unPedido in 'unPedido.pas' {frmPedido},
  U_CarregaDados in 'Classes\U_CarregaDados.pas' {F_CarregaDados},
  U_DataAware in 'Classes\U_DataAware.pas' {F_DataAware},
  U_DataModule_Library in 'Classes\U_DataModule_Library.pas' {DataModule_Library: TDataModule},
  U_Rotinas_Manager in 'Classes\U_Rotinas_Manager.pas',
  C_DetailGrid5 in 'Classes\C_DetailGrid5.pas' {F_DetailGrid5},
  C_EntryGrid5 in 'Classes\C_EntryGrid5.pas' {F_EntryGrid5},
  C_Pesquisa in 'Classes\C_Pesquisa.pas' {F_Pesquisa},
  C_PesquisaGlobal in 'Classes\C_PesquisaGlobal.pas' {F_PesquisaGlobal},
  C_PesquisaZ in 'Classes\C_PesquisaZ.pas' {F_PesquisaZ},
  C_Print_Form5 in 'Classes\C_Print_Form5.pas' {F_Print_Form5},
  unRegrasDataModule in 'Classes\unRegrasDataModule.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.CreateForm(TfrmProduto, frmProduto);
  Application.CreateForm(TfrmPedido, frmPedido);
  Application.CreateForm(TF_CarregaDados, F_CarregaDados);
  Application.CreateForm(TF_DataAware, F_DataAware);
  Application.CreateForm(TDataModule_Library, DataModule_Library);
  Application.CreateForm(TF_DetailGrid5, F_DetailGrid5);
  Application.CreateForm(TF_EntryGrid5, F_EntryGrid5);
  Application.CreateForm(TF_Pesquisa, F_Pesquisa);
  Application.CreateForm(TF_PesquisaGlobal, F_PesquisaGlobal);
  Application.CreateForm(TF_PesquisaZ, F_PesquisaZ);
  Application.CreateForm(TF_Print_Form5, F_Print_Form5);
  Application.Run;
end.
