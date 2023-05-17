pragma License (Modified_GPL);





with Dear_ImGui.API;
with Dear_ImGui.Backend_Glfw;
with Dear_ImGui.Backend_OpenGL3;
with Dear_ImGui.Context;
with Dear_ImGui.Drawing;
with Dear_ImGui.Inputs;
with Dear_ImGui.Types;



pragma Elaborate_All (Dear_ImGui.API);
pragma Elaborate_All (Dear_ImGui.Backend_Glfw);
pragma Elaborate_All (Dear_ImGui.Backend_OpenGL3);
pragma Elaborate_All (Dear_ImGui.Context);
pragma Elaborate_All (Dear_ImGui.Drawing);
pragma Elaborate_All (Dear_ImGui.Inputs);
pragma Elaborate_All (Dear_ImGui.Types);





generic

	type T_Float is digits <>;

package Generic_ImGui is



	-- Packages
	package IG is new Dear_ImGui (T_Float);

	package API             is new IG.API;
	package Types           is new IG.Types;

	package Backend_Glfw    is new IG.Backend_Glfw;
	package Backend_OpenGL3 is new IG.Backend_OpenGL3 (API);
	package Inputs          is new IG.Inputs  (API, Types);
	package Context         is new IG.Context (API, Inputs);
	package Drawing         is new IG.Drawing (API, Types);



end Generic_ImGui;
