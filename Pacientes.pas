unit Pacientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Datasnap.Provider, Datasnap.DBClient,
  ZAbstractTable;


type
  TPacientesFrm = class(TForm)
    SearchTxt: TEdit;
    SearchBtn: TButton;
    NovoBtn: TButton;
    MainMenu1: TMainMenu;
    U1: TMenuItem;
    Logout1: TMenuItem;
    ZConnection1: TZConnection;
    DBGrid1: TDBGrid;
    RefreshBtn: TButton;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    ZTable1: TZTable;
    procedure NovoBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Logout1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure RefreshBtnClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
    var id : string;
  end;

var
  PacientesFrm: TPacientesFrm;


implementation

{$R *.dfm}

uses Cadastro, Login, Procedures, Alterar;

procedure TPacientesFrm.DBGrid1CellClick(Column: TColumn);
var
  valor: string;
  form : TForm;
begin
  valor := DBGrid1.Columns.items[0].field.Value;
  form := TDadosEditarFrm.Create(Self);
  id := valor;
  form.ShowModal;

end;

procedure TPacientesFrm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  PacientesFrm := nil;
end;

procedure TPacientesFrm.FormCreate(Sender: TObject);
var
  SusForm: TForm;
begin
     SusForm := TSusFrm.Create(Self);
     SusForm.ShowModal;
end;

procedure TPacientesFrm.FormShow(Sender: TObject);
begin
  DBGrid1.Columns[0].Width := 200;
  DBGrid1.Columns[1].Width := 200;
  DBGrid1.Columns[2].Width := 220;
  DBGrid1.Columns[3].Width := 200;
  DBGrid1.Columns[4].Width := 200;
  DBGrid1.Columns[5].Width := 219;
end;

procedure TPacientesFrm.Logout1Click(Sender: TObject);
var
  LoginForm: TForm;
begin
  TForm(Self).Hide;
  LoginForm := TSusFrm.Create(Self);
  LoginForm.ShowModal;
end;

procedure TPacientesFrm.NovoBtnClick(Sender: TObject);
var
  CadastroForm : TForm;
begin
   CadastroForm := TCadastroFrm.Create(Self);
   CadastroForm.ShowModal;
end;

procedure TPacientesFrm.RefreshBtnClick(Sender: TObject);
begin
  ZTable1.Refresh;
end;

procedure TPacientesFrm.SearchBtnClick(Sender: TObject);
begin
  ZTable1.Filter := 'nome like' + QuotedStr('*' + SearchTxt.Text + '*') + 'OR'
  + ' telefone like' + QuotedStr('*' + SearchTxt.Text + '*');

end;

end.
