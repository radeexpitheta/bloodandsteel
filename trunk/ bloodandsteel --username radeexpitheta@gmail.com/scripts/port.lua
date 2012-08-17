include "constants.lua"

local spGetUnitTeam = Spring.GetUnitTeam
local spGetUnitIsBuilding = Spring.GetUnitIsBuilding 
local spGetUnitHealth = Spring.GetUnitHealth

local base = piece 'base' 
local crane = piece 'crane' 
local port = piece 'port' 
local b1 = piece 'b1' 

--local emitPieces = {piece('emit04', 'emit08', 'emit012')}
local nanoNum = 1

smokePiece = {base}

-- Signal definitions
local SIG_BUILD = 2

--[[local function craneAdjust()
	Signal(SIG_BUILD)
	SetSignalMask(SIG_BUILD)
	local buildee, progress
	while true do
		local buildee = spGetUnitIsBuilding(unitID)
		--Spring.Echo(buildee)
		if buildee then
			progress = select(5, spGetUnitHealth(buildee))
			Move(crane, y_axis, -20 + (40*progress))
			--Spring.Echo(progress)
		else
			progress = 0
			Move(crane, y_axis, -20)
		end
		Sleep(500)
	end
end]]

function script.Activate()
	--StartThread(craneAdjust)
	--[[
	SetUnitValue(YARD_OPEN, 1)	--Tobi said its not necessary
	while GetUnitValue(YARD_OPEN) ~= 1 do
		SetUnitValue(BUGGER_OFF, 1)
		Sleep(1500)
	end
	]]--	
	SetUnitValue(COB.INBUILDSTANCE, 1)
	SetUnitValue(COB.BUGGER_OFF, 0)
end

function script.Deactivate()
	--[[
	SetUnitValue(YARD_OPEN, 1)	--Tobi said its not necessary
	while GetUnitValue(YARD_OPEN) ~= 0 do
		SetUnitValue(BUGGER_OFF, 1)
		Sleep(1500)
	end
	]]--
	Signal(SIG_BUILD)
	SetUnitValue(COB.INBUILDSTANCE, 0)
	SetUnitValue(COB.BUGGER_OFF, 0)
	Move(crane, z_axis, -20)
end


function script.Create()
	StartThread(SmokeUnit)
end

function script.QueryNanoPiece()
	--[[nanoNum = nanoNum + 1
	if nanoNum > 3 then nanoNum = 1 end

	local piece = emitPieces[nanoNum]
	GG.LUPS.QueryNanoPiece(unitID,unitDefID,spGetUnitTeam(unitID),piece)]]
	return b1
end

function script.QueryBuildInfo()
	return b1
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	if severity <= .25 then
		Explode(base, sfxNone)
		Explode(crane, sfxNone)
		return 1
	elseif severity <= .50  then
		Explode(base, sfxNone)
		Explode(crane, sfxNone)
		return 2
	elseif severity <= .99  then
		Explode(base, sfxNone)
		Explode(crane, sfxNone)
		return 2
	else
		Explode(base, sfxNone)
		Explode(crane, sfxNone)
		return 2
	end
end
