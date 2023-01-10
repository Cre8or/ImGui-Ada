pragma License( Modified_GPL );





private with Ada.Finalization;
private with Ada.Unchecked_Deallocation;
private with Interfaces.C.Strings;

private with Dear_ImGui.API;
with Dear_ImGui.Context;
with Dear_ImGui.Types;



pragma Elaborate_All( Ada.Finalization );
pragma Elaborate_All( Ada.Unchecked_Deallocation );
pragma Elaborate_All( Interfaces.C.Strings );

pragma Elaborate( Dear_ImGui.API );
pragma Elaborate( Dear_ImGui.Context );
pragma Elaborate( Dear_ImGui.Types );





package Dear_ImGui.Drawing is



	-- Use clauses
	use Dear_ImGui.Types;



	-- Exceptions
	EX_NO_ACTIVE_WINDOW        : exception;
	EX_WINDOW_STILL_ACTIVE     : exception;
	EX_STRING_LENGTH_EXCEEDED  : exception;



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
	-- Creates a window using the given flags (analogous to ImGui::Begin).
	-- Returns true if the window is shown and visible, otherwise false (e.g. if the window is collapsed or fully clipped).
	-- Use this to early out and omit submitting additional draw commands to the window.
	-- NOTE: Must be followed by a call to End_Window before it may be used again!
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window(Title : in String; Flags : in T_Window_Flag := C_Window_Flag_None) return Boolean
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Creates a window using the given flags (analogous to ImGui::Begin).
	-- NOTE: Must be followed by a call to End_Window before it may be used again!
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window(Title : in String; Flags : in T_Window_Flag := C_Window_Flag_None; Is_Open : out Boolean) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Ends the active window; signals that its handling is finished (analogous to ImGui::End).
	-- NOTE: Must follow a call to Begin_Window!
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Window;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a button to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Button(Label : in String; State : out Boolean);

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a checkbox to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Checkbox(Label : in String; State : in out Boolean);

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 3-component colour editor/picker to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit3(Label : in String; Colour : in out T_Colour3; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 3-component colour editor/picker to the active window.
	-- Returns true if the colour has changed, otherwise false.
	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit3(Label : in String; Colour : in out T_Colour3; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 4-component colour editor/picker to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Colour_Edit4(Label : in String; Colour : in out T_Colour4; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a 4-component colour editor/picker to the active window.
	-- Returns true if the colour has changed, otherwise false.
	------------------------------------------------------------------------------------------------------------------------
	function Add_Colour_Edit4(Label : in String; Colour : in out T_Colour4; Flags : in T_ColourEdit_Flag := C_ColourEdit_Flag_None) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a single-component float slider to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Slider(Label : in String; Value : not null access Float; Min, Max : in Float; Flags : in T_Slider_Flag := C_Slider_Flag_None)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a single-component float slider to the active window.
	-- Returns true if the value has changed, otherwise false.
	------------------------------------------------------------------------------------------------------------------------
	function Add_Slider(Label : in String; Value : not null access Float; Min, Max : in Float; Flags : in T_Slider_Flag := C_Slider_Flag_None) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a text to the active window.
	------------------------------------------------------------------------------------------------------------------------
	procedure Add_Text(Text : in String);




private



	-- Use clauses
	use type Interfaces.C.size_t;



	-- Renames
	package P_C_Str renames Interfaces.C.Strings;

	procedure Begin_Frame renames Dear_ImGui.API.igNewFrame;



	-- Constants
	C_Max_Buffer_Length : constant Interfaces.C.size_t := 2 ** 16;  -- Arbitrary



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Buffers the given string to the internal chars_array. Removes the need to create a new local array for every ImGui
	-- API call, so long as the maximum string length is not exceeded (see C_Max_Buffer_Length).
	------------------------------------------------------------------------------------------------------------------------
	procedure Buffer_String( Text : in String );

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Window_Internal(Title : in String; Flags : in T_Window_Flag; Open_Internal : access T_Bool) return Boolean;



	-- Variables
	G_Title_Ptr    : T_Chars_Ptr := C_Null_Ptr;
	G_Window_Count : Natural     := 0;

	G_Buffer      : aliased Interfaces.C.char_array := Interfaces.C.char_array'( 1 .. C_Max_Buffer_Length => Interfaces.C.char'First);
	G_Buffer_Ptr  : Interfaces.C.Strings.chars_ptr  := P_C_Str.To_Chars_Ptr( G_Buffer'Unchecked_Access );
	G_Buffer_Last : Interfaces.C.size_t;



end Dear_ImGui.Drawing;
