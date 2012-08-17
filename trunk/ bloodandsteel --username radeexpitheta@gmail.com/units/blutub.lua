-- $Id$
unitDef = {
  unitname            = [[blutub]],
  name                = [[Weapon Truck]],
  description         = [[Carries Weapon Systems to Deploy in the Battlefield]],
  activatewhenbuilt	 = false,
  brakeRate			  = 0.2,
  buildCostEnergy     = 0,
  buildCostMetal      = 1,
  buildTime           = 16,
  builddistance = 64,
  builder               = true,
    buildoptions       = {
	[[gendr]],
	[[gendi]],
	[[gendv]],
	[[genda]],
	[[gendd]],
    [[port]],
  },
	workerTime         = 1, 
  canGuard            = true,
  canMove             = true,
    capturable  = false,	
	canRepair = false,
	canRestore = false,
	canReclaim = false,
	canAssist = false,
  canPatrol           = true,
  canstop             = true,
  category            = [[VEH UNIT TARGET NOTINF]], 
  corpse              = [[dead]],
  CustomParams = {
		RefillRange	 = 100,
		RefillStock = 100,
			},
  explodeAs           = [[death]],
  footprintX          = 1,
  footprintZ          = 2,
  frontToSpeed        = 0,
  iconType            = [[tub]],
  idleAutoHeal        = 50,
  idleTime            = 300,
  leavetracks = 1, 
	trackwidth = 7, 
	trackoffset = 0, 
	trackstrength = 8, 
	trackstretch = 1,
	tracktype = "StdTank",
  mass                = 9000,
  maxAcc              = 0.3,
  maxDamage           = 2500, 
  maxVelocity         = 0.5,
  MaxWaterDepth 	  = 1,
  MovementClass		  = "WHEEL",
  noChaseCategory     = [[NOTINF NOTARGET]],
  objectName          = [[dumtruk.s3o]],
  seismicSignature    = 4,
  selfDestructAs      = [[death]],
  showNanoFrame      = false,
  showNanoSpray      = false,
  side                = [[BLU]],
  sightDistance       = 800,
  turnInPlace		  = false,
  turnRate            = 600,
	sounds = {
			canceldestruct = "RadAcknow",
			underattack = {
				[1] = "RadNeedBack",
				[2] = "RadTaking",
			},
			cant = {
				[1] = "RadCant",
			},
			ok = {
				[1] = "veh1",
				[2] = "RadAcknow",
				[3] = "veh4",
				[4] = "RadRoger",
			},
			select = {
				[1] = "veh2",
				[2] = "veh3",
				[3] = "veh4",
			},
			arrived = {
				[1] = "vehstop",
				[2] = "vehstop2",
			},
		},
		
featureDefs         = {
		DEAD  = {
		  description      = [[Wreckage - blutub]],
		  blocking         = true,
		  category         = [[corpses]],
		  damage           = 5000,
		  energy           = 0,
		  featurereclamate = [[SMUDGE01]],
		  footprintX       = 1,
		  footprintZ       = 2,
		  height           = [[12]],
		  hitdensity       = [[1]],
		  metal            = 0,
		  object           = [[blui_dead.s3o]],
		  reclaimable      = false,
		  reclaimTime      = 0,
		  world            = [[All Worlds]],
				},
	},

}

return lowerkeys({ blutub = unitDef })
