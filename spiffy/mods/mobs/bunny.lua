
-- Bunny by ExeterDad

mobs:register_mob("mobs:bunny", {
	type = "animal",
	passive = true,
	hp_min = 1,
	hp_max = 4,
	armor = 200, 
	collisionbox = {-0.268, -0.5, -0.268,  0.268, 0.167, 0.268},
	visual = "mesh",
	mesh = "mobs_bunny.b3d",
	textures = {
		{"mobs_bunny_grey.png"},
		{"mobs_bunny_brown.png"},
		{"mobs_bunny_white.png"},
	},
	makes_footstep_sound = false,
	walk_velocity = 1,
	jump = true,
	drops = {
		{name = "mobs:meat_raw",
		chance = 1, min = 1, max = 2,},
	},
	water_damage = 1,
	lava_damage = 4,
	light_damage = 0,
	animation = {
		speed_normal = 15,
		stand_start = 1,		stand_end = 15,
		walk_start = 16,		walk_end = 24,
	},
	follow = "farming:carrot",
	view_range = 5,
	replace_rate = 80,
	replace_what = {"farming:carrot_7", "farming:carrot_8", "farming_plus:carrot"},
	replace_with = "air",
	on_rightclick = function(self, clicker)
		local item = clicker:get_wielded_item()
		if item:get_name() == "farming_plus:carrot_item"
		or item:get_name() == "farming:carrot" then
			if not minetest.setting_getbool("creative_mode") then
				item:take_item()
				clicker:set_wielded_item(item)
			end
			self.food = (self.food or 0) + 1
			if self.food >= 4 then
				self.food = 0
				self.tamed = true
			end
			return
		end

		if clicker:is_player()
		and clicker:get_inventory()
		and self.child == false
		and clicker:get_inventory():room_for_item("main", "mobs:bunny") then
			clicker:get_inventory():add_item("main", "mobs:bunny")
			self.object:remove()
		end
	end, 
})

mobs:register_spawn("mobs:bunny", {"default:dirt_with_grass", "ethereal:prairie_dirt"}, 20, 8, 9000, 1, 31000)

mobs:register_egg("mobs:bunny", "Bunny", "mobs_bunny_inv.png", 0)
