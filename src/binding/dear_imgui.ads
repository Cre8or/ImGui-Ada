pragma License( Modified_GPL );	-- Consider contributing! :)





with Interfaces.C.Extensions;
with Interfaces.C.Strings;



pragma Elaborate_All( Interfaces.C.Extensions );
pragma Elaborate_All( Interfaces.C.Strings );





package Dear_ImGui is



	-- Exceptions
	EX_CONTEXT_ALREADY_CREATED : exception;
	EX_NO_CONTEXT_FOUND        : exception;



	-- Types
	subtype T_Integer  is Interfaces.C.int;
	subtype T_Unsigned is Interfaces.C.unsigned;
	subtype T_Bool     is Interfaces.C.Extensions.bool;
	subtype T_Double   is Interfaces.C.double;



private



	-- Types
	subtype T_Chars_Ptr is Interfaces.C.Strings.chars_ptr;



	-- Constants
	C_Null_Ptr : constant T_Chars_Ptr := Interfaces.C.Strings.Null_Ptr;



end Dear_ImGui;
