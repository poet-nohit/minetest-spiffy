-- Code of rubber tree by PilzAdam

local S = technic.worldgen.gettext

minetest.register_node(":moretrees:rubber_tree_sapling", {
	description = S("Rubber Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"technic_rubber_sapling.png"},
	inventory_image = "technic_rubber_sapling.png",
	wield_image = "technic_rubber_sapling.png",
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3, flammable=2},
	sounds = default.node_sound_defaults(),
})

minetest.register_node(":moretrees:rubber_tree_sapling_ongen", {
	description = S("Rubber Tree Sapling"),
	drawtype = "plantlike",
	tiles = {"technic_rubber_sapling.png"},
	inventory_image = "technic_rubber_sapling.png",
	wield_image = "technic_rubber_sapling.png",
	paramtype = "light",
	walkable = false,
	groups = {dig_immediate=3, flammable=2},
	sounds = default.node_sound_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "moretrees:rubber_tree_sapling",
	burntime = 10
})

-- *** drops like papyrus/cactus

minetest.register_node(":moretrees:rubber_tree_trunk", {
	description = S("Rubber Tree"),
	tiles = {"default_tree_top.png", "default_tree_top.png",
		"technic_rubber_tree_full.png"},
	groups = {tree=1, snappy=1, choppy=2, oddly_breakable_by_hand=1,
		flammable=2},
	sounds = default.node_sound_wood_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_node(":moretrees:rubber_tree_trunk_empty", {
	description = S("Rubber Tree"),
	tiles = {"default_tree_top.png", "default_tree_top.png",
		"technic_rubber_tree_empty.png"},
	groups = {tree=1, snappy=1, choppy=2, oddly_breakable_by_hand=1,
			flammable=2, not_in_creative_inventory=1},
	sounds = default.node_sound_wood_defaults(),
	after_dig_node = function(pos, node, metadata, digger)
		default.dig_up(pos, node, digger)
	end,
})

minetest.register_node(":moretrees:rubber_tree_leaves", {
	drawtype = "allfaces_optional",
	tiles = {"technic_rubber_leaves.png"},
	paramtype = "light",
	groups = {snappy=3, leafdecay=3, flammable=2, not_in_creative_inventory=1},
	drop = {
		max_items = 1,
		items = {{
			items = {"moretrees:rubber_tree_sapling"},
			rarity = 20,
		}}
	},
	sounds = default.node_sound_leaves_defaults(),
})

technic.rubber_tree_model={
	axiom = "FFFFA",
	rules_a = "[&FFBFA]////[&BFFFA]////[&FBFFA]",
	rules_b = "[&FFA]////[&FFA]////[&FFA]",
	trunk = "moretrees:rubber_tree_trunk",
	leaves = "moretrees:rubber_tree_leaves",
	angle = 35,
	iterations = 3,
	random_level = 1,
	trunk_type = "double",
	thin_branches = true
}

minetest.register_abm({
	nodenames = {"moretrees:rubber_tree_sapling"},
	interval = 60,
	chance = 20,
	action = function(pos, node)
		minetest.remove_node(pos)
		minetest.spawn_tree(pos, technic.rubber_tree_model)
	end
})

minetest.register_abm({
	nodenames = {"moretrees:rubber_tree_sapling_ongen"},
	interval = 10,
	chance = 1,
	action = function(pos, node)
		if minetest.get_node_light(pos) > 7 then
			minetest.remove_node(pos)
			minetest.spawn_tree(pos, technic.rubber_tree_model)
		end
	end
})

if technic.config:get_bool("enable_rubber_tree_generation") then
	minetest.register_decoration({
		deco_type = "simple",
		place_on = "group:soil",
		sidelen = 8,
		fill_ratio = 0.02,
		decoration = "moretrees:rubber_tree_sapling_ongen",
		height_max = 1,
		y_min = 15,
		y_max = 30,
	})
end

