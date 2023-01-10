pragma License( Modified_GPL );





private with Dear_ImGui.API;
with Dear_ImGui.Inputs;



pragma Elaborate( Dear_ImGui.API );
pragma Elaborate( Dear_ImGui.Inputs );





package Dear_ImGui.Context is



   -- Types
	type T_ImGuiContext is tagged limited private;

		-- Primitives
		------------------------------------------------------------------------------------------------------------------------
		-- Returns an access to the context's IO record.
		------------------------------------------------------------------------------------------------------------------------
		function Get_IO(Context : in out T_ImGuiContext) return Dear_ImGui.Inputs.T_ImGuiIO
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		-- Returns true if the given context is initialised, otherwise false.
		------------------------------------------------------------------------------------------------------------------------
		function Is_Initialised(Context : in T_ImGuiContext) return Boolean
		with Inline;



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Creates the main ImGui context. Use this if you don't need to directly interact with the context object.
	-- Analogous to ImGui::CreateContext.
	------------------------------------------------------------------------------------------------------------------------
	procedure Initialise
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Creates the ImGui context and stores it in the given variable.
	-- Analogous to ImGui::CreateContext.
	------------------------------------------------------------------------------------------------------------------------
	procedure Initialise(Context : out T_ImGuiContext)
	with Inline;

	------------------------------------------------------------------------------------------------------------------------
	-- Destroys the main ImGui context.
	-- Analogous to ImGui::DestroyContext.
	------------------------------------------------------------------------------------------------------------------------
	procedure Destroy
	with Inline;

	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	-- Destroys the given ImGui context.
	-- Analogous to ImGui::DestroyContext.
	------------------------------------------------------------------------------------------------------------------------
	procedure Destroy(Context : in out T_ImGuiContext)
	with Inline;



private



	-- Types
	type T_ImGuiContext is tagged limited record
		m_Internal : access Dear_ImGui.API.ImGuiContext;
	end record;



	-- Variables
	G_Main_Context : T_ImGuiContext;



end Dear_ImGui.Context;
