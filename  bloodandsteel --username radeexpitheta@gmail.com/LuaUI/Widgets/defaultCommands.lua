function widget:GetInfo()
	return {
		name = "Default Commands",
		desc = "Allows using the rightclick for some commands",
		author = "KDR_11k (David Becker)",
		date = "2009-03-06",
		license = "Public Domain",
		layer = 1,
		enabled = true
	}
end

local CMD_TAKE = 30001
local CMD_RALLY= 30002

local point = UnitDefNames.point.id
local gaia = Spring.GetGaiaTeamID()
local base = {
	[UnitDefNames.base.id]=true,
	--[UnitDefNames.redbase.id]=true
}

function widget:DefaultCommand()
	local mx,my=Spring.GetMouseState()
	local s,t =Spring.TraceScreenRay(mx,my)
	if s == "unit" then
		if Spring.GetUnitDefID(t) == point and Spring.GetUnitTeam(t) == gaia then
			return CMD_TAKE
		end
	end
	if Spring.GetSelectedUnits()[1] and base[Spring.GetUnitDefID(Spring.GetSelectedUnits()[1])] then
		return CMD_RALLY
	end
end


