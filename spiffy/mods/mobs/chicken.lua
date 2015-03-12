
-- Chicken by JK Murray

mobs:register_mob("mobs:chicken", {
	-- animal, monster, npc, barbarian
	type = "animal",
	-- is it aggressive
	passive = true,
	-- health & armor
	hp_min = 5, hp_max = 10, armor = 200,
	-- textures and model
	collisionbox = {-0.3, -0.75, -0.3, 0.3, 0.1, 0.3},
	visual = "mesh",
	mesh = "chicken.x",
	drawtype = "front",
	available_textures = {
		total = 2,
		texture_1 = {"mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png",
					"mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png",
					"mobs_chicken.png", "mobs_chicken.png", "mobs_chicken.png"},
		texture_2 = {"mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png",
					"mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png",
					"mobs_chicken_black.png", "mobs_chicken_black.png", "mobs_chicken_black.png"},
	},
	blood_texture = "mobs_blood.png",
	-- sounds
	makes_footstep_sound = true,
	sounds = {
		random = "mobs_chicken",
	},
	-- speed and jump
	walk_velocity = 1,
	jump = true,
	-- drops raw chicken when dead
	drops = {
		{name = "mobs:chicken_raw",
		chance = 1, min = 2, max = 2},
	},
	-- damaged by
	water_damage = 1,
	lava_damage = 5,
	light_damage = 0,
	fall_damage = 0,
	fall_speed = -8,
	-- model animation
	animation = {
		speed_normal = 15,
		stand_start = 0,
		stand_end = 1, -- 20
		walk_start = 20,
		walk_end = 40,
	},
	-- follows wheat
	follow = "farming:wheat", view_range = 5,
	-- replace air with egg (lay)
	replace_rate = 1000,
	replace_what = {"air"},
	replace_with = "mobs:egg",
	-- right click to pick up chicken
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if clicker:is_player() and clicker:get_inventory() then
			clicker:get_inventory():add_item("main", "mobs:chicken")
			self.object:remove()
		end
	end,
})
-- spawn on default or bamboo grass between 8 and 20 light, 1 in 9000 change, 1 chicken in area up to 31000 in height
mobs:register_spawn("mobs:chicken", {"default:dirt_with_grass", "ethereal:bamboo_dirt"}, 20, 8, 9000, 1, 31000)
-- register spawn egg
mobs:register_egg("mobs:chicken", "Chicken", "mobs_chicken_inv.png", 0)

-- Egg
minetest.register_node("mobs:egg", {
	description = "Chicken Egg",
	tiles = {"mobs_chicken_egg.png"},
	inventory_image  = "mobs_chicken_egg.png",
	visual_scale = 0.7,
	drawtype = "plantlike",
	wield_image = "mobs_chicken_egg.png",
	paramtype = "light",
	walkable = false,
	is_ground_content = true,
	sunlight_propagates = true,
	selection_box = {
		type = "fixed",
		fixed = {-0.2, -0.5, -0.2, 0.2, 0, 0.2}
	},
	groups = {snappy=2, dig_immediate=3},
	after_place_node = function(pos, placer, itemstack)
		if placer:is_player() then
			minetest.set_node(pos, {name="mobs:egg", param2=1})
		end
	end
})

-- Fried egg
minetest.register_craftitem("mobs:chicken_egg_fried", {
description = "Fried Egg",
	inventory_image = "mobs_chicken_egg_fried.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:egg",
	output = "mobs:chicken_egg_fried",
})

-- Chicken (raw and cooked)
minetest.register_craftitem("mobs:chicken_raw", {
description = "Raw Chicken",
	inventory_image = "mobs_chicken_raw.png",
	on_use = minetest.item_eat(2),
})

minetest.register_craftitem("mobs:chicken_cooked", {
description = "Cooked Chicken",
	inventory_image = "mobs_chicken_cooked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type  =  "cooking",
	recipe  = "mobs:chicken_raw",
	output = "mobs:chicken_cooked",
})
