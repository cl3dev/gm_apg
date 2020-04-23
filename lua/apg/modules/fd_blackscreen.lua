local fd_tool = "fading_door" -- Name of the tool
hook.Add("CanTool", "apg_noBlackScreen", function(ply, tr, tool)
	if tool ~= fd_tool then return end
	local mat = GetConVarString(fd_tool .. "_mat")
	if !mat then return end
	if !list.Contains("FDoorMaterials", mat) then return false end
end)