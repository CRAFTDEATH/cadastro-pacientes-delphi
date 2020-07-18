object PacientesFrm: TPacientesFrm
  Left = 0
  Top = 0
  Caption = 'Pacientes'
  ClientHeight = 440
  ClientWidth = 840
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    840
    440)
  PixelsPerInch = 96
  TextHeight = 13
  object SearchTxt: TEdit
    Left = 16
    Top = 8
    Width = 734
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = 'Digite o nome do paciente aqui'
    ExplicitWidth = 759
  end
  object SearchBtn: TButton
    Left = 756
    Top = 6
    Width = 72
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Search'
    TabOrder = 1
    OnClick = SearchBtnClick
    ExplicitLeft = 781
  end
  object NovoBtn: TButton
    Left = 16
    Top = 381
    Width = 100
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Novo'
    TabOrder = 3
    OnClick = NovoBtnClick
    ExplicitTop = 412
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 35
    Width = 734
    Height = 324
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Visible = True
      end>
  end
  object RefreshBtn: TButton
    Left = 138
    Top = 381
    Width = 95
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Refresh'
    TabOrder = 4
    OnClick = RefreshBtnClick
    ExplicitTop = 412
  end
  object MainMenu1: TMainMenu
    Left = 520
    Top = 384
    object U1: TMenuItem
      Caption = 'Usuario'
      object Logout1: TMenuItem
        Caption = 'Logout'
        OnClick = Logout1Click
      end
    end
  end
  object ZConnection1: TZConnection
    ControlsCodePage = cCP_UTF16
    AutoEncodeStrings = True
    Catalog = ''
    Connected = True
    HostName = 'localhost'
    Port = 0
    Database = 'sus'
    User = 'postgres'
    Password = '000000'
    Protocol = 'postgresql'
    LibraryLocation = 'C:\Program Files (x86)\PostgreSQL\9.6\bin\libpq.dll'
    Left = 256
    Top = 384
  end
  object ZQuery1: TZQuery
    Connection = ZConnection1
    Filtered = True
    Active = True
    SQL.Strings = (
      'SELECT id, nome, email, telefone, estado, cidade FROM pacientes')
    Params = <>
    DataSource = DataSource1
    Left = 328
    Top = 384
  end
  object DataSource1: TDataSource
    DataSet = ZTable1
    Left = 456
    Top = 384
  end
  object ZTable1: TZTable
    Connection = ZConnection1
    Filtered = True
    Active = True
    TableName = 'pacientes'
    Left = 392
    Top = 384
  end
end
