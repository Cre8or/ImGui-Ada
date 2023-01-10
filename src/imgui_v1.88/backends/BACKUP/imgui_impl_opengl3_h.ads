pragma Ada_2012;
pragma Style_Checks (Off);

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
with Interfaces.C.Extensions;
limited with cimgui_h;

package imgui_impl_opengl3_h is

  -- dear imgui: Renderer Backend for modern OpenGL with shaders / programmatic pipeline
  -- - Desktop GL: 2.x 3.x 4.x
  -- - Embedded GL: ES 2.0 (WebGL 1.0), ES 3.0 (WebGL 2.0)
  -- This needs to be used along with a Platform Backend (e.g. GLFW, SDL, Win32, custom..)
  -- Implemented features:
  --  [X] Renderer: User texture binding. Use 'GLuint' OpenGL texture identifier as void*/ImTextureID. Read the FAQ about ImTextureID!
  --  [x] Renderer: Desktop GL only: Support for large meshes (64k+ vertices) with 16-bit indices.
  -- You can use unmodified imgui_impl_* files in your project. See examples/ folder for examples of using this.
  -- Prefer including the entire imgui/ repository into your project (either as a copy or as a submodule), and only build the backends you need.
  -- If you are new to Dear ImGui, read documentation from the docs/ folder + read the top of imgui.cpp.
  -- Read online: https://github.com/ocornut/imgui/tree/master/docs
  -- About GLSL version:
  --  The 'glsl_version' initialization parameter should be NULL (default) or a "#version XXX" string.
  --  On computer platform the GLSL version default to "#version 130". On OpenGL ES 3 platform it defaults to "#version 300 es"
  --  Only override if your GL version doesn't handle this GLSL version. See GLSL version table at the top of imgui_impl_opengl3.cpp.
  -- IMGUI_IMPL_API
  -- Backend API

   C_Default_GLSL_Version : constant Interfaces.C.Strings.chars_ptr := Interfaces.C.Strings.Null_Ptr;



   function ImGui_ImplOpenGL3_Init (glsl_version : Interfaces.C.Strings.chars_ptr) return Extensions.bool  -- imgui_impl_opengl3.h:24
   with Import => True,
        Convention => CPP,
        External_Name => "_Z22ImGui_ImplOpenGL3_InitPKc";

   procedure ImGui_ImplOpenGL3_Shutdown  -- imgui_impl_opengl3.h:25
   with Import => True,
        Convention => CPP,
        External_Name => "_Z26ImGui_ImplOpenGL3_Shutdownv";

   procedure ImGui_ImplOpenGL3_NewFrame  -- imgui_impl_opengl3.h:26
   with Import => True,
        Convention => CPP,
        External_Name => "_Z26ImGui_ImplOpenGL3_NewFramev";

   --procedure ImGui_ImplOpenGL3_RenderDrawData (draw_data : access imgui_h.Class_ImDrawData.ImDrawData)  -- imgui_impl_opengl3.h:27
   procedure ImGui_ImplOpenGL3_RenderDrawData (draw_data : access cimgui_h.ImDrawData)  -- imgui_impl_opengl3.h:27
   with Import => True,
        Convention => CPP,
        External_Name => "_Z32ImGui_ImplOpenGL3_RenderDrawDataP10ImDrawData";

  -- (Optional) Called by Init/NewFrame/Shutdown
   function ImGui_ImplOpenGL3_CreateFontsTexture return Extensions.bool  -- imgui_impl_opengl3.h:30
   with Import => True,
        Convention => CPP,
        External_Name => "_Z36ImGui_ImplOpenGL3_CreateFontsTexturev";

   procedure ImGui_ImplOpenGL3_DestroyFontsTexture  -- imgui_impl_opengl3.h:31
   with Import => True,
        Convention => CPP,
        External_Name => "_Z37ImGui_ImplOpenGL3_DestroyFontsTexturev";

   function ImGui_ImplOpenGL3_CreateDeviceObjects return Extensions.bool  -- imgui_impl_opengl3.h:32
   with Import => True,
        Convention => CPP,
        External_Name => "_Z37ImGui_ImplOpenGL3_CreateDeviceObjectsv";

   procedure ImGui_ImplOpenGL3_DestroyDeviceObjects  -- imgui_impl_opengl3.h:33
   with Import => True,
        Convention => CPP,
        External_Name => "_Z38ImGui_ImplOpenGL3_DestroyDeviceObjectsv";

  -- Specific OpenGL ES versions
  --#define IMGUI_IMPL_OPENGL_ES2     // Auto-detected on Emscripten
  --#define IMGUI_IMPL_OPENGL_ES3     // Auto-detected on iOS/Android
  -- You can explicitly select GLES2 or GLES3 API by using one of the '#define IMGUI_IMPL_OPENGL_LOADER_XXX' in imconfig.h or compiler command-line.
  -- Try to detect GLES on matching platforms
  -- Otherwise imgui_impl_opengl3_loader.h will be used.
end imgui_impl_opengl3_h;
