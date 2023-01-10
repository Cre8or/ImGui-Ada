pragma License( Modified_GPL );





package body Dear_ImGui.Context is



	-- Primitives
	------------------------------------------------------------------------------------------------------------------------
	-- T_ImGuiContext
	------------------------------------------------------------------------------------------------------------------------
	function Get_IO(Context : in out T_ImGuiContext) return Dear_ImGui.Inputs.T_ImGuiIO is
	begin

		return (
			m_IO => Context.m_Internal.IO'Access
		);

	end Get_IO;

	------------------------------------------------------------------------------------------------------------------------
	function Is_Initialised(Context : in T_ImGuiContext) return Boolean is
	begin

		return (Context.m_Internal /= null);

	end Is_Initialised;



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	procedure Initialise is
	begin

		if G_Main_Context.m_Internal /= null then
			raise EX_CONTEXT_ALREADY_CREATED;
		end if;

		Initialise( G_Main_Context );

	end Initialise;

	------------------------------------------------------------------------------------------------------------------------
	procedure Initialise(Context : out T_ImGuiContext) is
	begin

		Context.m_Internal := Dear_ImGui.API.igCreateContext;

	end Initialise;

	------------------------------------------------------------------------------------------------------------------------
	procedure Destroy is
	begin

		Destroy( G_Main_Context );

	end Destroy;

	------------------------------------------------------------------------------------------------------------------------
	procedure Destroy(Context : in out T_ImGuiContext) is
	begin

		if Context.m_Internal = null then
			raise EX_NO_CONTEXT_FOUND;
		end if;

		Dear_ImGui.API.igDestroyContext( Context.m_Internal );

		Context.m_Internal := null;

	end Destroy;



end Dear_ImGui.Context;
