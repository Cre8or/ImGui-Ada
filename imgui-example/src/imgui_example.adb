pragma License (Restricted);

with Ada.Text_IO;

with Glfw.Input;
with Glfw.Windows.Context;
with Glfw.Windows.Hints;
with GL.Buffers;
with GL.Types;
with GL.Window;

with Generic_ImGui;

procedure ImGui_Example is

   package ImGui is new Generic_ImGui (Float);

   use type ImGui.IG.T_Unsigned;

   MENU_WIDTH : constant := 300.0;
   MENU_HEIGHT : constant := 400.0;
   ITEM_WIDTH : constant := 120.0;
   PIZZA_WINDOW_FLAGS : constant := (
      ImGui.Types.C_Window_Flag_NoSavedSettings or
      ImGui.Types.C_Window_Flag_MenuBar);

   Window : aliased Glfw.Windows.Window;
   Window_Width : Glfw.Size := 640;
   Window_Height : Glfw.Size := 480;

   Is_Pizza_Window_Open : Boolean := True;
   Toggle_Pineapple : Boolean := False;
   Size_Int : Natural := 0; -- Valid options in range 1 .. 3;
   Colour3 : ImGui.Types.T_Colour_RGB  := (others => 0.0);
   Colour4 : ImGui.Types.T_Colour_RGBA := (others => 0.0);
   Ratio : Float := 0.1;
   Eats_Meat : Boolean := True;
   Current_Context : ImGui.Contexts.T_ImGuiContext;
   Is_Light_Theme : Boolean := False;
