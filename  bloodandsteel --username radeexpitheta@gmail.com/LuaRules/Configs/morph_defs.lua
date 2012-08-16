-- $Id: morph_defs.lua 4643 2009-05-22 05:52:27Z carrepairer $
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local devolution = false


local morphDefs = {

blutub = {
  --  [1] = {into = 'gendr', metal = 0, energy = 0, time = 30, facing = true,},
  --  [2] = {into = 'gendi', metal = 0, energy = 0, time = 60, facing = true,},
  --  [3] = {into = 'gendv', metal = 0, energy = 0, time = 90, facing = true,},
  --  [4] = {into = 'genda', metal = 0, energy = 0, time = 90, facing = true,},
  --  [5] = {into = 'gendd', metal = 0, energy = 0, time = 360, facing = true,},
  },
}




--
-- Here's an example of why active configuration
-- scripts are better then static TDF files...
--

--
-- devolution, babe  (useful for testing)
--
if (devolution) then
  local devoDefs = {}
  for src,data in pairs(morphDefs) do
    devoDefs[data.into] = { into = src, time = 10, metal = 1, energy = 1 }
  end
  for src,data in pairs(devoDefs) do
    morphDefs[src] = data
  end
end


return morphDefs

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
