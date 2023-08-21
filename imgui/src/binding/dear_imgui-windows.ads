pragma License (Modified_GPL);





with Dear_ImGui.Types;



generic

	with package P_Types is new Dear_ImGui.Types;

package Dear_ImGui.Windows is



	-- Use clauses
	use P_Types;



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Creates a window using the given flags (analogous to ImGui::Begin).
	-- Returns true if the window is shown and visible, otherwise false (e.g. if the window is collapsed or fully clipped).
	-- Use this to early out and omit submitting additional draw commands to the window.
	-- NOTE: Must be followed by a call to End_Window before it may be used again!
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window (
		Title : in String;
		Flags : in T_Window_Flag := C_Window_Flag_None
	) return Boolean
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Creates a window using the given flags (analogous to ImGui::Begin).
	-- Returns true if the window is shown and visible, otherwise false (e.g. if the window is collapsed or fully clipped).
	-- Use this to early out and omit submitting additional draw commands to the window.
	-- Additionally, the window will show a closing widget in the upper-right corner, which, when clicked, will set Is_Open
	-- to false.
	-- NOTE: Must be followed by a call to End_Window before it may be used again!
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window (
		Title   : in     String;
		Flags   : in     T_Window_Flag := C_Window_Flag_None;
		Is_Open :    out Boolean
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Ends the active window; signals that its handling is finished (analogous to ImGui::End).
	-- Must follow a call to Begin_Window.
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Window;

	------------------------------------------------------------------------------------------------------------------------
	-- Sets the position of the next window. Must be called before Begin_Window.
	-- The X and Y components are measured in pixels.
	-- The pivot components are measured as a fraction of the window's width and height (0.0 .. 1.0), where 0.0 represents
	-- the top/left corner.
	------------------------------------------------------------------------------------------------------------------------
	procedure Set_Next_Window_Position (
		X         : in T_Float;
		Y         : in T_Float;
		Condition : in T_Condition  := E_Once;
		Pivot_X   : in T_Float_Norm := 0.0;
		Pivot_Y   : in T_Float_Norm := 0.0
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Sets the size of the next window. Must be called before Begin_Window.
	-- The width and height are measured in pixels.
	------------------------------------------------------------------------------------------------------------------------
	procedure Set_Next_Window_Size (
		Width     : in T_Float;
		Height    : in T_Float;
		Condition : in T_Condition := E_Once
	) with Inline;



private



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window_Internal (
		Title         : in String;
		Flags         : in T_Window_Flag;
		Open_Internal : access T_Bool
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	function API_Begin (
		name   : in T_Chars_Ptr;
		p_open : access T_Bool;
		flags  : in T_Window_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igBegin";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_End
	with Import, Convention => C, External_Name => "igEnd";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_SetNextWindowPos (
		pos   : in T_Vector2;
		cond  : in T_Condition;
		pivot : in T_Vector2
	) with Import, Convention => C, External_Name => "igSetNextWindowPos";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_SetNextWindowSize (
		size : in T_Vector2;
		cond : in T_Condition
	) with Import, Convention => C, External_Name => "igSetNextWindowSize";



end Dear_ImGui.Windows;
