pragma License (Modified_GPL);





package body Dear_ImGui.Inputs is



	-- Use clause
	use P_Types;



	-- Primitives
	------------------------------------------------------------------------------------------------------------------------
	-- T_ImGuiIO
	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Set_Config_Flags (
		This  : in out T_ImGuiIO;
		Flags : in     T_Config_Flag
	) is
	begin

		This.m_IO.ConfigFlags := Flags;

	end Set_Config_Flags;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Set_Backend_Flags (
		This  : in out T_ImGuiIO;
		Flags : in     T_Backend_Flag
	) is
	begin

		This.m_IO.BackendFlags := Flags;

	end Set_Backend_Flags;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Set_Display_Size (
		This          : in out T_ImGuiIO;
		Width, Height : in     T_Float
	) is
	begin

		This.m_IO.DisplaySize := (float (Width), float (Height));

	end Set_Display_Size;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Add_Key_Event (
		This    : in out T_ImGuiIO;
		Key     : in     T_ImGuiKey;
		Pressed : in     Boolean
	) is
	begin

		API_AddKeyEvent (This.m_IO, Key, T_Bool (Pressed));

	end Add_Key_Event;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Add_Mouse_Pos_Event (
		This : in out T_ImGuiIO;
		X, Y : in     T_Float
	) is
	begin

		API_AddMousePosEvent (This.m_IO, X, Y);

	end Add_Mouse_Pos_Event;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Add_Mouse_Button_Event (
		This    : in out T_ImGuiIO;
		Button  : in     T_ImGuiButton;
		Pressed : in     Boolean
	) is
	begin

		API_AddMouseButtonEvent (This.m_IO, Button, T_Bool (Pressed));

	end Add_Mouse_Button_event;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Add_Mouse_Wheel_Event (
		This : in out T_ImGuiIO;
		X, Y : in     T_Float
	) is
	begin

		API_AddMouseWheelEvent (This.m_IO, X, Y);

	end Add_Mouse_Wheel_Event;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Add_Focus_Event (
		This    : in out T_ImGuiIO;
		Focused : in     Boolean
	) is
	begin

		API_AddFocusEvent (This.m_IO, T_Bool (Focused));

	end Add_Focus_Event;

	------------------------------------------------------------------------------------------------------------------------
	not overriding procedure Add_Wide_Wide_Character_Event (
		This : in out T_ImGuiIO;
		Char : in     Wide_Wide_Character
	) is

		Char_Unsigned : T_Unsigned
		with Address => Char'Address;

	begin

		API_AddInputCharacter (This.m_IO, Char_Unsigned);

	end Add_Wide_Wide_Character_Event;



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	function Get_IO return T_ImGuiIO is
	begin

		return (
			m_IO => API_GetIO
		);

	end Get_IO;



end Dear_ImGui.Inputs;
