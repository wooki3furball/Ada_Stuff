with Ada.Text_IO; use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;

procedure cli is
begin
   Put_Line("Number of arguments: " & Integer'Image(Argument_Count));

   for I in 1 .. Argument_Count loop
      Put_Line("Argument " & Integer'Image(I) & ": " & Argument(I));
   end loop;

   if Argument_Count > 1 then
      for I in 1 .. Argument_Count - 1 loop
         declare
            Arg1 : constant String := Argument(I);
            Arg2 : constant String := Argument(I + 1);
         begin
            if Arg1 = Arg2 then
               Put_Line("Argument " & Integer'Image(I) & " (" & Arg1 & ") is equal to Argument " & Integer'Image(I + 1) & " (" & Arg2 & ")");
            elsif Arg1 < Arg2 then
               Put_Line("Argument " & Integer'Image(I) & " (" & Arg1 & ") is less than Argument " & Integer'Image(I + 1) & " (" & Arg2 & ")");
            else
               Put_Line("Argument " & Integer'Image(I) & " (" & Arg1 & ") is greater than Argument " & Integer'Image(I + 1) & " (" & Arg2 & ")");
            end if;
         end;
      end loop;
   else
      Put_Line("Not enough arguments to compare.");
   end if;
end cli;
