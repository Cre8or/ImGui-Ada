pragma License (Modified_GPL);





with Dear_ImGui.API;



pragma Elaborate (Dear_ImGui.API);





generic

	with package P_API is new Dear_ImGui.API; -- Needed to return the draw data

package Dear_ImGui.Drawing is



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Begins a new frame. ImGui subprograms may be called afterwards for the duration of the frame.
	-- Analogous to ImGui::NewFrame.
	------------------------------------------------------------------------------------------------------------------------
	procedure Begin_Frame;

	------------------------------------------------------------------------------------------------------------------------
	-- Renders the contents of the previous frame.
	-- Analogous to ImGui::Render.
	------------------------------------------------------------------------------------------------------------------------
	procedure Render;

	------------------------------------------------------------------------------------------------------------------------
	-- Returns the current draw data to be displayed. Should be called after Render.
	-- Analogous to ImGui::GetDrawData.
	------------------------------------------------------------------------------------------------------------------------
	function Get_Draw_Data return access P_API.ImDrawData;



private



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	procedure API_NewFrame
	with Import, Convention => C, External_Name => "igNewFrame";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_Render
	with Import, Convention => C, External_Name => "igRender";

	------------------------------------------------------------------------------------------------------------------------
	function API_GetDrawData return access P_API.ImDrawData
	with Import, Convention => C, External_Name => "igGetDrawData";



	-- Renames
	procedure Begin_Frame renames API_NewFrame;

	function Get_Draw_Data return access P_API.ImDrawData renames API_GetDrawData;



end Dear_ImGui.Drawing;
