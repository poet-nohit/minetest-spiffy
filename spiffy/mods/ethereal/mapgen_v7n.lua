-- clear default mapgen biomes and decorations
minetest.clear_registered_biomes()
minetest.clear_registered_decorations()

-- tree schematics
dofile(minetest.get_modpath("ethereal").."/schematics/apple_tree.lua")
dofile(minetest.get_modpath("ethereal").."/schematics/orange_tree.lua")
dofile(minetest.get_modpath("ethereal").."/schematics/banana_tree.lua")

-- Biomes (for 0.4.12 with new changes from Paramat)
if ethereal.icewater == 1 then
minetest.register_biome({
	name = "icewater",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 1,
	node_water_top = "default:ice",
	depth_water_top = 2,
	y_min = -31000,
	y_max = 1,
	heat_point = 0,
	humidity_point = 0,
})
end

if ethereal.bamboo == 1 then
minetest.register_biome({
	name = "bamboo",
	node_top = "ethereal:bamboo_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 71,
	heat_point = 45,
	humidity_point = 75,
})
end

if ethereal.mesa == 1 then
minetest.register_biome({
	name = "mesa",
	node_top = "bakedclay:red",
	depth_top = 1,
	node_filler = "bakedclay:orange",
	depth_filler = 5,
	y_min = 2,
	y_max = 71,
	heat_point = 25,
	humidity_point = 28,
})
end

if ethereal.alpine == 1 then
minetest.register_biome({
	name = "alpine",
	node_top = "default:dirt_with_snow",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	y_min = 40,
	y_max = 90,
	heat_point = 10,
	humidity_point = 40,
})
end

if ethereal.healing == 1 then
minetest.register_biome({
	name = "healing",
	node_top = "default:dirt_with_snow",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	y_min = 75,
	y_max = 140,
	heat_point = 10,
	humidity_point = 40,
})
end

if ethereal.snowy == 1 then
minetest.register_biome({
	name = "snowy",
	node_top = "ethereal:cold_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 2,
	y_min = 5,
	y_max = 40,
	heat_point = 10,
	humidity_point = 40,
})
end

if ethereal.frost == 1 then
minetest.register_biome({
	name = "frost",
	node_top = "ethereal:crystal_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 71,
	heat_point = 10,
	humidity_point = 40,
})
end

if ethereal.grassy == 1 then
minetest.register_biome({
	name = "grassy",
	node_top = "ethereal:green_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 91,
	heat_point = 13,
	humidity_point = 40,
})
end

if ethereal.caves == 1 then
minetest.register_biome({
	name = "caves",
	node_top = "default:desert_stone",
	depth_top = 3,
	node_filler = "air",
	depth_filler = 8,
	y_min = 4,
	y_max = 41,
	heat_point = 15,
	humidity_point = 25,
})
end

if ethereal.grayness == 1 then
minetest.register_biome({
	name = "grayness",
	node_top = "ethereal:gray_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 41,
	heat_point = 15,
	humidity_point = 30,
})
end

if ethereal.grassytwo == 1 then
minetest.register_biome({
	name = "grassytwo",
	node_top = "ethereal:green_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 91,
	heat_point = 15,
	humidity_point = 40,
})
end

if ethereal.prairie == 1 then
minetest.register_biome({
	name = "prairie",
	node_top = "ethereal:prairie_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 3,
	y_max = 26,
	heat_point = 20,
	humidity_point = 40,
})
end

if ethereal.jumble == 1 then
minetest.register_biome({
	name = "jumble",
	node_top = "ethereal:green_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 71,
	heat_point = 25,
	humidity_point = 50,
})
end

if ethereal.junglee == 1 then
minetest.register_biome({
	name = "junglee",
	node_top = "ethereal:jungle_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 71,
	heat_point = 30,
	humidity_point = 60,
})
end

