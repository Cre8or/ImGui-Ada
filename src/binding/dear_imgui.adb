pragma License (Modified_GPL);	-- Consider contributing! :)





package body Dear_ImGui is



-- PRIVATE



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	function Buffer_String (
		Text  : in String;
		Index : in Positive
	) return T_Chars_Ptr is

		Last : Interfaces.C.size_t;

	begin

		if Index > C_Max_Buffer_Count then
			raise EX_BUFFER_COUNT_EXCEEDED;
		end if;

		Interfaces.C.To_C (
			Item       => Text,
			Target     => G_Buffers (Index),
			Count      => Last,
			Append_Nul => true
		);

		if Last >= C_Max_Buffer_Length then
			raise EX_BUFFER_LENGTH_EXCEEDED;
		end if;

		return G_Buffers_Ptr (Index);

	end Buffer_String;
	------------------------------------------------------------------------------------------------------------------------

	procedure Buffer_String (
		Text  : in String;
		Index : in Positive
	) is

		Dummy_Ptr : T_Chars_Ptr;

	begin

		Dummy_Ptr := Buffer_String (Text, Index);

	end Buffer_String;

	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Window is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

	end Enforce_Active_Window;



begin



	-- Link the buffer pointers to the buffers
	for I in G_Buffers'Range loop
			G_Buffers_Ptr (I) := P_C_Str.To_Chars_Ptr (G_Buffers (I)'Unrestricted_Access);
	end loop;



end Dear_ImGui;
