pragma License( Modified_GPL );





with Ada.Unchecked_Conversion;



pragma Elaborate_All( Ada.Unchecked_Conversion );





package body Dear_ImGui.Backend_Glfw is



	-- Use clauses
	use type T_Bool;



	-- Instantiations
	function Convert is new Ada.Unchecked_Conversion( GLFWwindow, T_Glfw_Window );



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	procedure Init_For_OpenGL(Window : in Glfw.Windows.Window'Class; install_callbacks : in Boolean) is
	begin

		if not Init_For_OpenGL_Raw( Convert(GLFWwindow( Window )).Handle, T_Bool( install_callbacks ) ) then
			raise EX_INITIALISATION_ERROR;
		end if;

	end Init_For_OpenGL;

	------------------------------------------------------------------------------------------------------------------------
	procedure Init_For_Vulkan(Window : in Glfw.Windows.Window'Class; install_callbacks : in Boolean) is
	begin

		if not Init_For_Vulkan_Raw( Convert(GLFWwindow( Window )).Handle, T_Bool( install_callbacks ) ) then
			raise EX_INITIALISATION_ERROR;
		end if;

	end Init_For_Vulkan;

	------------------------------------------------------------------------------------------------------------------------
	procedure Init_For_Other(Window : in Glfw.Windows.Window'Class; install_callbacks : in Boolean) is
	begin

		if not Init_For_Other_Raw( Convert(GLFWwindow( Window )).Handle, T_Bool( install_callbacks ) ) then
			raise EX_INITIALISATION_ERROR;
		end if;

	end Init_For_Other;



end Dear_ImGui.Backend_Glfw;
