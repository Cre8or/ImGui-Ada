pragma License( Restricted );





with Ada.Text_IO;
with Interfaces.C.Strings;

with Glfw.Input;
with Glfw.Windows.Context;
with Glfw.Windows.Hints;
with GL.Buffers;
with GL.Types;
with GL.Window;

with Dear_ImGui.API;
with Dear_ImGui.Backend_Glfw;
with Dear_ImGui.Backend_OpenGL3;
with Dear_ImGui.Context;
with Dear_ImGui.Drawing;
with Dear_ImGui.Inputs;
with Dear_ImGui.Types;



pragma Elaborate_All( Ada.Text_IO );
pragma Elaborate_All( Interfaces.C.Strings );

pragma Elaborate_All( Glfw.Input );
pragma Elaborate_All( Glfw.Windows.Context );
pragma Elaborate_All( Glfw.Windows.Hints );
pragma Elaborate_All( GL.Buffers );
pragma Elaborate_All( GL.Types );
pragma Elaborate_All( GL.Window );

pragma Elaborate_All( Dear_ImGui.API );
pragma Elaborate_All( Dear_ImGui.Backend_Glfw );
pragma Elaborate_All( Dear_ImGui.Backend_OpenGL3 );
pragma Elaborate_All( Dear_ImGui.Context );
pragma Elaborate_All( Dear_ImGui.Drawing );
pragma Elaborate_All( Dear_ImGui.Inputs );
pragma Elaborate_All( Dear_ImGui.Types );





procedure Main_ImGui_Test is



	-- Use clauses
	use Ada;



	-- Types
	use type Dear_ImGui.T_Bool;



	-- Variables
	Window : aliased Glfw.Windows.Window;

	Continue       : Boolean := true;
	Is_Open        : Boolean := true;
	Is_Visible     : Boolean;
	Button_Pressed : Boolean := false;
	Checkbox_State : Boolean := false;

	Colour : Dear_ImGui.Types.T_Colour3 := (others => 0.0);
	Ratio  : aliased Float := 0.1;

	-- ImGui stuff
	Context : Dear_ImGui.Context.T_ImGuiContext;
	IO      : Dear_ImGui.Inputs.T_ImGuiIO;

	Window_Width  : Interfaces.C.Int := 640;
	Window_Height : Interfaces.C.Int := 480;



begin



	-- [Glfw] Initialisation
	Glfw.Init;
	Glfw.Windows.Hints.Set_Profile( Glfw.Windows.Context.Core_Profile );
	Glfw.Windows.Hints.Set_Minimum_OpenGL_Version(4, 2);

	Window.Init( Window_Width, Window_Height, "Glfw Window");
	Glfw.Windows.Context.Make_Current( Window'Access );
	Glfw.Windows.Context.Set_Swap_Interval( 1 );

	-- [ImGui] Initialisation
	Dear_ImGui.Context.Initialise( Context );
	IO := Context.Get_IO;

	-- Setup Dear ImGui style
	Dear_ImGui.API.igStyleColorsDark;

	-- Setup Platform/Renderer backends
	Dear_ImGui.Backend_Glfw.Init_For_OpenGL( Window, True );
	Dear_ImGui.Backend_OpenGL3.Init;



   while Continue and not Window.Should_Close loop

		Glfw.Input.Poll_Events;

		-- Begin a new ImGui frame
		Dear_ImGui.Backend_OpenGL3.Begin_Frame;
		Dear_ImGui.Backend_Glfw.Begin_Frame;
		Dear_ImGui.Drawing.Begin_Frame;



		-- Draw a custom window
		if Is_Open then

			Is_Visible := Dear_ImGui.Drawing.Begin_Window( "Pizza poll!", Dear_ImGui.Types.C_Window_Flag_None, Is_Open );

			if Is_Visible then
				Dear_ImGui.Drawing.Add_Button( "I don't like pizza.", Button_Pressed );

				if Button_Pressed then
					Text_IO.Put_Line( "Button pressed, closing window...");
					Is_Open := false;
				end if;

				Dear_ImGui.Drawing.Add_Checkbox( "Pineapple on pizza?", Checkbox_State );

				if Checkbox_State then
					Dear_ImGui.Drawing.Add_Text( "Good choice :)" );
				else
					Dear_ImGui.Drawing.Add_Text( "" );
				end if;

				Dear_ImGui.Drawing.Add_Slider( "Pineapple ratio", Ratio'Access, 0.0, 1.0 );

				Dear_ImGui.Drawing.Add_Colour_Edit3( "Crust colour", Colour );

			end if;

			Dear_ImGui.Drawing.End_Window;

		else

			Text_IO.Put_Line("Window closed, finalising...");
			Continue := False;

		end if;



		-- Rendering
		Dear_ImGui.Drawing.Render;

		Glfw.Windows.Get_Framebuffer_Size( Window'Access, Window_Width, Window_Height );
		GL.Window.Set_Viewport( 0, 0, GL.Types.Int( Window_Width ), GL.Types.Int( Window_Height ) );

		GL.Buffers.Set_Color_Clear_Value((0.0, 0.0, 0.0, 1.0));
		GL.Buffers.Clear((true, false, false, true));

		Dear_ImGui.Backend_OpenGL3.Render_Draw_Data( Dear_ImGui.API.igGetDrawData );

		Glfw.Windows.Context.Swap_Buffers( Window'Access );

		--delay 0.01;

	end loop;

	if Window.Visible then
		Text_IO.Put_Line("Closing Glfw window...");
		Window.Destroy;
	end if;



	-- [ImGui] Finalisation
	Dear_ImGui.Backend_OpenGL3.Shutdown;
	Dear_ImGui.Backend_Glfw.Shutdown;
	Dear_ImGui.Context.Destroy( Context );

	-- [GLfw] Finalisation
	Glfw.Shutdown;



end Main_ImGui_Test;
