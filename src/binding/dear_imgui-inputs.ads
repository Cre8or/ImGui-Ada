pragma License( Modified_GPL );





with Dear_ImGui.API;
with Dear_ImGui.Types;



pragma Elaborate_All( Dear_ImGui.API );
pragma Elaborate_All( Dear_ImGui.Types );





package Dear_ImGui.Inputs is



	-- Types
	type T_ImGuiIO is tagged record
		m_IO : access Dear_ImGui.API.ImGuiIO;
	end record;

		-- Primitives
		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Set_Config_Flags(This : in out T_ImGuiIO; Flags : in Dear_ImGui.Types.T_Config_Flag)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Set_Backend_Flags(This : in out T_ImGuiIO; Flags : in Dear_ImGui.Types.T_Backend_Flag)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Set_Display_Size(This : in out T_ImGuiIO; Width, Height : in Float)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Key_Event(This : in out T_ImGuiIO; Key : in Dear_ImGui.Types.T_ImGuiKey; Pressed : in Boolean)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Mouse_Pos_Event(This : in out T_ImGuiIO; X, Y : in Float)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Mouse_Button_Event(This : in out T_ImGuiIO; Button : in Dear_ImGui.Types.T_ImGuiButton; Pressed : in Boolean)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Mouse_Wheel_Event(This : in out T_ImGuiIO; X, Y : in Float)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Focus_Event(This : in out T_ImGuiIO; Focused : in Boolean)
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		not overriding procedure Add_Wide_Wide_Character_Event(This : in out T_ImGuiIO; Char : in Wide_Wide_Character);



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Returns a record that contains the ImGuiIO struct of the currently active context.
	------------------------------------------------------------------------------------------------------------------------
	function Get_IO return T_ImGuiIO;



private



	-- Types



end Dear_ImGui.Inputs;