if ethereal.desert ==1 then
minetest.register_biome({
	name = "desert",
	node_top = "default:desert_sand",
	depth_top = 5,
	node_filler = "default:desert_stone",
	depth_filler = 70,
	y_min = 3,
	y_max = 23,
	heat_point = 35,
	humidity_point = 20,
})
end

if ethereal.grove == 1 then
minetest.register_biome({
	name = "grove",
	node_top = "ethereal:grove_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler= 5,
	y_min = 3,
	y_max = 23,
	heat_point = 40,
	humidity_point = 60,
})
end

if ethereal.mushroom == 1 then
minetest.register_biome({
	name = "mushroom",
	node_top = "ethereal:mushroom_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 1,
	y_max = 50,
	heat_point = 45,
	humidity_point = 65,
})
end

if ethereal.desertstone == 1 then
minetest.register_biome({
	name = "desertstone",
	node_top = "default:sandstone",
	depth_top = 7,
	node_filler = "default:desert_stone",
	depth_filler = 70,
	y_min = 3,
	y_max = 23,
	heat_point = 50,
	humidity_point = 20,
})
end

if ethereal.quicksand == 1 then
minetest.register_biome({
	name = "quicksand",
	node_top = "ethereal:quicksand2",
	depth_top = 3,
	node_filler = "default:gravel",
	depth_filler = 1,
	y_min = 1,
	y_max = 1,
	heat_point = 50,
	humidity_point = 38,
})
end

if ethereal.lake == 1 then
minetest.register_biome({
	name = "lake",
	node_top = "default:sand",
	depth_top = 2,
	node_filler = "default:gravel",
	depth_filler = 1,
	node_water = "default:water_source",
	node_dust_water = "default:water_source",
	y_min = -31000,
	y_max = 3,
	heat_point = 50,
	humidity_point = 40,
})
end

if ethereal.plains == 1 then
minetest.register_biome({
	name = "plains",
	node_top = "ethereal:dry_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 3,
	y_max = 61,
	heat_point = 55,
	humidity_point = 25,
})
end

if ethereal.fiery == 1 then
minetest.register_biome({
	name = "fiery",
	node_top = "ethereal:fiery_dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 5,
	y_min = 5,
	y_max = 65,
	heat_point = 80,
	humidity_point = 10,
})
end

if ethereal.sandclay == 1 then
minetest.register_biome({
	name = "sandclay",
	node_top = "default:sand",
	depth_top = 3,
	node_filler = "default:clay",
	depth_filler = 2,
	y_min = 1,
	y_max = 11,
	heat_point = 65,
	humidity_point = 2,
})
end

--= schematic decorations

local path = minetest.get_modpath("ethereal").."/schematics/"

-- redwood tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"bakedclay:red","bakedclay:orange"},
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"mesa"},
	schematic = path.."redwood.mts",
	flags = "place_center_x, place_center_z",
})

-- banana tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:grove_dirt",
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"grove"},
	schematic = ethereal.bananatree,
	flags = "place_center_x, place_center_z",
})

-- healing tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "default:dirt_with_snow",
	sidelen = 80,
	fill_ratio = 0.04,
	biomes = {"healing"},
	schematic = path.."yellowtree.mts",
	flags = "place_center_x, place_center_z",
})

-- crystal frost tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:crystal_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"frost"},
	schematic = path.."frosttrees.mts",
	flags = "place_center_x, place_center_z",
})

-- giant mushroom
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:mushroom_dirt",
	sidelen = 80,
	fill_ratio = 0.07,
	biomes = {"mushroom"},
	schematic = path.."mushroomone.mts",
	flags = "place_center_x, place_center_z",
})

-- small lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.012,
	biomes = {"fiery"},
	schematic = path.."volcanom.mts",
	flags = "place_center_x, place_center_z",
})

-- large lava crater
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:fiery_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"fiery"},
	schematic = path.."volcanol.mts",
	flags = "place_center_x, place_center_z",
--	replacements = {{"default:stone", "default:desert_stone"}},
})

