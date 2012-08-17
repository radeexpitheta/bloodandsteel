function gadget:GetInfo()
	return {
		name = "Points",
		desc = "The points you have to capture",
		author = "KDR_11k (David Becker)",
		date = "2009-03-05",
		license = "Public Domain",
		layer = 5,
		enabled = true
	}
end

local CMD_TAKE = 30001

local CMD_UNTAKE = 30101

local takeDist=20 --Distance at which the unit will do the taking

local exempt = {
	[UnitDefNames.point.id]=true,
	[UnitDefNames.relic.id]=true,
}

if (gadgetHandler:IsSyncedCode()) then

--SYNCED

local cmdTakeDesc={
	name="Capture Point",
	tooltip="Send one unit into the point to take control of it.\n"..
			"The unit will remain in the point but can be removed",
	id=CMD_TAKE,
	type=CMDTYPE.ICON_UNIT,
	action="capture",
	cursor="Capture",
}


local cmdUntakeDesc={
	name="Release Point",
	tooltip="Give up the point.",
	id=CMD_UNTAKE,
	type=CMDTYPE.ICON,
--	action="move",
--	cursor="Move",
}

local capturers={
    [UnitDefNames.bluii.id]=true,
	[UnitDefNames.bluia.id]=true, 
	[UnitDefNames.bluir.id]=true, 
	[UnitDefNames.bluiv.id]=true, 
	[UnitDefNames.bluid.id]=true, 
	
}

local bases = {
	[UnitDefNames.base.id]=true,
	--[UnitDefNames.redbase.id]=true,
}

local gaia = Spring.GetGaiaTeamID()
local point = UnitDefNames.point.id

local mgList={}
local transferList={}
local stopList={}

local takers={}
local taken={}

local destroyList={}

_G.pointCountTotal=0
GG.takers=takers

local function Take(taker, ud, team, target)
	takers[taker]=target
	taken[target]=true
	transferList[target]=team
	stopList[taker]=true
	--Spring.Echo("Point taken!")
	Spring.RemoveUnitCmdDesc(taker,cmdTakeDesc)
	Spring.InsertUnitCmdDesc(taker,cmdUntakeDesc)
	
Spring.MoveCtrl.Enable(taker)
local x,y,z=Spring.GetUnitBasePosition(target)    -- doesn't need to beam in the middle, does it ? (or is it not clear enough otherwise ?
Spring.MoveCtrl.SetPosition(taker,x,y,z)          -- the problem with disabling this (in conjunction with not "stopping" units) is that they move to get out of the way of others
--	GG.RemoveSquadUnit(taker, ud, team)           -- this also needs to go - ya, probably, because it still counts as squad of one... doh?
--	Spring.SetUnitNoSelect(taker,true)           we want the unit to still be selectable. But will this work cleanly ?
end

local function Untake(unitID, ud, team)
	Spring.RemoveUnitCmdDesc(unitID,cmdUntakeDesc)
	Spring.InsertUnitCmdDesc(unitID,cmdTakeDesc)
	
	Spring.MoveCtrl.Enable(unitID)
	local x,y,z=Spring.GetUnitBasePosition(takers[unitID])
	Spring.MoveCtrl.SetPosition(unitID,x,y,z-80)
	Spring.MoveCtrl.Disable(unitID) -- need to switch off so they can move again ?
	taken[takers[unitID]]=nil
	transferList[takers[unitID]]=gaia    -- why do I get the time lag with the point disapearing in between ?
	takers[unitID]=nil            -- hmm as I'm setting this to nil, why does it seem to me that the check above is still running?  maybe it even takes nil...
end



function gadget:UnitCreated(u,ud,team)
	if capturers[ud] then
		Spring.InsertUnitCmdDesc(u,cmdTakeDesc)
	end
	if ud == point then
		Spring.SetUnitNoSelect(u,true)
		Spring.SetUnitAlwaysVisible(u,true)
		_G.pointCountTotal = _G.pointCountTotal + 1
	end
end

