pragma License (Modified_GPL);





package body Dear_ImGui.Backend_OpenGL3 is



	-- Use clauses
	use type T_Bool;
	use type T_Chars_Ptr;



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	procedure Init is
	begin

		if not Init_Raw then
			raise EX_INITIALISATION_ERROR;
		end if;

	end Init;

	------------------------------------------------------------------------------------------------------------------------
	procedure Init (GLSL_Version : in String) is

		Version_String : T_Chars_Ptr;
		Result         : T_Bool;

	begin

		Version_String := Interfaces.C.Strings.New_String (GLSL_Version);

		Result := Init_Raw (Version_String);

		Interfaces.C.Strings.Free (Version_String);

		-- Error checking
		if not Result then
			raise EX_INITIALISATION_ERROR;
		end if;

	end Init;



end Dear_ImGui.Backend_OpenGL3;