-- jungle tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:jungle_dirt",
	sidelen = 80,
	fill_ratio = 0.3,
	biomes = {"junglee"},
	schematic = path.."jungletree.mts",
	flags = "place_center_x, place_center_z",
})

-- willow tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:gray_dirt",
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"grayness"},
	schematic = path.."willow.mts",
	flags = "place_center_x, place_center_z",
})

-- pine tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:cold_dirt", "default:dirt_with_snow"},
	sidelen = 80,
	fill_ratio = 0.025,
	biomes = {"snowy", "alpine"},
	schematic = path.."pinetree.mts",
	flags = "place_center_x, place_center_z",
})

-- apple tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"grassy", "jumble"},
	schematic = ethereal.appletree,
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.005,
	biomes = {"grassytwo"},
	schematic = ethereal.appletree,
	flags = "place_center_x, place_center_z",
})

-- orange tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.005,
	biomes = {"prairie"},
	schematic = ethereal.orangetree,
	flags = "place_center_x, place_center_z",
})

-- acacia tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:desert_sand"},
	sidelen = 80,
	fill_ratio = 0.004,
	biomes = {"desert"},
	schematic = path.."acaciatree.mts",
	flags = "place_center_x, place_center_z",
})

-- big old tree
minetest.register_decoration({
	deco_type = "schematic",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"grassytwo"},
	schematic = path.."bigtree.mts",
	flags = "place_center_x, place_center_z",
})

--= simple decorations

-- scorched tree
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:dry_dirt",
	sidelen = 80,
	fill_ratio = 0.006,
	biomes = {"plains"},
	decoration = "ethereal:scorched_tree",
	height_max = 6,
})

-- bamboo stalks
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.055,
	biomes = {"bamboo"},
	decoration = "ethereal:bamboo",
	height_max = 5,
})

-- bamboo sprouts & grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:bamboo_dirt",
	sidelen = 80,
	fill_ratio = 0.25,
	biomes = {"bamboo"},
	decoration = {"ethereal:bamboo_sprout", "default:grass_2", "default:grass_3"},
})

-- dry shrub
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:dry_dirt", "default:sand", "default:desert_sand", "sandstone", "bakedclay:red"},
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"plains", "lake", "desert", "desertstone", "mesa"},
	decoration = "default:dry_shrub",
})

-- flowers & strawberry
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:green_dirt",
	sidelen = 80,
	fill_ratio = 0.03,
	biomes = {"grassy", "grassy", "grassytwo"},
	decoration = {"flowers:dandelion_white", "flowers:dandelion_yellow", "flowers:geranium", "flowers:rose", "flowers:tulip", "flowers:viola", "ethereal:strawberry_7"},
})

-- prairie flowers & strawberry
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:prairie_dirt",
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"prairie"},
	decoration = {"flowers:dandelion_white", "flowers:dandelion_yellow", "flowers:geranium", "flowers:rose", "flowers:tulip", "flowers:viola", "ethereal:strawberry_7"},
})

-- crystal spike & crystal grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:crystal_dirt",
	sidelen = 80,
	fill_ratio = 0.02,
	biomes = {"frost"},
	decoration = {"ethereal:crystal_spike", "ethereal:crystalgrass"},
})

-- red shrub
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:fiery_dirt", 
	sidelen = 80,
	fill_ratio = 0.20,
	biomes = {"fiery"},
	decoration = "ethereal:dry_shrub",
})

-- snowy grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:gray_dirt", "ethereal:cold_dirt"},
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"grayness", "snowy"},
	decoration = "ethereal:snowygrass",
})

-- cactus
minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:sandstone",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"desertstone"},
	decoration = "default:cactus",
	height_max = 3,
})

minetest.register_decoration({
	deco_type = "simple",
	place_on = "default:desert_sand",
	sidelen = 80,
	fill_ratio = 0.01,
	biomes = {"desert"},
	decoration = "default:cactus",
	height_max = 4,
})

