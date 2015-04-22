-- Mob Api

dofile(minetest.get_modpath("mobs").."/api.lua")

-- Animals

dofile(minetest.get_modpath("mobs").."/chicken.lua") -- JKmurray
dofile(minetest.get_modpath("mobs").."/cow.lua") -- KrupnoPavel
dofile(minetest.get_modpath("mobs").."/rat.lua") -- PilzAdam
dofile(minetest.get_modpath("mobs").."/sheep.lua") -- PilzAdam
dofile(minetest.get_modpath("mobs").."/warthog.lua") -- KrupnoPavel
dofile(minetest.get_modpath("mobs").."/bee.lua") -- KrupnoPavel
dofile(minetest.get_modpath("mobs").."/bunny.lua") -- ExeterDad
dofile(minetest.get_modpath("mobs").."/kitten.lua") -- Jordach/BFD

-- Monsters

dofile(minetest.get_modpath("mobs").."/dirtmonster.lua") -- PilzAdam
dofile(minetest.get_modpath("mobs").."/dungeonmaster.lua")
dofile(minetest.get_modpath("mobs").."/oerkki.lua")
dofile(minetest.get_modpath("mobs").."/sandmonster.lua")
dofile(minetest.get_modpath("mobs").."/stonemonster.lua")
dofile(minetest.get_modpath("mobs").."/treemonster.lua")
dofile(minetest.get_modpath("mobs").."/lava_flan.lua") -- Zeg9
dofile(minetest.get_modpath("mobs").."/mese_monster.lua")
dofile(minetest.get_modpath("mobs").."/spider.lua") -- AspireMint

-- NPC
--dofile(minetest.get_modpath("mobs").."/npc.lua") -- TenPlus1

-- Meat & Cooked Meat

minetest.register_craftitem("mobs:meat_raw", {
	description = "Raw Meat",
	inventory_image = "mobs_meat_raw.png",
	on_use = minetest.item_eat(3),
})

minetest.register_craftitem("mobs:meat", {
	description = "Meat",
	inventory_image = "mobs_meat.png",
	on_use = minetest.item_eat(8),
})

minetest.register_craft({
	type = "cooking",
	output = "mobs:meat",
	recipe = "mobs:meat_raw",
	cooktime = 5,
})

-- Golden Lasso

minetest.register_tool("mobs:magic_lasso", {
	description = "Magic Lasso (right-click animal to put in inventory)",
	inventory_image = "mobs_magic_lasso.png",
})

minetest.register_craft({
	output = "mobs:magic_lasso",
	recipe = {
		{"farming:string", "default:gold_lump", "farming:string"},
		{"default:gold_lump", "default:diamondblock", "default:gold_lump"},
		{"farming:string", "default:gold_lump", "farming:string"},
	}
})

if minetest.setting_get("log_mods") then
	minetest.log("action", "mobs loaded")
end
