pragma License (Modified_GPL);	-- Consider contributing! :)





with Interfaces.C.Extensions;
with Interfaces.C.Strings;




generic

	type T_Float is digits <>;

package Dear_ImGui is



	-- Pragmas
	pragma Elaborate_Body; -- Required to initialise the global variables

	pragma Compile_Time_Error (
		T_Float'Size /= 32,
		"Actual for T_Float must have 32 bits"
	);



	-- Exceptions
	EX_BUFFER_COUNT_EXCEEDED  : exception;
	EX_BUFFER_LENGTH_EXCEEDED : exception;

	EX_CONTEXT_ALREADY_CREATED : exception;
	EX_NO_CONTEXT_FOUND        : exception;

	EX_NO_ACTIVE_WINDOW    : exception;
	EX_WINDOW_STILL_ACTIVE : exception;

	EX_NO_ACTIVE_MENU_BAR : exception;

	EX_NO_ACTIVE_TAB_BAR : exception;


	-- Types
	subtype T_Integer  is Interfaces.C.int;
	subtype T_Natural  is T_Integer range 0 .. T_Integer'Last;
	subtype T_Positive is T_Natural range 1 .. T_Natural'Last;

	subtype T_Unsigned is Interfaces.C.unsigned;
	subtype T_Bool     is Interfaces.C.Extensions.bool;
	subtype T_Double   is Interfaces.C.double;

	subtype T_Char     is Interfaces.C.char;



private



	-- Use clauses
	use type Interfaces.C.size_t;



	-- Constants (1 / 2)
	C_Max_Buffer_Count  : constant                     := 4; -- Arbitrary; maximum amount of buffers we may ever need to reference at any given time
	C_Max_Buffer_Length : constant Interfaces.C.size_t := 2 ** 16;  -- Arbitrary



	-- Types
	subtype T_Chars_Ptr is Interfaces.C.Strings.chars_ptr;

	subtype T_Char_Arr is Interfaces.C.char_array;
	subtype T_Char_Arr_Constr is T_Char_Arr (0 .. C_Max_Buffer_Length - 1);



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Buffers the given string into the global buffer at the specified index, and returns the corresponding char pointer.
	-- Removes the need to create a new local array for every ImGui API call, so long as the maximum string length is not
	-- exceeded (see C_Max_Buffer_Length).
	------------------------------------------------------------------------------------------------------------------------
	function Buffer_String (
		Text  : in String;
		Index : in Positive
	) return T_Chars_Ptr;

	------------------------------------------------------------------------------------------------------------------------
	-- Buffers the given string into the global buffer at the specified index.
	-- Identical to its function counterpart, except it doesn't return anything after buffering.
	------------------------------------------------------------------------------------------------------------------------
	procedure Buffer_String (
		Text  : in String;
		Index : in Positive
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Checks if a window is currently open. If no window is open, the exception EX_NO_ACTIVE_WINDOW is raised.
	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Window
	with Inline;



	-- Renames
	package P_C_Str renames Interfaces.C.Strings;



	-- Constants ( 2 / 2)
	C_Null_Ptr : constant T_Chars_Ptr := Interfaces.C.Strings.Null_Ptr;



	-- Variables
	G_Buffers     : array (Positive range 1 .. C_Max_Buffer_Count) of aliased T_Char_Arr_Constr;
	G_Buffers_Ptr : array (G_Buffers'Range) of T_Chars_Ptr;

	G_Window_Count : Natural := 0;



end Dear_ImGui;
