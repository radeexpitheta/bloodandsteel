function gadget:GetInfo()
	return {
		name = "Point Spawner",
		desc = "populates the map with the points the player has to take",
		author = "KDR_11k (David Becker)",
		date = "2009-03-06",
		license = "Public Domain",
		layer = 1,
		enabled = true
	}
end

local point = UnitDefNames.point.id
local mode = Spring.GetModOptions().pointmode or "metal"

if (gadgetHandler:IsSyncedCode()) then

--SYNCED


--local geovent = FeatureDefNames.geovent.id -- this busts the whole file loading if there is no geovent...



local gaia=Spring.GetGaiaTeamID()
local minDist = math.max(160,Game.extractorRadius)

local spawnList = {}

function gadget:Initialize()
	local i=1
--	if mode == "geovent" then
--		for _,f in ipairs (Spring.GetAllFeatures()) do
--			if Spring.GetFeatureDefID(f)==geovent then
--				local x,y,z = Spring.GetFeaturePosition(f)
--				spawnList[i]={x,y,z}
--				i=i+1
--			end
--		end
	if mode == "metal" then
		--Make sure to favour different corners of the spots in different halves
		local _,baseM = Spring.GetGroundInfo(0,0)
		for y = 0,Game.mapSizeZ/2,16 do
			for x = 0,Game.mapSizeX,16 do
				local _,m = Spring.GetGroundInfo(x,y)
				if m > baseM then
					spawnList[i]={x,0,y}
					i=i+1
				end
			end
		end
		for y = Game.mapSizeZ,Game.mapSizeZ/2,-16 do
			for x = Game.mapSizeX,0,-16 do
				local _,m = Spring.GetGroundInfo(x,y)
				if m > baseM then
					spawnList[i]={x,0,y}
					i=i+1
				end
			end
		end
	end
end

function gadget:GameFrame()
	Spring.Echo("Extractor radius:")
	Spring.Echo(Game.extractorRadius)
	Spring.Echo("minDist, used for Cylinder:")
	Spring.Echo(minDist)

	for _,p in pairs(spawnList) do
		--Spring.Echo("Spot at")
		--Spring.Echo(p[1],p[3])

		if #(Spring.GetUnitsInCylinder(p[1],p[3],minDist)) == 0 then -- well this should be stopping points being created all too close together... -- remove "gaia" - want to check for all units (including ports!)
			Spring.CreateUnit(point,p[1],p[2],p[3],0,gaia)			-- not quite sure what length and relevance minDist has though - need to think that through (problem with the S44 map might be here!)
		--	Spring.Echo("Point spawned at")
		--	Spring.Echo(p[1],p[3])
		end
	end
--	if mode == "geovent" then
--		for _,f in ipairs (Spring.GetAllFeatures()) do
--			if Spring.GetFeatureDefID(f)==geovent then
--				Spring.DestroyFeature(f)
--			end
--		end		not using relics at the moment and just missing this is is the easiest fix till I look into it more
--	end
	gadgetHandler:RemoveGadget()
end

else

--UNSYNCED

return false

end
