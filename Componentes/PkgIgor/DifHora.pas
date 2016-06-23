function DifHora(Inicio,Fim : String):String;
{Retorna a diferença entre duas horas}
var
  FIni,FFim : TDateTime;
begin
Fini := StrTotime(Inicio);
FFim := StrToTime(Fim);
If (Inicio > Fim) then
    begin
    Result := TimeToStr((StrTotime('23:59:59')-Fini)+FFim)
    end
else
   begin
   Result := TimeToStr(FFim-Fini);
   end;
end;
