pragma License( Modified_GPL );





private with Ada.Finalization;
private with System;

with Glfw.Windows;
with Glfw.Monitors;



pragma Elaborate_All( Ada.Finalization );
pragma Elaborate_All( System );

pragma Elaborate_All( Glfw.Windows );
pragma Elaborate_All( Glfw.Monitors );





package Dear_ImGui.Backend_Glfw is



	-- Execptions
	EX_INITIALISATION_ERROR : exception;



	-- Types
	subtype GLFWwindow is Glfw.Windows.Window;
	subtype GLFWmonitor is Glfw.Monitors.Monitor;



	-- Specifications
	procedure Init_For_OpenGL(Window : in GLFWwindow'Class; install_callbacks : in Boolean)
	with Inline;

	procedure Init_For_Vulkan(Window : in GLFWwindow'Class; install_callbacks : in Boolean)
	with Inline;

	procedure Init_For_Other(Window : in GLFWwindow'Class; install_callbacks : in Boolean)
	with Inline;

	procedure Shutdown
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z23ImGui_ImplGlfw_Shutdownv";

	procedure Begin_Frame
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z23ImGui_ImplGlfw_NewFramev";

	procedure Install_Callbacks (window : access GLFWwindow)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z31ImGui_ImplGlfw_InstallCallbacksP10GLFWwindow";

	procedure Restore_Callbacks (window : access GLFWwindow)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z31ImGui_ImplGlfw_RestoreCallbacksP10GLFWwindow";

	-- GLFW callbacks (individual callbacks to call if you didn't install callbacks)
	-- Since 1.84
	procedure Window_Focus_Callback (window : access GLFWwindow; focused : T_Integer)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z34ImGui_ImplGlfw_WindowFocusCallbackP10GLFWwindowi";

	-- Since 1.84
	procedure Cursor_Enter_Callback (window : access GLFWwindow; entered : T_Integer)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z34ImGui_ImplGlfw_CursorEnterCallbackP10GLFWwindowi";

	-- Since 1.87
	procedure Cursor_Pos_Callback
	(window : access GLFWwindow;
  x : T_Double;
  y : T_Double)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z32ImGui_ImplGlfw_CursorPosCallbackP10GLFWwindowdd";

	procedure Mouse_Button_Callback
	(window : access GLFWwindow;
  button : T_Integer;
  action : T_Integer;
  mods : T_Integer)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z34ImGui_ImplGlfw_MouseButtonCallbackP10GLFWwindowiii";

	procedure Scroll_Callback
	(window : access GLFWwindow;
  xoffset : T_Double;
  yoffset : T_Double)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z29ImGui_ImplGlfw_ScrollCallbackP10GLFWwindowdd";

	procedure Key_Callback
	(window : access GLFWwindow;
  key : T_Integer;
  scancode : T_Integer;
  action : T_Integer;
  mods : T_Integer)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z26ImGui_ImplGlfw_KeyCallbackP10GLFWwindowiiii";

	procedure Char_Callback (window : access GLFWwindow; c : T_Unsigned)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z27ImGui_ImplGlfw_CharCallbackP10GLFWwindowj";

	procedure Monitor_Callback (monitor : access GLFWmonitor; event : T_Integer)
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z30ImGui_ImplGlfw_MonitorCallbackP11GLFWmonitori";



private



	-- Types
	type T_Glfw_Window is new Ada.Finalization.Controlled with record -- Copied from Glfw.Windows
		Handle : System.Address := System.Null_Address;
	end record;



	-- Specifications
	function Init_For_OpenGL_Raw (window : in System.Address; install_callbacks : T_Bool) return T_Bool
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z28ImGui_ImplGlfw_InitForOpenGLP10GLFWwindowb";

	function Init_For_Vulkan_Raw (window : in System.Address; install_callbacks : T_Bool) return T_Bool
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z28ImGui_ImplGlfw_InitForVulkanP10GLFWwindowb";

	function Init_For_Other_Raw (window : in System.Address; install_callbacks : T_Bool) return T_Bool
	with Import   => True,
	Convention    => CPP,
	External_Name => "_Z27ImGui_ImplGlfw_InitForOtherP10GLFWwindowb";



end Dear_ImGui.Backend_Glfw;
