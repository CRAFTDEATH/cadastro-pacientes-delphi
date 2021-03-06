program sus;

uses
  Vcl.Forms,
  Login in 'Login.pas' {SusFrm},
  Pacientes in 'Pacientes.pas' {PacientesFrm},
  Cadastro in 'Cadastro.pas' {CadastroFrm},
  Procedures in 'Procedures.pas',
  funcoes in 'funcoes.pas',
  validacoes in 'validacoes.pas',
  Tipos in 'Tipos.pas',
  Alterar in 'Alterar.pas' {DadosEditarFrm},
  uEndereco in 'uEndereco.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TPacientesFrm, PacientesFrm);
  Application.CreateForm(TDadosEditarFrm, DadosEditarFrm);
  Application.ShowMainForm := false;
  Application.Run;
end.
