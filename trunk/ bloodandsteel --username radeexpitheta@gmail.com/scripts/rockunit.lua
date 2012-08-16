-- Translated from BOS to Lua by Tobi Vollebregt
-- Original file: ROCKUNIT.H, RockUnit_Set.h


-- definitions for RockUnit
local ROCK_SPEED = ROCK_SPEED or math.rad(50) -- heavier units should rock less
local RESTORE_SPEED = math.rad(20)


function RockUnit(x, z, base)
	-- Multiplication factor 0.048 is approx. 500 / 32768 * PI
	-- (In COB x and z are in range -500..500, and angles are in range 0..65536,
	--  In Lua x and z are in range -1..1 (vector), and angles are in range 0..2pi)
	Turn(base, x_axis,  0.048 * z, ROCK_SPEED)
	Turn(base, z_axis, -0.048 * x, ROCK_SPEED)

	WaitForTurn(base, z_axis)
	WaitForTurn(base, x_axis)

	Turn(base, z_axis, 0, RESTORE_SPEED)
	Turn(base, x_axis, 0, RESTORE_SPEED)
end