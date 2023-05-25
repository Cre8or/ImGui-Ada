pragma License (Modified_GPL);





package body Dear_ImGui.Drawing is



	-- Bodies
	------------------------------------------------------------------------------------------------------------------------
	procedure Render is
	begin

		if G_Window_Count > 0 then
			raise EX_WINDOW_STILL_ACTIVE;
		end if;

		API_Render;

	end Render;



end Dear_ImGui.Drawing;
