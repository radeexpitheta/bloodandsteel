-- $Id$
unitDef = {
  unitname            = "relic",
  name                = "Supply Center",
  description         = "Position squads nearby to increase your logistics charge",
  buildCostEnergy     = 0,
  buildCostMetal      = 0,
  builder             = true,
  buildTime           = 0,
  category            = "NOTARGET",
  collisionVolumeType = "ellipsoid",
  collisionVolumeOffsets = "0 5 0",
  collisionVolumeScales = "54 10 54",
  collisionvolumetest = 1,
--  corpse              = [[DEAD]],

  footprintX          = 8,
  footprintZ          = 8,
  yardmap = "oooyyooo oooyyooo oooyyooo yyyyyyyy yyyyyyyy oooyyooo oooyyooo oooyyooo",
  iconType            = [[obj]],
 
  maxdamage = 20000,
  maxslope = 255,
  objectName          = [[rez.s3o]],
  sightDistance       = 0,

  showNanoSpray = false,
  workerTime = 200,
  IsAirBase = true,




}

return lowerkeys({ relic = unitDef })
