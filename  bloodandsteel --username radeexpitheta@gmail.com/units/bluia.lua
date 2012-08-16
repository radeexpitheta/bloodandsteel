-- $Id$
unitDef = {
  unitname            = [[bluia]],
  name                = [[Anti Air Team]],
  description         = [[Counter Air]],
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
	toggle1on = [[DumbFire On]],
	toggle1off = [[DumbFire Off]],
	toggle1tooltip = [[Anti Air or Anti Ground Missile Settings]],
	--helptext = [[words]],
  },

  explodeAs           = [[death]],
--floater             = true,
  footprintX          = 1,
  footprintZ          = 1,
  frontToSpeed        = 0,
  iconType            = [[ia]],
  idleAutoHeal        = 50,
  idleTime            = 300,
  maneuverleashlength = [[1280]],
  mass                = 200,
  maxAcc              = 0.3,
  maxDamage           = 300, --2x150
  maxVelocity         = 0.5,
  MaxWaterDepth 	  = 1,
  MovementClass		  = "foot",
  noChaseCategory     = [[AIR NOTARGET]],
  objectName          = [[bluia.s3o]],
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
      def                = [[bluiawpn1]],
      badTargetCategory  = [[NOTAIRN OTARGET]],
      onlyTargetCategory = [[AIR VTOL]],
	  
    },

	[2]  = {
      def                = [[bluigun]],
      badTargetCategory  = [[AIR NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  weaponSlaveTo = 1,
    },

	[3]  = {
      def                = [[bluigun]],
      badTargetCategory  = [[AIR NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  weaponSlaveTo = 1,
    },
	
	[4]  = {
      def                = [[bluiawpn2]],
      badTargetCategory  = [[AIR NOTARGET]],
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
	  laserFlareSize     = 0.0001,
	  leadbonus				  = 5, --works?
      movingAccuracy     = 888,
	  movingAccuracy     = 888,
      noSelfDamage            = true,
      duration                = 0.01,
      range                   = 600,
      reloadtime              = 2,
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
	
	bluiawpn1 = {
      name                    = [[Surface to Air Missile]],
	  toairweapon = true,
      areaOfEffect            = 50,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 300,
        air  = 900,
        inf  = 75,
		base = 0,
      },
	  edgeeffectiveness       = 1,
      explosionGenerator      = [[custom:MISSILE_EXPLOSION]], -- was FLASH2 
      fireStarter             = 70,
      flightTime              = 3,
      guidance                = true,
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
      InterceptedByShieldType = 2,
	lineOfSight             = true,
      metalpershot            = 0,
      model                   = [[genaamis.s3o]],
      noSelfDamage            = true,
      range                   = 600,
      reloadtime              = 15,
      renderType              = 1,
      selfprop                = true,
      smokedelay              = [[0.1]],
      smokeTrail              = true,
      soundHit                = [[missile2]],
      soundStart              = [[smallexplo]],
      startsmoke              = [[1]],
      startVelocity           = 500,
      tolerance               = 10000,
      tracks                  = true,
      turnRate                = 24000,
      turret                  = true,
      weaponAcceleration      = 450,
      weaponTimer             = 5,
      weaponType              = [[MissileLauncher]],
      weaponVelocity          = 1200,
    },
  
  bluiawpn2 = {
      name                    = [[Mortar HE]],
	  TrajectoryHeight  = 1.8,
	  heightBoostFactor = 1.5,
	  gravityAffected = true,
	  
      areaOfEffect            = 50,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 300,
        veh  = 100,
        base  = 0,
		inf  = 200,
      },

	  edgeeffectiveness		  = 1,
      explosionGenerator      = [[custom:SMALLMISSILE_EXPLOSION]], -- was FLASH2 
      fireStarter             = 50,
		myGravity				 = 0.5,
      impulseBoost            = 0,
      impulseFactor           = 0,
      InterceptedByShieldType = 1,
		
	  leadLimit          = 500,	
      metalpershot            = 0,
      model                   = [[genaamis.s3o]],
      noSelfDamage            = true,
      range                   = 1200,
      reloadtime              = 16,
      renderType              = 6, --was 1
      selfprop                = true,
      --smokedelay              = [[5]],
      --smokeTrail              = true,
      soundHit                = [[ArtHit]],
      soundStart              = [[rockfire2]],
      startsmoke              = [[1]],
      tolerance               = 3000,
	  tracks                  = true,
      turnRate                = 800,
      turret                  = true,
      weaponAcceleration      = 800,
      weaponTimer             = 10,
      weaponType              = [[MissileLauncher]],
	  fixedLauncher			  = 0,
      weaponVelocity          = 800,

    },
	
  },

featureDefs         = {
		DEAD  = {
		  description      = [[Wreckage - bluia]],
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

return lowerkeys({ bluia = unitDef })
