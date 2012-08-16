-- $Id$
unitDef = {
  unitname            = [[bluiv]],
  name                = [[Anti Tank Team]],
  description         = [[Counter Vehicle]],
----  autoheal            = 50,
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
	toggle1tooltip = [[Deploy Weapon for Increased Vehicle Damage]],
	--helptext = [[words]],
  },

  explodeAs           = [[death]],
--floater             = true,
  footprintX          = 1,
  footprintZ          = 1,
  frontToSpeed        = 0,
  iconType            = [[iv]],
  idleAutoHeal        = 50,
  idleTime            = 300,
  maneuverleashlength = [[1280]],
  mass                = 200,
  maxAcc              = 0.3,
  maxDamage           = 300, --2x150
  maxVelocity         = 0.5,
  MaxWaterDepth 	  = 1,
  MovementClass		  = "foot",
  noChaseCategory     = [[NOTINF NOTARGET]],
  objectName          = [[bluiv.s3o]],
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
      def                = [[bluivwpn1]],
      badTargetCategory  = [[INF AIR NOTARGET]],
      onlyTargetCategory = [[VEH]],
	  
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
      def                = [[bluivwpn2]],
      badTargetCategory  = [[AIR NOTARGET]],
      onlyTargetCategory = [[NOTAIR TARGET]],
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
  
  bluivwpn1 = {
      name                    = [[Recoiless Rifle]],
	  accuracy				  = 300,
	  aimrate	= 1000,
      areaOfEffect            = 20,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 200,
		gendi = 2000,
        veh  = 800,
	    inf = 75,
	    base = 0,
      },
		
	  edgeEffectiveness       = 1,
      explosionGenerator      = [[custom:SMALLMISSILE_EXPLOSION]], 
      fireStarter             = 50,
	  gravityaffected = "true",
	  --[[holdtime = true, --depreciated?]]
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
	  
      InterceptedByShieldType = 2,
     
      metalpershot            = 0,
     -- model                   = [[genaamis.s3o]],
      noSelfDamage            = true,
      range                   = 400,
      reloadtime              = 10,
      renderType              = 4,
      selfprop                = true,
      smokedelay              = [[0.1]],
      smokeTrail              = true,
	  size = 0.5,
      soundHit                = [[rockhit2]],
      soundStart              = [[rockfire2]],
      startsmoke              = "1",
      tolerance               = 300,
      turret                  = true,
	  
      weaponAcceleration      = 100,
      weaponVelocity          = 900,

    },
  
  bluivwpn2 = {
      name                    = [[Anti Tank Missile]],
	  accuracy				  = 300,
	  aimrate	= 1000,
      areaOfEffect            = 20,
      craterBoost             = 0,

      damage                  = {
        default = 100,
		gendi = 1000,
        veh  = 2000,
	    inf = 50,
	    base = 0,
      },
	 
      impactOnly              = true,
      impulseBoost            = 0,
      impulseFactor           = 0.4,
	  
      InterceptedByShieldType = 2,
     
      metalpershot            = 0,
      model                   = [[blunade.s3o]],
      noSelfDamage            = true,
      range                   = 400,
      reloadtime              = 10,
      renderType              = 1,
      selfprop                = true,
      smokedelay              = [[0.1]],
      smokeTrail              = true,
      soundHit                = [[rockhit2]],
      soundStart              = [[missile2]],
      startsmoke              = "1",
	  startVelocity           = 300,
	  tracks                  = true,
      turnRate   			  = 6000,
      tolerance               = 300,
      turret                  = true,
	  weaponTimer             = 2,
      weaponAcceleration      = 100,
	  weaponType              = [[MissileLauncher]],
      weaponVelocity          = 600,

    },
  
  },

featureDefs         = {
		DEAD  = {
		  description      = [[Wreckage - bluiv]],
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

return lowerkeys({ bluiv = unitDef })
