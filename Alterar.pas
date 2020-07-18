unit Alterar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  ZAbstractConnection, ZConnection, Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TDadosEditarFrm = class(TForm)
    ComplementoMemo: TMemo;
    NumeroEdt: TEdit;
    RuaEdt: TEdit;
    EstadoTxt: TEdit;
    BairroTxt: TEdit;
    CidadeTxt: TEdit;
    EmailEdt: TEdit;
    NomeTxt: TEdit;
    CepTxt: TMaskEdit;
    TelefoneEdt: TMaskEdit;
    CpfEdt: TMaskEdit;
    FecharBtn: TButton;
    EditarBtn: TButton;
    RuaLbl: TLabel;
    ComplementoLbl: TLabel;
    NumeroLbl: TLabel;
    BairroLbl: TLabel;
    EstadoLbl: TLabel;
    CidadeLbl: TLabel;
    CepLbl: TLabel;
    EmailLbl: TLabel;
    TelefoneLbl: TLabel;
    NomeLbl: TLabel;
    CpfLbl: TLabel;
    ZQuery2: TZQuery;
    ZConnection2: TZConnection;
    IdEdt: TEdit;
    ExcluirBtn: TButton;
    procedure FecharBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LimparBtnClick(Sender: TObject);
    procedure EditarBtnClick(Sender: TObject);
    procedure TelefoneEdtEnter(Sender: TObject);
    procedure TelefoneEdtExit(Sender: TObject);
    procedure CpfEdtExit(Sender: TObject);
    procedure CpfEdtClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CepTxtExit(Sender: TObject);
    procedure ExcluirBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DadosEditarFrm: TDadosEditarFrm;


implementation

{$R *.dfm}

uses funcoes, Procedures, Tipos, validacoes, Pacientes, uEndereco;

procedure TDadosEditarFrm.CepTxtExit(Sender: TObject);
var
  _rEndereco: TEndereco;
begin
if CepTxt.Text = EmptyStr then
    Exit;

  _rEndereco := TEndereco.Create(CepTxt.Text);
  try
    BairroTxt.Text := _rEndereco.Bairro;
    CidadeTxt.Text := _rEndereco.Cidade;
    EstadoTxt.Text := _rEndereco.UF;
    RuaEdt.Text := _rEndereco.Logradouro;
    CepTxt.EditMask := '';
  finally
    _rEndereco.Free;
    _rEndereco := nil;
  end;
end;

procedure TDadosEditarFrm.CpfEdtClick(Sender: TObject);
begin
CpfEdt.EditMask := '000.000.000-00;1;_';
end;

procedure TDadosEditarFrm.CpfEdtExit(Sender: TObject);
begin
CpfEdt.EditMask := '';
end;

procedure TDadosEditarFrm.FecharBtnClick(Sender: TObject);
begin
fecharForm(TForm(Self));
end;

procedure TDadosEditarFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  DadosEditarFrm := nil;
end;

procedure TDadosEditarFrm.FormShow(Sender: TObject);
begin
ZQuery2.SQL.Text := 'SELECT cpf, nome, telefone, email, cep, cidade, ' +
    'estado, bairro, rua, numero, complemento '+ 'FROM pacientes ' + 'WHERE id = ' +
    QuotedStr(PacientesFrm.id);
    ZQuery2.Open;
    IdEdt.Text := PacientesFrm.id;
    CpfEdt.Text := ZQuery2.FieldByName('cpf').Value;
    NomeTxt.Text := ZQuery2.FieldByName('nome').Value;
    TelefoneEdt.Text := ZQuery2.FieldByName('telefone').Value;
    EmailEdt.Text := ZQuery2.FieldByName('email').Value;
    CepTxt.Text := ZQuery2.FieldByName('cep').Value;
    CidadeTxt.Text := ZQuery2.FieldByName('cidade').Value;
    EstadoTxt.Text := ZQuery2.FieldByName('estado').Value;
    BairroTxt.Text := ZQuery2.FieldByName('bairro').Value;
    RuaEdt.Text := ZQuery2.FieldByName('rua').Value;
    NumeroEdt.Text := ZQuery2.FieldByName('numero').Value;
    ComplementoMemo.Lines.Text := ZQuery2.FieldByName('complemento').Value;
end;

procedure TDadosEditarFrm.LimparBtnClick(Sender: TObject);
begin
ClearFieldAll(TForm(Self));
end;

procedure TDadosEditarFrm.EditarBtnClick(Sender: TObject);
var
dados : ArrayOf11;
begin
  if(campoVazio(TForm(Self))) then
  begin
     ShowMessage('Algum Campo Esta vazio, Por favor o prencha');
  end
  else
  begin
      dados := getParams(TForm(Self));
      editarDados(TForm(Self),ZQuery2,dados,PacientesFrm.id);
      PacientesFrm.RefreshBtn.Click;
  end;
end;

procedure TDadosEditarFrm.ExcluirBtnClick(Sender: TObject);
begin
excluirDados(TForm(Self),ZQuery2,PacientesFrm.id);
PacientesFrm.RefreshBtn.Click;
TForm(Self).Close;
end;

procedure TDadosEditarFrm.TelefoneEdtEnter(Sender: TObject);
begin
TelefoneEdt.EditMask := '!\(00\)000000009;1;_';
end;

procedure TDadosEditarFrm.TelefoneEdtExit(Sender: TObject);
begin
 TelefoneEdt.EditMask := '';
end;

end.
