unit validacoes;

interface
  uses  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, REST.Types,Data.Bind.Components, Data.Bind.ObjectScope,
  REST.Client, Vcl.Mask, Data.DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, ZSqlUpdate,System.Generics.Collections;
  function campoVazio(AForm: TForm) : boolean;
implementation
// verificar campos vazio
function campoVazio(AForm: TForm) : boolean;
var
i: integer;
begin
   with AForm do
   begin
      for i := 0 to ComponentCount - 1 do
      begin
         if (Components[i] is TEdit) then
         begin
            if(TEdit(Components[i]).Text = '') then
            begin
               TEdit(Components[i]).TextHint := 'Campo Obrigatorio';
               Result := true;

            end;
         end;
         if (Components[i] is TMaskEdit) then
         begin
            if(TMaskEdit(Components[i]).Text = '') then
            begin
               TMaskEdit(Components[i]).TextHint := 'Campo Obrigatorio';
               Result := true;

            end;
         end;
         if (Components[i] is TMemo) then
         begin
            if(TMemo(Components[i]).Text = '') then
            begin

               TMemo(Components[i]).Lines.Add(Application.Hint);
               Application.Hint :=  'Campo Obrigatorio';
               Result:= true;
            end;
         end;
      end;
   end;
end;
end.
