-- $Id$
unitDef = {
  unitname            = "point",
  name                = "Urban Objective",
  description         = "Capture to receive reinforcements more frequently",
  buildCostEnergy     = 0,
  buildCostMetal      = 0,
  builder             = false,
  buildTime           = 0,
  category            = "NOTARGET",
  collisionVolumeType = "ellipsoid",
  collisionVolumeOffsets = "0 5 0",
  collisionVolumeScales = "54 10 54",
  collisionvolumetest = 1,
--  corpse              = [[DEAD]],
	customParams        = {
			ProvideTech = "defendable",
			ProvideTechRange = 300,
							},
  footprintX          = 8,
  footprintZ          = 8,
  yardmap = "oooyyooo oooyyooo oooyyooo yyyyyyyy yyyyyyyy oooyyooo oooyyooo oooyyooo",
  iconType            = [[obj]],
 
  maxdamage = 20000,
  maxslope = 255,
  objectName          = [[citi.s3o]],
  sightDistance       = 0,



  weaponDefs = {


  },



}

return lowerkeys({ point = unitDef })
