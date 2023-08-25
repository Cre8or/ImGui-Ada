pragma License (Modified_GPL);





with Dear_ImGui.API;
with Dear_ImGui.Backend_Glfw;
with Dear_ImGui.Backend_OpenGL3;
with Dear_ImGui.Contexts;
with Dear_ImGui.Drawing;
with Dear_ImGui.Inputs;
with Dear_ImGui.Types;
with Dear_ImGui.Widgets;
with Dear_ImGui.Windows;


generic

	type T_Float is digits <>;

package Generic_ImGui is



	-- Packages
	package IG is new Dear_ImGui (T_Float);

	package API             is new IG.API;
	package Types           is new IG.Types;

	package Backend_Glfw    is new IG.Backend_Glfw;
	package Backend_OpenGL3 is new IG.Backend_OpenGL3 (API);
	package Drawing         is new IG.Drawing (API);
	package Inputs          is new IG.Inputs  (API, Types);

	package Contexts        is new IG.Contexts (API, Inputs);
	package Widgets         is new IG.Widgets  (Types);
	package Windows         is new IG.Windows  (Types);



end Generic_ImGui;
