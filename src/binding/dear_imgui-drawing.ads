pragma License (Modified_GPL);





private with Ada.Finalization;
private with Ada.Unchecked_Deallocation;

        with Dear_ImGui.API;
        with Dear_ImGui.Types;



pragma Elaborate_All (Ada.Finalization);
pragma Elaborate_All (Ada.Unchecked_Deallocation);

pragma Elaborate (Dear_ImGui.API);
pragma Elaborate (Dear_ImGui.Types);





generic

	with package P_API   is new Dear_ImGui.API;
	with package P_Types is new Dear_ImGui.Types;

package Dear_ImGui.Drawing is



	-- Use clauses
	use P_Types;



	-- Exceptions
	EX_NO_ACTIVE_WINDOW       : exception;
	EX_WINDOW_STILL_ACTIVE    : exception;
	EX_STRING_LENGTH_EXCEEDED : exception;



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Begins a new frame. ImGui subprograms may be called afterwards for the duration of the frame.
	-- Analogous to ImGui::NewFrame.
	------------------------------------------------------------------------------------------------------------------------
	procedure Begin_Frame;

	------------------------------------------------------------------------------------------------------------------------
	-- Renders the contents of the previous frame.
	-- Analogous to ImGui::Render.
	------------------------------------------------------------------------------------------------------------------------
	procedure Render;

	------------------------------------------------------------------------------------------------------------------------
	-- Returns the current draw data to be displayed. Should be called after Render.
	-- Analogous to ImGui::GetDrawData.
	------------------------------------------------------------------------------------------------------------------------
	function Get_Draw_Data return access P_API.ImDrawData;

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
	-- NOTE: Must follow a call to Begin_Window!
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Window;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a button to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Button (
		Label : in     String;
		State :    out Boolean
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a button to the active window with the specified size.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Button (
		Label : in     String;
		Size  : in     T_Vector2;
		State :    out Boolean
	);

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a checkbox to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Checkbox (
		Label : in     String;
		State : in out Boolean
	);

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 3-component colour editor/picker to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 3-component colour editor/picker to the active window.
	-- Returns true if the colour has changed, otherwise false.
	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 4-component colour editor/picker to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 4-component colour editor/picker to the active window.
	-- Returns true if the colour has changed, otherwise false.
	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a single-component float slider to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Slider (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a single-component float slider to the active window.
	-- Returns true if the value has changed, otherwise false.
	------------------------------------------------------------------------------------------------------------------------
	function Add_Slider (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a text to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Text (Text : in String);

	------------------------------------------------------------------------------------------------------------------------
	-- Sets the width of any subsequent, common large "item+label" widgets. The width is measured in pixels.
	-- Behaviour depends on the sign of the Width parameter:
	-- >  0.0: items will be <Width> pixels wide;
	-- <= 0.0: items will be aligned <Width> pixels to the right of the window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Set_Item_Width (Width : in T_Float)
	with Inline;



private



	-- Use clauses
	use type Interfaces.C.size_t;



	-- Constants
	C_Max_Buffer_Length : constant Interfaces.C.size_t := 2 ** 16;  -- Arbitrary



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Buffers the given string to the internal chars_array. Removes the need to create a new local array for every ImGui
	-- API call, so long as the maximum string length is not exceeded (see C_Max_Buffer_Length).
	------------------------------------------------------------------------------------------------------------------------
	procedure Buffer_String (Text : in String);

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window_Internal (
		Title         : in String;
		Flags         : in T_Window_Flag;
		Open_Internal : access T_Bool
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Checks if a window is currently open. If no window is open, the exception EX_NO_ACTIVE_WINDOW is raised.
	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Window
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	procedure API_NewFrame
	with Import, Convention => C, External_Name => "igNewFrame";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_Render
	with Import, Convention => C, External_Name => "igRender";

	------------------------------------------------------------------------------------------------------------------------
	function API_GetDrawData return access P_API.ImDrawData
	with Import, Convention => C, External_Name => "igGetDrawData";

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
	function API_Button (
		label : in T_Chars_Ptr;
		size  : in T_Vector2 := (0.0, 0.0)
	) return T_Bool
	with Import, Convention => C, External_Name => "igButton";

	------------------------------------------------------------------------------------------------------------------------
	function API_Checkbox (
		label : in T_Chars_Ptr;
		value : access T_Bool
	) return T_Bool
	with Import, Convention => C, External_Name => "igCheckbox";

	------------------------------------------------------------------------------------------------------------------------
	function API_ColorEdit3 (
		label : in     T_Chars_Ptr;
		col   : in out T_Colour_RGB;
		flags : in     T_ColourEdit_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igColorEdit3";

	------------------------------------------------------------------------------------------------------------------------
	function API_ColorEdit4 (
		label : in     T_Chars_Ptr;
		col   : in out T_Colour_RGBA;
		flags : in     T_ColourEdit_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igColorEdit4";

	------------------------------------------------------------------------------------------------------------------------
	function API_SliderFloat (
		label  : in     T_Chars_Ptr;
		v      : in out T_Float;
		v_min  : in     T_Float;
		v_max  : in     T_Float;
		format : in     T_Chars_Ptr;
		flags  : in     T_Slider_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igSliderFloat";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_Text (fmt : in T_Chars_Ptr)
	with Import, Convention => C, External_Name => "igText";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_PushItemWidth (item_width : in T_Float)
	with Import, Convention => C, External_Name => "igPushItemWidth";



	-- Renames
	package P_C_Str renames Interfaces.C.Strings;

	procedure Begin_Frame renames API_NewFrame;
	function Get_Draw_Data return access P_API.ImDrawData renames API_GetDrawData;



	-- Variables
	G_Title_Ptr    : T_Chars_Ptr := C_Null_Ptr;
	G_Window_Count : Natural     := 0;

	G_Buffer      : aliased Interfaces.C.char_array := Interfaces.C.char_array'(1 .. C_Max_Buffer_Length => Interfaces.C.char'First);
	G_Buffer_Ptr  : T_Chars_Ptr                     := P_C_Str.To_Chars_Ptr (G_Buffer'Unchecked_Access);
	G_Buffer_Last : Interfaces.C.size_t;



end Dear_ImGui.Drawing;
