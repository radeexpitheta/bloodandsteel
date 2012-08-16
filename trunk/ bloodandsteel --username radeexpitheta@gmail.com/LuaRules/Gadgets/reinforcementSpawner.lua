function gadget:GetInfo()
	return {
		name = "reinforcementSpawner",
		desc = "Reinforcement spawner for Blood and Steel",
		author = "KDR_11k (David Becker) - modified by Sean Heron",
		date = "2009-03-05",
		license = "GNU General Public Licence v2 or later",
		layer = 20,
		enabled = true
	}
end

local maxCharge=200 --was120 
local startCharge=100 --was90
local pointCharge=.1 --was .2

local blutub=UnitDefNames.blutub.id
local bluii=UnitDefNames.bluii.id
local bluir=UnitDefNames.bluir.id
local bluid=UnitDefNames.bluid.id
local bluiv=UnitDefNames.bluiv.id
local bluia=UnitDefNames.bluia.id

local bluvr=UnitDefNames.bluvr.id
local bluvi=UnitDefNames.bluvi.id
local bluvv=UnitDefNames.bluvv.id
local bluvd=UnitDefNames.bluvd.id
local bluva=UnitDefNames.bluva.id

local bluar=UnitDefNames.bluar.id
local bluaa=UnitDefNames.bluaa.id
local bluai=UnitDefNames.bluai.id
local bluav=UnitDefNames.bluav.id
local bluad=UnitDefNames.bluad.id

local gentub=UnitDefNames.gentub.id

--rename below later
local base = UnitDefNames.base.id
local point = UnitDefNames.point.id
local port = UnitDefNames.port.id

local CMD_RALLY=30002

local bases= {
	[base]=1.0,
	[port]=1.0,
	--[redbase]=1.0,
}

local unitCounts= {
	[base]={
		--blue
		[bluvr]=0,
		[bluvi]=0,
		[bluvv]=0,
		[bluvd]=0,	   
		[bluva]=0,
		[blutub]=0,
		[bluii]=0,
        [bluir]=0,	   
		[bluid]=0,	   			   
		[bluiv]=0,	   
		[bluia]=0,	   
		[bluar]=0,
        [bluaa]=0,
		[bluai]=0,	   
		[bluav]=0,	   
		[bluad]=0,	   
	},
	
	[port]={
		[gentub] = 0,
	}
	--[redbase]={     -- no second side yet
	--},
}
local wavesize = 8 -- how many units are spawned each wave