function gadget:UnitDestroyed(u,ud,team)
	if takers[u] then
		taken[takers[u]]=nil
		transferList[takers[u]]=gaia    -- right the point goes to the player before, but needs to go back to gaia if the taker is destroyed
		takers[u]=nil
	end
	if bases[ud] then
		destroyList[team]=true
	end
end

function gadget:AllowCommand(u, ud, team, cmd, param, opt)
	if cmd == CMD_TAKE then
		if (takers[u] ~= nil) then        -- so I don't get the weird movement allowed behaviour - might just add to the long list of ands below ?
			return false
		end
		if capturers[ud] and param[1] and Spring.GetUnitDefID(param[1])==point and Spring.GetUnitTeam(param[1])==gaia then
			return true       --hmm does this allow units to take a capture command, even when they already captured ?
		else
			return false
		end
	end
	if ud == point then
		return false
	end
	if (takers[u] ~= nil) then           --  list those I don't allow.
		if (cmd == CMD.MOVE or cmd == CMD.ATTACK or cmd == CMD.PATROL or cmd == CMD.FIGHT or cmd == CMD.GUARD) then       -- this as config would be good I think - for ease of use for bob
			return false                                  -- might allow some through and modify how they apply - like allowing rotation through CMD.MOVE, selection of targets through CMD.ATTACK
		else
			return true         
		end
	end
	return true
end

function gadget:CommandFallback(u,ud,team,cmd,param,opt)
	if cmd == CMD_TAKE then
	    -- Spring.Echo("Take order in use")
		if Spring.GetUnitTeam(param[1]) ~= gaia or taken[param[1]] then
			-- Spring.Echo("too late")
			return true,true --the target was already taken before we got to it
		end
		if Spring.GetUnitSeparation(u, param[1]) <= takeDist then
			Take(u, ud, team, param[1])
			--Spring.GiveOrderToUnit(u,CMD.STOP,{},{})    -- using this just so it checks on the AllowCommands bit - very hacky I know...
                                        -- so if I give an order here, and it's checked for immediately in Allcommand, it crashes ?
                                        -- I would say maybe it crashes in any case, but when I was just allowing CMD_UNTAKE it wasn't... (but then it was blocking this) Probably bad to do it here immediately - perhaps could have guessed that from KDR passing everything on to Gameframe :P
                                        
			return true, true          -- need to allow units to do other stuff after having taken      -- so Take should be called just the once and thats it, no ?
		else
			local x,y,z=Spring.GetUnitPosition(param[1])
			mgList[u]={x,y,z,takeDist*.5}
			--Spring.Echo("move, move")
			return true, false
		end
	end
	if cmd == CMD_UNTAKE then
	    Untake(u, ud, team)
		return true,true
			
--	    if Spring.GetUnitSeparation(u, takers[u]) <= takeDist then
--		end
	end
	return false
end

function gadget:GameFrame()
	for u,d in pairs(mgList) do
		Spring.SetUnitMoveGoal(u,d[1],d[2],d[3],d[4])
		mgList[u]=nil
		--Spring.Echo("any move orders?")
	end
	for u,t in pairs(transferList) do
		Spring.TransferUnit(u,t,false)   -- why is my giving back still glitchy...
		transferList[u]=nil                     
	end
	for u,_ in pairs(stopList) do
		Spring.GiveOrderToUnit(u,CMD.STOP,{},{})           --we want them to still be able to do stuff, right ?
		stopList[u]=nil                                    -- ah, but it was only once ! So it hurt us to remove this really, as it made the error to drive on if it already had a command que - learnt some things about where you can make calls from, and where not though :P
	end
	for t,_ in pairs(destroyList) do
		for _,u in ipairs (Spring.GetTeamUnits(t)) do
			if not exempt[Spring.GetUnitDefID(u)] then
				Spring.DestroyUnit(u)
			end
		end
	end
end


else

--UNSYNCED
function gadget:Initialize()
 	Spring.SetCustomCommandDrawData(CMD_TAKE,"Capture",{1,1,.2,1})
-- 	Spring.SetCustomCommandDrawData(CMD_UNTAKE,"Move",{1,1,.2,1})         not queable so shouldn't need
end

end
