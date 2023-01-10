pragma License( Modified_GPL );





limited with Dear_ImGui.API;



pragma Elaborate_All( Dear_ImGui.API );





package Dear_ImGui.Backend_OpenGL3 is



	-- Execptions
	EX_INITIALISATION_ERROR : exception;



	-- Specifications
	procedure Init;

	procedure Init(GLSL_Version : in String);

	procedure Shutdown
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z26ImGui_ImplOpenGL3_Shutdownv";

	procedure Begin_Frame
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z26ImGui_ImplOpenGL3_NewFramev";

	procedure Render_Draw_Data (draw_data : access Dear_ImGui.API.ImDrawData)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z32ImGui_ImplOpenGL3_RenderDrawDataP10ImDrawData";

	-- (Optional) Called by Init/NewFrame/Shutdown
	function Create_Fonts_Texture return T_Bool
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z36ImGui_ImplOpenGL3_CreateFontsTexturev";

	procedure Destroy_Fonts_Texture
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z37ImGui_ImplOpenGL3_DestroyFontsTexturev";

	function Create_Device_Objects return T_Bool
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z37ImGui_ImplOpenGL3_CreateDeviceObjectsv";

	procedure Destroy_Device_Objects
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z38ImGui_ImplOpenGL3_DestroyDeviceObjectsv";



private



   -- Constants
	C_Default_GLSL_Version : constant Interfaces.C.Strings.chars_ptr := Interfaces.C.Strings.Null_Ptr;



   -- Specifications
  	function Init_Raw (glsl_version : T_Chars_Ptr := C_Default_GLSL_Version) return T_Bool
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z22ImGui_ImplOpenGL3_InitPKc";



end Dear_ImGui.Backend_OpenGL3;