begin

   Glfw.Init;
   Glfw.Windows.Hints.Set_Profile (Glfw.Windows.Context.Core_Profile);
   Glfw.Windows.Hints.Set_Minimum_OpenGL_Version (4, 2);

   Window.Init (Window_Width, Window_Height, "Glfw Window");
   Glfw.Windows.Context.Make_Current (Window'Access);
   Glfw.Windows.Context.Set_Swap_Interval (1);

   ImGui.Contexts.Initialise (Current_Context);

   ImGui.Backend_Glfw.Init_For_OpenGL (Window, True);
   ImGui.Backend_OpenGL3.Init;

   while
      not Window.Should_Close and then Is_Pizza_Window_Open
   loop

      Glfw.Input.Wait_For_Events;

      ImGui.Backend_OpenGL3.Begin_Frame;
      ImGui.Backend_Glfw.Begin_Frame;
      ImGui.Drawing.Begin_Frame;

      --  Initialise our window's position and size
      ImGui.Windows.Set_Next_Window_Position (
         X         => 0.0,
         Y         => 0.0,
         Condition => ImGui.Types.E_Once);

      ImGui.Windows.Set_Next_Window_Size (
         Width     => MENU_WIDTH,
         Height    => MENU_HEIGHT,
         Condition => ImGui.Types.E_Once);

      if ImGui.Windows.Begin_Window (
         "Pizza time!", PIZZA_WINDOW_FLAGS, Is_Pizza_Window_Open)
      then

         if not Is_Pizza_Window_Open then
            Ada.Text_IO.Put_Line ("ImGui Window closing widget pressed");
         end if;

         if ImGui.Widgets.Begin_Menu_Bar then

            if ImGui.Widgets.Begin_Menu ("File") then

               if ImGui.Widgets.Begin_Menu ("More...") then
                  if ImGui.Widgets.Menu_Item ("Do nothing") then
                     null;
                  end if;

                  ImGui.Widgets.End_Menu;
               end if;

               if ImGui.Widgets.Menu_Item ("Print ""Test""") then
                  Ada.Text_IO.Put_Line ("Test");
               end if;

               ImGui.Widgets.Menu_Item_Toggle ("Pineapple?", Toggle_Pineapple);

               if ImGui.Widgets.Menu_Item ("Unavailable", False, False) then
                  Ada.Text_IO.Put_Line ("How did you get here?!");
               end if;

               declare
                  State_Changed : constant Boolean := ImGui.Widgets.
                     Menu_Item_Toggle ("Light Theme", Is_Light_Theme);
               begin
                  if State_Changed then
                     if Is_Light_Theme then
                        ImGui.API.igStyleColorsLight;
                     else
                        ImGui.API.igStyleColorsDark;
                     end if;
                  end if;
               end;

               ImGui.Widgets.Text ("This isn't an item");

               ImGui.Widgets.Separator;
               if ImGui.Widgets.Menu_Item ("Exit") then
                  Ada.Text_IO.Put_Line (
                     "TERMINATING: ""Exit"" menu item pressed");
                  Is_Pizza_Window_Open := False;
               end if;

               ImGui.Widgets.End_Menu;
            end if;

            if ImGui.Widgets.Begin_Menu ("About") then
               ImGui.Widgets.Text ("Widgets are cool!");

               ImGui.Widgets.End_Menu;
            end if;

            ImGui.Widgets.End_Menu_Bar;
         end if;

         if ImGui.Widgets.Button ("I don't like pizza.") then
            Ada.Text_IO.Put_Line ("TERMINATING: Button pressed");
            Is_Pizza_Window_Open := False;
         end if;

         ImGui.Widgets.Push_Item_Width (-ITEM_WIDTH);

         ImGui.Widgets.Separator;

         ImGui.Widgets.Text ("Select a size:");
         ImGui.Widgets.Radio_Button ("Small",  Size_Int, 1);
         ImGui.Widgets.Radio_Button ("Medium", Size_Int, 2);
         ImGui.Widgets.Radio_Button ("Large",  Size_Int, 3);

         ImGui.Widgets.Separator;

         ImGui.Widgets.Checkbox ("Pineapple on pizza?", Toggle_Pineapple);

         if Toggle_Pineapple then
            ImGui.Widgets.Slider_Float ("Pineapple ratio", Ratio, 0.0, 1.0);
         else
            ImGui.Widgets.New_Line;
         end if;

         ImGui.Widgets.Colour_Edit_RGB ("Crust colour", Colour3);
         ImGui.Widgets.Colour_Edit_RGBA ("Steam colour", Colour4);

         ImGui.Widgets.Separator;

         if ImGui.Widgets.Begin_Tab_Bar ("Ingredients selection") then

            if ImGui.Widgets.Begin_Tab_Item ("Vegetables") then
               ImGui.Widgets.Text ("Onions");
               ImGui.Widgets.Text ("Tomatoes");
               ImGui.Widgets.Text ("Peppers");
               ImGui.Widgets.Text ("Jalapenos");
               ImGui.Widgets.Same_Line;
               ImGui.Widgets.Text ("(hot!)", (1.0, 0.5, 0.5, 1.0));
               ImGui.Widgets.Text ("Mushrooms");

               ImGui.Widgets.End_Tab_Item;
            end if;

            if
               Eats_Meat and then
               ImGui.Widgets.Begin_Tab_Item ("Meats", Eats_Meat)
            then
               ImGui.Widgets.Text ("Pork Salami");
               ImGui.Widgets.Text ("Beef Salami");
               ImGui.Widgets.Text ("Pulled Pork");
               ImGui.Widgets.Text ("Grilled Chicken");

               ImGui.Widgets.End_Tab_Item;
            end if;

            if ImGui.Widgets.Begin_Tab_Item ("Cheese") then
               ImGui.Widgets.Text ("Mozzarella");
               ImGui.Widgets.Text ("Emmental");
               ImGui.Widgets.Text ("Gouda");
               ImGui.Widgets.Text ("Cheddar");
               ImGui.Widgets.Text ("Gruyere");

               ImGui.Widgets.End_Tab_Item;
            end if;

            ImGui.Widgets.End_Tab_Bar;
         end if;

      end if;

      ImGui.Windows.End_Window;

      ImGui.Drawing.Render;

      Glfw.Windows.Get_Framebuffer_Size (
         Window'Access, Window_Width, Window_Height);

      GL.Window.Set_Viewport (
         X      => 0,
         Y      => 0,
         Width  => GL.Types.Int (Window_Width),
         Height => GL.Types.Int (Window_Height));

      GL.Buffers.Set_Color_Clear_Value ((0.0, 0.0, 0.0, 1.0));
      GL.Buffers.Clear ((True, False, False, True));

      ImGui.Backend_OpenGL3.Render_Draw_Data (ImGui.Drawing.Get_Draw_Data);

      Glfw.Windows.Context.Swap_Buffers (Window'Access);
   end loop;

   if Window.Visible then
      Ada.Text_IO.Put_Line ("Closing Glfw window...");
      Window.Destroy;
   end if;

   ImGui.Backend_OpenGL3.Shutdown;
   ImGui.Backend_Glfw.Shutdown;
   ImGui.Contexts.Destroy (Current_Context);

   Glfw.Shutdown;

end ImGui_Example;
