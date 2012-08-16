function widget:GetInfo()
	return {
			name	= "Print Stats",
			desc	= "Print the stats of (some) units",
			author	= "zwzsg",
			date	= "August 2010",
			license	= "Free",
			layer	= 0,
			enabled	= false,
		}
end


local UnitsToPrint={"megabit","megabug","megapacket"}

function widget:Initialize()
	for n,ud in pairs(UnitDefs) do
		for _,utpn in ipairs(UnitsToPrint) do
			Spring.Echo(string.upper(ud.name)..":")
			--[[if string.lower(utpn)==string.lower(ud.name) then
				Spring.Echo("====================")
				Spring.Echo(string.upper(ud.name)..":")
				Spring.Echo("--------------------")
				for k,v in ud:pairs() do
					Spring.Echo(tostring(k).." = "..tostring(v))
				end
				Spring.Echo("====================")
			end]]
		end
	end
	widgetHandler:RemoveWidget()
end