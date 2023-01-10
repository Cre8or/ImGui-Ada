package body imgui_impl_glfw_h is



   function ImGui_ImplGlfw_InitForOpenGL (window : access GLFWwindow; install_callbacks : Extensions.bool) return Extensions.bool is
   begin

      return ImGui_ImplGlfw_InitForOpenGL_Raw( Window.Get_Unsafe_Window_Address, install_callbacks );

   end ImGui_ImplGlfw_InitForOpenGL;

   function ImGui_ImplGlfw_InitForVulkan (window : access GLFWwindow; install_callbacks : Extensions.bool) return Extensions.bool is
   begin

      return ImGui_ImplGlfw_InitForVulkan_Raw( Window.Get_Unsafe_Window_Address, install_callbacks );

   end ImGui_ImplGlfw_InitForVulkan;

   function ImGui_ImplGlfw_InitForOther  (window : access GLFWwindow; install_callbacks : Extensions.bool) return Extensions.bool is
   begin

      return ImGui_ImplGlfw_InitForOther_Raw( Window.Get_Unsafe_Window_Address, install_callbacks );

   end ImGui_ImplGlfw_InitForOther;



end imgui_impl_glfw_h;
