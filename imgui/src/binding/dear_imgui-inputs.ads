pragma License (Modified_GPL);





with Dear_ImGui.API;
with Dear_ImGui.Types;


generic

	with package P_API   is new Dear_ImGui.API;
	with package P_Types is new Dear_ImGui.Types;

package Dear_ImGui.Inputs is



	-- Use clauses
	use P_Types;



	-- Types
	type T_ImGuiIO is tagged record
		m_IO : access P_API.ImGuiIO;
	end record;

		-- Primitives
		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Set_Config_Flags (
			This  : in out T_ImGuiIO;
			Flags : in     T_Config_Flag
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Set_Backend_Flags (
			This  : in out T_ImGuiIO;
			Flags : in     T_Backend_Flag
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Set_Display_Size (
			This          : in out T_ImGuiIO;
			Width, Height : in     T_Float
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Key_Event (
			This    : in out T_ImGuiIO;
			Key     : in     T_ImGuiKey;
			Pressed : in     Boolean
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Mouse_Pos_Event (
			This : in out T_ImGuiIO;
			X, Y : in     T_Float
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Mouse_Button_Event (
			This    : in out T_ImGuiIO;
			Button  : in     T_ImGuiButton;
			Pressed : in     Boolean
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Mouse_Wheel_Event (
			This : in out T_ImGuiIO;
			X, Y : in     T_Float
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Focus_Event (
			This    : in out T_ImGuiIO;
			Focused : in     Boolean
		)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Wide_Wide_Character_Event (
			This : in out T_ImGuiIO;
			Char : in     Wide_Wide_Character
		);



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Returns a record that contains the ImGuiIO struct of the currently active context.
	------------------------------------------------------------------------------------------------------------------------
	function Get_IO return T_ImGuiIO;



private



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	procedure API_AddKeyEvent (
		self : access P_API.ImGuiIO;
		key  : in T_ImGuiKey;
		down : in T_Bool
	) with Import, Convention => C, External_Name => "ImGuiIO_AddKeyEvent";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_AddMousePosEvent (
		self : access P_API.ImGuiIO;
		x, y : in T_Float
	) with Import, Convention => C, External_Name => "ImGuiIO_AddMousePosEvent";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_AddMouseButtonEvent (
		self   : access P_API.ImGuiIO;
		button : in T_ImGuiButton;
		state  : in T_Bool
	) with Import, Convention => C, External_Name => "ImGuiIO_AddMouseButtonEvent";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_AddMouseWheelEvent (
		self : access P_API.ImGuiIO;
		wh_x : in T_Float;
		wh_y : in T_Float
	) with Import, Convention => C, External_Name => "ImGuiIO_AddMouseWheelEvent";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_AddFocusEvent (
		self    : access P_API.ImGuiIO;
		focused : in T_Bool
	) with Import, Convention => C, External_Name => "ImGuiIO_AddFocusEvent";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_AddInputCharacter (
		self : access P_API.ImGuiIO;
		char : in T_Unsigned
	) with Import, Convention => C, External_Name => "ImGuiIO_AddInputCharacter";

	------------------------------------------------------------------------------------------------------------------------
	function API_GetIO return access P_API.ImGuiIO
	with Import, Convention => C, External_Name => "igGetIO";



end Dear_ImGui.Inputs;
