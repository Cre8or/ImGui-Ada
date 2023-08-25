pragma License (Modified_GPL);





with Dear_ImGui.Types;


generic

	with package P_Types is new Dear_ImGui.Types;

package Dear_ImGui.Widgets is



	-- Use clauses
	use P_Types;



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- ======== PARAMETERS STACKS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Pushes the width of any subsequent, common large "item+label" widgets. The width is measured in pixels.
	-- Behaviour depends on the sign of the Width parameter:
	-- >  0.0: items will be <Width> pixels wide;
	-- <= 0.0: items will be aligned <Width> pixels to the right of the window.
	-- Analogous to ImGui::PushItemWidth.
	------------------------------------------------------------------------------------------------------------------------
	procedure Push_Item_Width (Width : in T_Float)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== CURSOR / LAYOUT ========
	------------------------------------------------------------------------------------------------------------------------
	-- Adds a separator to the active window.
	-- Normally, separators are oriented horizontally. Inside a menu bar, or in horizontal layout mode, separators are
	-- oriented vertically.
	-- Analogous to ImGui::Separator.
	------------------------------------------------------------------------------------------------------------------------
	procedure Separator;

	------------------------------------------------------------------------------------------------------------------------
	-- Spaces widgets or groups out horizontally. The offset and spacing are measured in pixels.
	-- Setting the offset to 0.0 will resume at the end of the preceding widget.
	-- Setting the Spacing to negative values will let Dear ImGui pick a suitable value.
	-- Analogous to ImGui::SameLine.
	------------------------------------------------------------------------------------------------------------------------
	procedure Same_Line (
		Offset_From_Start : in T_Float := 0.0;
		Spacing           : in T_Float := -1.0
	);

	------------------------------------------------------------------------------------------------------------------------
	-- Leaves a blank line when in horizontal-layout contexts, or undoes Same_Line if called immediately afterwards.
	-- Analogous to ImGui::NewLine.
	------------------------------------------------------------------------------------------------------------------------
	procedure New_Line;

	------------------------------------------------------------------------------------------------------------------------
	-- Creates a new group, locking the horizontal starting position for all subsequent elements.
	-- Captures the whole group bounding box into one "item" (so you can use Is_Item_Hovered or layout primitives such as
	-- Same_Line on the whole group).
	-- Analogous to ImGui::BeginGroup.
	------------------------------------------------------------------------------------------------------------------------
	procedure Begin_Group;

	------------------------------------------------------------------------------------------------------------------------
	-- Ends a group, unlocking the horizontal starting position for all subsequent elements.
	-- Must follow a call to Begin_Group.
	-- Analogous to ImGui::NewLine.
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Group;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TEXTS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Adds a text to the active window.
	-- Analogous to ImGui::Text.
	------------------------------------------------------------------------------------------------------------------------
	procedure Text (Text : in String);

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a coloured text to the active window.
	-- Analogous to ImGui::TextColored.
	------------------------------------------------------------------------------------------------------------------------
	procedure Text (
		Text   : in String;
		Colour : in T_Vector4
	);

	------------------------------------------------------------------------------------------------------------------------
	-- ======== MAIN ========
	------------------------------------------------------------------------------------------------------------------------
	-- Adds a button to the active window. Returns true if the button is pressed, otherwise false.
	-- Analogous to ImGui::Button.
	------------------------------------------------------------------------------------------------------------------------
	function Button (Label : in String) return Boolean
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a button to the active window with the specified size. Returns true if the button is pressed, otherwise false.
	-- Analogous to ImGui::Button.
	------------------------------------------------------------------------------------------------------------------------
	function Button (
		Label : in String;
		Size  : in T_Vector2
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a checkbox to the active window. Returns true if the checkbox state has changed, otherwise false.
	-- Analogous to ImGui::Checkbox.
	------------------------------------------------------------------------------------------------------------------------
	function Checkbox (
		Label : in     String;
		State : in out Boolean
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a checkbox to the active window.
	-- Identical to its function counterpart, except it doesn't return anything when the state changes.
	------------------------------------------------------------------------------------------------------------------------
	procedure Checkbox (
		Label : in     String;
		State : in out Boolean
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a radio button to the active window. Returns true if the radio button state has changed, otherwise false.
	-- Analogous to ImGui::RadioButton.
	------------------------------------------------------------------------------------------------------------------------
	function Radio_Button (
		Label : in String;
		State : in Boolean
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a radio button to the active window. Returns true if the radio button state has changed, otherwise false.
	-- Additonally, if selected, State will be set to Value. Likewise, the radio button will be selected when
	-- State is set to Value.
	-- Analogous to ImGui::RadioButton.
	------------------------------------------------------------------------------------------------------------------------
	function Radio_Button (
		Label : in     String;
		State : in out Integer;
		Value : in     Integer
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a radio button to the active window.
	-- Identical to its function counterpart, except it doesn't return anything when the state changes.
	------------------------------------------------------------------------------------------------------------------------
	procedure Radio_Button (
		Label : in     String;
		State : in out Integer;
		Value : in     Integer
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== IMAGES ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== COMBO BOXES ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== DRAG SLIDERS ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== REGULAR SLIDERS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Refer to the C++ documentation for information on valid number formats:
	--   https://en.cppreference.com/w/cpp/io/c/fprintf
	------------------------------------------------------------------------------------------------------------------------
	-- Adds a single-component float slider to the active window. Returns true if the value has changed, otherwise false.
	-- Optionally, Format can be set to values other than C++format strings to display plain text on the slider bar.
	-- If no text should be displayed, set Format to an empty string ("").
	-- Analogous to ImGui::SliderFloat.
	------------------------------------------------------------------------------------------------------------------------
	function Slider_Float (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Format   : in     String        := "%.3f";
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds a single-component float slider to the active window.
	-- Identical to its function counterpart, except it doesn't return anything when the value changes.
	------------------------------------------------------------------------------------------------------------------------
	procedure Slider_Float (
		Label    : in     String;
		Value    : in out T_Float;
		Min, Max : in     T_Float;
		Format   : in     String        := "%.3f";
		Flags    : in     T_Slider_Flag := C_Slider_Flag_None
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== KEYBOARD INPUTS ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== COLOUR PICKERS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Adds an RGB colour editor/picker to the active window. Returns true if the colour has changed, otherwise false.
	-- Analogous to ImGui::ColorEdit3.
	------------------------------------------------------------------------------------------------------------------------
	function Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds an RGB colour editor/picker to the active window.
	-- Identical to its function counterpart, except it doesn't return anything when the colour changes.
	------------------------------------------------------------------------------------------------------------------------
	procedure Colour_Edit_RGB (
		Label  : in     String;
		Colour : in out T_Colour_RGB;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds an RGBA colour editor/picker to the active window. Returns true if the colour has changed, otherwise false.
	-- Analogous to ImGui::ColorEdit4.
	------------------------------------------------------------------------------------------------------------------------
	function Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds an RGBA colour editor/picker to the active window.
	-- Identical to its function counterpart, except it doesn't return anything when the colour changes.
	------------------------------------------------------------------------------------------------------------------------
	procedure Colour_Edit_RGBA (
		Label  : in     String;
		Colour : in out T_Colour_RGBA;
		Flags  : in     T_ColourEdit_Flag := C_ColourEdit_Flag_None
	) with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- ======== SELECTABLES ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== LIST BOXES ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== DATA PLOTTING ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== HELPERS ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== SELECTABLES ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== MENUS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Appends a menu bar to the current window. Returns true if the menu bar is shown and visible, otherwise false.
	-- This requires the window to use the C_Window_Flag_MenuBar flag.
	-- Analogous to ImGui::BeginMenuBar.
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Menu_Bar return Boolean
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Ends the active menu bar; signals that its handling is finished.
	-- Must only be called after Begin_Menu_Bar if it returned true.
	-- Analogous to ImGui::EndMenuBar.
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Menu_Bar
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Appends a menu to the current menu bar. Returns true if the menu is shown and visible, otherwise false.
	-- If Enabled is set to false, the menu will not be useable.
	-- Analogous to ImGui::BeginMenu.
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Menu (
		Label   : in String;
		Enabled : in Boolean := true
	) return Boolean
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Ends the active menu; signals that its handling is finished.
	-- Must only be called after Begin_Menu if it returned true.
	-- Analogous to ImGui::EndMenu.
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Menu
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds an item to the active menu. Returns true when the item has been activated, otherwise false.
	-- When Selected is true, the item will display a check mark next to the label.
	-- When Enabled is false, the item cannot be activated.
	-- Analogous to ImGui::MenuItem.
	------------------------------------------------------------------------------------------------------------------------
	function Menu_Item (
		Label    : in String;
		Selected : in Boolean := false;
		Enabled  : in Boolean := true
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds an item to the active menu. Returns true when the item has been activated, otherwise false.
	-- When activated, the new selection state (checked/unchecked) will be stored inside Selected, acting as a toggle.
	-- When Enabled is false, the item cannot be activated.
	-- Analogous to ImGui::MenuItem.
	------------------------------------------------------------------------------------------------------------------------
	function Menu_Item_Toggle (
		Label    : in     String;
		Selected : in out Boolean;
		Enabled  : in     Boolean := true
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Adds an item to the active menu.
	-- Identical to its function counterpart, except it doesn't return anything when the state changes.
	------------------------------------------------------------------------------------------------------------------------
	procedure Menu_Item_Toggle (
		Label    : in     String;
		Selected : in out Boolean;
		Enabled  : in     Boolean := true
	);

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TOOLTIPS ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== POPUPS ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TABLES ========
	------------------------------------------------------------------------------------------------------------------------

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TABS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Creates a tab bar using the given flags. Returns true if the tab bar is shown and visible, otherwise false.
	-- Analogous to ImGui::BeginTabBar.
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Bar (
		Label : in String;
		Flags : in T_Tab_Bar_Flag := C_Tab_Bar_Flag_None
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	-- Ends the active tab bar; signals that its handling is finished.
	-- Must only be called after Begin_Tab_Bar if it returned true.
	-- Analogous to ImGui::EndTabBar.
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Tab_Bar
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Creates a tab item using the given flags. Returns true if the tab item is selected, otherwise false.
	-- Analogous to ImGui::BeginTabItem.
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Item (
		Label : in String;
		Flags : in T_Tab_Bar_Flag := C_Tab_Item_Flag_None
	) return Boolean
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Creates a tab item using the given flags. Returns true if the tab item is selected, otherwise false.
	-- Additionally, the tab item will show a closing widget in the upper-right corner, which, when clicked, will set
	-- Is_Open to false.
	-- Aanalogous to ImGui::BeginTabItem.
	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Item (
		Label   : in     String;
		Is_Open :    out Boolean;
		Flags   : in     T_Tab_Bar_Flag := C_Tab_Item_Flag_None
	) return Boolean
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Ends the active tab item; signals that its handling is finished.
	-- Must only be called after Begin_Tab_Item if it returned true.
	-- Analogous to ImGui::EndTabitem.
	------------------------------------------------------------------------------------------------------------------------
	procedure End_Tab_Item
	with Inline;



private



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- ======== PARAMETERS STACKS ========
	------------------------------------------------------------------------------------------------------------------------
	procedure API_PushItemWidth (item_width : in T_Float)
	with Import, Convention => C, External_Name => "igPushItemWidth";

	------------------------------------------------------------------------------------------------------------------------
	-- ======== CURSOR / LAYOUT ========
	------------------------------------------------------------------------------------------------------------------------
	procedure API_Separator
	with Import, Convention => C, External_Name => "igSeparator";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_SameLine (
		offset_from_start : in T_Float := 0.0;
		spacing           : in T_Float := -1.0
	) with Import, Convention => C, External_Name => "igSameLine";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_NewLine
	with Import, Convention => C, External_Name => "igNewLine";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_BeginGroup
	with Import, Convention => C, External_Name => "igBeginGroup";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_EndGroup
	with Import, Convention => C, External_Name => "igEndGroup";

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TEXTS ========
	------------------------------------------------------------------------------------------------------------------------
	procedure API_Text (fmt : in T_Chars_Ptr)
	with Import, Convention => C, External_Name => "igText";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_TextColored (
		col : in T_Vector4;
		fmt : in T_Chars_Ptr
	) with Import, Convention => C, External_Name => "igTextColored";

	------------------------------------------------------------------------------------------------------------------------
	-- ======== MAIN ========
	------------------------------------------------------------------------------------------------------------------------
	function API_Button (
		label : in T_Chars_Ptr;
		size  : in T_Vector2 := (0.0, 0.0)
	) return T_Bool
	with Import, Convention => C, External_Name => "igButton";

	------------------------------------------------------------------------------------------------------------------------
	function API_Checkbox (
		label : in T_Chars_Ptr;
		value : access T_Bool
	) return T_Bool
	with Import, Convention => C, External_Name => "igCheckbox";

	------------------------------------------------------------------------------------------------------------------------
	function API_RadioButton (
		label  : in T_Chars_Ptr;
		active : in T_Bool
	) return T_Bool
	with Import, Convention => C, External_Name => "igRadioButton_Bool";

	------------------------------------------------------------------------------------------------------------------------
	function API_RadioButton (
		label    : in T_Chars_Ptr;
		v        : access T_Integer;
		v_button : in T_Integer
	) return T_Bool
	with Import, Convention => C, External_Name => "igRadioButton_IntPtr";

	------------------------------------------------------------------------------------------------------------------------
	-- ======== REGULAR SLIDERS ========
	------------------------------------------------------------------------------------------------------------------------
	function API_SliderFloat (
		label  : in     T_Chars_Ptr;
		v      : in out T_Float;
		v_min  : in     T_Float;
		v_max  : in     T_Float;
		format : in     T_Chars_Ptr;
		flags  : in     T_Slider_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igSliderFloat";

	------------------------------------------------------------------------------------------------------------------------
	-- ======== COLOUR PICKERS ========
	------------------------------------------------------------------------------------------------------------------------
	function API_ColorEdit3 (
		label : in     T_Chars_Ptr;
		col   : in out T_Colour_RGB;
		flags : in     T_ColourEdit_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igColorEdit3";

	------------------------------------------------------------------------------------------------------------------------
	function API_ColorEdit4 (
		label : in     T_Chars_Ptr;
		col   : in out T_Colour_RGBA;
		flags : in     T_ColourEdit_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igColorEdit4";

	------------------------------------------------------------------------------------------------------------------------
	-- ======== MENUS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Checks if a menu bar is currently active. If not, the exception EX_NO_ACTIVE_MENU_BAR is raised.
	-- Used to automatically raise exceptions when adding/removing menu items with no active menu bar present.
	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Menu_Bar
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	function API_BeginMenuBar return T_Bool
	with Import, Convention => C, External_Name => "igBeginMenuBar";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_EndMenuBar
	with Import, Convention => C, External_Name => "igEndMenuBar";

	------------------------------------------------------------------------------------------------------------------------
	function API_BeginMenu (
		label   : in T_Chars_Ptr;
		enabled : in T_Bool := T_Bool (true)
	) return T_Bool
	with Import, Convention => C, External_Name => "igBeginMenu";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_EndMenu
	with Import, Convention => C, External_Name => "igEndMenu";

	------------------------------------------------------------------------------------------------------------------------
	function API_MenuItem (
		label    : in T_Chars_Ptr;
		shortcut : access T_Char := null;
		selected : in T_Bool := T_Bool (false);
		enabled  : in T_Bool := T_Bool (true)
	) return T_Bool
	with Import, Convention => C, External_Name => "igMenuItem_Bool";

	------------------------------------------------------------------------------------------------------------------------
	function API_MenuItemPtr (
		label      : in     T_Chars_Ptr;
		shortcut   : access T_Char := null;
		p_selected : in out T_Bool;
		enabled    : in     T_Bool := T_Bool (true)
	) return T_Bool
	with Import, Convention => C, External_Name => "igMenuItem_BoolPtr";

	------------------------------------------------------------------------------------------------------------------------
	-- ======== TABS ========
	------------------------------------------------------------------------------------------------------------------------
	-- Checks if a tab bar is currently active. If not, the exception EX_NO_ACTIVE_TAB_BAR is raised.
	-- Used to automatically raise exceptions when adding/removing tab items with no active tab bar present.
	------------------------------------------------------------------------------------------------------------------------
	procedure Enforce_Active_Tab_Bar
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	function Begin_Tab_Item_Internal (
		Label         : in String;
		Flags         : in T_Tab_Item_Flag;
		Open_Internal : access T_Bool
	) return Boolean;

	------------------------------------------------------------------------------------------------------------------------
	function API_BeginTabBar (
		str_id : in T_Chars_Ptr;
		flags  : in T_Tab_Bar_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igBeginTabBar";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_EndTabBar
	with Import, Convention => C, External_Name => "igEndTabBar";

	------------------------------------------------------------------------------------------------------------------------
	function API_BeginTabItem (
		label  : in T_Chars_Ptr;
		p_open : access T_Bool := null;
		flags  : in T_Tab_Item_Flag
	) return T_Bool
	with Import, Convention => C, External_Name => "igBeginTabItem";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_EndTabItem
	with Import, Convention => C, External_Name => "igEndTabItem";



	-- Renames
	procedure Separator renames API_Separator;

	procedure Same_Line (
		Offset_From_Start : in T_Float := 0.0;
		Spacing           : in T_Float := -1.0
	) renames API_SameLine;

	procedure New_Line renames API_NewLine;

	procedure Begin_Group renames API_BeginGroup;

	procedure End_Group renames API_EndGroup;



	-- Variables
	G_Menu_Bar_Count : Natural := 0;

	G_Tab_Bar_Count : Natural := 0;



end Dear_ImGui.Widgets;
