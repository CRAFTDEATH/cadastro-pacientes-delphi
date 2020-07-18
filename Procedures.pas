unit Procedures;

interface
  uses Winapi.Windows, Winapi.Messages, System.SysUtils,System.UITypes,
  System.Variants,System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, Vcl.StdCtrls,Vcl.Mask,Data.DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection,Vcl.Grids,Vcl.DBGrids,
  System.Generics.Collections,Tipos;
  procedure ClearFieldAll(AForm: TForm);
  procedure fecharForm(AForm: TForm);
  procedure salvarDados(AForm: TForm;AQuery: TZquery;data: Arrayof11);
  procedure editarDados(AForm: TForm;AQuery: TZQuery;data: ArrayOf11;id: string);
  procedure excluirDados(AForm: TForm;AQuery: TZQuery;id: string);
implementation
  {procedure que limpa todos os campo do formulario favor passar TForm(Self)
  como parametro}

  procedure ClearFieldAll(AForm: TForm);
  var
  i: word;
  begin
    with AForm do
    begin
       for i := 0 to ComponentCount - 1 do
       begin
          if (Components[i] is TEdit) then
          begin
            TEdit(Components[i]).Clear;
          end;
          if (Components[i] is TMaskEdit) then
          begin
            TMaskEdit(Components[i]).Clear;
          end;
          if (Components[i] is TMemo) then
          begin
            TMemo(Components[i]).Clear;
          end;
       end;
    end;
  end;
  {pergunta se quer fechar o form favor passar TForm(Self)
  como parametro}
  procedure FecharForm(AForm: TForm);
  var
    confirmar: integer;
  begin
    with Aform do
    begin
      confirmar := MessageDlg('Deseja encerrar ?', mtConfirmation, mbYesNo,0);
      if(confirmar = mrYes) then
      begin
         Aform.Close;
      end;
    end;

  end;
  //procedure salvar dados de pacientes
  procedure salvarDados(AForm: TForm;AQuery: TZQuery;data: ArrayOf11);
  var
    query: string;
  begin
     try
       with AForm do
       begin
          query := 'INSERT INTO pacientes VALUES(default,'
          + QuotedStr(data[1])+ ',' + QuotedStr(data[2]) + ','
          + QuotedStr(data[3]) + ',' + QuotedStr(data[4])+ ','
          + QuotedStr(data[5]) + ',' + QuotedStr(data[6]) + ','
          + QuotedStr(data[7]) +','+ QuotedStr(data[8]) + ','
          + QuotedStr(data[9]) + ',' + QuotedStr(data[10]) + ','
          + QuotedStr(data[11]) + ')';
          AQuery.SQL.Text := query;
          AQuery.ExecSQL;
          AQuery.Close;
          ShowMessage('Cadastro com Sucesso');
     end;
     except
      on E: exception do
      ShowMessage('Error = ' + E.Message );
    end;
  end;
  //procedure para editar dados do paciente
  procedure editarDados(AForm: TForm;AQuery: TZQuery;data: ArrayOf11;id: string);
  var
    query: string;
  begin
     try
       with AForm do
       begin
          query := 'UPDATE pacientes  SET  cpf ='
          + QuotedStr(data[1])+ ',' + 'nome = ' + QuotedStr(data[2]) + ','
          + 'telefone =' + QuotedStr(data[3]) + ',' + 'email = ' + QuotedStr(data[4]) + ','
          + 'cep = ' + QuotedStr(data[5]) + ',' + 'cidade = ' + QuotedStr(data[6]) + ','
          + 'estado =' + QuotedStr(data[7]) +','+ 'bairro = ' + QuotedStr(data[8]) + ','
          + 'rua = ' + QuotedStr(data[9]) + ',' + 'numero = ' + QuotedStr(data[10]) + ','
          + 'complemento =' + QuotedStr(data[11]) + 'where id = ' + QuotedStr(id);
          AQuery.SQL.Text := query;
          AQuery.ExecSQL;
          AQuery.Close;
          ShowMessage('Editado com Sucesso');
     end;
     except
      on E: exception do
      ShowMessage('Error = ' + E.Message );
    end;
  end;
  //procedure para excluir dados de paciente
   procedure excluirDados(AForm: TForm;AQuery: TZQuery;id: string);
   begin
     with AForm do
     begin
       AQuery.SQL.Text := 'DELETE FROM pacientes WHERE id =' + QuotedStr(id);
       AQuery.ExecSQL;
       ShowMessage('Excluido com Sucesso');
     end;
   end;
end.

