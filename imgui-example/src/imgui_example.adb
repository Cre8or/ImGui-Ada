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

procedure ImGui_Example is

   -- Use clauses
   use Ada;

   -- Types
   type T_Float is new Float;

   -- Packages
   package P_ImGui is new Generic_ImGui (T_Float);

   -- Use clauses
   use P_ImGui;

   use type IG.T_Unsigned;

   -- Variables
   Window : aliased Glfw.Windows.Window;

   Continue : aliased Boolean := true;

   Toggle_Pineapple : Boolean := false;
   Size_Int : Natural := 0; -- Valid options in range 1 .. 3;

   Colour3   : Types.T_Colour_RGB  := (others => 0.0);
   Colour4   : Types.T_Colour_RGBA := (others => 0.0);
   Ratio     : T_Float := 0.1;
   Eats_Meat : Boolean := true;

   -- ImGui stuff
   Current_Context : Contexts.T_ImGuiContext;
   IO              : Inputs.T_ImGuiIO;

   Window_Width  : Interfaces.C.Int := 640;
   Window_Height : Interfaces.C.Int := 480;

   -- Constants
   C_Menu_Width  : constant T_Float := 300.0;
   C_Menu_Height : constant T_Float := 400.0;

   C_Item_Width : constant T_Float := 120.0;

