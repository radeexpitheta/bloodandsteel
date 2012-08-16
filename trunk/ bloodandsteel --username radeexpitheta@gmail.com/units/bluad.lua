-- $Id$
unitDef = {
  unitname            = [[bluad]],
  name                = [[Destiny]],
  description         = [[Precision Bomber]],
  amphibious          = true,
  buildCostEnergy     = 0,
  buildCostMetal      = 0,
  builder             = false,
  buildTime           = 0,
  canAttack           = true,
  canFly              = true,
  canFireControl      = 1,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  canSubmerge         = false,
  category            = [[VTOL AIR TARGET NOTINF]],
  collide             = false,
  corpse              = [[DEAD]],
  cruiseAlt           = 230,

  customParams        = {
    toggle1 = 2,
	toggle1on = [[Cluster On]],
	toggle1off = [[Cluster Off]],
	toggle1tooltip = [[Precision or Cluster Bomb]],
    helptext       = [[The Destiny Class Strike Bomber can deliver a heavy payload of freedom]],
    },

  defaultmissiontype  = [[VTOL_standby]],
  explodeAs           = [[death]],
  fireState           = 1,
  floater             = true,
  footprintX          = 3,
  footprintZ          = 3,
  iconType            = [[ad]],
  idleAutoHeal        = 5,
  idleTime            = 1800,
  maneuverleashlength = [[1380]],
  mass                = 7500,
  maxAcc              = 1.0,
  maxDamage           = 900,
  maxFuel             = 350,
  maxVelocity         = 10,
  MaxWaterDepth 	    = 1,
  noAutoFire          = false,
  noChaseCategory     = [[AIR NOTARGET]],
  objectName          = [[bluad.s3o]],
  scale               = [[1]],
  seismicSignature    = 0,
  selfDestructAs      = [[death]],
sfxtypes           = {

    explosiongenerators = {
      [[custom:AfterBurner]],
      [[custom:FF_WINGTIPS]],
    },
},
  side                = [[BLU]],
  sightDistance       = 1200,
  smoothAnim          = true,
  TEDClass            = [[VTOL]],
  workerTime          = 0,

  weapons             = {

    {
      def                = [[BLUADWPN1]],
      badTargetCategory  = [[AIR BASE NOTARGET]],
      fuelUsage          = 50,
	mainDir            = [[0 -1 1]],
      onlyTargetCategory = [[NOTAIR TARGET]],
    },
	
    {
 	def                = [[BLUADWPN2]],
      badTargetCategory  = [[AIR BASE NOTARGET]],
      fuelUsage          = 300,
  	mainDir            = [[0 -1 1]],
      onlyTargetCategory = [[NOTAIR TARGET]],
    },
  },


  weaponDefs = {

    BLUADWPN1 = {
      name                    = [[Guided Bomb]],
      areaOfEffect            = 160,
      avoidFeature            = false,
      avoidFriendly           = false,
      collideFriendly         = false,
      commandfire             = true,
      craterBoost             = 1,
      craterMult              = 1,

      damage                  = {
        default = 2000,
        def  = 3000,
	  veh  = 1500,
	  inf  = 150,
        base    = 0,
      },

      dropped                 = true,
      edgeEffectiveness       = 1,
      explosionGenerator      = [[custom:BIGBOMB_EXPLOSION]],
	guidance                = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      InterceptedByShieldType = 2,
      manualBombSettings      = true,
      model                   = [[genaamis.s3o]],
      myGravity               = 0.7,
      noSelfDamage            = true,
      range                   = 300,  
      reloadtime              = 10,
      renderType              = 6,
      soundHit                = [[bigexplo]],
      soundStart              = [[drop2]],
	turret			= 1,
      tracks                  = true,
      turnRate                = 50000,
 	weaponType              = [[AircraftBomb]],
    },

  BLUADWPN2 = {
      name                    = [[Cluster Bombs]],
	accuracy			= 4000;
      areaOfEffect            = 50,
      avoidFeature            = false,
      avoidFriendly           = false,
      burst                   = 7,
      burstrate               = 0.08,
      collideFriendly         = false,
      commandfire             = true,
      craterBoost             = 1,
      craterMult              = 1,

      damage                  = {
        default = 425,
        def  = 600,
	  veh  = 300,
	  inf  = 100,
        base = 0,
      },

      dropped                 = true,
      edgeEffectiveness       = 1,
      explosionGenerator      = [[custom:MISSILE_EXPLOSION]],
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      InterceptedByShieldType = 2,
      manualBombSettings      = true,
      model                   = [[genaamis.s3o]],
      myGravity               = 0.7,
      noSelfDamage            = true,
      range                   = 300,
      reloadtime              = 10,
      renderType              = 6,
      soundHit                = [[ArtHit]],
      soundStart              = [[drop2]],
      sprayAngle              = 3000,
	turret			= 1,
      weaponType              = [[AircraftBomb]],
    },

  },

   featureDefs         = {
    DEAD  = {
      description      = [[Wreckage - bluad]],
      blocking         = true,
      category         = [[corpses]],
      damage           = 3000,
      energy           = 0,
      featurereclamate = [[SMUDGE01]],
      footprintX       = 1,
      footprintZ       = 1,
      height           = [[20]],
      hitdensity       = [[100]],
      metal            = 0,
      object           = [[bluad_dead.s3o]],
      reclaimable      = false,
      reclaimTime      = 0,
      world            = [[All Worlds]],
    },
  },

}

return lowerkeys({ bluad = unitDef })