-- wild mushroom
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:mushroom_dirt",
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"mushroom"},
	decoration = "ethereal:mushroom_plant",
})

-- jungle grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt", "ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.18,
	biomes = {"junglee", "jumble"},
	decoration = "default:junglegrass",
})

-- grass
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt_top", "ethereal:jungle_dirt", "ethereal:prairie_dirt", "ethereal:grove_dirt"},
	sidelen = 80,
	fill_ratio = 0.4,
	biomes = {"grassy", "grassytwo", "jumble", "junglee", "prairie", "grove"},
	decoration = "default:grass_2", "default:grass_3", "default:grass_4", "default:grass_5",
})

-- ferns
minetest.register_decoration({
	deco_type = "simple",
	place_on = "ethereal:grove_dirt",
	sidelen = 80,
	fill_ratio = 0.2,
	biomes = {"grove"},
	decoration = "ethereal:fern",
})

-- snow
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:cold_dirt", "default:dirt_with_snow"},
	sidelen = 80,
	fill_ratio = 0.8,
	biomes = {"snowy", "alpine"},
	decoration = "default:snow",
})

-- wild onion
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.25,
	biomes = {"grassy", "grassytwo", "jumble", "prairie"},
	decoration = "ethereal:onion_4",
})

-- papyrus
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"grassy", "junglee"},
	decoration = "default:papyrus",
	height_max = 4,
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

-- palm tree on sand next to water
minetest.register_on_generated(function(minp, maxp, seed)
	if maxp.y > 1 and minp.y < 1 then
		local perlin1 = minetest.get_perlin(354, 3, 0.7, 100)
		local divlen = 8
		local divs = (maxp.x-minp.x)/divlen+1
		local pr, x, z
		for divx=0,divs-1 do
			for divz=0,divs-1 do
				-- find random positions for palm tree
				pr = PseudoRandom(seed+1)
				x = pr:next(minp.x + math.floor((divx+0)*divlen), minp.x + math.floor((divx+1)*divlen))
				z = pr:next(minp.z + math.floor((divz+0)*divlen), minp.z + math.floor((divz+1)*divlen))
				if minetest.get_node({x=x,y=1,z=z}).name == "default:sand" and
					minetest.find_node_near({x=x,y=1,z=z}, 1, "default:water_source") then
					minetest.place_schematic({x=x-4,y=2,z=z-4}, path.."palmtree.mts", 0, '', 0)
				end
			end
		end
	end
end)

--= Farming Redo plants

if farming.mod and farming.mod == "redo" then

if minetest.setting_getbool("log_mods") then
	print ("[MOD] Ethereal - Detected and using Farming Redo mod")
end

-- potato
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.035,
	biomes = {"junglee"},
	decoration = "farming:potato_3",
})

-- carrot, cucumber, potato, tomato, corn, coffee, raspberry, rhubarb
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:prairie_dirt"},
	sidelen = 80,
	fill_ratio = 0.05,
	biomes = {"grassy", "grassytwo", "prairie", "jumble"},
	decoration = {"farming:carrot_7", "farming:cucumber_4", "farming:potato_3", "farming:tomato_7", "farming:corn_8", "farming:coffee_5", "farming:raspberry_4", "farming:rhubarb_3", "farming:blueberry_4"},
})

-- melon and pumpkin
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt", "ethereal:jungle_dirt"},
	sidelen = 80,
	fill_ratio = 0.015,
	biomes = {"grassy", "grassytwo", "junglee", "jumble"},
	decoration = {"farming:melon_8", "farming:pumpkin_8"},
	spawn_by = "default:water_source",
	num_spawn_by = 1,
})

-- green beans
minetest.register_decoration({
	deco_type = "simple",
	place_on = {"ethereal:green_dirt"},
	sidelen = 80,
	fill_ratio = 0.035,
	biomes = {"grassytwo"},
	decoration = "farming:beanbush",
})
end
