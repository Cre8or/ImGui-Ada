pragma License (Restricted);





with Ada.Text_IO;
with Interfaces.C.Strings;

with Glfw.Input;
with Glfw.Windows.Context;
with Glfw.Windows.Hints;
with GL.Buffers;
with GL.Types;
with GL.Window;

with Generic_ImGui;


pragma Elaborate_All (Ada.Text_IO);
pragma Elaborate_All (Interfaces.C.Strings);

pragma Elaborate_All (Glfw.Input);
pragma Elaborate_All (Glfw.Windows.Context);
pragma Elaborate_All (Glfw.Windows.Hints);
pragma Elaborate_All (GL.Buffers);
pragma Elaborate_All (GL.Types);
pragma Elaborate_All (GL.Window);

pragma Elaborate_All (Generic_ImGui);





procedure Main_ImGui_Test is



	-- Use clauses
	use Ada;



	-- Types
	type T_Float is new Float;



	-- Packages
	package P_ImGui is new Generic_ImGui (T_Float);



	-- Variables
	Window : aliased Glfw.Windows.Window;

	Continue : aliased Boolean := true;

	Button_Pressed : Boolean := false;
	Checkbox_State : Boolean := false;

	Colour3 : P_ImGui.Types.T_Colour_RGB  := (others => 0.0);
	Colour4 : P_ImGui.Types.T_Colour_RGBA := (others => 0.0);
	Ratio  : T_Float := 0.1;

	-- ImGui stuff
	Context : P_ImGui.Context.T_ImGuiContext;
	IO      : P_ImGui.Inputs.T_ImGuiIO;

	Window_Width  : Interfaces.C.Int := 640;
	Window_Height : Interfaces.C.Int := 480;



begin



	-- [Glfw] Initialisation
	Glfw.Init;
	Glfw.Windows.Hints.Set_Profile (Glfw.Windows.Context.Core_Profile);
	Glfw.Windows.Hints.Set_Minimum_OpenGL_Version (4, 2);

	Window.Init (Window_Width, Window_Height, "Glfw Window");
	Glfw.Windows.Context.Make_Current (Window'Access);
	Glfw.Windows.Context.Set_Swap_Interval (1);

	-- [ImGui] Initialisation
	P_ImGui.Context.Initialise (Context);
	IO := Context.Get_IO;

	-- Setup Dear ImGui style
	--P_ImGui.API.igStyleColorsLight;

	-- Setup Platform/Renderer backends
	P_ImGui.Backend_Glfw.Init_For_OpenGL (Window, True);
	P_ImGui.Backend_OpenGL3.Init;



   while Continue and not Window.Should_Close loop

		Glfw.Input.Wait_For_Events;

		-- Begin a new ImGui frame
		P_ImGui.Backend_OpenGL3.Begin_Frame;
		P_ImGui.Backend_Glfw.Begin_Frame;
		P_ImGui.Drawing.Begin_Frame;



		-- Draw a custom window
		if P_ImGui.Drawing.Begin_Window (
			"Pizza poll!",
			P_ImGui.Types.C_Window_Flag_NoSavedSettings,
			Continue -- Closing the window should terminate
		) then

			-- Check if the window closing-widget was pressed
			if not Continue then
				Text_IO.Put_Line ("Window closing widget pressed, closing window...");
			end if;

			P_ImGui.Drawing.Add_Button ("I don't like pizza.", Button_Pressed);

			-- Pressing the button should also terminate
			if Button_Pressed then
				Text_IO.Put_Line ("Button pressed, closing window...");
				Continue := false;
			end if;

			P_ImGui.Drawing.Add_Checkbox ("Pineapple on pizza?", Checkbox_State);

			if Checkbox_State then
				P_ImGui.Drawing.Add_Text ("Good choice :)");
			else
				P_ImGui.Drawing.Add_Text ("");
			end if;

			P_ImGui.Drawing.Set_Item_Width (-120.0);
			P_ImGui.Drawing.Add_Slider ("Pineapple ratio", Ratio, 0.0, 1.0);
			P_ImGui.Drawing.Add_Colour_Edit_RGB ("Crust colour", Colour3);
			P_ImGui.Drawing.Add_Colour_Edit_RGBA ("Steam colour", Colour4);

		end if;

		P_ImGui.Drawing.End_Window;



		-- Rendering
		P_ImGui.Drawing.Render;

		Glfw.Windows.Get_Framebuffer_Size (Window'Access, Window_Width, Window_Height);
		GL.Window.Set_Viewport (0, 0, GL.Types.Int (Window_Width), GL.Types.Int (Window_Height));

		GL.Buffers.Set_Color_Clear_Value ((0.0, 0.0, 0.0, 1.0));
		GL.Buffers.Clear ((true, false, false, true));

		P_ImGui.Backend_OpenGL3.Render_Draw_Data (P_ImGui.Drawing.Get_Draw_Data);

		Glfw.Windows.Context.Swap_Buffers (Window'Access);

	end loop;

	if Window.Visible then
		Text_IO.Put_Line ("Closing Glfw window...");
		Window.Destroy;
	end if;



	-- [ImGui] Finalisation
	P_ImGui.Backend_OpenGL3.Shutdown;
	P_ImGui.Backend_Glfw.Shutdown;
	P_ImGui.Context.Destroy (Context);

	-- [Glfw] Finalisation
	Glfw.Shutdown;



end Main_ImGui_Test;
