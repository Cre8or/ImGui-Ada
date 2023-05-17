pragma License (Modified_GPL);





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

		API_Render;

	end Render;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window (
		Title : in String;
		Flags : in T_Window_Flag := C_Window_Flag_None
	) return Boolean is
	begin

		return Begin_Window_Internal (Title, Flags, null);

	end Begin_Window;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window (
		Title   : in     String;
		Flags   : in     T_Window_Flag := C_Window_Flag_None;
		Is_Open :    out Boolean
	) return Boolean is

		Is_Visible    : Boolean;
		Open_Internal : aliased T_Bool := T_Bool (true);

	begin

		Is_Visible := Begin_Window_Internal (Title, Flags, Open_Internal'Access);
		Is_Open    := Boolean (Open_Internal);

		return Is_Visible;

	end Begin_Window;

	------------------------------------------------------------------------------------------------------------------------
	procedure End_Window is
	begin

		Enforce_Active_Window;

		API_End;

		G_Window_Count := G_Window_Count - 1;

	end End_Window;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Button (
		Label : in     String;
		State :    out Boolean
	) is
	begin

		Add_Button (Label, (0.0, 0.0), State);

	end Add_Button;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Button (
		Label : in     String;
		Size  : in     P_Types.T_Vector2;
		State :    out Boolean
	) is
	begin

		Enforce_Active_Window;

		Buffer_String (Label);

		State := Boolean (API_Button (G_Buffer_Ptr, Size));

	end Add_Button;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Checkbox (
		Label : in     String;
		State : in out Boolean
	) is

		Result      : T_Bool;
		Local_State : aliased T_Bool := T_Bool (State);

	begin

		Enforce_Active_Window;

		Buffer_String (Label);

		Result := API_Checkbox (G_Buffer_Ptr, Local_State'Access);

		State := Boolean (Local_State);

	end Add_Checkbox;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) is

		Result : Boolean;

	begin

		Result := Add_Colour_Edit_RGB (Label, colour, Flags);

	end Add_Colour_Edit_RGB;

	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean is
	begin

		Enforce_Active_Window;

		Buffer_String (Label);

		return Boolean (API_ColorEdit3 (G_Buffer_Ptr, Colour, Flags));

	end Add_Colour_Edit_RGB;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) is

		Result : Boolean;

	begin

		Result := Add_Colour_Edit_RGBA (Label, colour, Flags);

	end Add_Colour_Edit_RGBA;

	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean is
	begin

		Enforce_Active_Window;

		Buffer_String (Label);

		return Boolean (API_ColorEdit4 (G_Buffer_Ptr, Colour, Flags));

	end Add_Colour_Edit_RGBA;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Slider (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	) is

		Result : Boolean;

	begin

		Result := Add_Slider (Label, Value, Min, Max, Flags);

	end Add_Slider;

	------------------------------------------------------------------------------------------------------------------------
	function Add_Slider (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	) return Boolean is
	begin

		Enforce_Active_Window;

		Buffer_String (Label);

		return Boolean (API_SliderFloat (
			label  => G_Buffer_Ptr,
			v      => Value,
			v_min  => Min,
			v_max  => Max,
			format => C_Null_Ptr, -- Default format
			flags  => Flags
		));

	end Add_Slider;

	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Text (Text : in String) is
	begin

		Enforce_Active_Window;

		Buffer_String (Text);

		API_Text (G_Buffer_Ptr);

	end Add_Text;

	------------------------------------------------------------------------------------------------------------------------
	procedure Set_Item_Width (Width : in T_Float) is
	begin

		Enforce_Active_Window;

		API_PushItemWidth (Width);

	end Set_Item_Width;



-- PRIVATE



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	procedure Buffer_String (Text : in String) is
	begin

		Interfaces.C.To_C (
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
	function Begin_Window_Internal (
		Title         : in String;
		Flags         : in T_Window_Flag;
		Open_Internal : access T_Bool
	) return Boolean is
	begin

		G_Title_Ptr := P_C_Str.New_String (Title);

		return Result : Boolean do
			Result := Boolean (API_Begin (G_Title_Ptr, Open_Internal, Flags));

			P_C_Str.Free (G_Title_Ptr);

			G_Window_Count := G_Window_Count + 1;
		end return;

	end Begin_Window_Internal;

	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Window is
	begin

		if G_Window_Count = 0 then
			raise EX_NO_ACTIVE_WINDOW;
		end if;

	end Enforce_Active_Window;



end Dear_ImGui.Drawing;