begin

   -- [Glfw] Initialisation
   Glfw.Init;
   Glfw.Windows.Hints.Set_Profile (Glfw.Windows.Context.Core_Profile);
   Glfw.Windows.Hints.Set_Minimum_OpenGL_Version (4, 2);

   Window.Init (Window_Width, Window_Height, "Glfw Window");
   Glfw.Windows.Context.Make_Current (Window'Access);
   Glfw.Windows.Context.Set_Swap_Interval (1);

   -- [ImGui] Initialisation
   Contexts.Initialise (Current_Context);
   IO := Current_Context.Get_IO;

   -- Setup Dear ImGui style
   --API.igStyleColorsLight;

   -- Setup Platform/Renderer backends
   Backend_Glfw.Init_For_OpenGL (Window, True);
   Backend_OpenGL3.Init;

   while Continue and not Window.Should_Close loop

      Glfw.Input.Wait_For_Events;

      -- Begin a new ImGui frame
      Backend_OpenGL3.Begin_Frame;
      Backend_Glfw.Begin_Frame;
      Drawing.Begin_Frame;

      -- Initialise our window's position and size
      Windows.Set_Next_Window_Position (
         X         => 0.0,
         Y         => 0.0,
         Condition => Types.E_Once
      );

      Windows.Set_Next_Window_Size (
         C_Menu_Width,
         C_Menu_Height,
         Types.E_Once
      );

      -- Draw our window
      if Windows.Begin_Window (
         "Pizza time!",
         Types.C_Window_Flag_NoSavedSettings or Types.C_Window_Flag_MenuBar,
         Continue -- Closing the window should terminate
      ) then

         -- Check if the window closing-widget was pressed
         if not Continue then
            Text_IO.Put_Line ("TERMINATING: Window closing widget pressed");
         end if;

         --------------------------------
         -- Create a menu
         if Widgets.Begin_Menu_Bar then

            if Widgets.Begin_Menu ("File") then

               if Widgets.Begin_Menu ("More...") then
                  if Widgets.Menu_Item ("Do nothing") then
                     null;
                  end if;

                  Widgets.End_Menu;
               end if;

               if Widgets.Menu_Item ("Print ""Test""") then
                  Text_IO.Put_Line("Test");
               end if;

               Widgets.Menu_Item_Toggle ("Pineapple?", Toggle_Pineapple);

               if Widgets.Menu_Item ("Unavailable", false, false) then
                  Text_IO.Put_Line("How did you get here?!");
               end if;

               Widgets.Text ("This isn't an item");

               Widgets.Separator;
               if Widgets.Menu_Item ("Exit") then
                  Text_IO.Put_Line ("TERMINATING: ""Exit"" menu item pressed");
                  Continue := false;
               end if;

               Widgets.End_Menu;
            end if;

            if Widgets.Begin_Menu ("About") then
               Widgets.Text ("Widgets are cool!");

               Widgets.End_Menu;
            end if;

            Widgets.End_Menu_Bar;
         end if;

         -- Pressing the button should also terminate
         if Widgets.Button ("I don't like pizza.") then
            Text_IO.Put_Line ("TERMINATING: Button pressed");
            Continue := false;
         end if;

         Widgets.Push_Item_Width (-C_Item_Width);

         --------------------------------
         Widgets.Separator;

         Widgets.Text ("Select a size:");
         Widgets.Radio_Button ("Small",  Size_Int, 1);
         Widgets.Radio_Button ("Medium", Size_Int, 2);
         Widgets.Radio_Button ("Large",  Size_Int, 3);

         --------------------------------
         Widgets.Separator;

         Widgets.Checkbox ("Pineapple on pizza?", Toggle_Pineapple);

         if Toggle_Pineapple then
            Widgets.Slider_Float ("Pineapple ratio", Ratio, 0.0, 1.0);
         else
            Widgets.New_Line;
         end if;

         Widgets.Colour_Edit_RGB ("Crust colour", Colour3);
         Widgets.Colour_Edit_RGBA ("Steam colour", Colour4);

         --------------------------------
         Widgets.Separator;

         -- Ingredients tab bar
         if Widgets.Begin_Tab_Bar ("Ingredients selection") then

            if Widgets.Begin_Tab_Item ("Vegetables") then
               Widgets.Text ("Onions");
               Widgets.Text ("Tomatoes");
               Widgets.Text ("Peppers");
               Widgets.Text ("Jalapenos");
               Widgets.Same_Line;
               Widgets.Text ("(hot!)", (1.0, 0.5, 0.5, 1.0));
               Widgets.Text ("Mushrooms");

               Widgets.End_Tab_Item;
            end if;

            if Eats_Meat and then Widgets.Begin_Tab_Item ("Meats", Eats_Meat) then
               Widgets.Text ("Pork Salami");
               Widgets.Text ("Beef Salami");
               Widgets.Text ("Pulled Pork");
               Widgets.Text ("Grilled Chicken");

               Widgets.End_Tab_Item;
            end if;

            if Widgets.Begin_Tab_Item ("Cheese") then
               Widgets.Text ("Mozzarella");
               Widgets.Text ("Emmental");
               Widgets.Text ("Gouda");
               Widgets.Text ("Cheddar");
               Widgets.Text ("Gruyere");

               Widgets.End_Tab_Item;
            end if;

            Widgets.End_Tab_Bar;
         end if;

      end if;

      Windows.End_Window;

      -- Rendering
      Drawing.Render;

      Glfw.Windows.Get_Framebuffer_Size (Window'Access, Window_Width, Window_Height);
      GL.Window.Set_Viewport (0, 0, GL.Types.Int (Window_Width), GL.Types.Int (Window_Height));

      GL.Buffers.Set_Color_Clear_Value ((0.0, 0.0, 0.0, 1.0));
      GL.Buffers.Clear ((true, false, false, true));

      Backend_OpenGL3.Render_Draw_Data (Drawing.Get_Draw_Data);

      Glfw.Windows.Context.Swap_Buffers (Window'Access);

   end loop;

   if Window.Visible then
      Text_IO.Put_Line ("Closing Glfw window...");
      Window.Destroy;
   end if;

   -- [ImGui] Finalisation
   Backend_OpenGL3.Shutdown;
   Backend_Glfw.Shutdown;
   Contexts.Destroy (Current_Context);

   -- [Glfw] Finalisation
   Glfw.Shutdown;

end ImGui_Example;
