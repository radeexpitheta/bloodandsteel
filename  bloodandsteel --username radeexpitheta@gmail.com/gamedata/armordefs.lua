--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
--  file:    armorDefs.lua
--  brief:   armor definitions
--
--  This file is based off of the armordefs.lua file from CA. 
--
--  This file contains the different armor types that exist in the game
--  The units listed under an armor type will belong to that category
--  All unlisted ones will belong to the default category (not listed in the file)
--  
--  Weapons work in much the same way:
--  They do the default damage against all categories except if they have a special 
--  damage against one of the units in a category
--  
--  In the future its of course meant that the units should have a ArmorType tag 
--  in the lua file and that weapons should list damage against armor categories 
--  instead of against units. This will make it easier to add new units without 
--  having to change all the old weapons
--  
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local armorDefs = {

air = {
	"bluar",
	"bluai",
	"bluav",
	"bluaa",
	"bluad",
	--redar",
},

base = {
	"base",
	--"blubase",
	--redbase",
	--grebase",
},

def = {
	--gen for now
	"gendr",
	"gendi",
	"gendv",
	"genda",
	"gendd",
	--"bludr",
},

inf =
{
	"bluir",
	"bluii",
	"bluiv",
	"bluia",
	"bluid",
	--redir",
},

veh = {
	"blutub",
	"bluvr",
	"bluvi",
	"bluvv",
	"bluva",
	"bluvd",
	--redvr",
},


invulnerable = {
	--keep names for now
	"point",
	"relic",
},


  -- populated automatically
  PLANES = {}, 
  ELSE   = {},
}
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

for categoryName, categoryTable in pairs(armorDefs) do
  local t = {}
  for _, unitName in pairs(categoryTable) do
    t[unitName] = 1
  end
  armorDefs[categoryName] = t
end

return armorDefs