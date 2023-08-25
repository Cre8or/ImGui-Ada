pragma License (Modified_GPL);





package body Dear_ImGui.Widgets is



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	-- ======== PARAMETERS STACKS ========
	------------------------------------------------------------------------------------------------------------------------
	procedure Push_Item_Width (Width : in T_Float) is
	begin

		Enforce_Active_Window;

		API_PushItemWidth (Width);

	end Push_Item_Width;


	------------------------------------------------------------------------------------------------------------------------
	-- ======== TEXTS ========
	------------------------------------------------------------------------------------------------------------------------
	procedure Text (Text : in String) is
	begin

		Enforce_Active_Window;

		API_Text (Buffer_String (Text, 1));

	end Text;

	------------------------------------------------------------------------------------------------------------------------
	procedure Text (
		Text   : in String;
		Colour : in T_Vector4
	) is
	begin

		Enforce_Active_Window;

		API_TextColored (Colour, Buffer_String (Text, 1));

	end Text;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== MAIN ========
	------------------------------------------------------------------------------------------------------------------------
	function Button (Label : in String) return Boolean is
	begin

		return Button (Label, (0.0, 0.0));

	end Button;

	------------------------------------------------------------------------------------------------------------------------
	function Button (
		Label : in String;
		Size  : in T_Vector2
	) return Boolean is
	begin

		Enforce_Active_Window;

		return Boolean (API_Button (Buffer_String (Label, 1), Size));

	end Button;

	------------------------------------------------------------------------------------------------------------------------
	function Checkbox (
		Label : in     String;
		State : in out Boolean
	) return Boolean is

		Local_State : aliased T_Bool
		with Address => State'Address;

	begin

		Enforce_Active_Window;

		return Boolean (API_Checkbox (Buffer_String (Label, 1), Local_State'Access));

	end Checkbox;

	------------------------------------------------------------------------------------------------------------------------
	procedure Checkbox (
		Label : in     String;
		State : in out Boolean
	) is

		Dummy_Changed : Boolean;

	begin

		Dummy_Changed := Checkbox (Label, State);

	end Checkbox;

	------------------------------------------------------------------------------------------------------------------------
	function Radio_Button (
		Label : in String;
		State : in Boolean
	) return Boolean is
	begin

		Enforce_Active_Window;

		return Boolean (API_RadioButton (Buffer_String (Label, 1), T_Bool (State)));

	end Radio_Button;

	------------------------------------------------------------------------------------------------------------------------
	function Radio_Button (
		Label : in     String;
		State : in out Integer;
		Value : in     Integer
	) return Boolean is

		Local_State : aliased T_Integer
		with Address => State'Address;

	begin

		Enforce_Active_Window;

		return Boolean (API_RadioButton (Buffer_String (Label, 1), Local_State'Access, T_Integer (Value)));

	end Radio_Button;

	------------------------------------------------------------------------------------------------------------------------
	procedure Radio_Button (
		Label : in     String;
		State : in out Integer;
		Value : in     Integer
	) is

		Dummy_Changed : Boolean;

	begin

		Dummy_Changed := Radio_Button (Label, State, Value);

	end Radio_Button;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== REGULAR SLIDERS ========
	------------------------------------------------------------------------------------------------------------------------
	function Slider_Float (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Format   : in     String        := "%.3f";
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	) return Boolean is

		Format_Ptr : T_Chars_Ptr := C_Null_Ptr;

	begin

		Enforce_Active_Window;

		if Format /= "%.3f" then -- ImGui uses this as default value, even when passing a null pointer
			Format_Ptr := Buffer_String (Format, 2);
		end if;

		return Boolean (API_SliderFloat (
			label  => Buffer_String (Label, 1),
			v      => Value,
			v_min  => Min,
			v_max  => Max,
			format => Format_Ptr, -- Index 2
			flags  => Flags
		));

	end Slider_Float;

	------------------------------------------------------------------------------------------------------------------------
	procedure Slider_Float (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Format   : in     String        := "%.3f";
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	) is

		Dummy_Changed : Boolean;

	begin

		Dummy_Changed := Slider_Float (Label, Value, Min, Max, Format, Flags);

	end Slider_Float;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== COLOUR PICKERS ========
	------------------------------------------------------------------------------------------------------------------------
	function Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean is
	begin

		Enforce_Active_Window;

		return Boolean (API_ColorEdit3 (Buffer_String (Label, 1), Colour, Flags));

	end Colour_Edit_RGB;

	------------------------------------------------------------------------------------------------------------------------
	procedure Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) is

		Dummy_Changed : Boolean;

	begin

		Dummy_Changed := Colour_Edit_RGB (Label, Colour, Flags);

	end Colour_Edit_RGB;

	------------------------------------------------------------------------------------------------------------------------
	function Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean is
	begin

		Enforce_Active_Window;

		return Boolean (API_ColorEdit4 (Buffer_String (Label, 1), Colour, Flags));

	end Colour_Edit_RGBA;

	------------------------------------------------------------------------------------------------------------------------
	procedure Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) is

		Dummy_Changed : Boolean;

	begin

		Dummy_Changed := Colour_Edit_RGBA (Label, Colour, Flags);

	end Colour_Edit_RGBA;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== MENUS ========
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Menu_Bar return Boolean is
	begin

		Enforce_Active_Window;

		G_Menu_Bar_Count := G_Menu_Bar_Count + 1;

		return Boolean (API_BeginMenuBar);

	end Begin_Menu_Bar;

	------------------------------------------------------------------------------------------------------------------------
	procedure End_Menu_Bar is
	begin

		Enforce_Active_Menu_Bar;

		API_EndMenuBar;

		G_Menu_Bar_Count := G_Menu_Bar_Count - 1;

	end End_Menu_Bar;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Menu (
		Label   : in String;
		Enabled : in Boolean := true
	) return Boolean is
	begin

		Enforce_Active_Menu_Bar;

		return Boolean (API_BeginMenu (Buffer_String (Label, 1), T_Bool (Enabled)));

	end Begin_Menu;

	------------------------------------------------------------------------------------------------------------------------
	procedure End_Menu is
	begin

		Enforce_Active_Menu_Bar;

		API_EndMenu;

	end End_Menu;

	------------------------------------------------------------------------------------------------------------------------
	function Menu_Item (
		Label    : in String;
		Selected : in Boolean := false;
		Enabled  : in Boolean := true
	) return Boolean is
	begin

		Enforce_Active_Menu_Bar;

		return Boolean (API_MenuItem (Buffer_String (Label, 1), null, T_Bool (Selected), T_Bool (Enabled)));

	end Menu_Item;

	------------------------------------------------------------------------------------------------------------------------
	function Menu_Item_Toggle (
		Label    : in     String;
		Selected : in out Boolean;
		Enabled  : in     Boolean := true
	) return Boolean is

		Local_Selected : aliased T_Bool
		with Address => Selected'Address;

	begin

		Enforce_Active_Menu_Bar;

		return Boolean (API_MenuItemPtr (Buffer_String (Label, 1), null, Local_Selected, T_Bool (Enabled)));

	end Menu_Item_Toggle;

	------------------------------------------------------------------------------------------------------------------------
	procedure Menu_Item_Toggle (
		Label    : in     String;
		Selected : in out Boolean;
		Enabled  : in     Boolean := true
	) is

		Dummy_State : Boolean;

	begin

		Dummy_State := Menu_Item_Toggle (Label, Selected, Enabled);

	end Menu_Item_Toggle;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TABS ========
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Bar (
		Label : in String;
		Flags : in T_Tab_Bar_Flag := C_Tab_Bar_Flag_None
	) return Boolean is
	begin

		Enforce_Active_Window;

		G_Tab_Bar_Count := G_Tab_Bar_Count + 1;

		return Boolean (API_BeginTabBar (Buffer_String (Label, 1), Flags));

	end Begin_Tab_Bar;

	------------------------------------------------------------------------------------------------------------------------
	procedure End_Tab_Bar is
	begin

		Enforce_Active_Tab_Bar;

		API_EndTabBar;

		G_Tab_Bar_Count := G_Tab_Bar_Count - 1;

	end End_Tab_Bar;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Item (
		Label : in String;
		Flags : in T_Tab_Bar_Flag := C_Tab_Item_Flag_None
	) return Boolean is
	begin

		return Begin_Tab_Item_Internal (Label, Flags, null);

	end Begin_Tab_Item;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Item (
		Label   : in     String;
		Is_Open :    out Boolean;
		Flags   : in     T_Tab_Bar_Flag := C_Tab_Item_Flag_None
	) return Boolean is

		Open_Internal : aliased T_Bool := T_Bool (true);

	begin

		return Is_Selected : Boolean do

			Is_Selected := Begin_Tab_Item_Internal (Label, Flags, Open_Internal'Access);
			Is_Open     := Boolean (Open_Internal);

		end return;

	end Begin_Tab_Item;

	------------------------------------------------------------------------------------------------------------------------
	procedure End_Tab_Item is
	begin

		API_EndTabItem;

	end End_Tab_Item;


-- PRIVATE



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	-- ======== MENUS ========
	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Menu_Bar is
	begin

		if G_Menu_Bar_Count = 0 then
			raise EX_NO_ACTIVE_MENU_BAR;
		end if;

	end Enforce_Active_Menu_Bar;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TABS ========
	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Tab_Bar is
	begin

		if G_Tab_Bar_Count = 0 then
			raise EX_NO_ACTIVE_TAB_BAR;
		end if;

	end Enforce_Active_Tab_Bar;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Item_Internal (
		Label         : in String;
		Flags         : in T_Tab_Item_Flag;
		Open_Internal : access T_Bool
	) return Boolean is
	begin

		Enforce_Active_Tab_Bar;

		return Boolean (API_BeginTabItem (Buffer_String (Label, 1), Open_Internal, Flags));

	end Begin_Tab_Item_Internal;



end Dear_ImGui.Widgets;
