function gadget:GetInfo()
	return {
		name      = "Kill Builder",
		desc      = "Kills Builders of Defences",
		author    = "bobtheimpatient",
		date      = "17 Jan 2011",
		license   = "LGPL v2",
		layer     = 0,
		enabled   = true
	}
end

local spGetUnitDefID    = Spring.GetUnitDefID
local spGetUnitPosition = Spring.GetUnitPosition
local killTable = {}

local blutub = UnitDefNames.blutub.id
local gendr = UnitDefNames.gendr.id

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if gadgetHandler:IsSyncedCode() then
----- SYNCED -----

function gadget:UnitCreated(unitID, unitDefID, teamID, builderID)
local udef = UnitDefs[unitDefID]	
local builderDefID = spGetUnitDefID(builderID)
Spring.Echo(unitDefID..", "..unitID.." created from builder "..builderDefID..", "..builderID)
	if ((unitDefID == "gendr") and (builderDefID == "blutub")) then	 
		killTable[f][builderID] = true
	end
end	

function gadget:GameFrame(f)
    if killTable[f] then
        for unitID,_ in pairs(killTable[f]) do
            if Spring.IsValidUnit(unitID) then
                Spring.DestroyUnit(unitID, false, true)
            end
           -- killTableByUnitID[unitID] = nil
        end
        killTable[f] = nil
    end
end

function gadget:UnitDestroyed(unitID)
    if killTableByUnitID[unitID] then
        killTable[killTableByUnitID[unitID]][unitID] = nil
        killTableByUnitID[unitID] = nil
    end

else
--UNSYNCED




end
--------------------------------------------------------------------------------