
-- This gadget:
-- Consider as "refillers" all units with both RefillRange & RefillStock custom param
-- Consider as "users" all units with a "Refill" bos/cob function
-- Call the user's Refill function of every user in the range of a refiller
-- Keep track of the ammo inside the refillers, and blow them up once exhausted
-- A unit can be both a refiller and a user, allowing for some ammo transport truck
-- (but then remove the DestroyUnit at the bottom, or else they'll blow up when exhausted)

-- In the FBI of the refillers, use:
--	[CustomParams]
--	{
--		RefillRange=200; -- in pixels, how far can it refill units
--		RefillStock=50; -- how many ammunition before it runs out
--	}

-- In the BOS/COB of the refillers, optionnaly use:
--	SetStock(newstock)// Only called when ammo is drawn, and no more than once per frame
--	{
--		move ammo_surface to y-axis (50-newstock)*[0.2] now;
--		turn ammo_hatch to x-axis <90> now;
--		turn ammo_hatch to x-axis <0> speed <20>;
--	}

-- In the BOS/COB of the users, use:
-- // That function must be instant (no sleep/wait/call/..)
-- // That function must take 2 input and return 1 output
--	Refill(RefillerID,RefillerStock)// UnitID of the refiller, how many ammo left in the refiller stock
--	{
--		var refilled;
--		refilled=20-ammo;// Supposing the unit has a max ammo capacity of 20
--		if(refilled>RefillerStock)
--			refilled=RefillerStock;
--		ammo=ammo+refilled;
--		if(refilled>0)
--		{	// Exemple of animation: Whenever it's refilling, a hatch open instantly and slowly close down
--			turn ammo_hatch to x-axis <90> now;
--			turn ammo_hatch to x-axis <0> speed <20>;
--		}
--		return refilled;// return how many ammo to substract from the refiller stock.
--	}
--	// You could change it to draw more ammo than available, allowing for one last overdraw when crate die
--	// You could change it to increment the user ammo more or less than you decrement the refiller stock, allowing for varying ammo conversion ratio
--	// In reality, what the gadget retrieve is not the returned value, but the fourth variable on the stack, which happens to be refilled (before there is 0,RefillerID,RefillerStock)
--
-- If you want ammo to replenish more slowly, and more evenly, you can do:
--	Refill(RefillerID,RefillerStock)
--	{
--		var refilled;
--		refilled=0;
--		if(RefillerStock>0 && ammo<20)
--		{
--			turn ammo_hatch to z-axis <90> now;
--			turn ammo_hatch to z-axis <0> speed <20>;
--			refilled=1;
--			++ammo;
--		}
--	}

function gadget:GetInfo()
	return {
		name = "Ammo Refill",
		desc = "Call Cob's Refill(giverId,maxAmount){var drawn;..} of any unit near another unit with RefillRange & RefillStock custom params",
		author = "zwzsg",
		date = "29th of June 2010",
		license = "Free",
		version = "2",
		layer = 0,
		enabled = true
	}
end


if (gadgetHandler:IsSyncedCode()) then

	local UsersCob, RefillersStock, RefillersDefID, RefillersDefRange, RefillersDefStock = {}, {}, {}, {}, {}
	-- UsersCob: Indexed by the unitID of the live units with a Refill() script, value is the CobID of their Refill() script
	-- RefillersStock: Indexed by the UnitID of refillers, value is their current stock
	-- RefillersDefID: Indexed by 1...n, value is the UnitDefID of refillers
	-- RefillersDefRange: Indexed by ther UnitDefID of refillers, value is their range
	-- RefillersDefStock: Indexed by ther UnitDefID of refillers, value is their initial max stock


	local function isUnitComplete(UnitID)
		local health,maxHealth,paralyzeDamage,captureProgress,buildProgress=Spring.GetUnitHealth(UnitID)
		if buildProgress and buildProgress>=1 then
			return true
		else
			return false
		end
	end

	function gadget:UnitCreated(u,ud,team)-- or use UnitFinished if your prefer
		local RefillScriptID=Spring.GetCOBScriptID(u,"Refill")
		if RefillScriptID then
			UsersCob[u]=RefillScriptID
		end
		if RefillersDefStock[ud] then
			RefillersStock[u]=RefillersDefStock[ud]
		end
	end

	function gadget:UnitDestroyed(u,ud,team)
		if UsersCob[u] then
			UsersCob[u]=nil
		end
		if RefillersStock[u] then
			RefillersStock[u]=nil
		end
	end

	function gadget:Initialize()
		UsersCob={}
		RefillersStock={}
		RefillersDefID={}
		RefillersDefRange={}
		RefillersDefStock={}
		for _,def in pairs(UnitDefs) do
			local cp=def.customParams
			if cp then
				local r,s=cp.refillrange,cp.refillstock
				if r and not s then
					Spring.Echo("Error! "..def.name.." has RefillRange but no RefillStock!")
				elseif s and not r then
					Spring.Echo("Error! "..def.name.." has RefillStock but no RefillRange!")
				elseif r and s then
					table.insert(RefillersDefID,def.id)
					RefillersDefRange[def.id]=tonumber(r)
					RefillersDefStock[def.id]=tonumber(s)
				end
			end
		end
	end

	function gadget:GameFrame(frame)
		if frame%15==0 then -- Every ten frame is thrice per second
			local NewRefillersStock={}
			for userID,userRefillFct in pairs(UsersCob) do
				local userTeam=Spring.GetUnitTeam(userID)
				for _,refillerTeam in ipairs(Spring.GetTeamList()) do
					if Spring.AreTeamsAllied(userTeam,refillerTeam) then
						for _,refillerID in ipairs(Spring.GetTeamUnitsByDefs(refillerTeam,RefillersDefID)) do
							if Spring.GetUnitSeparation(userID,refillerID,1)<=RefillersDefRange[Spring.GetUnitDefID(refillerID)] then
								if refillerID~=userID and isUnitComplete(refillerID) then
									local s = NewRefillersStock[refillerID] or RefillersStock[refillerID]
									if s ~= nil then
										NewRefillersStock[refillerID]=s - select(4,Spring.CallCOBScript(userID,userRefillFct,3,refillerID,s,0))-- That 4, that 3 and that 0 make little sense, I know. But yet that's the way it is.
									else
									end
								end
							end
						end
					end
				end
			end
			for refillerID,stock in pairs(NewRefillersStock) do
				if stock~=RefillersStock[refillerID] then
					local SetStock=Spring.GetCOBScriptID(refillerID,"SetStock")
					if SetStock then
						Spring.CallCOBScript(refillerID,SetStock,0,NewRefillersStock[refillerID])
					end
					RefillersStock[refillerID]=NewRefillersStock[refillerID]
					if stock<=0 then
						Spring.DestroyUnit(refillerID,false,false)
					end
				end
			end
		end
	end

end