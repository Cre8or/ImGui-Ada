pragma License (Modified_GPL);	-- Consider contributing! :)





with Interfaces.C.Extensions;
with Interfaces.C.Strings;



pragma Elaborate_All (Interfaces.C.Extensions);
pragma Elaborate_All (Interfaces.C.Strings);





generic

	type T_Float is digits <>;

package Dear_ImGui is



	-- Pragmas
	pragma Compile_Time_Error (
		T_Float'Size /= 32,
		"Actual for T_Float must have 32 bits"
	);



	-- Exceptions
	EX_CONTEXT_ALREADY_CREATED : exception;
	EX_NO_CONTEXT_FOUND        : exception;



	-- Types
	subtype T_Integer  is Interfaces.C.int;
	subtype T_Natural  is T_Integer range 0 .. T_Integer'Last;
	subtype T_Positive is T_Natural range 1 .. T_Natural'Last;

	subtype T_Unsigned is Interfaces.C.unsigned;
	subtype T_Bool     is Interfaces.C.Extensions.bool;
	subtype T_Double   is Interfaces.C.double;



private



	-- Types
	subtype T_Chars_Ptr is Interfaces.C.Strings.chars_ptr;



	-- Constants
	C_Null_Ptr : constant T_Chars_Ptr := Interfaces.C.Strings.Null_Ptr;



end Dear_ImGui;
