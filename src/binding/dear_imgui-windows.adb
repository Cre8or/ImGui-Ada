pragma License (Modified_GPL);





package body Dear_ImGui.Windows is



	-- Bodies
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
	procedure Set_Next_Window_Position (
		X         : in T_Float;
		Y         : in T_Float;
		Condition : in T_Condition  := E_Once;
		Pivot_X   : in T_Float_Norm := 0.0;
		Pivot_Y   : in T_Float_Norm := 0.0
	) is
	begin

		API_SetNextWindowPos ((X, Y), Condition, (Pivot_X, Pivot_Y));

	end Set_Next_Window_Position;

	------------------------------------------------------------------------------------------------------------------------
	procedure Set_Next_Window_Size (
		Width     : in T_Float;
		Height    : in T_Float;
		Condition : in T_Condition := E_Once
	) is
	begin

		API_SetNextWindowSize ((Width, Height), Condition);

	end Set_Next_Window_Size;



-- PRIVATE



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window_Internal (
		Title         : in String;
		Flags         : in T_Window_Flag;
		Open_Internal : access T_Bool
	) return Boolean is
	begin

		G_Window_Count := G_Window_Count + 1;

		return Boolean (API_Begin (Buffer_String (Title, 1), Open_Internal, Flags));

	end Begin_Window_Internal;



end Dear_ImGui.Windows;
