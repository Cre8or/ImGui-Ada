pragma License (Modified_GPL);





with Dear_ImGui.API;
with Dear_ImGui.Inputs;



pragma Elaborate (Dear_ImGui.API);
pragma Elaborate (Dear_ImGui.Inputs);





generic

	with package P_API    is new Dear_ImGui.API;
	with package P_Inputs is new Dear_ImGui.Inputs (P_API, <>);

package Dear_ImGui.Contexts is



   -- Types
	type T_ImGuiContext is tagged limited private;

		-- Primitives
		------------------------------------------------------------------------------------------------------------------------
		-- Returns an access to the context's IO record.
		------------------------------------------------------------------------------------------------------------------------
		function Get_IO (Context : in out T_ImGuiContext) return P_Inputs.T_ImGuiIO
		with Inline;

		------------------------------------------------------------------------------------------------------------------------
		-- Returns true if the given context is initialised, otherwise false.
		------------------------------------------------------------------------------------------------------------------------
		function Is_Initialised (Context : in T_ImGuiContext) return Boolean
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
	procedure Initialise (Context : out T_ImGuiContext)
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
	procedure Destroy (Context : in out T_ImGuiContext)
	with Inline;



private



	-- Types
	type T_ImGuiContext is tagged limited record
		m_Internal : access P_API.ImGuiContext;
	end record;



	-- Specifications
	------------------------------------------------------------------------------------------------------------------------
	function API_CreateContext (Shared_Font_Atlas : access P_API.ImFontAtlas := null) return access P_API.ImGuiContext
	with Import, Convention => C, External_Name => "igCreateContext";

	------------------------------------------------------------------------------------------------------------------------
	procedure API_DestroyContext (Context : access P_API.ImGuiContext)
	with Import, Convention => C, External_Name => "igDestroyContext";



	-- Variables
	G_Main_Context : T_ImGuiContext;



end Dear_ImGui.Contexts;
