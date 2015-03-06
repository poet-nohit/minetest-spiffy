-- tool mods, by gsmanners
-- license: WTFPL

--------------------------------------------------
-- general crafts

minetest.register_craftitem("gs_tools:stone_rod", {
	description = "Stone Rod",
	inventory_image = "gs_stone_rod.png",
})

minetest.register_craft({
	output = "gs_tools:stone_rod 4",
	recipe = {
		{"", "", "default:cobble"},
		{"", "default:cobble", ""},
		{"default:cobble", "", ""}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:cobble 3",
	recipe = { "gs_tools:stone_rod", "gs_tools:stone_rod",
		"gs_tools:stone_rod", "gs_tools:stone_rod" }
})

minetest.register_node("gs_tools:cobble_b", {
	description = "Condensed Cobblestone",
	tiles = {"gs_condensed_cobble.png"},
	is_ground_content = true,
	groups = {cracky=2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = "gs_tools:cobble_b 3",
	recipe = {
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"},
		{"default:cobble", "default:cobble", "default:cobble"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "default:cobble 9",
	recipe = { "gs_tools:cobble_b", "gs_tools:cobble_b", "gs_tools:cobble_b" }
})

minetest.register_craftitem("gs_tools:clay_rod", {
	description = "Clay Rod",
	inventory_image = "gs_clay_rod.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "gs_tools:clay_rod 4",
	recipe = { "default:clay_brick", "default:clay_brick" }
})

minetest.register_craft({
	type = "shapeless",
	output = "default:clay_brick 2",
	recipe = { "gs_tools:clay_rod", "gs_tools:clay_rod",
		"gs_tools:clay_rod", "gs_tools:clay_rod" }
})

-- *** "iron" rods

minetest.register_craftitem("gs_tools:steel_rod", {
	description = "Iron Rod",
	inventory_image = "gs_steel_rod.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "gs_tools:steel_rod 4",
	recipe = { "default:steel_ingot", "default:steel_ingot" }
})

minetest.register_craft({
	type = "shapeless",
	output = "default:steel_ingot 2",
	recipe = { "gs_tools:steel_rod", "gs_tools:steel_rod", 
		"gs_tools:steel_rod", "gs_tools:steel_rod" }
})

-- seems silly that this one isn't already in default

minetest.register_craft({
	type = "shapeless",
	output = "default:clay_lump 4",
	recipe = { "default:papyrus", "default:dirt", "bucket:bucket_water" },
	replacements = { { "bucket:bucket_water", "bucket:bucket_empty" } }
})

-- charcoal (pretty much the same as coal, but renewable)

minetest.register_craftitem("gs_tools:charcoal", {
	description = "Charcoal",
	inventory_image = "gs_charcoal.png",
})

-- charcoal grinds into coal dust

if minetest.get_modpath("technic") then
	technic.register_grinder_recipe(
		{ input = {"gs_tools:charcoal"},
		output = "technic:coal_dust 2" }
	)
end

-- sugar coal (like charcoal, but only about 25% as efficient)

minetest.register_craftitem("gs_tools:sugarcoal", {
	description = "Sugar Coal",
	inventory_image = "gs_sugarcoal.png",
})

minetest.register_craft({
	type = "fuel",
	recipe = "gs_tools:charcoal",
	burntime = 40
})

minetest.register_craft({
	type = "fuel",
	recipe = "gs_tools:sugarcoal",
	burntime = 10
})

minetest.register_craft({
	type = "cooking",
	recipe = "default:papyrus",
	output = "gs_tools:sugarcoal",
})

minetest.register_craft({
	type = "cooking",
	recipe = "group:tree",
	output = "gs_tools:charcoal",
})

minetest.register_craft({
	output = "default:torch 4",
	recipe = {
		{ "gs_tools:charcoal" },
		{ "group:stick" },
	}
})

minetest.register_craft({
	output = "default:torch",
	recipe = {
		{ "gs_tools:sugarcoal" },
		{ "group:stick" },
	}
})

minetest.register_node("gs_tools:charcoalblock", {
	description = "Charcoal Block",
	tiles = { "gs_charcoal_block.png" },
	is_ground_content = true,
	groups = { cracky=3,flammable=3 },
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	type = "fuel",
	recipe = "gs_tools:charcoalblock",
	burntime = 370,
})

minetest.register_craft({
	output = "gs_tools:charcoalblock",
	recipe = {
		{ "gs_tools:charcoal", "gs_tools:charcoal", "gs_tools:charcoal" },
		{ "gs_tools:charcoal", "gs_tools:charcoal", "gs_tools:charcoal" },
		{ "gs_tools:charcoal", "gs_tools:charcoal", "gs_tools:charcoal" },
	}
})

minetest.register_craft({
	output = "gs_tools:charcoal 9",
	recipe = {
		{ "gs_tools:charcoalblock" },
	}
})
