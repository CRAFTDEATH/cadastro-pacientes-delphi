object CadastroFrm: TCadastroFrm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cadastro'
  ClientHeight = 470
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object CpfLbl: TLabel
    Left = 18
    Top = 21
    Width = 24
    Height = 13
    Caption = 'Cpf: '
  end
  object NomeLbl: TLabel
    Left = 18
    Top = 67
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object TelefoneLbl: TLabel
    Left = 206
    Top = 67
    Width = 46
    Height = 13
    Caption = 'Telefone:'
  end
  object EmailLbl: TLabel
    Left = 20
    Top = 113
    Width = 32
    Height = 13
    Caption = 'E-mail:'
  end
  object CepLbl: TLabel
    Left = 207
    Top = 113
    Width = 23
    Height = 13
    Caption = 'Cep:'
  end
  object CidadeLbl: TLabel
    Left = 20
    Top = 159
    Width = 37
    Height = 13
    Caption = 'Cidade:'
  end
  object EstadoLbl: TLabel
    Left = 204
    Top = 159
    Width = 37
    Height = 13
    Caption = 'Estado:'
  end
  object BairroLbl: TLabel
    Left = 18
    Top = 205
    Width = 32
    Height = 13
    Caption = 'Bairro:'
  end
  object NumeroLbl: TLabel
    Left = 20
    Top = 251
    Width = 41
    Height = 13
    Caption = 'Numero:'
  end
  object ComplementoLbl: TLabel
    Left = 20
    Top = 297
    Width = 69
    Height = 13
    Caption = 'Complemento:'
  end
  object RuaLbl: TLabel
    Left = 204
    Top = 205
    Width = 19
    Height = 13
    Caption = 'Rua'
  end
  object SalvarBtn: TButton
    Left = 20
    Top = 422
    Width = 75
    Height = 25
    Caption = 'Enviar'
    TabOrder = 0
    OnClick = SalvarBtnClick
  end
  object LimparBtn: TButton
    Left = 118
    Top = 422
    Width = 75
    Height = 25
    Caption = 'Clear'
    TabOrder = 12
    OnClick = LimparBtnClick
  end
  object FecharBtn: TButton
    Left = 211
    Top = 422
    Width = 75
    Height = 25
    Caption = 'Fechar'
    TabOrder = 13
    OnClick = FecharBtnClick
  end
  object ComplementoMemo: TMemo
    Tag = 11
    Left = 18
    Top = 316
    Width = 348
    Height = 89
    Lines.Strings = (
      '')
    MaxLength = 200
    TabOrder = 8
  end
  object CpfEdt: TMaskEdit
    Tag = 1
    Left = 18
    Top = 40
    Width = 348
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    Text = ''
    TextHint = 'Digite o CPF aqui'
    OnEnter = CpfEdtEnter
    OnExit = CpfEdtExit
  end
  object TelefoneEdt: TMaskEdit
    Tag = 3
    Left = 207
    Top = 86
    Width = 159
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Text = ''
    TextHint = 'Digite telefone aqui'
    OnEnter = TelefoneEdtEnter
    OnExit = TelefoneEdtExit
  end
  object CepTxt: TMaskEdit
    Tag = 5
    Left = 206
    Top = 132
    Width = 160
    Height = 21
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = ''
    TextHint = 'Digite o Cep aqui'
    OnEnter = CepTxtEnter
    OnExit = CepTxtExit
  end
  object NomeTxt: TEdit
    Tag = 2
    Left = 18
    Top = 86
    Width = 173
    Height = 21
    MaxLength = 40
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    TextHint = 'Digite o nome aqui'
  end
  object EmailEdt: TEdit
    Tag = 4
    Left = 18
    Top = 132
    Width = 173
    Height = 21
    MaxLength = 50
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    TextHint = 'Digite o E-mail aqui'
  end
  object CidadeTxt: TEdit
    Tag = 6
    Left = 18
    Top = 178
    Width = 171
    Height = 21
    MaxLength = 50
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    TextHint = 'Digite a cidade aqui'
  end
  object BairroTxt: TEdit
    Tag = 8
    Left = 18
    Top = 224
    Width = 171
    Height = 21
    MaxLength = 50
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    TextHint = 'Digite o bairro aqui'
  end
  object EstadoTxt: TEdit
    Tag = 7
    Left = 204
    Top = 178
    Width = 162
    Height = 21
    MaxLength = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    TextHint = 'Digite estado aqui'
  end
  object RuaEdt: TEdit
    Tag = 9
    Left = 204
    Top = 224
    Width = 162
    Height = 21
    MaxLength = 50
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    TextHint = 'Digite a rua aqui'
  end
  object NumeroEdt: TEdit
    Tag = 10
    Left = 18
    Top = 270
    Width = 348
    Height = 21
    MaxLength = 10
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    TextHint = 'Digite o numero da casa aqui'
  end
  object ZQuery1: TZQuery
    Connection = PacientesFrm.ZConnection1
    Params = <>
    Left = 304
    Top = 432
  end
end