local unitWeights= {      -- Only integers should be used for the weights (not tried with floats - the sum is calculated elsewhere, so just set the relations at values your happy with.

    [bluir]=10,	   
	[bluid]=11,	   
	[bluii]=13,	   
	[bluiv]=10,	   
	[bluia]=10,   
	[blutub]=10,	   
	[bluvr]=6,	   
	[bluvi]=5,
	[bluvd]=4,	   
	[bluva]=4,	 	   
	[bluvv]=4,	   
	[bluar]=4,	   
	[bluai]=3,	   
	[bluav]=2,	   
	[bluad]=1,	   
	[bluaa]=1,	
	
	--naval units for port
	--[navr]=10,	 
	[gentub]=6,
	--[navv]=6,
	--[nava]=3,
	--[navd]=1,
}




local sum1 = 0
local sum2 = 0

for ud,_ in pairs(unitCounts[base]) do                              -- oh I idiot - trying to access the table with "base" when of course base is UnitdefName. ... doh!
	sum1 = sum1 + unitWeights[ud]
end
--for ud,_ in pairs(unitCounts[redbase]) do
--	sum2 = sum2 + unitWeights[ud]
--end




local weightSums = {    --calculated, and used to make sure the random function knows the full range without having to set it by hand
	[base]=sum1,
	--[redbase]=sum2,
}


-- not really used - just carrying this along as too lazy to remove at the moment (and rewriting may be easier)
local squadSize= {
	[blutub]=0,
	[bluii]=0,
	[bluvr]=0,
	[bluvi]=0,
	[bluvv]=0,
	[bluar]=0,
	[bluaa]=0,
	[bluir]=0,
	[bluid]=0,
	[bluiv]=0,
	[bluia]=0,
	[bluvd]=0,
	[bluva]=0,
	[bluai]=0,
	[bluav]=0,
	[bluad]=0,

}




if (gadgetHandler:IsSyncedCode()) then

--SYNCED

local refTimers={}
local squads
local rallyPoints={}

local rallyCmd={
	name="Rallypoint",
	tooltip="Define the location where new squads will move after being built",
	action="move",
	id=CMD_RALLY,
	type=CMDTYPE.ICON_MAP,
	cursor="Move",
}

function gadget:UnitCreated(u, ud, team)
	if bases[ud] then
		refTimers[u]=startCharge
		local x,y,z=Spring.GetUnitBasePosition(u)
		rallyPoints[u]={x,y,z+200}
		Spring.InsertUnitCmdDesc(u,rallyCmd)
	end
end

function gadget:UnitDestroyed(u,ud,team)
	if bases[ud] then
		refTimers[u]=nil
	end
end

function gadget:AllowCommand(u, ud, team, cmd, param, opt)
	if cmd == CMD_RALLY then
		if rallyPoints[u] and param[3] then
			rallyPoints[u] = param
		end
		return false
	end
	return true
end

local function Reinforce(team,from)
	local sx,sy,sz = Spring.GetUnitBasePosition(from)
	local basetype=Spring.GetUnitDefID(from)
	-- sz=sz+16    -- this was only because Cuberor base had it's spawn slightly below middle
	
	-- okay, our random draft comes here
	-- Fill the numbers in the structure I'm still using:
	local counts={}

	for i =1, wavesize do
	    local unitroll = math.random(weightSums[basetype])        -- our unitweights have to add up to a hundred for now - think of them as percentages
	    local oldsum = 0 -- ah, but does this get set back - yes, should do, it runs the whole thing through again
	
		for ud,_ in pairs(unitCounts[basetype]) do
			if counts[ud] == nil then        -- make sure we have values for everything, without deleting the numbers we alread have...
				counts[ud]= 0
			end                             -- somewhere here (or hereafter perhaps better possible), we set how many of which units spawned
			if unitroll <= (unitWeights[ud] + oldsum) then
			    counts[ud] = counts[ud] + 1
			    oldsum = -weightSums[basetype] - 100    -- this is a hack - so that if the roll applies here, it won't get counted elsewhere - would be cleaner to just end the for here, (hmm, but need to make sure all have values (or catch nil later) )
   			else
			oldsum = oldsum + unitWeights[ud]  -- or does this work as += ?   -- ah in this case we need to take care about units with a value of 0... hmm, we need to end the function anyhow when the criteria is first fulfilled, as of course it's smaller than the others as well then!
			end
		end
	end                      -- should work - fingers crossed !        Woot! that was the fastest and neatest piece of code I've come up with so far, I think :P!


--	for u,d in pairs(squads) do                             -- this is the part that did the "reinforcements" behaviour (ie filling up squads with members they'd lost)
--		if Spring.GetUnitTeam(u)==team then                 -- if this was wanted again, we'd need to uncomment here - but probably also fix up below, because I'm using counts for something quite differen then it was originally used for.
--			local ud = d.type
--			counts[ud]=(counts[ud] or 0)+1
--			for i = 1,squadSize[ud] do
--				if not d.followers[i] then
--					local nu = Spring.CreateUnit(ud,sx+i+math.random(40)-20,sy,sz+math.random(40)-20,0,team)
--					if nu then
--						GG.AddSquadUnitAt(nu,i,u)
--					end
--				end
--			end
--		end
--	end
--	for ud,_ in pairs(counts) do
--		counts[blutub]=5                Lets try the other way first, eh ?
--	end
--	counts[blutub]=5           -- access like this not possible if I remember - altogether this is not a clean way of doing things, seeing that we have a different goalin mind, but whatever
	for ud,c in pairs(counts) do
		if (c > 0) then                     -- flip around the meaning of counts - now the counter for how many should be built, not the limit!
   			for i = -c, -1 do                -- hack away, oh let us hack away
				local nl
				if (math.random() > 0.5) then                    -- 50/50 chance for units to spawn on the edges
					nl = Spring.CreateUnit(ud,sx+math.random(80)-40,sy,sz+math.random(2)*110-165,0,team)        -- why aren't they moving anymore... cause my local is local to the if clause, idiot
					--Spring.Echo(math.random(2))
				else
				    nl = Spring.CreateUnit(ud,sx+math.random(2)*80-120,sy,sz+math.random(110)-55,0,team)
				end
				if nl then
					local fol = {}
					for i = 1,squadSize[ud] do                                                     -- this might be acting weird - as we don't use it and I messed around above...
						fol[i]=Spring.CreateUnit(ud,sx+i+math.random(40)-20,sy,sz+math.random(40)-20,0,team)
					end
					GG.RegisterSquad(ud,nl,fol)
					local phi = math.random()*6.284
					local dist = math.random(100)
					Spring.GiveOrderToUnit(nl,CMD.MOVE,{rallyPoints[from][1] + math.cos(phi)*dist,rallyPoints[from][2],rallyPoints[from][3] + math.sin(phi)*dist},{})
				end
			end
		end
	end
end

function gadget:GameFrame(f)
	if f==5 then
		for u,_ in pairs(refTimers) do
			local team = Spring.GetUnitTeam(u)
			Reinforce(team,u)
		end
	end
	if f%30 < .1 then
		for b,tm in pairs (refTimers) do
			local team = Spring.GetUnitTeam(b)
			local ud = Spring.GetUnitDefID(b)
			tm = tm + bases[ud] + pointCharge * Spring.GetTeamUnitDefCount(team,point)
			if tm >= maxCharge then
				refTimers[b]=0
				Reinforce(team,b)
			else
				refTimers[b]=tm
			end
		end
	end
end

function gadget.Initialize()
	squads=GG.squads
	_G.refTimers=refTimers
	_G.rallyPoints=rallyPoints
end

else
--UNSYNCED

local myBase=nil
local myPoints=0
local border = 3

function gadget:DrawScreen(vsx,vsy)
	if not Spring.IsGUIHidden() and myBase and SYNCED.refTimers[myBase] then
		local left = vsx*.5
		local right = vsx*.95
		local top = vsy-15
		local bottom = top - 20
		gl.Color(.2,.2,.2,1)
		gl.Rect(left - border, top + border, right + border, bottom - border)
		gl.Color(.2,.5,.2,1)
		gl.Rect(left, top, left + (SYNCED.refTimers[myBase] / maxCharge)*(right - left), bottom)
		gl.Text("Reinforcement Timer:", left, top - 10, 16,"oc")
		gl.Text("Points held: "..myPoints.."/"..SYNCED.pointCountTotal, right,bottom-5,16,"or")
	end
end

function gadget:DrawWorldPreUnit()
	if myBase and SYNCED.rallyPoints[myBase] then
		gl.Texture("bitmaps/rally.tga")
		gl.Blending(GL.SRC_ALPHA,GL.ONE)
		local r = SYNCED.rallyPoints[myBase]
		gl.DrawGroundQuad(r[1]-32,r[3]-32,r[1]+32,r[3]+32,false,true)
		gl.Texture(false)
		gl.Blending(false)
	end
end

function gadget:Update()
	local team = Spring.GetLocalTeamID()
	myBase=Spring.GetTeamUnitsByDefs(team,base)[1] --or Spring.GetTeamUnitsByDefs(team,redbase)[1]
	myPoints=Spring.GetTeamUnitDefCount(team,point)
end

end
