pragma Ada_2012;
pragma Style_Checks (Off);

private with System;
with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;

with Glfw.Windows;
with Glfw.Monitors;



pragma Elaborate_All( Glfw.Windows );
pragma Elaborate_All( Glfw.Monitors );





package imgui_impl_glfw_h is

  -- dear imgui: Platform Backend for GLFW
  -- This needs to be used along with a Renderer (e.g. OpenGL3, Vulkan, WebGPU..)
  -- (Info: GLFW is a cross-platform general purpose library for handling windows, inputs, OpenGL/Vulkan graphics context creation, etc.)
  -- Implemented features:
  --  [X] Platform: Clipboard support.
  --  [X] Platform: Keyboard support. Since 1.87 we are using the io.AddKeyEvent() function. Pass ImGuiKey values to all key functions e.g. ImGui::IsKeyPressed(ImGuiKey_Space). [Legacy GLFW_KEY_* values will also be supported unless IMGUI_DISABLE_OBSOLETE_KEYIO is set]
  --  [X] Platform: Gamepad support. Enable with 'io.ConfigFlags |= ImGuiConfigFlags_NavEnableGamepad'.
  --  [X] Platform: Mouse cursor shape and visibility. Disable with 'io.ConfigFlags |= ImGuiConfigFlags_NoMouseCursorChange' (note: the resizing cursors requires GLFW 3.4+).
  -- You can use unmodified imgui_impl_* files in your project. See examples/ folder for examples of using this.
  -- Prefer including the entire imgui/ repository into your project (either as a copy or as a submodule), and only build the backends you need.
  -- If you are new to Dear ImGui, read documentation from the docs/ folder + read the top of imgui.cpp.
  -- Read online: https://github.com/ocornut/imgui/tree/master/docs
  -- About GLSL version:
  -- The 'glsl_version' initialization parameter defaults to "#version 150" if NULL.
  -- Only override if your GL version doesn't handle this GLSL version. Keep NULL if unsure!
  -- IMGUI_IMPL_API

   --type GLFWwindow is null record;   -- incomplete struct
   subtype GLFWwindow is Glfw.Windows.Window;

   --type GLFWmonitor is null record;   -- incomplete struct
   subtype GLFWmonitor is Glfw.Monitors.Monitor;



   function ImGui_ImplGlfw_InitForOpenGL (window : access GLFWwindow; install_callbacks : Extensions.bool) return Extensions.bool
   with Inline;

   function ImGui_ImplGlfw_InitForVulkan (window : access GLFWwindow; install_callbacks : Extensions.bool) return Extensions.bool
   with Inline;

   function ImGui_ImplGlfw_InitForOther  (window : access GLFWwindow; install_callbacks : Extensions.bool) return Extensions.bool
   with Inline;

   procedure ImGui_ImplGlfw_Shutdown  -- imgui_impl_glfw.h:29
   with Import => True,
        Convention => CPP,
        External_Name => "_Z23ImGui_ImplGlfw_Shutdownv";

   procedure ImGui_ImplGlfw_NewFrame  -- imgui_impl_glfw.h:30
   with Import => True,
        Convention => CPP,
        External_Name => "_Z23ImGui_ImplGlfw_NewFramev";

  -- GLFW callbacks (installer)
  -- - When calling Init with 'install_callbacks=true': ImGui_ImplGlfw_InstallCallbacks() is called. GLFW callbacks will be installed for you. They will chain-call user's previously installed callbacks, if any.
  -- - When calling Init with 'install_callbacks=false': GLFW callbacks won't be installed. You will need to call individual function yourself from your own GLFW callbacks.
   procedure ImGui_ImplGlfw_InstallCallbacks (window : access GLFWwindow)  -- imgui_impl_glfw.h:35
   with Import => True,
        Convention => CPP,
        External_Name => "_Z31ImGui_ImplGlfw_InstallCallbacksP10GLFWwindow";

   procedure ImGui_ImplGlfw_RestoreCallbacks (window : access GLFWwindow)  -- imgui_impl_glfw.h:36
   with Import => True,
        Convention => CPP,
        External_Name => "_Z31ImGui_ImplGlfw_RestoreCallbacksP10GLFWwindow";

  -- GLFW callbacks (individual callbacks to call if you didn't install callbacks)
  -- Since 1.84
   procedure ImGui_ImplGlfw_WindowFocusCallback (window : access GLFWwindow; focused : int)  -- imgui_impl_glfw.h:39
   with Import => True,
        Convention => CPP,
        External_Name => "_Z34ImGui_ImplGlfw_WindowFocusCallbackP10GLFWwindowi";

  -- Since 1.84
   procedure ImGui_ImplGlfw_CursorEnterCallback (window : access GLFWwindow; entered : int)  -- imgui_impl_glfw.h:40
   with Import => True,
        Convention => CPP,
        External_Name => "_Z34ImGui_ImplGlfw_CursorEnterCallbackP10GLFWwindowi";

  -- Since 1.87
   procedure ImGui_ImplGlfw_CursorPosCallback
     (window : access GLFWwindow;
      x : double;
      y : double)  -- imgui_impl_glfw.h:41
   with Import => True,
        Convention => CPP,
        External_Name => "_Z32ImGui_ImplGlfw_CursorPosCallbackP10GLFWwindowdd";

   procedure ImGui_ImplGlfw_MouseButtonCallback
     (window : access GLFWwindow;
      button : int;
      action : int;
      mods : int)  -- imgui_impl_glfw.h:42
   with Import => True,
        Convention => CPP,
        External_Name => "_Z34ImGui_ImplGlfw_MouseButtonCallbackP10GLFWwindowiii";

   procedure ImGui_ImplGlfw_ScrollCallback
     (window : access GLFWwindow;
      xoffset : double;
      yoffset : double)  -- imgui_impl_glfw.h:43
   with Import => True,
        Convention => CPP,
        External_Name => "_Z29ImGui_ImplGlfw_ScrollCallbackP10GLFWwindowdd";

   procedure ImGui_ImplGlfw_KeyCallback
     (window : access GLFWwindow;
      key : int;
      scancode : int;
      action : int;
      mods : int)  -- imgui_impl_glfw.h:44
   with Import => True,
        Convention => CPP,
        External_Name => "_Z26ImGui_ImplGlfw_KeyCallbackP10GLFWwindowiiii";

   procedure ImGui_ImplGlfw_CharCallback (window : access GLFWwindow; c : unsigned)  -- imgui_impl_glfw.h:45
   with Import => True,
        Convention => CPP,
        External_Name => "_Z27ImGui_ImplGlfw_CharCallbackP10GLFWwindowj";

   procedure ImGui_ImplGlfw_MonitorCallback (monitor : access GLFWmonitor; event : int)  -- imgui_impl_glfw.h:46
   with Import => True,
        Convention => CPP,
        External_Name => "_Z30ImGui_ImplGlfw_MonitorCallbackP11GLFWmonitori";



private



   function ImGui_ImplGlfw_InitForOpenGL_Raw (window : in System.Address; install_callbacks : Extensions.bool) return Extensions.bool  -- imgui_impl_glfw.h:26
   with Import => True,
        Convention => CPP,
        External_Name => "_Z28ImGui_ImplGlfw_InitForOpenGLP10GLFWwindowb";

   function ImGui_ImplGlfw_InitForVulkan_Raw (window : in System.Address; install_callbacks : Extensions.bool) return Extensions.bool  -- imgui_impl_glfw.h:27
   with Import => True,
        Convention => CPP,
        External_Name => "_Z28ImGui_ImplGlfw_InitForVulkanP10GLFWwindowb";

   function ImGui_ImplGlfw_InitForOther_Raw (window : in System.Address; install_callbacks : Extensions.bool) return Extensions.bool  -- imgui_impl_glfw.h:28
   with Import => True,
        Convention => CPP,
        External_Name => "_Z27ImGui_ImplGlfw_InitForOtherP10GLFWwindowb";



end imgui_impl_glfw_h;
