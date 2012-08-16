-- $Id$
unitDef = {
  unitname            = [[bluai]],
  name                = [[Eagle]],
  description         = [[Air Transport]],
  acceleration        = 0.5,
  amphibious          = true,
  bankscale           = [[1]],
  bmcode              = [[1]],
  brakeRate           = 1,
  buildCostEnergy     = 0,
  buildCostMetal      = 0,
  builder             = false,
  buildTime           = 0,
  canDropFlare        = false,
  canFly              = true,
  canFireControl      = 1,
  canGuard            = true,
  canload             = [[1]],
  canMove             = true,
  canPatrol           = true,
  canstop             = [[1]],
  canSubmerge         = false,
  category            = [[VTOL AIR TARGET]],
  collide             = false,
  corpse              = [[DEAD]],
  cruiseAlt           = 200,

  customParams        = {
       helptext       = [[The Eagle has landed.]],

  },

  defaultmissiontype  = [[VTOL_standby]],
  drag		    = 0.08,
  explodeAs           = [[death]],
  floater             = true,
  footprintX          = 1,
  footprintZ          = 1,
  HoldSteady 	    = 1,
  iconType            = [[ai]],
  idleAutoHeal        = 5,
  idleTime            = 300,
  maneuverleashlength = [[1280]],
  mass                = 19500,
  maxDamage           = 2500,
  maxVelocity         = 10,
  MaxWaterDepth 	    = 10,
  noAutoFire          = false,
  noChaseCategory     = [[AIR VTOL NOTARGET]],
  objectName          = [[BLUAI.S3O]],
  releaseHeld         = false,
  seismicSignature    = 0,
  selfDestructAs      = [[death]],

  sfxtypes            = {

    explosiongenerators = {
     [[custom:flashmuzzle1]],
    },

  },

  side                = [[BLU]],
  sightDistance       = 1200,
  smoothAnim          = true,
  steeringmode        = [[1]],
  TEDClass            = [[VTOL]],
  transmaxunits       = [[1]],
  transportCapacity   = 1,
  transportMass       = 20000,
  transportSize       = 1,
  turnInPlace         = 0,
  turnRate            = 550,
  workerTime          = 0,

  weapons             = {

    {
      def                = [[BLUAIWPN1]],
      badTargetCategory  = [[AIR VTOL NOTARGET]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[NOTAIR TARGET]],
    },

  },

weaponDefs          = {

    BLUAIWPN1 = {
      name                    = [[Heavy Chain Gun]],
      areaOfEffect            = 15,
      avoidFeature            = false,
      burst                   = 5,
      burstrate               = 0.1,
      collideFriendly         = false,
      craterBoost             = 0.1,
      craterMult              = 0.1,

      damage                  = {
        default = 15,
        base    = 0,
	  gendi = 1;
	  inf = 50;
      },

      edgeEffectiveness       = 0.5,
      endsmoke                = [[0]],
      explosionGenerator      = [[custom:Bullet]],
      firestarter             = 70,
	impactOnly 			= 1,
      impulseBoost            = 0,
      impulseFactor           = 0.2,
      InterceptedByShieldType = 2,
      lineOfSight             = true,
      noSelfDamage            = true,
      pitchtolerance          = 12000,
      range                   = 600,
      reloadtime              = 2,
      renderType              = 2,
      rgbColor                = [[1 0.95 0.5]],
      --soundHit                = [[Rifle]],
	  size = 0.3,
      soundStart              = [[mgun]],
      sprayAngle              = 600,
      startsmoke              = [[0]],
      sweepfire               = True,
      tolerance               = 2000,
      turret                  = true,
      weaponTimer             = 1,
      weaponType              = [[Cannon]],
      weaponVelocity          = 900,
    },
  },

featureDefs         = {
    DEAD  = {
      description      = [[Wreckage - bluai]],
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
      object           = [[bluai_dead.s3o]],
      reclaimable      = false,
      reclaimTime      = 0,
      world            = [[All Worlds]],
    },
  },

}

return lowerkeys({ bluai = unitDef })
