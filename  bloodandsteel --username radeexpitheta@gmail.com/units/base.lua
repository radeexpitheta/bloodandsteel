-- $Id$
unitDef = {
  unitname            = [[base]],
  name                = [[Port]],
  description         = [[HQ]],
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
  commander = true,
  
  maxdamage = 10000,
  maxslope = 255,
  explodeAs           = [[basedeath]],
  footprintX          = 5,
  footprintZ          = 7,
  yardmap = "yyyyy yyyyy yoooy yoooy yoooy yyyyy yyyyy",
  iconType            = [[base]],
 
  objectName          = [[base.s3o]],
  selfDestructAs      = [[basedeath]],
  side                = [[BLU]],
  sightDistance       = 800,

  isairbase			  = true,
  workerTime          = 200,
  showNanoSpray		  = false,
  
}

return lowerkeys({ base = unitDef })
