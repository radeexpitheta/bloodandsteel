-- $Id$
unitDef = {
  unitname            = [[bluid]],
  name                = [[Combat Engineers]],
  description         = [[Counter Defense and Base]],
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
	toggle1on = [[Satchel On]],
	toggle1off = [[Satchel Off]],
	toggle1tooltip = [[Satchel or Grenade Mode]],
	--helptext = [[words]],
  },

  explodeAs           = [[death]],
--floater             = true,
  footprintX          = 1,
  footprintZ          = 1,
  frontToSpeed        = 0,
  iconType            = [[id]],
  idleAutoHeal        = 50,
  idleTime            = 300,
  maneuverleashlength = [[1280]],
  mass                = 300,
  maxAcc              = 0.3,
  maxDamage           = 600, --4x150
  maxVelocity         = 0.5,
  MaxWaterDepth 	  = 1,
  MovementClass		  = "foot",
  noChaseCategory     = [[NOTINF NOTARGET]],
  objectName          = [[bluid.s3o]],
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
      def                = [[bluidwpn1]],
      badTargetCategory  = [[AIR NOTARGET]],
      onlyTargetCategory = [[TARGET]],
	  
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
      def                = [[bluigun]],
      badTargetCategory  = [[NOTINF NOTARGET]],
      onlyTargetCategory = [[INF TARGET]],
	  weaponSlaveTo = 1,
    },
	
	[6]  = {
      def                = [[bluidwpn2]],
      badTargetCategory  = [[INF AIR VEH NOTARGET]],
      onlyTargetCategory = [[DEF BASE]],
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
      craterBoost             = 0,
      craterMult              = 0,

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
      renderType              = 0,
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
	
	bluidwpn1 = {
      name                    = [[Grenades]],
      areaOfEffect            = 25,
	  gravityAffected = true,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 200,
        veh  = 100,
        base  = 0,
		inf  = 150,
      },

	  edgeeffectiveness		  = 1,
      explosionGenerator      = [[custom:SMALLMISSILE_EXPLOSION]], -- was FLASH2 
      fireStarter             = 70,
      groundbounce            = true,
		bounceslip			     = 1,
		bouncerebound		     = 0.5,
		numbounce			     = 2,
		holdtime				 = 2,	
	    minbarrelangle			 =-45,
		myGravity				 = 0.1,
      impulseBoost            = 0,
      impulseFactor           = 0,
      InterceptedByShieldType = 1,

      metalpershot            = 0,
      model                   = [[blunade.s3o]],
      noSelfDamage            = true,
      range                   = 120,
      reloadtime              = 3,
      renderType              = 6, --was 1
      selfprop                = true,
      smokedelay              = [[0.1]],
      smokeTrail              = true,
     -- soundHit                = [[grenade]],
     -- soundStart              = [[throw]],
      startsmoke              = [[1]],
	  sprayAngle              = 100,
      tolerance               = 10000,

      turret                  = true,
      weaponAcceleration      = 80,
      weaponTimer             = 10,
      --weaponType              = [[MissileLauncher]],
      weaponVelocity          = 80,

    },
	
	bluidwpn2 = {
	  id	= 2, -----important to kill base	
      name                    = [[Satchel]],
	  gravityAffected = true,
      areaOfEffect            = 100,
      craterBoost             = 0,
      craterMult              = 0,

      damage                  = {
        default = 0,
		def = 1200,
        gendi  = 6600,
        base  = 1300,
		veh = 500,
		bluid  = 0,
      },

	  edgeeffectiveness		  = 1,
      explosionGenerator      = [[custom:BIGBOMB_EXPLOSION]], -- was FLASH2 
      fireStarter             = 70,
      groundbounce            = true,
		bounceslip			     = 0.2,
		bouncerebound		     = 0.2,
		numbounce			     = 1,
		holdtime				 = 2,	
	    minbarrelangle			 =-45,
		myGravity				 = 0.1,
      impulseBoost            = 0,
      impulseFactor           = 0,
      InterceptedByShieldType = 1,

      metalpershot            = 0,
      model                   = [[blunade.s3o]],
      noSelfDamage            = true,
      range                   = 80,
      reloadtime              = 10,
      renderType              = 6, --was 1
      selfprop                = true,
      smokedelay              = [[0.1]],
      smokeTrail              = true,
      soundHit                = [[basedeath]],
     -- soundStart              = [[throw]],
      startsmoke              = [[1]],
	  sprayAngle              = 300,
      tolerance               = 10000,

      turret                  = true,
      weaponAcceleration      = 80,
      weaponTimer             = 10,
      --weaponType              = [[MissileLauncher]],
      weaponVelocity          = 80,

    },
	
  },

featureDefs         = {
		DEAD  = {
		  description      = [[Wreckage - bluid]],
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

return lowerkeys({ bluid = unitDef })
