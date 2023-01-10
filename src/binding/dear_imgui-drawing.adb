pragma License( Modified_GPL );





package body Dear_ImGui.Drawing is



	-- Use clauses
	use type T_Bool;
	use type T_Chars_Ptr;



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	procedure Render is
	begin

		if G_Window_Count > 0 then
			raise EX_WINDOW_STILL_ACTIVE;
		end if;

		Dear_ImGui.API.igRender;

	end Render;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window(Title : in String; Flags : in T_Window_Flag := C_Window_Flag_None) return Boolean is
	begin

		return Begin_Window_Internal( Title, Flags, null );

	end Begin_Window;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window(Title : in String; Flags : in T_Window_Flag := C_Window_Flag_None; Is_Open : out Boolean) return Boolean is

		Is_Visible : Boolean;
		Open_Internal : aliased T_Bool := T_Bool( true );

	begin

		Is_Visible := Begin_Window_Internal( Title, Flags, Open_Internal'Access );

		Is_Open := Boolean( Open_Internal );

		return Is_Visible;

	end Begin_Window;

	------------------------------------------------------------------------------------------------------------------------
	procedure End_Window is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

		Dear_ImGui.API.igEnd;

		G_Window_Count := G_Window_Count - 1;

	end End_Window;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Button(Label : in String; State : out Boolean) is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

		Buffer_String( Label );

		State := Boolean( Dear_ImGui.API.igButton( G_Buffer_Ptr ) );

	end Add_Button;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Checkbox(Label : in String; State : in out Boolean) is

		Result      : T_Bool;
		Local_State : aliased T_Bool;

	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

		Local_State := T_Bool( State );
		Buffer_String( Label );

		Result := Dear_ImGui.API.igCheckbox( G_Buffer_Ptr, Local_State'Access );

		State := Boolean( Local_State );

	end Add_Checkbox;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit3(Label : in String; Colour : in out T_Colour3; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None) is

		Result : Boolean;

	begin

		Result := Add_Colour_Edit3( Label, colour, Flags );

	end Add_Colour_Edit3;

	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit3(Label : in String; Colour : in out T_Colour3; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None) return Boolean is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

		Buffer_String( Label );

		return Boolean( Dear_ImGui.API.igColorEdit3(
			label => G_Buffer_Ptr,
			col   => Colour.R'Access,
			flags => Dear_ImGui.API.ImGuiColorEditFlags( Flags )
		) );

	end Add_Colour_Edit3;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit4(Label : in String; Colour : in out T_Colour4; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None) is

		Result : Boolean;

	begin

		Result := Add_Colour_Edit4( Label, colour, Flags );

	end Add_Colour_Edit4;

	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit4(Label : in String; Colour : in out T_Colour4; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None) return Boolean is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

		Buffer_String( Label );

		return Boolean( Dear_ImGui.API.igColorEdit4(
			label => G_Buffer_Ptr,
			col   => Colour.R'Access,
			flags => Dear_ImGui.API.ImGuiColorEditFlags( Flags )
		) );

	end Add_Colour_Edit4;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Slider(Label : in String; Value : not null access Float; Min, Max : in Float; Flags : in T_Slider_Flag := C_Slider_Flag_None) is

		Result : Boolean;

	begin

		Result := Add_Slider( Label, Value, Min, Max, Flags );

	end Add_Slider;

	------------------------------------------------------------------------------------------------------------------------
	function Add_Slider(Label : in String; Value : not null access Float; Min, Max : in Float; Flags : in T_Slider_Flag := C_Slider_Flag_None) return Boolean is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

		Buffer_String( Label );

		return Boolean( Dear_ImGui.API.igSliderFloat(
			label  => G_Buffer_Ptr,
			v      => Value,
			v_min  => Min,
			v_max  => Max,
			format => C_Null_Ptr, -- Default format
			flags  => Dear_ImGui.API.ImGuiSliderFlags( Flags )
		) );

	end Add_Slider;


	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Text(Text : in String) is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

		Buffer_String( Text );

		Dear_ImGui.API.igText( G_Buffer_Ptr );

	end Add_Text;



-- PRIVATE



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	procedure Buffer_String( Text : in String ) is
	begin

		Interfaces.C.To_C(
			Item       => Text,
			Target     => G_Buffer,
			Count      => G_Buffer_Last,
			Append_Nul => true
		);

		if G_Buffer_Last >= C_Max_Buffer_Length then
			raise EX_STRING_LENGTH_EXCEEDED;
		end if;

	end Buffer_String;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window_Internal(Title : in String; Flags : in T_Window_Flag; Open_Internal : access T_Bool) return Boolean is

		Is_Visible : aliased T_Bool;

	begin

		G_Title_Ptr := P_C_Str.New_String( Title );

		Is_Visible := Dear_ImGui.API.igBegin(
			name   => G_Title_Ptr,
			p_open => Open_Internal,
			flags  => Dear_ImGui.API.ImGuiWindowFlags( Flags )
		);

		P_C_Str.Free( G_Title_Ptr );

		G_Window_Count := G_Window_Count + 1;

		return Boolean( Is_Visible );

	end Begin_Window_Internal;



end Dear_ImGui.Drawing;
