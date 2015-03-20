
-- Tree Monster (or Tree Gollum) by PilzAdam

mobs:register_mob("mobs:tree_monster", {
	-- animal, monster, npc, barbarian
	type = "monster",
	-- aggressive, deals 2 damage to player when hit
	passive = false,
	attack_type = "dogfight",
	damage = 2,
	-- health & armor
	hp_min = 7, hp_max = 33, armor = 100,
	-- textures and model
	collisionbox = {-0.4, -0.01, -0.4, 0.4, 1.9, 0.4},
	visual = "mesh",
	mesh = "mobs_tree_monster.x",
	drawtype = "front",
	textures = {
		{"mobs_tree_monster.png"},
	},
	visual_size = {x=4.5,y=4.5},
	blood_texture = "default_wood.png",
	-- sounds
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_treemonster",
	},
	-- speed and jumop
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	-- drops saplings or apple
	drops = {
		{name = "ethereal:tree_sapling",
		chance = 3, min = 1, max = 2},
		{name = "ethereal:jungle_tree_sapling",
		chance = 3, min = 1, max = 2},
		{name = "default:apple",
		chance = 2, min = 1, max=3},
	},
	-- damaged by
	water_damage = 1,
	lava_damage = 5,
	light_damage = 2,
	fall_damage = 0,
	-- model animation
	animation = {
		speed_normal = 15,		speed_run = 15,
		stand_start = 0,		stand_end = 24,
		walk_start = 25,		walk_end = 47,
		run_start = 48,			run_end = 62,
		punch_start = 48,		punch_end = 62,
	},
})
-- spawn on leaves, between 0 and 5 light, 1 in 7000 chance, 1 in area up to 31000 in height
mobs:register_spawn("mobs:tree_monster", {"default:leaves", "default:jungleleaves"}, 5, 0, 7000, 1, -64)
mobs:register_spawn("mobs:tree_monster", {"nether:rack"}, 5, 0, 3500, 1, 31000)
-- register spawn egg
mobs:register_egg("mobs:tree_monster", "Tree Monster", "default_tree_top.png", 1)

-- Ethereal sapling compatibility
if not minetest.get_modpath("ethereal") then
	minetest.register_alias("ethereal:tree_sapling", "default:sapling")
	minetest.register_alias("ethereal:jungle_tree_sapling", "default:junglesapling")
end
