
-- Mese Monster by Zeg9

mobs:register_mob("mobs:mese_monster", {
	-- animal, monster, npc, barbarian
	type = "monster",
	-- agressive, deals 3 damage to player when hit
	passive = false,
	damage = 3,
	attack_type = "shoot",
	shoot_interval = .5,
	arrow = "mobs:mese_arrow",
	shoot_offset = 2,
	-- health & armor
	hp_min = 10, hp_max = 25, armor = 80,
	-- textures and model
	collisionbox = {-0.5, -1.5, -0.5, 0.5, 0.5, 0.5},
	visual = "mesh",
	mesh = "zmobs_mese_monster.x",
	textures = {
		{"zmobs_mese_monster.png"},
	},
	visual_size = {x=1, y=1},
	drawtype = "front",
	blood_texture = "default_mese_crystal_fragment.png",
	-- sounds
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_mesemonster",
	},
	-- speed and jump
	view_range = 10,
	walk_velocity = 0.5,
	run_velocity = 2,
	jump = true,
	fall_damage = 0,
	fall_speed = -6,
	-- drops mese when dead
	drops = {
		{name = "default:mese_crystal",
		chance = 9, min = 1, max = 3,},
		{name = "default:mese_crystal_fragment",
		chance = 1, min = 1, max = 9,},
	},
	-- damaged by
	water_damage = 0,
	lava_damage = 0,
	light_damage = 0,
	-- model animation
	animation = {
		speed_normal = 15,		speed_run = 15,
		stand_start = 0,		stand_end = 14,
		walk_start = 15,		walk_end = 38,
		run_start = 40,			run_end = 63,
		punch_start = 15,		punch_end = 38, -- was 40 & 63
	},
})
-- spawn on stone between 0 and 5 light, 1 in 5000 chance, 1 in area below -20
mobs:register_spawn("mobs:mese_monster", {"default:stone"}, 5, 0, 5000, 1, -64)
mobs:register_spawn("mobs:mese_monster", {"nether:rack"}, 5, 0, 2500, 1, 31000)
-- register spawn egg
mobs:register_egg("mobs:mese_monster", "Mese Monster", "default_mese_block.png", 1)

-- Mese Monster Crystal Shards (weapon)
mobs:register_arrow("mobs:mese_arrow", {
	visual = "sprite",
	visual_size = {x=.5, y=.5},
	textures = {"default_mese_crystal_fragment.png"},
	velocity = 6,

	hit_player = function(self, player)
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=1},
		}, 0)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=1},
		}, 0)
	end,

	hit_node = function(self, pos, node)
	end
})

-- 9 mese crystal fragments = 1 mese crystal
minetest.register_craft({
	output = "default:mese_crystal",
	recipe = {
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
	}
})
