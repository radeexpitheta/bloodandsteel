-- $Id$
unitDef = {
  unitname            = [[port]],
  name                = [[Sea Port]],
  description         = [[Rally for Naval Reinforcements]],
  activatewhenbuilt = true,
  autoheal = 5,
  buildCostEnergy     = 0,
  buildCostMetal      = 0,
  builder             = false,
  buildTime           = 0,
  camove			  = false,
  canstop             = [[1]],
  canSubmerge         = false,
  category            = "BASE ARMORED TARGET",
  collisionvolumeoffsets = "-2 -3 -3",
		collisionvolumescales = "75 50 75",
		collisionvolumetest = 1,
  minwaterdepth = 20,
  maxdamage = 10000,
  maxslope = 255,
  explodeAs           = [[basedeath]],
  footprintX          = 5,
  footprintZ          = 5,
  yardmap = "wwwwww wwwwww wwwwww wwwwww wwwwww",
  iconType            = [[port]],
  norestrict          = [[1]], 
  objectName          = [[port.s3o]],
  selfDestructAs      = [[basedeath]],
  script = [[port.lua]],
  --side                = [[BLU]],
  sightDistance       = 800,
  waterline = [[-2]],
  workerTime          = 200,
  showNanoSpray		  = false,
  
}

return lowerkeys({ port = unitDef })
