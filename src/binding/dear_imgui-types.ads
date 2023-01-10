pragma License( Modified_GPL );





package Dear_ImGui.Types is



	-- Use clauses
	use type T_Unsigned;



	-- Types
	subtype T_Backend_Flag    is T_Unsigned;
	subtype T_ColourEdit_Flag is T_Unsigned;
	subtype T_Config_Flag     is T_Unsigned;
	subtype T_Window_Flag     is T_Unsigned;
	subtype T_Slider_Flag     is T_Unsigned;

	type T_ImGuiKey is (
		E_ImGuiKey_None,
		E_ImGuiKey_Tab,
		E_ImGuiKey_LeftArrow,
		E_ImGuiKey_RightArrow,
		E_ImGuiKey_UpArrow,
		E_ImGuiKey_DownArrow,
		E_ImGuiKey_PageUp,
		E_ImGuiKey_PageDown,
		E_ImGuiKey_Home,
		E_ImGuiKey_End,
		E_ImGuiKey_Insert,
		E_ImGuiKey_Delete,
		E_ImGuiKey_Backspace,
		E_ImGuiKey_Space,
		E_ImGuiKey_Enter,
		E_ImGuiKey_Escape,
		E_ImGuiKey_LeftCtrl,
		E_ImGuiKey_LeftShift,
		E_ImGuiKey_LeftAlt,
		E_ImGuiKey_LeftSuper,
		E_ImGuiKey_RightCtrl,
		E_ImGuiKey_RightShift,
		E_ImGuiKey_RightAlt,
		E_ImGuiKey_RightSuper,
		E_ImGuiKey_Menu,
		E_ImGuiKey_0,
		E_ImGuiKey_1,
		E_ImGuiKey_2,
		E_ImGuiKey_3,
		E_ImGuiKey_4,
		E_ImGuiKey_5,
		E_ImGuiKey_6,
		E_ImGuiKey_7,
		E_ImGuiKey_8,
		E_ImGuiKey_9,
		E_ImGuiKey_A,
		E_ImGuiKey_B,
		E_ImGuiKey_C,
		E_ImGuiKey_D,
		E_ImGuiKey_E,
		E_ImGuiKey_F,
		E_ImGuiKey_G,
		E_ImGuiKey_H,
		E_ImGuiKey_I,
		E_ImGuiKey_J,
		E_ImGuiKey_K,
		E_ImGuiKey_L,
		E_ImGuiKey_M,
		E_ImGuiKey_N,
		E_ImGuiKey_O,
		E_ImGuiKey_P,
		E_ImGuiKey_Q,
		E_ImGuiKey_R,
		E_ImGuiKey_S,
		E_ImGuiKey_T,
		E_ImGuiKey_U,
		E_ImGuiKey_V,
		E_ImGuiKey_W,
		E_ImGuiKey_X,
		E_ImGuiKey_Y,
		E_ImGuiKey_Z,
		E_ImGuiKey_F1,
		E_ImGuiKey_F2,
		E_ImGuiKey_F3,
		E_ImGuiKey_F4,
		E_ImGuiKey_F5,
		E_ImGuiKey_F6,
		E_ImGuiKey_F7,
		E_ImGuiKey_F8,
		E_ImGuiKey_F9,
		E_ImGuiKey_F10,
		E_ImGuiKey_F11,
		E_ImGuiKey_F12,
		E_ImGuiKey_Apostrophe,
		E_ImGuiKey_Comma,
		E_ImGuiKey_Minus,
		E_ImGuiKey_Period,
		E_ImGuiKey_Slash,
		E_ImGuiKey_Semicolon,
		E_ImGuiKey_Equal,
		E_ImGuiKey_LeftBracket,
		E_ImGuiKey_Backslash,
		E_ImGuiKey_RightBracket,
		E_ImGuiKey_GraveAccent,
		E_ImGuiKey_CapsLock,
		E_ImGuiKey_ScrollLock,
		E_ImGuiKey_NumLock,
		E_ImGuiKey_PrintScreen,
		E_ImGuiKey_Pause,
		E_ImGuiKey_Keypad0,
		E_ImGuiKey_Keypad1,
		E_ImGuiKey_Keypad2,
		E_ImGuiKey_Keypad3,
		E_ImGuiKey_Keypad4,
		E_ImGuiKey_Keypad5,
		E_ImGuiKey_Keypad6,
		E_ImGuiKey_Keypad7,
		E_ImGuiKey_Keypad8,
		E_ImGuiKey_Keypad9,
		E_ImGuiKey_KeypadDecimal,
		E_ImGuiKey_KeypadDivide,
		E_ImGuiKey_KeypadMultiply,
		E_ImGuiKey_KeypadSubtract,
		E_ImGuiKey_KeypadAdd,
		E_ImGuiKey_KeypadEnter,
		E_ImGuiKey_KeypadEqual,
		E_ImGuiKey_GamepadStart,
		E_ImGuiKey_GamepadBack,
		E_ImGuiKey_GamepadFaceUp,
		E_ImGuiKey_GamepadFaceDown,
		E_ImGuiKey_GamepadFaceLeft,
		E_ImGuiKey_GamepadFaceRight,
		E_ImGuiKey_GamepadDpadUp,
		E_ImGuiKey_GamepadDpadDown,
		E_ImGuiKey_GamepadDpadLeft,
		E_ImGuiKey_GamepadDpadRight,
		E_ImGuiKey_GamepadL1,
		E_ImGuiKey_GamepadR1,
		E_ImGuiKey_GamepadL2,
		E_ImGuiKey_GamepadR2,
		E_ImGuiKey_GamepadL3,
		E_ImGuiKey_GamepadR3,
		E_ImGuiKey_GamepadLStickUp,
		E_ImGuiKey_GamepadLStickDown,
		E_ImGuiKey_GamepadLStickLeft,
		E_ImGuiKey_GamepadLStickRight,
		E_ImGuiKey_GamepadRStickUp,
		E_ImGuiKey_GamepadRStickDown,
		E_ImGuiKey_GamepadRStickLeft,
		E_ImGuiKey_GamepadRStickRight,
		E_ImGuiKey_ModCtrl,
		E_ImGuiKey_ModShift,
		E_ImGuiKey_ModAlt,
		E_ImGuiKey_ModSuper,
		E_ImGuiKey_COUNT

		--E_ImGuiKey_NamedKey_BEGIN,
		--E_ImGuiKey_NamedKey_END,
		--E_ImGuiKey_NamedKey_COUNT,
		--E_ImGuiKey_KeysData_SIZE,
		--E_ImGuiKey_KeysData_OFFSET
	);

	for T_ImGuiKey use (
		E_ImGuiKey_None               => 0,
		E_ImGuiKey_Tab                => 512,
		E_ImGuiKey_LeftArrow          => 513,
		E_ImGuiKey_RightArrow         => 514,
		E_ImGuiKey_UpArrow            => 515,
		E_ImGuiKey_DownArrow          => 516,
		E_ImGuiKey_PageUp             => 517,
		E_ImGuiKey_PageDown           => 518,
		E_ImGuiKey_Home               => 519,
		E_ImGuiKey_End                => 520,
		E_ImGuiKey_Insert             => 521,
		E_ImGuiKey_Delete             => 522,
		E_ImGuiKey_Backspace          => 523,
		E_ImGuiKey_Space              => 524,
		E_ImGuiKey_Enter              => 525,
		E_ImGuiKey_Escape             => 526,
		E_ImGuiKey_LeftCtrl           => 527,
		E_ImGuiKey_LeftShift          => 528,
		E_ImGuiKey_LeftAlt            => 529,
		E_ImGuiKey_LeftSuper          => 530,
		E_ImGuiKey_RightCtrl          => 531,
		E_ImGuiKey_RightShift         => 532,
		E_ImGuiKey_RightAlt           => 533,
		E_ImGuiKey_RightSuper         => 534,
		E_ImGuiKey_Menu               => 535,
		E_ImGuiKey_0                  => 536,
		E_ImGuiKey_1                  => 537,
		E_ImGuiKey_2                  => 538,
		E_ImGuiKey_3                  => 539,
		E_ImGuiKey_4                  => 540,
		E_ImGuiKey_5                  => 541,
		E_ImGuiKey_6                  => 542,
		E_ImGuiKey_7                  => 543,
		E_ImGuiKey_8                  => 544,
		E_ImGuiKey_9                  => 545,
		E_ImGuiKey_A                  => 546,
		E_ImGuiKey_B                  => 547,
		E_ImGuiKey_C                  => 548,
		E_ImGuiKey_D                  => 549,
		E_ImGuiKey_E                  => 550,
		E_ImGuiKey_F                  => 551,
		E_ImGuiKey_G                  => 552,
		E_ImGuiKey_H                  => 553,
		E_ImGuiKey_I                  => 554,
		E_ImGuiKey_J                  => 555,
		E_ImGuiKey_K                  => 556,
		E_ImGuiKey_L                  => 557,
		E_ImGuiKey_M                  => 558,
		E_ImGuiKey_N                  => 559,
		E_ImGuiKey_O                  => 560,
		E_ImGuiKey_P                  => 561,
		E_ImGuiKey_Q                  => 562,
		E_ImGuiKey_R                  => 563,
		E_ImGuiKey_S                  => 564,
		E_ImGuiKey_T                  => 565,
		E_ImGuiKey_U                  => 566,
		E_ImGuiKey_V                  => 567,
		E_ImGuiKey_W                  => 568,
		E_ImGuiKey_X                  => 569,
		E_ImGuiKey_Y                  => 570,
		E_ImGuiKey_Z                  => 571,
		E_ImGuiKey_F1                 => 572,
		E_ImGuiKey_F2                 => 573,
		E_ImGuiKey_F3                 => 574,
		E_ImGuiKey_F4                 => 575,
		E_ImGuiKey_F5                 => 576,
		E_ImGuiKey_F6                 => 577,
		E_ImGuiKey_F7                 => 578,
		E_ImGuiKey_F8                 => 579,
		E_ImGuiKey_F9                 => 580,
		E_ImGuiKey_F10                => 581,
		E_ImGuiKey_F11                => 582,
		E_ImGuiKey_F12                => 583,
		E_ImGuiKey_Apostrophe         => 584,
		E_ImGuiKey_Comma              => 585,
		E_ImGuiKey_Minus              => 586,
		E_ImGuiKey_Period             => 587,
		E_ImGuiKey_Slash              => 588,
		E_ImGuiKey_Semicolon          => 589,
		E_ImGuiKey_Equal              => 590,
		E_ImGuiKey_LeftBracket        => 591,
		E_ImGuiKey_Backslash          => 592,
		E_ImGuiKey_RightBracket       => 593,
		E_ImGuiKey_GraveAccent        => 594,
		E_ImGuiKey_CapsLock           => 595,
		E_ImGuiKey_ScrollLock         => 596,
		E_ImGuiKey_NumLock            => 597,
		E_ImGuiKey_PrintScreen        => 598,
		E_ImGuiKey_Pause              => 599,
		E_ImGuiKey_Keypad0            => 600,
		E_ImGuiKey_Keypad1            => 601,
		E_ImGuiKey_Keypad2            => 602,
		E_ImGuiKey_Keypad3            => 603,
		E_ImGuiKey_Keypad4            => 604,
		E_ImGuiKey_Keypad5            => 605,
		E_ImGuiKey_Keypad6            => 606,
		E_ImGuiKey_Keypad7            => 607,
		E_ImGuiKey_Keypad8            => 608,
		E_ImGuiKey_Keypad9            => 609,
		E_ImGuiKey_KeypadDecimal      => 610,
		E_ImGuiKey_KeypadDivide       => 611,
		E_ImGuiKey_KeypadMultiply     => 612,
		E_ImGuiKey_KeypadSubtract     => 613,
		E_ImGuiKey_KeypadAdd          => 614,
		E_ImGuiKey_KeypadEnter        => 615,
		E_ImGuiKey_KeypadEqual        => 616,
		E_ImGuiKey_GamepadStart       => 617,
		E_ImGuiKey_GamepadBack        => 618,
		E_ImGuiKey_GamepadFaceUp      => 619,
		E_ImGuiKey_GamepadFaceDown    => 620,
		E_ImGuiKey_GamepadFaceLeft    => 621,
		E_ImGuiKey_GamepadFaceRight   => 622,
		E_ImGuiKey_GamepadDpadUp      => 623,
		E_ImGuiKey_GamepadDpadDown    => 624,
		E_ImGuiKey_GamepadDpadLeft    => 625,
		E_ImGuiKey_GamepadDpadRight   => 626,
		E_ImGuiKey_GamepadL1          => 627,
		E_ImGuiKey_GamepadR1          => 628,
		E_ImGuiKey_GamepadL2          => 629,
		E_ImGuiKey_GamepadR2          => 630,
		E_ImGuiKey_GamepadL3          => 631,
		E_ImGuiKey_GamepadR3          => 632,
		E_ImGuiKey_GamepadLStickUp    => 633,
		E_ImGuiKey_GamepadLStickDown  => 634,
		E_ImGuiKey_GamepadLStickLeft  => 635,
		E_ImGuiKey_GamepadLStickRight => 636,
		E_ImGuiKey_GamepadRStickUp    => 637,
		E_ImGuiKey_GamepadRStickDown  => 638,
		E_ImGuiKey_GamepadRStickLeft  => 639,
		E_ImGuiKey_GamepadRStickRight => 640,
		E_ImGuiKey_ModCtrl            => 641,
		E_ImGuiKey_ModShift           => 642,
		E_ImGuiKey_ModAlt             => 643,
		E_ImGuiKey_ModSuper           => 644,
		E_ImGuiKey_COUNT              => 645

		--E_ImGuiKey_NamedKey_BEGIN     => 512,
		--E_ImGuiKey_NamedKey_END       => 645,
		--E_ImGuiKey_NamedKey_COUNT     => 133,
		--E_ImGuiKey_KeysData_SIZE      => 645,
		--E_ImGuiKey_KeysData_OFFSET    => 0
	);

	type T_ImGuiButton is (
		E_ImGuiButton_Left,
		E_ImGuiButton_Right,
		E_ImGuiButton_Middle
	);

	for T_ImGuiButton use (
		E_ImGuiButton_Left   => 0,
		E_ImGuiButton_Right  => 1,
		E_ImGuiButton_Middle => 2
	);

	type T_Colour3 is record
		R, G, B : aliased Float;
	end record
	with Convention => C_Pass_By_Copy;

	type T_Colour4 is record
		R, G, B, A : aliased Float;
	end record
	with Convention => C_Pass_By_Copy;



	-- Constants
	C_Backend_Flag_None                 : constant T_Backend_Flag := 0;
	C_Backend_Flag_HasGamepad           : constant T_Backend_Flag := 2 ** 0; -- Backend Platform supports gamepad and currently has one connected.
	C_Backend_Flag_HasMouseCursors      : constant T_Backend_Flag := 2 ** 1; -- Backend Platform supports honoring GetMouseCursor() value to change the OS cursor shape.
	C_Backend_Flag_HasSetMousePos       : constant T_Backend_Flag := 2 ** 2; -- Backend Platform supports io.WantSetMousePos requests to reposition the OS mouse position (only used if ImGuiConfigFlags_NavEnableSetMousePos is set).
	C_Backend_Flag_RendererHasVtxOffset : constant T_Backend_Flag := 2 ** 3; -- Backend Renderer supports ImDrawCmd::VtxOffset. This enables output of large meshes (64K+ vertices) while still using 16-bit indices.

    C_ColourEdit_Flag_None             : constant T_ColourEdit_Flag := 0;
    C_ColourEdit_Flag_NoAlpha          : constant T_ColourEdit_Flag := 2 ** 1;   --              -- ColorEdit, ColorPicker, ColorButton: ignore Alpha component (will only read 3 components from the input pointer).
    C_ColourEdit_Flag_NoPicker         : constant T_ColourEdit_Flag := 2 ** 2;   --              -- ColorEdit: disable picker when clicking on color square.
    C_ColourEdit_Flag_NoOptions        : constant T_ColourEdit_Flag := 2 ** 3;   --              -- ColorEdit: disable toggling options menu when right-clicking on inputs/small preview.
    C_ColourEdit_Flag_NoSmallPreview   : constant T_ColourEdit_Flag := 2 ** 4;   --              -- ColorEdit, ColorPicker: disable color square preview next to the inputs. (e.g. to show only the inputs)
    C_ColourEdit_Flag_NoInputs         : constant T_ColourEdit_Flag := 2 ** 5;   --              -- ColorEdit, ColorPicker: disable inputs sliders/text widgets (e.g. to show only the small preview color square).
    C_ColourEdit_Flag_NoTooltip        : constant T_ColourEdit_Flag := 2 ** 6;   --              -- ColorEdit, ColorPicker, ColorButton: disable tooltip when hovering the preview.
    C_ColourEdit_Flag_NoLabel          : constant T_ColourEdit_Flag := 2 ** 7;   --              -- ColorEdit, ColorPicker: disable display of inline text label (the label is still forwarded to the tooltip and picker).
    C_ColourEdit_Flag_NoSidePreview    : constant T_ColourEdit_Flag := 2 ** 8;   --              -- ColorPicker: disable bigger color preview on right side of the picker, use small color square preview instead.
    C_ColourEdit_Flag_NoDragDrop       : constant T_ColourEdit_Flag := 2 ** 9;   --              -- ColorEdit: disable drag and drop target. ColorButton: disable drag and drop source.
    C_ColourEdit_Flag_NoBorder         : constant T_ColourEdit_Flag := 2 ** 10;  --              -- ColorButton: disable border (which is enforced by default)

    -- User Options (right-click on widget to change some of them).
    C_ColourEdit_Flag_AlphaBar         : constant T_ColourEdit_Flag := 2 ** 16;  --              -- ColorEdit, ColorPicker: show vertical alpha bar/gradient in picker.
    C_ColourEdit_Flag_AlphaPreview     : constant T_ColourEdit_Flag := 2 ** 17;  --              -- ColorEdit, ColorPicker, ColorButton: display preview as a transparent color over a checkerboard, instead of opaque.
    C_ColourEdit_Flag_AlphaPreviewHalf : constant T_ColourEdit_Flag := 2 ** 18;  --              -- ColorEdit, ColorPicker, ColorButton: display half opaque / half checkerboard, instead of opaque.
    C_ColourEdit_Flag_HDR              : constant T_ColourEdit_Flag := 2 ** 19;  --              -- (WIP) ColorEdit: Currently only disable 0.0f..1.0f limits in RGBA edition (note: you probably want to use C_ColourEdit_Flag_Float flag as well).
    C_ColourEdit_Flag_DisplayRGB       : constant T_ColourEdit_Flag := 2 ** 20;  -- [Display]    -- ColorEdit: override _display_ type among RGB/HSV/Hex. ColorPicker: select any combination using one or more of RGB/HSV/Hex.
    C_ColourEdit_Flag_DisplayHSV       : constant T_ColourEdit_Flag := 2 ** 21;  -- [Display]    -- "
    C_ColourEdit_Flag_DisplayHex       : constant T_ColourEdit_Flag := 2 ** 22;  -- [Display]    -- "
    C_ColourEdit_Flag_Uint8            : constant T_ColourEdit_Flag := 2 ** 23;  -- [DataType]   -- ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0..255.
    C_ColourEdit_Flag_Float            : constant T_ColourEdit_Flag := 2 ** 24;  -- [DataType]   -- ColorEdit, ColorPicker, ColorButton: _display_ values formatted as 0.0f..1.0f floats instead of 0..255 integers. No round-trip of value via integers.
    C_ColourEdit_Flag_PickerHueBar     : constant T_ColourEdit_Flag := 2 ** 25;  -- [Picker]     -- ColorPicker: bar for Hue, rectangle for Sat/Value.
    C_ColourEdit_Flag_PickerHueWheel   : constant T_ColourEdit_Flag := 2 ** 26;  -- [Picker]     -- ColorPicker: wheel for Hue, triangle for Sat/Value.
    C_ColourEdit_Flag_InputRGB         : constant T_ColourEdit_Flag := 2 ** 27;  -- [Input]      -- ColorEdit, ColorPicker: input and output data in RGB format.
    C_ColourEdit_Flag_InputHSV         : constant T_ColourEdit_Flag := 2 ** 28;  -- [Input]      -- ColorEdit, ColorPicker: input and output data in HSV format.

    -- Defaults Options. You can set application defaults using SetColorEditOptions(). The intent is that you probably don't want to
    -- override them in most of your calls. Let the user choose via the option menu and/or call SetColorEditOptions() once during startup.
    C_ColourEdit_Flag_DefaultOptions   : constant T_ColourEdit_Flag := C_ColourEdit_Flag_Uint8 or C_ColourEdit_Flag_DisplayRGB or C_ColourEdit_Flag_InputRGB or C_ColourEdit_Flag_PickerHueBar;

	C_Config_Flag_None                 : constant T_Config_Flag := 0;
	C_Config_Flag_NavEnableKeyboard    : constant T_Config_Flag := 2 ** 0; -- Master keyboard navigation enable flag. NewFrame() will automatically fill io.NavInputs[] based on io.AddKeyEvent() calls
	C_Config_Flag_NavEnableGamepad     : constant T_Config_Flag := 2 ** 1; -- Master gamepad navigation enable flag. This is mostly to instruct your imgui backend to fill io.NavInputs[]. Backend also needs to set C_Backend_Flag_HasGamepad.
	C_Config_Flag_NavEnableSetMousePos : constant T_Config_Flag := 2 ** 2; -- Instruct navigation to move the mouse cursor. May be useful on TV/console systems where moving a virtual mouse is awkward. Will update io.MousePos and set io.WantSetMousePos=true. If enabled you MUST honor io.WantSetMousePos requests in your backend, otherwise ImGui will react as if the mouse is jumping around back and forth.
	C_Config_Flag_NavNoCaptureKeyboard : constant T_Config_Flag := 2 ** 3; -- Instruct navigation to not set the io.WantCaptureKeyboard flag when io.NavActive is set.
	C_Config_Flag_NoMouse              : constant T_Config_Flag := 2 ** 4; -- Instruct imgui to clear mouse position/buttons in NewFrame(). This allows ignoring the mouse information set by the backend.
	C_Config_Flag_NoMouseCursorChange  : constant T_Config_Flag := 2 ** 5; -- Instruct backend to not alter mouse cursor shape and visibility. Use if the backend cursor changes are interfering with yours and you don't want to use SetMouseCursor() to change mouse cursor. You may want to honor requests from imgui by reading GetMouseCursor() yourself instead.

	-- User storage (to allow your backend/engine to communicate to code that may be shared between multiple projects. Those flags are not used by core Dear ImGui)
	C_Config_Flag_IsSRGB               : constant T_Config_Flag := 2 ** 20; -- Application is SRGB-aware.
	C_Config_Flag_IsTouchScreen        : constant T_Config_Flag := 2 ** 21; -- Application is using a touch screen instead of a mouse.

	C_Window_Flag_None                      : constant T_Window_Flag := 0;
	C_Window_Flag_NoTitleBar                : constant T_Window_Flag := 2 ** 0;   -- Disable title-bar
	C_Window_Flag_NoResize                  : constant T_Window_Flag := 2 ** 1;   -- Disable user resizing with the lower-right grip
	C_Window_Flag_NoMove                    : constant T_Window_Flag := 2 ** 2;   -- Disable user moving the window
	C_Window_Flag_NoScrollbar               : constant T_Window_Flag := 2 ** 3;   -- Disable scrollbars (window can still scroll with mouse or programmatically)
	C_Window_Flag_NoScrollWithMouse         : constant T_Window_Flag := 2 ** 4;   -- Disable user vertically scrolling with mouse wheel. On child window; mouse wheel will be forwarded to the parent unless NoScrollbar is also set.
	C_Window_Flag_NoCollapse                : constant T_Window_Flag := 2 ** 5;   -- Disable user collapsing window by double-clicking on it. Also referred to as Window Menu Button (e.g. within a docking node).
	C_Window_Flag_AlwaysAutoResize          : constant T_Window_Flag := 2 ** 6;   -- Resize every window to its content every frame
	C_Window_Flag_NoBackground              : constant T_Window_Flag := 2 ** 7;   -- Disable drawing background color (WindowBg; etc.) and outside border. Similar as using SetNextWindowBgAlpha(0.0f).
	C_Window_Flag_NoSavedSettings           : constant T_Window_Flag := 2 ** 8;   -- Never load/save settings in .ini file
	C_Window_Flag_NoMouseInputs             : constant T_Window_Flag := 2 ** 9;   -- Disable catching mouse; hovering test with pass through.
	C_Window_Flag_MenuBar                   : constant T_Window_Flag := 2 ** 10;  -- Has a menu-bar
	C_Window_Flag_HorizontalScrollbar       : constant T_Window_Flag := 2 ** 11;  -- Allow horizontal scrollbar to appear (off by default). You may use SetNextWindowContentSize(ImVec2(width;0.0f)); prior to calling Begin() to specify width. Read code in imgui_demo in the "Horizontal Scrolling" section.
	C_Window_Flag_NoFocusOnAppearing        : constant T_Window_Flag := 2 ** 12;  -- Disable taking focus when transitioning from hidden to visible state
	C_Window_Flag_NoBringToFrontOnFocus     : constant T_Window_Flag := 2 ** 13;  -- Disable bringing window to front when taking focus (e.g. clicking on it or programmatically giving it focus)
	C_Window_Flag_AlwaysVerticalScrollbar   : constant T_Window_Flag := 2 ** 14;  -- Always show vertical scrollbar (even if ContentSize.y < Size.y)
	C_Window_Flag_AlwaysHorizontalScrollbar : constant T_Window_Flag := 2 ** 15;  -- Always show horizontal scrollbar (even if ContentSize.x < Size.x)
	C_Window_Flag_AlwaysUseWindowPadding    : constant T_Window_Flag := 2 ** 16;  -- Ensure child windows without border uses style.WindowPadding (ignored by default for non-bordered child windows; because more convenient)
	C_Window_Flag_NoNavInputs               : constant T_Window_Flag := 2 ** 18;  -- No gamepad/keyboard navigation within the window
	C_Window_Flag_NoNavFocus                : constant T_Window_Flag := 2 ** 19;  -- No focusing toward this window with gamepad/keyboard navigation (e.g. skipped by CTRL+TAB)
	C_Window_Flag_UnsavedDocument           : constant T_Window_Flag := 2 ** 20;  -- Display a dot next to the title. When used in a tab/docking context; tab is selected when clicking the X + closure is not assumed (will wait for user to stop submitting the tab). Otherwise closure is assumed when pressing the X; so if you keep submitting the tab may reappear at end of tab bar.
	C_Window_Flag_NoNav                     : constant T_Window_Flag := C_Window_Flag_NoNavInputs or C_Window_Flag_NoNavFocus;
	C_Window_Flag_NoDecoration              : constant T_Window_Flag := C_Window_Flag_NoTitleBar or C_Window_Flag_NoResize or C_Window_Flag_NoScrollbar or C_Window_Flag_NoCollapse;
	C_Window_Flag_NoInputs                  : constant T_Window_Flag := C_Window_Flag_NoMouseInputs or C_Window_Flag_NoNavInputs or C_Window_Flag_NoNavFocus;

	C_Slider_Flag_None            : constant T_Slider_Flag := 0;
	C_Slider_Flag_AlwaysClamp     : constant T_Slider_Flag := 2 ** 4;       -- Clamp value to min/max bounds when input manually with CTRL+Click. By default CTRL+Click allows going out of bounds.
	C_Slider_Flag_Logarithmic     : constant T_Slider_Flag := 2 ** 5;       -- Make the widget logarithmic (linear otherwise). Consider using C_Slider_Flag_NoRoundToFormat with this if using a format-string with small amount of digits.
	C_Slider_Flag_NoRoundToFormat : constant T_Slider_Flag := 2 ** 6;       -- Disable rounding underlying value to match precision of the display format string (e.g. %.3f values are rounded to those 3 digits)
	C_Slider_Flag_NoInput         : constant T_Slider_Flag := 2 ** 7;       -- Disable CTRL+Click or Enter key allowing to input text directly into the widget



end Dear_ImGui.Types;
