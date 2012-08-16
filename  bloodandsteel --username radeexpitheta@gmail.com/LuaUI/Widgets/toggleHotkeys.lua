function widget:GetInfo()
	return {
		name = "toggle Hotkeys",
		desc = "Add a hotkey for the toggle command",
		author = "Sean Heron",
		date = "15. September 2009",
		license = "GNU GPL v2 or later",
		layer = 1,
		enabled = true
	}
end

local CMD_TOGGLE=35951
local vpressed = false
local npressed = false

function widget:Update()
    if (Spring.GetKeyState(0x076) == true and vpressed == false) then     -- get if v is pressed or not
       vpressed = true
--       Spring.Echo("pressed v")
       local selectedunits = Spring.GetSelectedUnits()
       for _,unitID in pairs(selectedunits) do
	   		Spring.GiveOrderToUnit(unitID,CMD_TOGGLE,{1},{}) -- works fine !     toggle on -- would be nice to have toggle of and on on one key, but haven't figured out how to query the state yet.
--	   		Spring.Echo(unitID)
       end
	end
	if (Spring.GetKeyState(0x076) == false) then    -- or do I just check if it's nil ?
	    vpressed = false
	end
	
	
    if (Spring.GetKeyState(0x06E) == true and npressed == false) then     -- for n
	   	npressed = true
--	   	Spring.Echo("pressed n")
	   	local selectedunits = Spring.GetSelectedUnits()
	   	for _,unitID in pairs(selectedunits) do
	   		Spring.GiveOrderToUnit(unitID,CMD_TOGGLE,{0},{}) -- toggle off
--	   		Spring.Echo(unitID)
	   	end
	end
	if (Spring.GetKeyState(0x076) == false) then    -- or do I just check if it's nil ?
	    npressed = false
	end

end


