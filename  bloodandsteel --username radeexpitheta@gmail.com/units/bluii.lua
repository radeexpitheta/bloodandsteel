-- $Id$
unitDef = {
  unitname            = [[bluii]],
  name                = [[Rifle Squad]],
  description         = [[Counter Infantry]],
--  autoheal            = 50,
  buildCostEnergy     = 0,
  buildCostMetal      = 0,
  buildTime           = 0,
  canAttack           = true,
  canFireControl 	    = 1,
  canGuard            = true,
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  category            = [[INF UNARMORED NOTAIR UNIT TARGET]], 
   CloakCost = 0,   
	initcloaked = 0, 
	minCloakDistance    = 200,
	init_cloaked = false, 
	
 corpse              = [[dead]],
	
  customParams        = {
	toggle1 = 2,
	toggle1on = [[Deploy On]],
	toggle1off = [[Deploy Off]],
	toggle1tooltip = [[Deploy Squad Machine Gun for Increased Fire Power]],
	helptext = [[Deal more damage with a penatly in movement]],
  },

  explodeAs           = [[death]],
--floater             = true,
  footprintX          = 1,
  footprintZ          = 1,
  frontToSpeed        = 0,
  iconType            = [[ii]],
  idleAutoHeal        = 50,
  idleTime            = 300,
  maneuverleashlength = [[1280]],
  mass                = 300,
  maxAcc              = 0.3,
  maxDamage           = 600,
  maxVelocity         = 0.5,
  MaxWaterDepth 	  = 1,
  MovementClass		  = "foot",
  noChaseCategory     = [[AIR NOTARGET]],
  objectName          = [[bluii.s3o]],
  seismicSignature    = 1,
  selfDestructAs      = [[death]],
  side                = [[BLU]],
  sightDistance       = 800,
  Stealth 			  = true,
  smoothAnim          = true,
  speedToFront        = 0,
  turnInPlace		  = true,
  turnRate            = 400,
  upright 			  = true,
  
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
				[1] = "RadGo",
				[2] = "RadAcknow",
				[3] = "RadMove",
				[4] = "RadRoger",
			},
			select = {
				[1] = "RadReady",
				[2] = "Radstandby",
				[3] = "RadRoger",
			},
		},
		
  weapons             = {

    [1]  = {
      def                = [[bluiiwpn1]],
      badTargetCategory  = [[NOTINF NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  
    },

	[2]  = {
      def                = [[bluigun]],
      badTargetCategory  = [[NOTINF NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  weaponSlaveTo = 1,
    },

	[3]  = {
      def                = [[bluigun]],
      badTargetCategory  = [[NOTINF NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  weaponSlaveTo = 1,
    },
	
	[4]  = {
      def                = [[bluigun]],
      badTargetCategory  = [[NOTINF NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  weaponSlaveTo = 1,
    },
	
	[5]  = {
      def                = [[bluiiwpn2]],
      badTargetCategory  = [[NOTINF NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  weaponSlaveTo = 1,
    },
  },


  weaponDefs          = {
  
  bluigun = {
      name                    = [[Rifle]],
      areaOfEffect            = 8,
      avoidFeature            = false,
      burst                   = 3,
      burstrate               = 0.1,
	  canAttackGround		  = false,
      collideFriendly         = false,
      craterBoost             = 0.1,
      craterMult              = 0.1,

      damage = {
			default = 5,
			base = 0,
			veh = 0;
				},

      edgeEffectiveness       = 0.5,
      endsmoke                = [[0]],
      explosionGenerator      = [[custom:Bullet]],
      firestarter             = 70,
	  impactOnly 			= 1,
      impulseBoost            = 0,
      impulseFactor           = 0.2,
      InterceptedByShieldType = 2,
	  leadbonus				  = 5, --works?
	   laserFlareSize     = 0.0001,
      movingAccuracy     = 888,
      noSelfDamage            = true,
       duration                = 0.01,
      range                   = 600,
      reloadtime              = 2,
      renderType              = 0, --was 2
      rgbColor                = [[1 0.7 0.2]],
      --soundHit                = [[Rifle]],
	   coreThickness      = 0.15,
      soundStart              = [[Rifle]],
	  soundstartvolume		  = 0.5,
	  soundTrigger			  = true,
      sprayAngle              = 300,
      startsmoke              = [[0]],
	  thickness				  = 0.8,
      tolerance               = 600,
      turret                  = true,
      weaponTimer             = 1,
      weapontype			  = "LaserCannon",
      weaponVelocity          = 900,
    },
  
  bluiiwpn1 = {
      name                    = [[Machinegun]],
      areaOfEffect            = 8,
      avoidFeature            = false,
      burst                   = 6,
      burstrate               = 0.1,
	  canAttackGround		  = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,

      damage = {
			default = 10,
			base = 0,
			veh = 5;
				},

      edgeEffectiveness       = 0.5,
      endsmoke                = [[0]],
      explosionGenerator      = [[custom:Bullet]],
      firestarter             = 70,
	  impactOnly 			= 1,
      impulseBoost            = 0,
      impulseFactor           = 0.2,
      InterceptedByShieldType = 2,
	   laserFlareSize     = 0.0001,
	  leadbonus				  = 5, --works?
      movingAccuracy     = 888,
      noSelfDamage            = true,
       duration                = 0.01,
      range                   = 800,
      reloadtime              = 3,
      renderType              = 0,
      rgbColor                = [[1 0.7 0.2]],
      --soundHit                = [[Rifle]],
	   coreThickness      = 0.15,
      soundStart              = [[gunfire]],
	  soundstartvolume		  = 0.5,
	  soundTrigger			  = true,
      sprayAngle              = 500,
      startsmoke              = [[0]],
	  thickness				  = 0.8,
      tolerance               = 600,
      turret                  = true,
      weaponTimer             = 1,
      weapontype			  = "LaserCannon",
      weaponVelocity          = 900,
    },
	
	bluiiwpn2 = {
      name                    = [[Machinegun Deployed]],
      areaOfEffect            = 8,
      avoidFeature            = false,
      burst                   = 6,
      burstrate               = 0.1,
	  canAttackGround		  = false,
      collideFriendly         = false,
      craterBoost             = 0,
      craterMult              = 0,

      damage = {
			default = 10,
			base = 0,
			veh = 5;
				},

      edgeEffectiveness       = 0.5,
      endsmoke                = [[0]],
      explosionGenerator      = [[custom:Bullet]],
      firestarter             = 70,
	  impactOnly 			  = 1,
      impulseBoost            = 0,
      impulseFactor           = 0.2,
      InterceptedByShieldType = 2,
	   laserFlareSize     = 0.0001,
	  leadbonus				  = 5, --works?
      movingAccuracy     = 888,
      noSelfDamage            = true,
         duration                = 0.01,
      range                   = 800,
	    heightBoostFactor		 = 1.2,
      reloadtime              = 2,
      renderType              = 0,
      rgbColor                = [[1 0.7 0.2]],
        --soundHit                = [[Rifle]],
	   coreThickness      = 0.15,
      soundStart              = [[gunfire]],
	  soundstartvolume		  = 0.5,
	  soundTrigger			  = true,
      sprayAngle              = 400,
      startsmoke              = [[0]],
	  thickness				  = 0.8,
      tolerance               = 600,
      turret                  = true,
      weaponTimer             = 1,
      weapontype			  = "LaserCannon",
      weaponVelocity          = 900,
    },
	
  },

featureDefs         = {
		DEAD  = {
		  description      = [[Wreckage - bluii]],
		  blocking         = false,
		  category         = [[corpses]],
		  damage           = 1200,
		  energy           = 0,
		  featurereclamate = [[SMUDGE01]],
		  footprintX       = 1,
		  footprintZ       = 1,
		  height           = [[0]],
		  hitdensity       = [[1]],
		  metal            = 0,
		  object           = [[blui_dead.s3o]],
		  reclaimable      = false,
		  reclaimTime      = 0,
		  world            = [[All Worlds]],
				},
	},

}

return lowerkeys({ bluii = unitDef })
