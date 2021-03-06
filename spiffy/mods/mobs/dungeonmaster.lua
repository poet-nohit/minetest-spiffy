
-- Dungeon Master by PilzAdam

mobs:register_mob("mobs:dungeon_master", {
	type = "monster",
	passive = false,
	damage = 4,
	attack_type = "shoot",
	shoot_interval = 2.5,
	arrow = "mobs:fireball",
	shoot_offset = 0,
	hp_min = 12,
	hp_max = 35,
	armor = 60,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 2.6, 0.7},
	visual = "mesh",
	mesh = "mobs_dungeon_master.x",
	textures = {
		{"mobs_dungeon_master.png"},
		{"mobs_dungeon_master2.png"},
		{"mobs_dungeon_master3.png"},
	},
	visual_size = {x=8, y=8},
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_dungeonmaster",
		attack = "mobs_fireball",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 15,
	drops = {
		{name = "default:mese_crystal_fragment",
		chance = 1, min = 1, max = 3,},
		{name = "default:diamond",
		chance = 4, min = 1, max = 1,},
		{name = "default:mese_crystal",
		chance = 2, min = 1, max = 2,},
		{name = "default:diamond_block",
		chance = 30, min = 1, max = 1,},
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	animation = {
		stand_start = 0,		stand_end = 19,
		walk_start = 20,		walk_end = 35,
		punch_start = 36,		punch_end = 48,
		speed_normal = 15,		speed_run = 15,
	},
})

mobs:register_spawn("mobs:dungeon_master", {"default:stone"}, 5, 0, 7000, 1, -70)
mobs:register_spawn("mobs:dungeon_master", {"nether:rack"}, 5, 0, 3500, 1, 31000)

mobs:register_egg("mobs:dungeon_master", "Dungeon Master", "fire_basic_flame.png", 1)

-- fireball (weapon)
mobs:register_arrow("mobs:fireball", {
	visual = "sprite",
	visual_size = {x=1, y=1},
	textures = {"mobs_fireball.png"},
	velocity = 6,

	-- direct hit, no fire... just plenty of pain
	hit_player = function(self, player)
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=8},
		}, 0)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0,  {
			full_punch_interval=1.0,
			damage_groups = {fleshy=8},
		}, 0)
	end,

	-- node hit, bursts into flame
	hit_node = function(self, pos, node)
		mobs:explosion(pos, 1, 1, 0)
	end
})
